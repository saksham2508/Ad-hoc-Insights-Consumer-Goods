/*
8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity
*/

SELECT
	CASE
		WHEN month(s.date) IN (9,10,11) THEN "Q1"
        WHEN month(s.date) IN (12,1,2) THEN "Q2"
        WHEN month(s.date) IN (3,4,5) THEN "Q3"
        WHEN month(s.date) IN (6,7,8) THEN "Q4"
	END AS QUARTER,
    CONCAT(FORMAT(SUM(s.sold_quantity)/1000000,2)," M ") AS Total_sold_quantity_mln
FROM
	fact_sales_monthly AS s
WHERE
	s.fiscal_year=2020
GROUP BY 
	Quarter
ORDER BY
	Total_sold_quantity_mln DESC;