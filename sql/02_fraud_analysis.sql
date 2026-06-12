-- ================================
-- QUESTION: What is the count of fraud transactions by type and what if the fraud rate
-- INSIGHT: It's clear that there are in 4.2 times more CASH_OUT fraud transactions than TRANSFER,
-- however fraud rate for TRANSFER is higher, but loss of money is bigger in CASH OUT so -- increase safety measure during CASH OUT
-- ================================
SELECT type, COUNT(*) AS count_fraud, AVG(isFraud) * 100 AS fraud_rate
FROM transactions
GROUP BY type
HAVING isFraud = 1;


-- ================================
-- QUESTION: How many transactions was lead to zero balance and how many from them were fraud
-- INSIGHT: over 1.5M transactions drained accounts to zero, yet fraud rate is only 0.5% — legitimate behavior pattern - so we dont need to increase safety measurement in this type of transactions
-- ================================
SELECT COUNT(*) AS zero_balance_after_transaction, AVG(isFraud) *100 as fraud_rate
FROM transactions
WHERE oldbalanceOrg > 0 AND newbalanceOrig = 0;


-- ================================
-- QUESTION: the top 5 accounts with the highest count of fraud and total stolen amount
-- INSIGHT: there are no accounts who do more than 1 fraud so it's useless to ban old fraud accounts, we need to preserve from gaining new fraud accounts
-- ================================
SELECT nameOrig, COUNT(*) AS count_fraud, SUM(amount) AS total_stolen_amount
FROM transactions
WHERE isFraud = 1
GROUP BY nameOrig
ORDER BY count_fraud DESC
LIMIT 5;