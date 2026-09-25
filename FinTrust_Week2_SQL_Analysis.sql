--Question 1: Customer Segments & Behavior
--Business Question: What is the total transaction volume, total financial value (in NGN), average transaction amount,
--and percentage share of total bank value across each Customer Segment?

SELECT 
    c.Customer_Segment,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ROUND(SUM(t.Amount_NGN), 2) AS Total_Amount_NGN,
    ROUND(AVG(t.Amount_NGN), 2) AS Avg_Amount_NGN,
    ROUND(SUM(t.Amount_NGN) * 100.0 / (SELECT SUM(Amount_NGN) FROM transactions), 2) AS Value_Share_Pct
FROM customers c
JOIN transactions t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Total_Amount_NGN DESC;

--Question 2: Transaction Activity & Monthly Trends
--Business Question: How does monthly transaction volume, total processed value, and average transaction size trend 
--across Q1 2026?

SELECT 
    TO_CHAR(t.Transaction_DateTime, 'YYYY-MM') AS Month,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ROUND(SUM(t.Amount_NGN), 2) AS Total_Amount_NGN,
    ROUND(AVG(t.Amount_NGN), 2) AS Avg_Amount_NGN
FROM transactions t
GROUP BY Month
ORDER BY Month ASC;

--Question 3: Transaction Channel Usage & Adoption
--Business Question: Which transaction channels handle the highest transaction volume and processed financial value 
--across FinTrust's user base?

SELECT 
    t.Channel,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ROUND(SUM(t.Amount_NGN), 2) AS Total_Amount_NGN,
    ROUND(AVG(t.Amount_NGN), 2) AS Avg_Amount_NGN,
    ROUND(COUNT(t.Transaction_ID) * 100.0 / (SELECT COUNT(*) FROM transactions), 2) AS Volume_Share_Pct
FROM transactions t
GROUP BY t.Channel
ORDER BY Total_Transactions DESC;

--Question 4: Transaction Status & Channel Failure Rates
--Business Question: What is the transaction completion status breakdown (Successful, Failed, Reversed, Pending) 
--and failure rate percentage across each transaction channel?

SELECT 
    t.Channel,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    SUM(CASE WHEN t.Transaction_Status = 'Successful' THEN 1 ELSE 0 END) AS Successful_Tx,
    SUM(CASE WHEN t.Transaction_Status = 'Failed' THEN 1 ELSE 0 END) AS Failed_Tx,
    SUM(CASE WHEN t.Transaction_Status = 'Reversed' THEN 1 ELSE 0 END) AS Reversed_Tx,
    SUM(CASE WHEN t.Transaction_Status = 'Pending' THEN 1 ELSE 0 END) AS Pending_Tx,
    ROUND(SUM(CASE WHEN t.Transaction_Status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(t.Transaction_ID), 2) AS Failure_Rate_Pct
FROM transactions t
GROUP BY t.Channel
ORDER BY Failure_Rate_Pct DESC;


--Question 5: Value Distribution by Transaction Type
--Business Question: What are the primary transaction types and how do they contribute to total processed monetary 
--value and transaction count?

SELECT 
    t.Transaction_Type,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ROUND(SUM(t.Amount_NGN), 2) AS Total_Amount_NGN,
    ROUND(AVG(t.Amount_NGN), 2) AS Avg_Amount_NGN,
    ROUND(SUM(t.Amount_NGN) * 100.0 / (SELECT SUM(Amount_NGN) FROM transactions), 2) AS Value_Share_Pct
FROM transactions t
GROUP BY t.Transaction_Type
ORDER BY Total_Amount_NGN DESC;


--Question 6: Risk-Review Patterns & Interception Rates
--Business Question: What is the non-success rate (Failed + Reversed) and total monetary volume for transactions 
--flagged for Risk Review compared to non-flagged transactions?

SELECT 
    t.Risk_Review_Flag,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ROUND(SUM(t.Amount_NGN), 2) AS Total_Amount_NGN,
    SUM(CASE WHEN t.Transaction_Status = 'Successful' THEN 1 ELSE 0 END) AS Successful,
    SUM(CASE WHEN t.Transaction_Status = 'Failed' THEN 1 ELSE 0 END) AS Failed,
    SUM(CASE WHEN t.Transaction_Status = 'Reversed' THEN 1 ELSE 0 END) AS Reversed,
    ROUND(SUM(CASE WHEN t.Transaction_Status IN ('Failed', 'Reversed') THEN 1 ELSE 0 END) * 100.0 / COUNT(t.Transaction_ID), 2) AS Non_Success_Rate_Pct
FROM transactions t
GROUP BY t.Risk_Review_Flag;


--Question 7: Compliance Exposure on Inactive Accounts
--Business Question: What is FinTrust's total financial exposure and transaction volume originating from inactive 
--customer accounts (Dormant and Restricted statuses)?

SELECT 
    c.Account_Status,
    COUNT(DISTINCT c.Customer_ID) AS Customer_Count,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ROUND(SUM(t.Amount_NGN), 2) AS Total_Amount_NGN,
    ROUND(AVG(t.Amount_NGN), 2) AS Avg_Amount_NGN,
    ROUND(SUM(t.Amount_NGN) * 100.0 / (SELECT SUM(Amount_NGN) FROM transactions), 2) AS Financial_Exposure_Pct
FROM customers c
JOIN transactions t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Account_Status
ORDER BY Total_Amount_NGN DESC;


--Question 8: High-Value Outliers across Customer Segments
--Business Question: How many high-value outlier transactions (exceeding NGN 117,922.86) occurred across each Customer
--Segment, and what total monetary value do they represent?

SELECT 
    c.Customer_Segment,
    COUNT(t.Transaction_ID) AS Outlier_Tx_Count,
    ROUND(SUM(t.Amount_NGN), 2) AS Outlier_Total_Amount_NGN,
    ROUND(AVG(t.Amount_NGN), 2) AS Outlier_Avg_Amount_NGN
FROM customers c
JOIN transactions t ON c.Customer_ID = t.Customer_ID
WHERE t.High_Value_Outlier_Flag = 'Outlier'
GROUP BY c.Customer_Segment
ORDER BY Outlier_Total_Amount_NGN DESC;



