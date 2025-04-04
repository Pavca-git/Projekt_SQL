CREATE OR REPLACE VIEW v_price_for_primary_final AS
	WITH cte_price AS (
		SELECT 
			round(avg(value),2) AS price, 
			year(date_from) AS price_year, 
			category_code 
		FROM czechia_price AS cp 
		GROUP BY category_code, price_year
	)
	SELECT 
		cp.category_code,
		cpc.name AS name_category_price, 
		cp.price,
		cpc.price_value, 
		cpc.price_unit,
		cp.price_year
	FROM cte_price AS cp 
	INNER JOIN czechia_price_category AS cpc
		ON cp.category_code = cpc.code;

CREATE OR REPLACE VIEW v_payroll_for_primary_final AS
	WITH cte_payroll AS (
		SELECT 
			round(avg(value)) AS payroll, 
			payroll_year, 
			industry_branch_code
		FROM czechia_payroll AS cp
		WHERE value_type_code = 5958
		GROUP BY payroll_year, industry_branch_code
	)
	SELECT 
		cp.industry_branch_code,
		cpib.name AS name_payroll,
		cp.payroll,
		cp.payroll_year
	FROM cte_payroll AS cp
	INNER JOIN czechia_payroll_industry_branch AS cpib 
		ON cp.industry_branch_code = cpib.code;


CREATE OR REPLACE TABLE t_pavla_kosturikova_project_SQL_primary_final AS (
	SELECT *
	FROM v_payroll_for_primary_final AS vpfpf 
	LEFT JOIN v_price_for_primary_final AS vpfpf2 
		ON vpfpf.payroll_year = vpfpf2.price_year 
	ORDER BY payroll_year, industry_branch_code
);