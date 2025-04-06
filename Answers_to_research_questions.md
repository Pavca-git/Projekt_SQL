# ODPOVĚDI NA VÝZKUMNÉ OTÁZKY
---

## Projekt SQL  
**První projekt do Engeto Online Datové Akademie** 

Zpracovala: Pavla Koštuříková  
e-mail: kosturikovap@gmail.com  
discord: Pavla K  

---

## Tvorba tabulek primary a secondary

Tabulka *t_pavla_kosturikova_project_SQL_primary_final* je vytvořená z tabulek czechia_payroll a czechia_price sjednocených za společné roky pomocí LEFT JOIN, aby byly zanechány všechny roky, ve kterých jsou údaje o mzdách. Také byly použity tabulky czechia_payroll_industry_branch a czechia_price_category pro doplnění potřebných údajů.
Do tabulky jsou zařazeny pouze mzdy, které obsahují název odvětví.

  Sloupce primary tabulky:
- industry_branch_code - kódy jednotlivých odvětví
- name_payroll - názvy jednotlivých odvětví
- payroll - průměrná hrubá mzda v Kč
- payroll_year - roky 2000 - 2021 (mzdy)
- category_code - kódy jednotlivých potravin
- name_category_price - názvy jednotlivých potravin
- price - ceny potravin v Kč
- price_value - množství jednotlivých potravin
- price_unit - jednotka množství daných potravin
- price_year - roky 2006 - 2018 (ceny potravin)
  
Tabulka *t_pavla_kosturikova_project_SQL_secondary_final* je vytvořena z tabulky economies pro srovnatelné období s primary tabulkou (2020 - 2021).

Sloupce secondary tabulky:
- country - země světa
- year - rok
- GDP - HDP
- population - populace

---

## 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

V letech **2001** až **2008**, **2012** a **2017** až **2019** rostly mzdy ve všech odvětvích.

Pouze ve čtyřech z 19 odvětví rostly mzdy ve všech zkoumaných letech (2000 - 2021):
- Doprava a skladování 
- Ostatní činnosti
- Zdravotní a sociální péče
- Zpracovatelský průmysl

V některých odvětvích poklesla mzda pouze nepatrně:
- Administrativní a podpůrné činnosti v roce *2013* o **0,36 %**
- Informační a komunikační činnosti *2013* o **1,01 %**
- Velkoobchod a maloobchod; opravy a údržba motorových vozidel v roce *2013* o **0,94 %**
- Zásobování vodou, činnosti související s odpady a sanacemi v roce *2013* o **0,38 %**

V jiných odvětví byl pokles mzdy výraznější:
- Činnosti v oblasti nemovitostí v roce *2013* o **1,7 %** a *2020* o **7 %**
- Kulturní, zábavní a rekreační činnosti v roce *2011* o **0,05 %**, *2013* o **1,37 %** a *2021* o **3,03 %**
- Peněžnictví a pojišťovnictví v roce *2013* o **8,91**
- Profesní, vědecké a technické činnosti v roce *2010* o **0,61 %** a *2013* o **2,91 %**
- Stavebnictví v roce *2013* o **2,13 %** a *2021* o **0,59 %**
- Těžba a dobývání v roce *2009* o **3,74 %**, *2013* o **2,85 %**, *2014* o **0,79 %** a *2016* o **0,59 %** 
- Ubytování, stravování a pohostinství v roce *2019* o **1,2 %**, *2011* o **1,11 %** a *2020* o **5,88 %**
- Veřejná správa a obrana; povinné sociální zabezpečení v roce *2010* o **0,33 %**, *2011* o **2,24 %** a *2021* o **2,27 %**
- Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu v roce *2013* o **4,37 %** a *2015* o **1,31 %**
- Vzdělávání v roce *2010* o **1,84 %** a *2021* o **2,65 %**
- Zemědělství, lesnictví, rybářství v roce *2009* o **0,62 %** a *2021* o **3,8 %**

