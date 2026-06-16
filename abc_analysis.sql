WITH game_revenue AS (
    SELECT
        g.title,
        SUM(g.price * p.quantity) AS revenue
    FROM Games g
    JOIN Purchases p ON g.game_id = p.game_id
    GROUP BY g.title
),
abc_data AS (
    SELECT
        title,
        revenue,
        SUM(revenue) OVER () AS total_revenue,
        SUM(revenue) OVER (
            ORDER BY revenue DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_revenue
    FROM game_revenue
)
SELECT
    title,
    revenue,
    ROUND(revenue * 100.0 / total_revenue, 2) AS revenue_percent,
    ROUND(cumulative_revenue * 100.0 / total_revenue, 2) AS cumulative_percent,
    CASE
        WHEN cumulative_revenue * 100.0 / total_revenue <= 80 THEN 'A'
        WHEN cumulative_revenue * 100.0 / total_revenue <= 95 THEN 'B'
        ELSE 'C'
    END AS abc_category
FROM abc_data
ORDER BY revenue DESC;
