SELECT
    c.customer_id,
    c.customer_name,
    MAX(o.order_date) AS last_order_date
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING MAX(o.order_date) < CURRENT_DATE - INTERVAL '90 days'
ORDER BY last_order_date;