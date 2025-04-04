DROP TABLE IF EXISTS USDW;
CREATE TABLE USDW(
StartOfMonth DATE,
Rate REAL,
HomeValue REAL,
PropertyTax REAL,
Insurance REAL,
Income REAL,
PRIMARY KEY (StartOfMonth)
);

INSERT INTO USDW (StartOfMonth, Rate, HomeValue, PropertyTax, Insurance, Income)
	SELECT USHomeValue.StartOfMonth, Rate, HomeValue, PropertyTax, Insurance, Income FROM USHomeValue
	INNER JOIN MortgageRate
	ON USHomeValue.StartOfMonth = MortgageRate.StartOfMonth
	INNER JOIN USPropertyTax
	ON strftime('%Y',USHomeValue.StartOfMonth) = USPropertyTax.Year
	INNER JOIN USHomeownersInsurance
	ON strftime('%Y',USHomeValue.StartOfMonth) = USHomeownersInsurance.Year
	INNER JOIN USMedianIncome
	ON strftime('%Y',USHomeValue.StartOfMonth) = USMedianIncome.Year
;