Nejvíce krát byl pokles mzdy napříč odvětví v roce **2013**. Nejvýraznější pokles ze všech odvětví zaznamenalo v roce **2013** *peněžnictví a pojišťovnictví* (o **8,91 %**). Konkrétně snížení mzdy v průměru o **4479 Kč**.  
Pokud se podíváme na nejvýraznější růst - ve *zdravotnictví a sociální péči* se v roce **2021** navýšily průměrně mzdy o **5823 Kč** (o **14.72 %**). Stojí za zmínku, že nejvyšší procentuální meziroční nárust mzdy zaznamenaly informační a komunikační činnosti v roce *2001* o **15,22 %**.

Celkový růst jednotlivých odvětví za celé období 21 let se pohybuje v rozmezí od **129,42 %** do **203,55 %**. Pouze v oblasti *zdravotní a sociální péči* mzdy vzrostli v roce 2021 oproti roku 2000 o **290,04 %**.

---

## 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

V roce *2006* bylo možné si koupit za průměrnou hrubou mzdu **1287 kg chleba** nebo **1437 l mléka**.

V roce *2018* bylo možné si koupit za průměrnou hrubou mzdu **1342 kg chleba** nebo **1642 l mléka**.

---

## 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

Za celé období (*2006 - 2018*) zlevnil cukr krystal o **27,52 %**, kdy v roce 2006 stál *21,73 Kč*, zatímco v roce 2018 se prodávalo 1 kg cukru za **15,75 Kč**. Zlevnila také rajská jablka červená kulatá o ***23,07 %**. Všechny ostatní potraviny v průběhu let zdražily.  
Stojí za zmínku, že k největšímu zdražení došlo u másla, jehož cena vzrostla o **98,37 %**, z *104,39 Kč* na *207,08 Kč* za 1 kg.

Pokud se podíváme na růst/pokles cen v jednotlivých letech, v roce *2007* došlo k nejvýraznějšímu meziročnímu poklesu ceny rajských jablek, a to o **30,28 %**. Ve stejném roce došlo k **94,82 %** zdražení u paprik.

---

## 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

Výchozí hodnotou cen potravin byl součet cen jednotlivých potravin, pro které byly k dispozici cenové údaje za všechny roky. *Jakostní víno bílé* nebylo zahrnuto do součtu, protože cenové údaje jsou známy až od roku *2015*.   
Ve zkoumaném období (*2006 - 2018*) *nebyl* zaznamenán rok, kdy by rozdíl mezi růstem cen potravin a růstem mezd byl větší než **10 %**.  
Nejlépe na tom byli lidé v roce *2009*, kdy nejen že potraviny zlevnily o **6,42 %**, ale mzdy navíc vzrostly o **3,16 %**.  
Naopak v roce *2013* ceny potravin vzrostly o **7,46 %** a mzdy klesly o **1,56 %**.  
Nejvýraznější růst cen potravin nastal v roce *2017*, kdy ceny vzrostly o **10,12 %**, což bylo částečně kompenzováno růstem mezd o **6.28 %**.  

---

## 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Pro lepší představu o změnách HDP, mzdách a cenách potravin je přiložen graf. Je zde také znázorněný *procentuální meziroční růst reálné mzdy*, vypočítaný jako procentuální rozdíl mzdy a ceny potravin.

![image](https://github.com/user-attachments/assets/14831e36-6530-4193-92d2-a3f6c236eab0)

Vliv HDP na změny ve mzdách a cenách potravin není zcela prokazatelný. V roce *2009* došlo k nejvýraznějšímu poklesu HDP a cen, přičemž mzdy sice rostly, ale tempo růstu bylo poloviční oproti předchozímu roku. V roce *2017* HDP vzrostlo o **5,17 %** a obdobně se zvýšily i mzdy. Ceny potravin vzrostly dokonce o **10,12 %**.   
Naopak v letech *2012* a *2013* se růst HDP pohyboval okolo **0 %**. V roce *2012* sice rostly ceny i mzdy, avšak v roce *2013* došlo k nejvýraznějšímu poklesu reálné mzdy.   
A v roce *2015*, kdy HDP rostlo o **5,42 %**, ceny potravin naopak klesly o **2,91 %**.  
Z grafu je patrné, že změny HDP a mezd vykazují podobné trendy, zatímco růst cen potravin není tak silně provázán s těmito změnami.
