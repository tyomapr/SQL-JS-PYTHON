select *
from departments
where exists(
  select price
  from sales
  where price > 98.00 and departments.id = sales.department_id
)