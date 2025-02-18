select *
from departments
where exists(
  select price
  from sales
  where price > 98.00 and departments.id = sales.department_id
)

/* https://www.codewars.com/kata/58113a64e10b53ec36000293 */