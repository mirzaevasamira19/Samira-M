
SELECT * FROM Games;
SELECT g.title, d.name
FROM Games g
JOIN Developers d
ON g.developer_id = d.developer_id;
SELECT * FROM Reviews;
SELECT game_id, AVG(rating)
FROM Reviews
GROUP BY game_id;
SELECT u.username, g.title
FROM Libraries l
JOIN Users u ON l.user_id = u.user_id
JOIN Games g ON l.game_id = g.game_id;
