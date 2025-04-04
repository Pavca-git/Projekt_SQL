WITH cte_bread_asc_year AS (
	SELECT *
	FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf
	WHERE price_year = (
		SELECT min(price_year)
		FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf2 
		)
		AND price_value = 1 
		AND price_unit = 'kg'
		AND category_code = 111301
)
SELECT 
	price_year,
	round(avg(payroll) / price) AS number_of_bread_asc_year
FROM cte_bread_asc_year;

WITH cte_milk_asc_year AS (
	SELECT *
	FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf
	WHERE price_year = (
		SELECT min(price_year)
		FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf2 
		)
		AND price_value = 1 
		AND price_unit = 'l'
		AND category_code = 114201
)
SELECT 
	price_year,
	round(avg(payroll) / price) AS number_of_milk_asc_year
FROM cte_milk_asc_year;

WITH cte_bread_desc_year AS (
	SELECT *
	FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf
	WHERE price_year = (
		SELECT max(price_year)
		FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf2 
		)
		AND price_value = 1 
		AND price_unit = 'kg'
		AND category_code = 111301
)
SELECT 
	price_year,
	round(avg(payroll) / price) AS number_of_bread_desc_year
FROM cte_bread_desc_year;

WITH cte_milk_desc_year AS (
	SELECT *
	FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf
	WHERE price_year = (
		SELECT max(price_year)
		FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf2 
		)
		AND price_value = 1 
		AND price_unit = 'l'
		AND category_code = 114201
)
SELECT 
	price_year,
	round(avg(payroll) / price) AS number_of_milk_desc_year
FROM cte_milk_desc_year;