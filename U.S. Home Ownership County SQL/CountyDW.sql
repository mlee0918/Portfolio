DROP TABLE IF EXISTS CountyDW;
CREATE TABLE CountyDW(
StartOfMonth DATE,
FIPS VARCHAR(5),
County TEXT,
State TEXT,
Rate REAL,
Value REAL,
Tax REAL,
Premium REAL,
Income REAL,
PRIMARY KEY (StartOfMonth, FIPS)
);

INSERT INTO CountyDW (StartOfMonth, FIPS, County, State, Rate, Value, Tax, Premium, Income)
	SELECT CountyHomeValue.StartOfMonth, CountyHomeValue.FIPS, CountyPropertyTax.County, CountyHomeValue.State, Rate, Value, Tax, Premium, Income FROM CountyHomeValue
	LEFT JOIN CountyPropertyTax
	ON strftime('%Y', CountyHomeValue.StartOfMonth) = CountyPropertyTax.Year
	AND CountyHomeValue.FIPS = CountyPropertyTax.FIPS
	LEFT JOIN MortgageRate
	ON CountyHomeValue.StartOfMonth = MortgageRate.StartOfMonth
	LEFT JOIN CountyHomeownersInsurance
	ON strftime('%Y', CountyHomeValue.StartOfMonth) = CountyHomeownersInsurance.Year
	AND CountyHomeValue.FIPS = CountyHomeownersInsurance.FIPS
	LEFT JOIN CountyMedianIncome
	ON strftime('%Y', CountyHomeValue.StartOfMonth) = CountyMedianIncome.Year
	AND CountyHomeValue.FIPS = CountyMedianIncome.FIPS
;
