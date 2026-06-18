SELECT * FROM pakistan_covid_project.`covid pk`;
-- Total Cases
SELECT
SUM(Cases) AS Total_Cases
FROM `covid pk`;

-- Total Deaths
SELECT
SUM(Deaths) AS Total_Deaths
FROM `covid pk`;
-- TOTAL REVANYE
SELECT
SUM(Recovered) AS Total_Recovered
FROM `covid pk`;
-- Province-wise Cases
SELECT
Province,
SUM(Cases) AS Total_Cases
FROM `covid pk`
GROUP BY Province
ORDER BY Total_Cases DESC;
-- PROVINCE WISE DEATHS
SELECT
Province,
SUM(Deaths) AS Total_Deaths
FROM `covid pk`
GROUP BY Province
ORDER BY Total_Deaths DESC;
-- Top Cities by Cases
SELECT
City,
SUM(Cases) AS Total_Cases
FROM `covid pk`
GROUP BY City
ORDER BY Total_Cases DESC
LIMIT 10;
-- Recovery Rate
SELECT
ROUND(
SUM(Recovered)*100/SUM(Cases),2
) AS Recovery_Rate
FROM `covid pk`;

-- Death Rate
SELECT
ROUND(
SUM(Deaths)*100/SUM(Cases),2
) AS Death_Rate
FROM `covid pk`;

-- Cases by Travel History
SELECT
Travel_history,
SUM(Cases) AS Total_Cases
FROM `covid pk`
GROUP BY Travel_history
ORDER BY Total_Cases DESC;

Monthly Cases
SELECT
MONTH(Date) AS Month_Number,
SUM(Cases) AS Total_Cases
FROM `covid pk`
GROUP BY MONTH(Date)
ORDER BY Month_Number;
-- Rank Provinces by Cases (Window Function)
-- Rank Provinces by Cases (Window Function)
SELECT
Province,
SUM(Cases) AS Total_Cases,
DENSE_RANK()
OVER(
ORDER BY SUM(Cases) DESC
) AS Province_Rank
FROM `covid pk`
GROUP BY Province;

-- Running Total Cases
SELECT
Date,
SUM(Daily_Cases)
OVER(
ORDER BY Date
) AS Running_Cases
FROM
(
SELECT
Date,
SUM(Cases) AS Daily_Cases
FROM `covid pk`
GROUP BY Date
) t;
RENAME TABLE `covid pk` TO covid_pk;

















