# Bank Loan & Credit–Debit Analytics Dashboard
To design an end-to-end banking analytics solution that monitors loan portfolio performance and credit/debit transaction patterns. The goal is to provide actionable insights on loan approvals, defaults, high-risk transactions, and branch growth trends to support risk management and strategic decision-making.

## Tools & Technologies
- MySQL – Data storage, cleaning, and transformation
- Excel – Power Query & preliminary analysis
- Power BI – Interactive KPI dashboards with DAX
- Tableau – Advanced visual storytelling and trend analysis

## Dataset Used
- <a href= "https://github.com/rohan-784/Bank_Analysis/commit/96d0b28892439d701178ef248afcea3e1fcad071">Bank Dataset</a>

## Key KPIs
The dashboards highlight the following metrics:
- Total Credit Amount & Total Debit Amount
- Net Transaction Amount and Credit-to-Debit Ratio
- Account Activity Ratio
- Count of High-Risk / Flagged Transactions
- Loan Approval Rate, Default Rate, and Total Loan Value
- Branch Transaction Growth % (Month-over-Month)
- Transaction Method Distribution (Debit Card, Credit Card, Bank Transfer)

## Process

1. Data Collection & Cleaning
- Imported raw datasets into MySQL for initial structuring.
- Handled missing values, duplicates, and outliers using SQL and Excel Power Query.
2. Data Modeling & Transformation
- Created relational models and aggregated tables using MySQL joins & window functions.
- Built calculated columns and KPIs using DAX (Power BI) and Tableau Calculations.
3. Dashboard Development
- Designed interactive dashboards in Power BI and Tableau with drill-down filters for Month, Day, Bank, and Branch.
- Connected to MySQL for live queries and implemented slicers for dynamic analysis.
4. Validation & Testing
- Cross-verified figures across Excel, Power BI, and Tableau to ensure consistency.

## Excel Loan Dashboard <img width="1867" height="973" alt="image" src="https://github.com/user-attachments/assets/d57877e7-ed0a-459b-a4dd-b35d645f7357" /> <img width="1866" height="975" alt="image" src="https://github.com/user-attachments/assets/da41319c-3ea6-4f0e-a643-4aeff1d240a5" />

## Excel Credit and Debit Dashboard <img width="1866" height="972" alt="image" src="https://github.com/user-attachments/assets/4ffe0dd0-d317-4761-8149-bfd54b157704" />

## Power BI Dashboard - <a href= "">Click Here</a>

## Tableau Dashboard - <a href= "">Click Here</a>

## Project Insights

- Total credit and debit transactions each exceeded ₹127M, with a credit-to-debit ratio of ~1.00, indicating balanced inflows and outflows.
- 20K+ high-risk transactions flagged across branches, enabling proactive fraud detection.
- Branch-wise growth analysis revealed City Center Branch as the top performer with >42M in transaction volume.
- Transaction method distribution showed an almost equal share among Debit Card, Credit Card, and Bank Transfer (~33% each).
- Loan analytics identified patterns in approval rates and default ratios that highlight seasonal lending trends.

## Final Conclusion

This project demonstrates how SQL, Excel, Power BI, and Tableau can be combined to transform raw banking data into actionable financial intelligence.
The dashboards enable management to:
- Track loan performance and risk exposure in real time
- Identify high-risk transactions instantly
- Compare branch performance and growth month-over-month
- Make data-driven decisions for lending strategies and customer engagement.


