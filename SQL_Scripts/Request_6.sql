/*
6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage
*/

SELECT 
	c.customer_code,
    c.customer,
    ROUND(AVG(id.pre_invoice_discount_pct),4) AS average_discount_percentage
FROM 
	dim_customer AS c
JOIN 
	fact_pre_invoice_deductions AS id
ON 
	c.customer_code = id.customer_code 
WHERE 
	id.pre_invoice_discount_pct > (SELECT 
								    AVG(pre_invoice_discount_pct) 
                                    FROM fact_pre_invoice_deductions)
	AND id.fiscal_year=2021 
	AND c.market='India'
GROUP BY 
	c.customer_code,
    c.customer
ORDER BY
	average_discount_percentage DESC
LIMIT 5;
