CREATE EXTENSION tablefunc;

SELECT * FROM crosstab(
  'SELECT p.name, d.detail, COUNT(d.detail)
   FROM products p
   JOIN details d
   ON p.id = d.product_id
   GROUP BY p.name, d.detail
   ORDER BY p.name'
) AS result (name TEXT, bad BIGINT, good BIGINT, ok BIGINT);