
-- number of providers in holidays
select  count(distinct providerid )
from orders A
where date(A.createdAt) in
(select * from holidays )

-- number of providers in non holidays
select  count(distinct providerid )
from orders A
where date(A.createdAt) not in
(select * from holidays )


select date(createdAt), sum(sales)
from orders
group by date(createdAt)
order by sum(sales) 

-- Average o Sales in holidays = 236999
With count_Holidays as
(
select count(distinct(date(A.createdAt))) as CNT_Holi
from orders A
where date(A.createdAt)  in 
(select *
from holidays)
)
select Sum(sales) / CNT_Holi
from orders A, count_Holidays
inner join holidays B on date(A.createdAt) = B.holyDate


-- Average o Sales in non holidays = 17193025
With count_Non_Holidays as
(
select count(distinct(date(A.createdAt))) as CNT_Non_Holi
from orders A
where date(A.createdAt) not in 
(select *
from holidays)
)
select Sum(sales) / CNT_Non_Holi
from orders A, count_Non_Holidays
inner join holidays B on date(A.createdAt) != B.holyDate

------------------------------------------

select count(distinct(date(A.createdAt))) as CNT_holi
from orders A
where date(A.createdAt)  in 
(select *
from holidays)

inner join holidays B on date(A.createdAt) = B.holyDate

With count_holidays as
(
select count(distinct(date(A.createdAt))) as CNT_holi
from orders A
inner join holidays B on date(A.createdAt) = B.holyDate
)
select Sum(sales) / CNT_holi
from orders A, count_holidays
inner join holidays B on date(A.createdAt) != B.holyDate


