/*
7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount
*/

SELECT
	MONTHNAME(s.DATE) AS MONTH,
	YEAR(s.DATE) AS YEAR,
    ROUND(SUM(gross_price*sold_quantity),2) AS Gross_Sales_Amount
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
	c.customer = 'Atliq Exclusive'
GROUP BY
	MONTHNAME(s.DATE),YEAR(s.DATE);