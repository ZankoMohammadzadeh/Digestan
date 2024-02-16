
-- Task 01 Question 01
SELECT USERID, SUM(SALES)
FROM ORDERS
INNER JOIN USERS ON ORDERS.userId = USERS.id
WHERE USERS.registeredDate >= '2023-01-01'
GROUP BY USERID
ORDER BY SUM(SALES) DESC
LIMIT 10


-- Task 01 Question 02
select  B.defaultOfferType, sum(A.quantity) as num_Offertype
from orders A
inner join providers B on A.providerId = B.id 
group by B.defaultOfferType
order  by sum(A.quantity) desc
