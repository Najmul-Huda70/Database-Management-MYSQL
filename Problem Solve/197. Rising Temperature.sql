#Problem: https://leetcode.com/problems/rising-temperature/description/
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature


-- Step-by-Step Explanation
  
Self-Join with Date Condition:
w1 and w2 are aliases for the Weather table.
JOIN Weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY):
This joins the table with itself such that w1.recordDate is exactly one day after w2.recordDate.
DATE_ADD(w2.recordDate, INTERVAL 1 DAY) adds 1 day to w2.recordDate.
This ensures w2 represents the “previous day” for w1.
Temperature Comparison:
WHERE w1.temperature > w2.temperature:
This keeps only the rows where the temperature on w1’s date is greater than the temperature on w2’s date (the previous day).
SELECT w1.id:
We select the id from w1, which corresponds to the dates where the temperature is higher than the previous day.
Applying to the Example
  
Input:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Join condition w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY):
For w1.recordDate = 2015-01-02, w2.recordDate must be 2015-01-01 → Pair: (w1.id = 2, w2.id = 1).
For w1.recordDate = 2015-01-03, w2.recordDate must be 2015-01-02 → Pair: (w1.id = 3, w2.id = 2).
For w1.recordDate = 2015-01-04, w2.recordDate must be 2015-01-03 → Pair: (w1.id = 4, w2.id = 3).
There’s no match for w1.recordDate = 2015-01-01 because there’s no previous day in the table.
Result of the join:

w1.id | w1.recordDate | w1.temperature | w2.id | w2.recordDate | w2.temperature
------+--------------+---------------+-------+--------------+---------------
2     | 2015-01-02   | 25            | 1     | 2015-01-01   | 10
3     | 2015-01-03   | 20            | 2     | 2015-01-02   | 25
4     | 2015-01-04   | 30            | 3     | 2015-01-03   | 20
Apply w1.temperature > w2.temperature:
w1.id = 2: 25 > 10 → Keep id = 2.
w1.id = 3: 20 < 25 → Discard.
w1.id = 4: 30 > 20 → Keep id = 4.
  
Final Output:
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Why This Works
The query directly compares each day with its previous day using the recordDate column.
It checks the temperature condition (w1.temperature > w2.temperature) as required by the problem.
It handles the “yesterday” requirement explicitly with DATE_ADD.
