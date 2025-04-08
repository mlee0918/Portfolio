SELECT C02.*, POPULATION 
	FROM C02 INNER JOIN Pop
	ON C02.YEAR = Pop.YEAR
	AND C02.STATE =Pop.STATE
;

--1
SELECT C02.YEAR, sum(EMISSIONS) AS Emissions,
	sum(POPULATION)/5 as Population,
	(SUM(EMISSIONS)*1000000)/(sum(POPULATION)/5) AS EmissionsRate
	from C02 INNER JOIN Pop			-- inner join Pop
	on C02.YEAR = Pop.YEAR and C02.STATE = Pop.STATE
	GROUP by C02.YEAR
;

--2
SELECT c02.YEAR,
	5000000*sum(CASE WHEN SECTOR = 'Commercial' then EMISSIONS else 0.0 end)/sum(POPULATION) as Commercial,
	5000000*sum(CASE WHEN SECTOR = 'Electric' then EMISSIONS else 0.0 end)/sum(POPULATION) as Electric,
	5000000*sum(CASE WHEN SECTOR = 'Industrial' then EMISSIONS else 0.0 end)/sum(POPULATION) as Industrial,
	5000000*sum(CASE WHEN SECTOR = 'Residential' then EMISSIONS else 0.0 end)/sum(POPULATION) as Residential,
	5000000*sum(CASE WHEN SECTOR = 'Transportation' then EMISSIONS else 0.0 end)/sum(POPULATION) as Transportation,
	
	5000000*SUM(EMISSIONS)/sum(POPULATION) AS Total
	FROM c02 inner JOIN Pop
	on C02.YEAR = Pop.YEAR and C02.STATE = Pop.STATE
	GROUP by c02.YEAR
;

--3
SELECT c02.STATE, 1000000*sum(EMISSIONS)/POPULATION as EmissionsRate2021
	from C02 inner join Pop
	on C02.YEAR = Pop.YEAR and C02.STATE = Pop.STATE
	GROUP by C02.STATE, C02.year
	ORDER by C02.YEAR desc, 1000000*sum(EMISSIONS)/POPULATION ASC
	LIMIT 10
;

--4
SELECT c02.STATE,
	1000000*sum(case when SECTOR = 'Commercial' THEN EMISSIONS else 0.0 end)/POPULATION as CommercialEmissionsRate2021
	from C02 inner join Pop
	on C02.YEAR = Pop.YEAR and C02.STATE = Pop.STATE
	GROUP by C02.STATE, C02.year
	ORDER by C02.YEAR desc, CommercialEmissionsRate2021 ASC
	LIMIT 10
;

--5
SELECT c02.STATE,
	1000000*sum(case when SECTOR = 'Electric' THEN EMISSIONS else 0.0 end)/POPULATION as ElectricEmissionsRate2021
	from C02 inner join Pop
	on C02.YEAR = Pop.YEAR and C02.STATE = Pop.STATE
	GROUP by C02.STATE, C02.year
	ORDER by C02.YEAR desc, ElectricEmissionsRate2021 ASC
	LIMIT 10
;

--6
SELECT c02.STATE,
	1000000*sum(case when SECTOR = 'Industrial' THEN EMISSIONS else 0.0 end)/POPULATION as IndustrialEmissionsRate2021
	from C02 inner join Pop
	on C02.YEAR = Pop.YEAR and C02.STATE = Pop.STATE
	GROUP by C02.STATE, C02.year
	ORDER by C02.YEAR desc, IndustrialEmissionsRate2021 ASC
	LIMIT 10
;

--7
SELECT c02.STATE,
	1000000*sum(case when SECTOR = 'Residential' THEN EMISSIONS else 0.0 end)/POPULATION as ResidentialEmissionsRate2021
	from C02 inner join Pop
	on C02.YEAR = Pop.YEAR and C02.STATE = Pop.STATE
	GROUP by C02.STATE, C02.year
	ORDER by C02.YEAR desc, ResidentialEmissionsRate2021 ASC
	LIMIT 10
;

--8
SELECT c02.STATE,
	1000000*sum(case when SECTOR = 'Transportation' THEN EMISSIONS else 0.0 end)/POPULATION as TransportationEmissionsRate2021
	from C02 inner join Pop
	on C02.YEAR = Pop.YEAR and C02.STATE = Pop.STATE
	GROUP by C02.STATE, C02.year
	ORDER by C02.YEAR desc, TransportationEmissionsRate2021 ASC
	LIMIT 10
;

/*
C02 Emmisions in 2021 in ASC ORDER (lowest - greatest)
1. Washington DC
2. New York
3. Massachusetts

Commericial C02 Emmisions in 2021 in ASC ORDER (lowest - greatest)
1. Florida
2. Hawaii
3. Georgia

Electric C02 Emmisions in 2021 in ASC ORDER (lowest - greatest)
1. Vermont
2. Washington DC
3. Massachusetts

Industrial C02 Emmisions in 2021 in ASC ORDER (lowest - greatest)
1. Washington DC
2. New York
3. Connecticut

Residential C02 Emmisions in 2021 in ASC ORDER (lowest - greatest)
1. Hawaii
2. Florida
3. Arizona

Transportation C02 Emmisions in 2021 in ASC ORDER (lowest - greatest)
1. Washington DC
2. Rhode Island
3. New York

Washington DC has the lowest total C02 emission rate in 2021. They excel in being sustainable when it comes to
minimizing Transportation, Industrial, and Electric C02 emission. I would advise the state Massachusets to focus on
finding sustainable alternatives for Residential and Commericial C02 emmision. For the other states, I would seggest
analyzing and adapting methods that the state of Washington DC uses in order to minimize their C02 emission.