/* Overall Ranking: What are the top 10 countries with the highest total 
food waste in tonnes (combining household, retail, and food service)?*/

SELECT TOP 10 
    country,
    combined_figures_kg_capita_year

FROM 
    dbo.[Food Waste data and research - by country]
ORDER BY 
    combined_figures_kg_capita_year DESC

/*Regional Averages: What is the average combined_figures_kg_capita_year for each region?
 Order the results from the highest average to the lowest.*/

select 
    region,
    avg(combined_figures_kg_capita_year) AS Average_combined_figures_kg_capita_year
from  
    dbo.[Food Waste data and research - by country]
group by 
    region
order by 
    Average_combined_figures_kg_capita_year desc
  
/*High-Waste Countries with Low Confidence: Which countries have a combined_figures_kg_capita_year 
greater than 150 and a confidence_in_estimate of 'Very Low Confidence'?*/

select 
    country,
    combined_figures_kg_capita_year,
    confidence_in_estimate
from 
    dbo.[Food Waste data and research - by country]
where 
    combined_figures_kg_capita_year > 150
and
    confidence_in_estimate ='Very Low Confidence'
order by 
    combined_figures_kg_capita_year desc

/*Household vs. Total Waste: For each country in 'South-eastern Asia', 
what percentage of the combined_figures_kg_capita_year is from household_estimate_kg_capita_year?*/

select 
    country,
    (household_estimate_kg_capita_year*100)/(combined_figures_kg_capita_year) AS percentage
from 
    dbo.[Food Waste data and research - by country]
where 
    region='South-eastern Asia'
order by 
    [percentage] DESC


/*Sector-Specific Waste: What is the total food waste in tonnes
 (SUM) for each sector (household, retail, food service) across the entire dataset?*/

select 
    sum(household_estimate_tonnes_year) as Total_household_waste_tonnes,
    sum(retail_estimate_tonnes_year) as Total_retail_waste_tonnes,
    sum(food_service_estimate_tonnes_year) as Food_service_waste_tonnes
from dbo.[Food Waste data and research - by country]

/*Regional Leaders in Low Waste:
 Which country has the lowest combined_figures_kg_capita_year within each region?*/

select 
    region,
    country,
    combined_figures_kg_capita_year

from 
    dbo.[Food Waste data and research - by country]
group by 
    region,country,combined_figures_kg_capita_year
order by 
    region,combined_figures_kg_capita_year desc

/*Waste Distribution by Confidence Level: How many countries fall into each confidence_in_estimate category, 
and what is the average combined food waste per capita for each of those categories?*/

select 
    confidence_in_estimate,
    country,
    avg(combined_figures_kg_capita_year) as Average_combined_figures_kg_capita_year
from
    dbo.[Food Waste data and research - by country]
group by 
    confidence_in_estimate,country
order by 
    confidence_in_estimate,country;

/*Comparing Regional Extremes: Which region has the highest maximum household_estimate_tonnes_year,
 and which has the lowest minimum household_estimate_tonnes_year?*/

SELECT
    region,
    MAX(household_estimate_tonnes_year) AS max_household_waste
FROM
    dbo.[Food Waste data and research - by country]
GROUP BY
    region
ORDER BY
    max_household_waste DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY


SELECT
    region,
    min(household_estimate_tonnes_year) AS min_household_waste
FROM
    dbo.[Food Waste data and research - by country]
GROUP BY
    region
ORDER BY
    min_household_waste DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY

/*Waste Categories: Can you categorize countries into 'High Waste' 
(combined figures > 140), 'Medium Waste' (100-140), and 'Low Waste' (< 100) and count how many countries are in each category?*/

SELECT
    CASE
        WHEN combined_figures_kg_capita_year > 140 THEN 'High Waste'
        WHEN combined_figures_kg_capita_year >= 100 AND combined_figures_kg_capita_year <= 140 THEN 'Medium Waste'
        ELSE 'Low Waste'
    END AS waste_category,
    COUNT(*) AS number_of_countries
FROM
    dbo.[Food Waste data and research - by country]
GROUP BY
    CASE
        WHEN combined_figures_kg_capita_year > 140 THEN 'High Waste'
        WHEN combined_figures_kg_capita_year >= 100 AND combined_figures_kg_capita_year <= 140 THEN 'Medium Waste'
        ELSE 'Low Waste'
    END
ORDER BY
    number_of_countries DESC;

/*Above Average Countries: Which countries have a combined_figures_kg_capita_year 
that is higher than the overall average for all countries?*/

SELECT
    country,
    combined_figures_kg_capita_year
FROM
    dbo.[Food Waste data and research - by country]
WHERE
    combined_figures_kg_capita_year > (SELECT AVG(combined_figures_kg_capita_year) FROM dbo.[Food Waste data and research - by country])
ORDER BY
    combined_figures_kg_capita_year DESC;







 


