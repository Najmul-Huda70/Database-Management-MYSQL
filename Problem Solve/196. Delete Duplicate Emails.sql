# problem : https://leetcode.com/problems/delete-duplicate-emails/description/

DELETE P1
FROM Person AS P1 
INNER JOIN Person AS P2
WHERE P1.email=P2.email AND P1.id>P2.id
