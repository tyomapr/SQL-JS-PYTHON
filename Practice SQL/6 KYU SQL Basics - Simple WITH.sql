with special_sales as (
select sales.department_id as id
from sales
join departments
on sales.department_id = departments.id
where price in (select price from sales where price > 90)
group by sales.department_id
order by sales.department_id
)
select special_sales.id, departments.name
from special_sales
join departments
on special_sales.id = departments.id

/* https://www.codewars.com/kata/5811501c2d35672d4f000146 */