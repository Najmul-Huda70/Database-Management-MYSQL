# Problem : https://leetcode.com/problems/game-play-analysis-i/description/
# Write your MySQL query statement below
SELECT player_id,event_date AS first_login
FROM Activity A1
WHERE event_date = (SELECT MIN(event_date)
FROM Activity A2
WHERE A1.player_id=A2.player_id
)
