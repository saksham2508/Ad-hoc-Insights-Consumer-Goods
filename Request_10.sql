/*
10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order
*/
WITH cte AS
(
SELECT 
	p.division,
    p.product_code,
    p.product,
    SUM(s.sold_quantity) AS total_sold_quantity,
    RANK() OVER (partition by p.division ORDER BY SUM(s.sold_quantity) DESC) AS rank_order
FROM 
	dim_product AS p
JOIN
	fact_sales_monthly AS s
ON 
	p.product_code=s.product_code
WHERE
	s.fiscal_year=2021
GROUP BY
	p.division, p.product_code, p.product
)
SELECT *
FROM cte
WHERE 
rank_order <= 3;







