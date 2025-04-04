CREATE OR REPLACE VIEW v_groceries_growth AS 
	WITH cte_groceries AS (
		SELECT DISTINCT 
				name_category_price,
				price,
				price_year 
		FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf 
		WHERE price IS NOT NULL
		ORDER BY name_category_price, price_year 
	)
	SELECT *,
	    CASE 
	        WHEN LAG(price) OVER (PARTITION BY name_category_price ORDER BY price_year) IS NOT NULL 
	        	THEN round(((price - LAG(price) OVER (PARTITION BY name_category_price ORDER BY price_year)) 
	            	/ LAG(price) OVER (PARTITION BY name_category_price ORDER BY price_year)) * 100, 2)
	        ELSE NULL
	    END AS perc_growth
	FROM cte_groceries;

SELECT *
FROM v_groceries_growth AS tgg 
WHERE perc_growth IS NOT NULL 
ORDER BY perc_growth ;

WITH cte_all_year AS (
	SELECT DISTINCT 
			name_category_price, 
			price, 
			price_year	
	FROM t_pavla_kosturikova_project_sql_primary_final AS tpkpspf 
	WHERE price_year IN (2006, 2018) AND category_code != 212101
	ORDER BY name_category_price, price_year 
)
SELECT *,
    CASE 
        WHEN LAG(price) OVER (PARTITION BY name_category_price ORDER BY price_year) IS NOT NULL 
        	AND price_year != 2006
        	THEN round(((price - LAG(price) OVER (PARTITION BY name_category_price ORDER BY price_year)) 
            	/ LAG(price) OVER (PARTITION BY name_category_price ORDER BY price_year)) * 100, 2)
        ELSE NULL
    END AS all_perc_growth
FROM cte_all_year
ORDER BY all_perc_growth;