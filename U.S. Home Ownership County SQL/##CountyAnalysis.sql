--2023 TOP 15
SELECT 
	concat(County, ", ", State) AS County,
	avg(Income) AS Y2023Q3AverageMedianHouseholdIncome,
	avg(Value) AS Y2023Q3AverageMedianHomeValue,
	avg(1/0.3*(0.85*Value*Rate/12*power(1+Rate/12,360)/(power(1+Rate/12,360)-1)*12+Tax+Premium)) AS Y2023Q3AverageIncomeRequired,
	avg(1/Income*(0.85*Value*Rate/12*power(1+Rate/12,360)/(power(1+Rate/12,360)-1)*12+Tax+Premium)) AS Y2023Q3AverageDebtToIncomeRatio
	FROM CountyDW
	WHERE strftime('%Y',StartOfMonth) = '2023'
	AND strftime('%m',StartOfMonth) BETWEEN '07' and '09' 
	GROUP BY County, State
	HAVING Income IS NOT NULL
	AND Value IS NOT NULL
	AND Y2023Q3AverageDebtToIncomeRatio IS NOT NULL
	AND Y2023Q3AverageDebtToIncomeRatio IS NOT NULL
	ORDER BY Y2023Q3AverageDebtToIncomeRatio ASC
	LIMIT 15
;

--2023 BOTTOM 15
SELECT 
	concat(County, ", ", State) AS County,
	avg(Income) AS Y2023Q3AverageMedianHouseholdIncome,
	avg(Value) AS Y2023Q3AverageMedianHomeValue,
	avg(1/0.3*(0.85*Value*Rate/12*power(1+Rate/12,360)/(power(1+Rate/12,360)-1)*12+Tax+Premium)) AS Y2023Q3AverageIncomeRequired,
	avg(1/Income*(0.85*Value*Rate/12*power(1+Rate/12,360)/(power(1+Rate/12,360)-1)*12+Tax+Premium)) AS Y2023Q3AverageDebtToIncomeRatio
	FROM CountyDW
	WHERE strftime('%Y',StartOfMonth) = '2023'
	AND strftime('%m',StartOfMonth) BETWEEN '07' and '09' 
	GROUP BY County, State
	HAVING Income IS NOT NULL
	AND Value IS NOT NULL
	AND Y2023Q3AverageDebtToIncomeRatio IS NOT NULL
	AND Y2023Q3AverageDebtToIncomeRatio IS NOT NULL
	ORDER BY Y2023Q3AverageDebtToIncomeRatio DESC
	LIMIT 15
;

--2024 BOTTOM 15
SELECT 
	concat(County, ", ", State) AS County,
	avg(Income) AS Y2024Q3AverageMedianHouseholdIncome,
	avg(Value) AS Y2024Q3AverageMedianHomeValue,
	avg(1/0.3*(0.85*Value*Rate/12*power(1+Rate/12,360)/(power(1+Rate/12,360)-1)*12+Tax+Premium)) AS Y2024Q3AverageIncomeRequired,
	avg(1/Income*(0.85*Value*Rate/12*power(1+Rate/12,360)/(power(1+Rate/12,360)-1)*12+Tax+Premium)) AS Y2024Q3AverageDebtToIncomeRatio
	FROM CountyDW
	WHERE strftime('%Y',StartOfMonth) = '2024'
	AND strftime('%m',StartOfMonth) BETWEEN '07' and '09' 
	GROUP BY County, State
	HAVING Income IS NOT NULL
	AND Value IS NOT NULL
	AND Y2024Q3AverageDebtToIncomeRatio IS NOT NULL
	AND Y2024Q3AverageDebtToIncomeRatio IS NOT NULL
	ORDER BY Y2024Q3AverageDebtToIncomeRatio DESC
	LIMIT 15
;

--2024 TOP 15
SELECT 
	concat(County, ", ", State) AS County,
	avg(Income) AS Y2024Q3AverageMedianHouseholdIncome,
	avg(Value) AS Y2024Q3AverageMedianHomeValue,
	avg(1/0.3*(0.85*Value*Rate/12*power(1+Rate/12,360)/(power(1+Rate/12,360)-1)*12+Tax+Premium)) AS Y2024Q3AverageIncomeRequired,
	avg(1/Income*(0.85*Value*Rate/12*power(1+Rate/12,360)/(power(1+Rate/12,360)-1)*12+Tax+Premium)) AS Y2024Q3AverageDebtToIncomeRatio
	FROM CountyDW
	WHERE strftime('%Y',StartOfMonth) = '2024'
	AND strftime('%m',StartOfMonth) BETWEEN '07' and '09' 
	GROUP BY County, State
	HAVING Income IS NOT NULL
	AND Value IS NOT NULL
	AND Y2024Q3AverageDebtToIncomeRatio IS NOT NULL
	AND Y2024Q3AverageDebtToIncomeRatio IS NOT NULL
	ORDER BY Y2024Q3AverageDebtToIncomeRatio ASC
	LIMIT 15
;