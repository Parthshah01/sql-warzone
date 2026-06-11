WITH cohort AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(order_date)) AS cohort_month
    FROM Orders
    GROUP BY customer_id
),
activity AS (
    SELECT
        o.customer_id,
        DATE_TRUNC('month', o.order_date) AS activity_month
    FROM Orders o
)
SELECT
    c.cohort_month,
    a.activity_month,
    COUNT(DISTINCT a.customer_id) AS active_customers
FROM cohort c
JOIN activity a
    ON c.customer_id = a.customer_id
GROUP BY c.cohort_month, a.activity_month
ORDER BY c.cohort_month, a.activity_month;