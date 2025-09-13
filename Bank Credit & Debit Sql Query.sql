use bank;

alter table c_d change column `ï»¿Customer_ID`  Customer_ID text;
select * from c_d;

# Total Credit Amount

select round(sum(amount),2) as Total_Credit_Amount from c_d where transaction_type = "Credit";

# Total Debit Amount

select round(sum(amount),2) as Total_Credit_Amount from c_d where transaction_type = "Debit";

# Credit to Debit Ratio

with a as (select 
sum(case when transaction_type = "Credit" then Amount end) as Credit_Amount, 
sum(case when transaction_type = "Debit" then Amount end) as Debit_Amount 
from c_d)
select Credit_Amount, Debit_Amount, concat(round(Credit_Amount*100/Debit_Amount,2),"%") as Credit_To_Debit_Ratio from a;

# Net Transaction Amount

with a as (select
sum(case when transaction_type = "Credit" then Amount end) as Credit_Amount,
sum(case when transaction_type = "Debit" then Amount end) as Debit_Amount
from C_d)
select round((Credit_Amount-Debit_Amount),2) as Net_Transaction_Amount from a;

# Account Activity Ratio

select concat(round((count(transaction_type)*100/sum(balance)),2),"%") as Balance_Activity_Ratio, 
concat(round((count(transaction_type)*100/sum(amount)),2),"%") as Amount_Activity_Ratio from c_d;

# Transactions per Day/Week/Month

select 
	transaction_day,
    count(transaction_type) as Total_Transactions
from c_d
group by 1
order by field(transaction_day,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday', 'Sunday');

select 
    Transaction_Week,
    count(transaction_type) as Total_Transactions
from c_d
group by 1
order by 1;

select 
    monthname(transaction_date) as Month_Name,
    count(transaction_type) as Total_Transactions
from c_d
group by year(transaction_date), month(transaction_date), monthname(transaction_date)
order by month(transaction_date);


select 
    cast(transaction_date as date) as Day,
    count(transaction_id) as Transactions_Per_Day
from c_d
group by cast(transaction_date as date)
order by Day;



# Total Transaction Amount by Branch

select Branch, sum(Amount) as Total_Amount from c_d group by 1 order by 2;

# Transaction Volume by Bank

select bank_name, sum(Amount) as Total_Amount from c_d group by 1 order by 2 desc;

# Transaction Method Distribution

select transaction_method, count(customer_id) as Total_Transaction, 
concat(round(count(customer_id)*100/(select count(customer_id) from c_d),2),"%") as Total_Percent 
from c_d group by 1 order by 1;

# Branch Transaction Growth

with monthly_txn as (
    select 
        branch as Branch,
        year(transaction_date) as Year,
        month(transaction_date) as Month,
        monthname(transaction_date) as Month_Name,
        sum(amount) as Total_Amount
    from c_d
    group by 1, year(transaction_date), month(transaction_date), monthname(transaction_date)
)
select 
    Branch,
    Month_Name,
    round(
        ((Total_Amount - lag(Total_Amount) over (partition by Branch order by Year, Month))
        / nullif(lag(Total_Amount) over (partition by Branch order by Year, Month),0)) * 100, 2
    ) as Growth_Percent
from monthly_txn
order by Branch, Year, Month;

# OR

with monthly_txn as (
    select 
        branch as Branch,
        year(transaction_date) as Year,
        month(transaction_date) as Month,
        monthname(transaction_date) as Month_Name,
        sum(amount) as Total_Amount
    from c_d
    group by 1, 2, 3, 4
),
growth_calc as (
    select 
        Branch,
        Year,
        Month,
        Month_Name,
        round(
            ((Total_Amount - lag(Total_Amount) over (partition by Branch order by Year, Month))
            / nullif(lag(Total_Amount) over (partition by Branch order by Year, Month),0)) * 100, 2
        ) as Growth_Percent
    from monthly_txn
)
select 
    Month_Name,
    max(case when Branch = 'City Center Branch' then Growth_Percent end) as City_Center_Branch,
    max(case when Branch = 'Downtown Branch' then Growth_Percent end) as Downtown_Branch,
    max(case when Branch = 'East Branch' then Growth_Percent end) as East_Branch,
    max(case when Branch = 'Main Branch' then Growth_Percent end) as Main_Branch,
    max(case when Branch = 'North Branch' then Growth_Percent end) as North_Branch,
    max(case when Branch = 'Suburban Branch' then Growth_Percent end) as Suburban_Branch
from growth_calc
group by Month, Month_Name
order by Month;


# High-Risk Transaction Flag

select flag, count(amount) as Total_Transaction_Count from c_d group by 1;

# Suspicious Transaction Frequency

select monthname(transaction_date) as Month_Name, count(Account_number) as Total_Count from c_d where flag = "High-Risk" group by 1, month(transaction_date) order by month(transaction_date);
