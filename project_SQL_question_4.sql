CREATE OR REPLACE VIEW v_payroll_vs_price AS 
	WITH cte_payroll_vs_price AS (
		SELECT 
			sum(DISTINCT price) AS price, 
			price_year, 
			avg(payroll) AS payroll, 
			payroll_year
		FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf 
		WHERE price_year IS NOT NULL AND category_code != 212101
		GROUP BY price_year 
	)
	SELECT *,
	    CASE 
	        WHEN LAG(price) OVER (ORDER BY price_year) IS NOT NULL 
	        	THEN round(((price - LAG(price) OVER (ORDER BY price_year)) 
	        		/ LAG(price) OVER (ORDER BY price_year)) * 100, 2)
	        ELSE NULL
	    END AS price_perc_growth,
		CASE 
			WHEN LAG(payroll) OVER (ORDER BY payroll_year) IS NOT NULL 
				THEN round(((payroll - LAG(payroll) OVER (ORDER BY payroll_year)) 
					/ LAG(payroll) OVER (ORDER BY payroll_year)) * 100, 2)
	        ELSE NULL
	    END AS payroll_perc_growth
	FROM cte_payroll_vs_price;

SELECT 
	price_year, 
	price_perc_growth, 
	payroll_perc_growth, 
	price_perc_growth - payroll_perc_growth AS price_vs_payroll
FROM v_payroll_vs_price
WHERE price_perc_growth IS NOT NULL;