create database bank;
use bank;

alter table loan change column `ï»¿Account_ID`  Account_ID text;
select * from loan;

# Total Loan Amount Funded

select sum(funded_amount) as Total_loan_amount from loan;

# Total Loans

select count(account_id) as Total_loans from loan;

# Total Collection

select sum(total_pymnt) as Total_Collection from loan;

# Total Interest

select sum(Total_Rrec_int) as Total_Interest from loan;

# Branch-Wise (Interest, Fees, Total Revenue)

select branch_name, sum(total_pymnt) as Total_Revenue, sum(total_Rrec_int) as Total_Interest, sum(total_fees) as Total_Fees from loan 
group by 1 order by 2 desc limit 5;

# State-Wise Loan

select state_name, sum(funded_amount) as Total_Loan from loan group by 1 order by 2 desc limit 10;

# Religion-Wise Loan

select religion, sum(funded_amount) as Total_Amount from loan group by 1 order by 2 desc;

# Product Group-Wise Loan

select product_code, sum(funded_amount) as total_amount from loan group by 1 order by 2 desc;

#  Disbursement Trend

select year(disbursement_date) as Years, sum(funded_amount) as Total_Amount from loan group by 1 order by 1;

# Grade-Wise Loan

select grade, sum(funded_amount) as Total_Amount from loan group by 1 order by 1;

# Count of Default Loan

select count(account_id) as Total_Default_Loan from loan where default_loan = "Y";

# Count of Delinquent Clients

select count(client_id) as Total_Delinquent_Clients from Loan where delinquent_loan = "Y";

# Delinquent Loans Rate

with loan_counts as (
    select 
        count(account_id) as Total_Loans,
        sum(case when delinquent_loan = 'Y' then 1 else 0 end) as Total_Delinquent_Loans
    from loan
)
select 
    concat(round((Total_Delinquent_Loans * 100.0 / Total_Loans),2), '%') as Delinquent_Loans_Rate
from loan_counts;


# Default Loan Rate

with loan_counts as (
    select 
        count(account_id) as Total_Loans,
        sum(case when default_loan = 'Y' then 1 else 0 end) as Total_Default_Loans
    from loan
)
select 
    concat(round((Total_Default_Loans * 100.0 / Total_Loans),2), '%') as Default_Loans_Rate
from loan_counts;


# Loan Status-Wise Loan

select loan_status, count(account_id) as Total_Loan from loan group by 1 order by 2 desc;

# Age Group-Wise Loan

select age_group, count(account_id) as Total_Loan from loan group by 1 order by 1;

# No Verified Loan

select count(account_id) as Total_Loan from loan where verification_status = "Not Verified";

# Loan Maturity

select term, count(term) as Total_Terms from loan group by 1;