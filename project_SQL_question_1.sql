CREATE OR REPLACE VIEW v_payroll_growth AS 
	WITH cte_distinct_payroll AS (
		SELECT DISTINCT
			name_payroll,
			payroll,
			payroll_year
		FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf
		WHERE name_payroll IS NOT NULL 
		ORDER BY name_payroll, payroll_year 					
	)
	SELECT *,
		CASE 
			WHEN LAG(payroll) OVER (PARTITION BY name_payroll ORDER BY payroll_year) IS NOT NULL 
		    	THEN ((payroll - LAG(payroll) OVER (PARTITION BY name_payroll ORDER BY payroll_year)))
		   	ELSE NULL
	    END AS payroll_growth,
		CASE 
			WHEN LAG(payroll) OVER (PARTITION BY name_payroll ORDER BY payroll_year) IS NOT NULL 
		    	THEN round(((payroll - LAG(payroll) OVER (PARTITION BY name_payroll ORDER BY payroll_year))
		    		/ LAG(payroll) OVER (PARTITION BY name_payroll ORDER BY payroll_year)) * 100, 2)
		   	ELSE NULL
	    END AS perc_payroll_growth
	FROM cte_distinct_payroll;

SELECT *
FROM v_payroll_growth AS vpg ;

SELECT *
FROM v_payroll_growth AS vpg 
WHERE perc_payroll_growth IS NOT NULL 
ORDER BY payroll_year;

SELECT 
	name_payroll, 
	payroll_year, 
	payroll_growth,
	perc_payroll_growth
FROM v_payroll_growth AS tpg
WHERE payroll_growth IS NOT NULL 
ORDER BY perc_payroll_growth
LIMIT 10;

SELECT 
	name_payroll, 
	payroll_year, 
	payroll_growth,
	perc_payroll_growth
FROM v_payroll_growth AS tpg
WHERE payroll_growth IS NOT NULL 
ORDER BY perc_payroll_growth DESC 
LIMIT 10;