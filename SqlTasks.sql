select * from sales;

select SaleDate, Amount, Boxes, Amount / Boxes AperB from sales;

select * from sales
where amount > 10000;

select * from sales
where amount > 10000
order by amount desc;

select * from sales
where geoid = 'g1'
order by pid, amount desc;

-- select * from sales
-- where amount > 10000 and SaleDate > '2022-01-01';

select * from sales
where amount > 10000 and year(SaleDate) = 2022
order by amount desc;

-- select * from sales
-- where boxes > 0 and boxes <=50;

select * from sales
where boxes between 0 and 50;

select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day'
from sales
where weekday(SaleDate) = 4;

select * from people;

-- select * from people
-- where Team = 'Delish' or Team = 'Jucies';

select * from people
where team in ('Delish','Jucies');

select * from people
where Salesperson like '%B%';

select * from sales;

select SaleDate, Amount,
case when Amount < 1000 then 'Under 1k'
	 when Amount < 5000 then 'Under 5k'
     when Amount < 10000 then 'Under 10k'
     else '10k or more'
     
end as 'Amount Category'
from sales;

select s.saledate, s.amount, p.salesperson, s.spid, p.spid
from sales s join people p
on s.spid = p.spid;

select s.saledate, s.amount, pr.product 
from sales s left join products pr
on s.pid = pr.pid;

select s.saledate, s.amount, pr.product, p.team
from sales s join people p
on s.spid = p.spid 
join products pr on s.pid = pr.pid;

select s.saledate, s.amount, pr.product, p.team, g.geo 
from sales s join people p
on s.spid = p.spid 
join products pr on s.pid = pr.pid
join geo g on g.geoid = s.geoid
where s.amount < 500 and p.team = '' and g.geo in ('India','New Zealand')
order by saledate;

select g.geo, sum(amount), avg(amount), sum(boxes)
from sales s join geo g
on s.geoid = g.geoid
group by g.geo;

select pr.category, p.team, sum(amount), sum(boxes)
from sales s join people p
on s.spid = p.spid
join products pr
on s.pid = pr.pid
where p.team <> ''
group by pr.category, p.team
order by pr.category, p.team;

select pr.product, sum(s.amount) as 'Total Amount'
from sales s join products pr
on s.pid = pr.pid
group by pr.product
order by 'Total Amount' desc
limit 10;

































