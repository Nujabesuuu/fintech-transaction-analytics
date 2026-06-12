-- ================================
-- QUESTION: Does transaction size have a relationship with fraud risk?
-- INSIGHT: Transactions over $100K have a 4.7x higher fraud rate —
-- large transfers require additional verification
-- ================================

SELECT
    CASE WHEN amount > 100000 THEN 'over 100k'
    ELSE 'under 100k' END AS amount_range,
    AVG(isFraud) as fraud_rate
FROM transactions
GROUP BY amount_range
