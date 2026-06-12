-- ================================
-- QUESTION: Which transaction types have the largest total amount
-- INSIGHT: TRANSFER has the 2nd largest total volume but the highest fraud rate — priority target for fraud prevention
-- ================================

SELECT type, COUNT(*) AS count, SUM(amount) as amount_sum
FROM transactions
GROUP BY type
ORDER BY amount_sum DESC


-- ================================
-- QUESTION: What is the top 10 biggest fraud transactions
-- INSIGHT: None of them was flagged as fraud and all of them was equal to possible limit of amount (10 mil)
-- ================================
SELECT *
FROM transactions
WHERE isFraud = 1
ORDER BY amount DESC
LIMIT 10







