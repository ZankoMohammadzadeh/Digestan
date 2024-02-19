
-- total days = 419 days 
select cast(julianday(date(max(createdAt))) -julianday(date(min(createdAt))) + 1 as int) as total_days
from orders

-- count of holidays = 16 days
With A as
(
select min(date(createdAt)) as min_orderDate, max(date(createdAt)) as max_orderDate
from orders
)
select count(*) as holidays_cnt
from holidays, A
where holyDate between min_orderDate and max_orderDate

-- count of non holidays = 403 days
select count(distinct(date(createdAt))) as CNT_Non_Holi
from orders
where date(createdAt) not in 
(
select *
from holidays
)




