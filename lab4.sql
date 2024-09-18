--Question 4.1:
/* No, becuase we still have VA records. /*

--Question 4.2:
/*No, becuase 80 is not a valid fips/*

--Question 4.3:
/* Just fine /*

--Question 4.6
SELECT 
    n.name, 
    i.income, 
    i.year
FROM 
    income i
JOIN 
    name n 
ON 
    i.fips = n.fips
WHERE 
    i.year = (SELECT MAX(year) FROM income)  -- Get the most recent year
ORDER BY 
    i.income DESC
LIMIT 1;  -- Get the state with the highest income


--Question 4.7
/*
-- Calculating the population growth rate in Virginia (FIPS = '51') for the past 5 years.
-- Formula: ((population at latest year - population at earliest year) / population at earliest year) * 100
*/

SELECT 
    ((pop_latest.population - pop_earliest.population)::decimal / pop_earliest.population) * 100 AS growth_rate
FROM
    (SELECT population 
     FROM population 
     WHERE fips = '51' 
     ORDER BY year DESC 
     LIMIT 1) AS pop_latest,    -- Latest population value
    (SELECT population 
     FROM population 
     WHERE fips = '51' 
     ORDER BY year ASC 
     LIMIT 1) AS pop_earliest;  -- Population value 5 years ago

