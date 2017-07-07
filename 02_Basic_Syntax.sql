
### DML Basic Practice ###

# WHERE

SELECT population FROM world WHERE name = 'Germany';

# IN

SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');

# BETWEEN

SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;

# LIKE

SELECT name, population FROM world WHERE name LIKE “A%”; (A--)

SELECT name FROM world WHERE name LIKE ‘%a” OR name LIKE ‘%l’

# calculate

SELECT name, gdp/population FROM world WHERE population > 200000000;

SELECT name, population/1000000 FROM world WHERE continent = 'South America';

# XOR (Exclusive OR – XOR: show the name that are big by area or big by population but not both)

SELECT name, population, area FROM world 
WHERE area >30000 XOR population > 25000000; 

# ROUND  
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) 
FROM world WHERE continent = 'South America'; 

# LENGTH  -- same string length
SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital);
