
-- Question 2.1 -------------------------------------------
-- sales in holidays
-- maximum sale in holidays
-- date 2023-11-04    -- sale 372,423
With A as
(
select date(O.createdAt), Sum(sales) as sum_sales, count(*) as cnt
from orders as O
where date(O.createdAt) in (select holyDate from holidays)
group by date(O.createdAt)
--order by Sum(sales) desc
)
select round(avg(sum_sales),0), round(avg(cnt),0)
from A

-- sales in non holidays
-- maximum sale in non-holidays
-- date 2023-11-08	 -- sale 951,342
with A as
(
select date(O.createdAt), Sum(sales) as sum_sales, count(*) as cnt
from orders as O
where date(O.createdAt) not in (select holyDate from holidays)
group by date(O.createdAt)
order by Sum(sales) desc
)
select round(avg(sum_sales),0), round(avg(cnt),0)
from A

-- Question 2.2 -------------------------------------------

-- average number of providers in holidays
with A as
(
select date(O.createdAt), count(distinct(providerid)) as cnt
from orders as O
where date(O.createdAt) in (select holyDate from holidays)
group by date(O.createdAt)
)
select round(avg(cnt), 0)
from A

-- average number of providers in non holidays
with A as
(
select date(O.createdAt), count(distinct(providerid)) as cnt
from orders as O
where date(O.createdAt) not in (select holyDate from holidays)
group by date(O.createdAt)
)
select round(avg(cnt), 0)
from A

-----------------------------------------------------------


