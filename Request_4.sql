/*
4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference
*/

WITH 
	x AS (
			SELECT
					p.segment , 
					COUNT(DISTINCT p.product_code) AS product_count_2020
			FROM 
					dim_product AS p
            JOIN 
					fact_sales_monthly AS s
				ON p.product_code = s.product_code
            WHERE 
				s.fiscal_year=2020
            GROUP BY 
				p.segment
		),
	y AS (
			SELECT
					p.segment , 
					COUNT(DISTINCT p.product_code) AS product_count_2021
			FROM 
					dim_product AS p
            JOIN 
					fact_sales_monthly AS s
				ON p.product_code = s.product_code
            WHERE 
				s.fiscal_year=2021
            GROUP BY 
				p.segment
		 )
SELECT 
    x.segment,
    x.product_count_2020,
    y.product_count_2021,
    (y.product_count_2021 - x.product_count_2020) AS Difference
FROM 
    x
JOIN 
    y ON x.segment = y.segment
ORDER BY 
    Difference DESC;
            


