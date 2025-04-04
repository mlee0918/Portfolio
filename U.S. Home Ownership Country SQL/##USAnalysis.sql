SELECT StartOfMonth, 
	1/0.3*(0.85*HomeValue*Rate/12*power((1+Rate/12),360)/(power(1+Rate/12,360)-1)*12+PropertyTax+Insurance) AS IncomeRequired
	FROM USDW
	ORDER BY StartOfMonth ASC
;

SELECT USDW.StartOfMonth,
	((1/0.3*(0.85*USDW.HomeValue*USDW.Rate/12*power((1+USDW.Rate/12),360)/(power(1+USDW.Rate/12,360)-1)*12+USDW.PropertyTax+USDW.Insurance)) - 
	(1/0.3*(0.85*T1.HomeValue*T1.Rate/12*power((1+T1.Rate/12),360)/(power(1+T1.Rate/12,360)-1)*12+T1.PropertyTax+T1.Insurance))) / 
	(1/0.3*(0.85*T1.HomeValue*T1.Rate/12*power((1+T1.Rate/12),360)/(power(1+T1.Rate/12,360)-1)*12+T1.PropertyTax+T1.Insurance)) AS IncomeRequiredYoY
	FROM USDW LEFT JOIN (SELECT
	DATE(StartOfMonth, '+1 year') AS FutureDate, Rate, HomeValue, PropertyTax, Insurance, Income FROM USDW) AS t1
	ON t1.FutureDate = USDW.StartOfMonth
	ORDER BY USDW.StartOfMonth ASC
;