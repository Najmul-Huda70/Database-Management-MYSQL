# Problem : https://leetcode.com/problems/customers-who-never-order/
# solve: https://leetcode.com/submissions/detail/1650370257/
# Write your MySQL query statement below
SELECT NAME AS Customers
FROM Customers
LEFT JOIN Orders ON Customers.ID = Orders.customerId
GROUP BY Customers.ID
HAVING COUNT(Orders.ID)=0
