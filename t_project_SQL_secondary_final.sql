CREATE OR REPLACE TABLE t_pavla_kosturikova_project_SQL_secondary_final AS (
	SELECT 
		country, 
		`year`, 
		GDP,
		population
	FROM economies AS e 
	WHERE `year` BETWEEN 
		(SELECT min(payroll_year) 
		FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf)
		AND
		(SELECT max(payroll_year)
		FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf)
	ORDER BY `year`
);