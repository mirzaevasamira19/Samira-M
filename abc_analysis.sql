SELECT
    g.title,
    SUM(g.price * p.quantity) AS revenue
FROM Games g
JOIN Purchases p
ON g.game_id = p.game_id
GROUP BY g.title
ORDER BY revenue DESC;
