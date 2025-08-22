/*
9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/

WITH cte AS
(
SELECT
	c.channel,
    CONCAT(ROUND(SUM(gross_price*sold_quantity)/1000000,2)," M ") AS gross_sales_mln
FROM 
	fact_sales_monthly AS s
JOIN 
	dim_customer AS c
ON 
	s.customer_code = c.customer_code
JOIN 
	fact_gross_price AS g
ON 
	s.product_code = g.product_code
WHERE 
	s.fiscal_year=2021
GROUP BY 
	c.channel
)
SELECT 
	channel,
    gross_sales_mln,
    ROUND((gross_sales_mln*100)/SUM(gross_sales_mln) OVER(), 2) as Percentage
FROM 
	cte
ORDER BY
	gross_sales_mln;