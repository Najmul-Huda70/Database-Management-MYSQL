# PROBLEM : https://leetcode.com/problems/combine-two-tables/submissions/1650540909/
# Write your MySQL query statement below
SELECT Person.firstName,Person.lastName,Address.city,Address.state
FROM Person
LEFT JOIN Address ON Person.personId=Address.personId
