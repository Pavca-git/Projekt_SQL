# Projekt_SQL

První projekt do Engeto Online Datové Akademie

## Popis projektu
Úkolem SQL projektu je pomocí použitých datových podkladů vytvořit dvě tabulky (primary_final a secondary_final), díky kterým dostaneme odpovědi na definované výzkumné otázky o dostupnosti základních potravin široké veřejnosti.

## Datové sady použité pro vytvoření datového podkladu

### Primární tabulky pro vytvoření tabulky primary_final

- czechia_payroll - informace o mzdách v různých odvětvích za několikaleté období
- czechia_payroll_industry_branch - číselník odvětví v tabulce mezd
- czechia_price - informace o cenách vybraných potravin za několikaleté období
- czechia_price_category - číselník kategorií vybraných potravin

### Dodatečná tabulka pro vytvoření tabulky secondary_final

- economies - HDP, GINI koeficient, populace, atd. pro daný stát a rok

## Výzkumné otázky

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentruální meziroční nárůst)?
4. Existuje rok, ve kterém byl meziroční nárust cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

## Popis souborů

Projekt obsahuje 7 samostatných SQL souborů - vytvoření tabulky primary_final, secondary_final a odpovědi na otázky 1 až 5.
Součástí je také MD soubor s odpověďmi na výzkumné otázky.
