SELECT
(
    COUNT(DISTINCT customer_id) FILTER (
        WHERE customer_id IN (
            SELECT customer_id
            FROM Orders
            GROUP BY customer_id
            HAVING COUNT(order_id) > 1
        )
    ) * 100.0
    /
    COUNT(DISTINCT customer_id)
) AS retention_rate
FROM Customers;