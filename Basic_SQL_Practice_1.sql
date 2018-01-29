
### Basic SQL Practice

## < Intro to SQL >

# SELECT FROM / WHERE

SELECT Major, Major_category, Median, ShareWomen FROM recent_grads
WHERE ShareWomen >= 0.5 AND Median > 50000;
 
# SELECT FROM / WHERE / AND / OR
SELECT Major, Major_category, ShareWomen, Unemployment_rate FROM recent_grads
WHERE (Major_category = 'Engineering') AND (ShareWomen > 0.5 OR Unemployment_rate < 0.051);

# SELECT FROM / WHERE / OR / ORDER BY 
SELECT Major_category, Major, Unemployment_rate FROM recent_grads
WHERE Major_category='Engineering' OR Major_category='Physical Sciences'
ORDER BY Unemployment_rate ASC;

## < Summary Statistics >

# COUNT() / SUM() 
SELECT COUNT(Major), SUM(Total) FROM recent_grads WHERE ShareWomen < 0.5;

# AVG() / MIN() / MAX()
SELECT AVG(Total), MIN(Men), MAX(Women) FROM recent_grads;

# COUNT(DISTINCT())
SELECT COUNT(DISTINCT (Major)) unique_majors, COUNT(DISTINCT(Major_code)) unique_major_codes 
FROM recent_grads;

# Aliases
SELECT COUNT(*) "Number of Students", MAX(Unemployment_rate) "Highest Unemployment Rate" FROM recent_grads;

# Largest Spread between 25th and 75th percentile
SELECT Major, Major_category, (P75th - P25th) quartile_spread
FROM recent_grads ORDER BY quartile_spread LIMIT 20;

## < Group Summary Statistics >


# Group By

SELECT Major_category, AVG(Employed) / AVG(Total) share_employed
FROM recent_grads
GROUP BY Major_category;

# Having and Where
# The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions. 
# HAVING clause is like a WHERE clause, but applies only to groups as a whole 
# that is, to the rows in the result set representing groups, whereas the WHERE clause applies to individual rows

WHERE comes before GROUP BY; SQL evaluates the WHERE clause before it groups records.
SELECT Major_category, AVG(Low_wage_jobs) / AVG(Total) AS share_low_wage FROM recent_grads
GROUP BY Major_category
HAVING share_low_wage > 0.1;

# Round
SELECT ROUND(ShareWomen, 2), Major_category
FROM recent_grads
LIMIT 10;

# Nesting Function
SELECT Major_category, ROUND(AVG(College_jobs) / AVG(Total), 3) AS share_degree_jobs
FROM recent_grads
GROUP BY Major_category
HAVING share_degree_jobs < 0.3;

# Casting -- transfer the interger to float
SELECT CAST(Women as Float) / CAST(Total as Float) FROM recent_grads limit 5

## < Subqueries >

SELECT Major, Unemployment_rate FROM recent_grads
WHERE Unemployment_rate < (SELECT AVG(Unemployment_rate) FROM recent_grads)
ORDER BY Unemployment_rate;

# computes the proportion (as a float value) of rows that contain above average values for the ShareWomen.
SELECT CAST(COUNT(*) as float)/ CAST((SELECT COUNT(*) FROM recent_grads) as float) proportion_abv_avg
FROM recent_grads
WHERE ShareWomen > (SELECT AVG(ShareWomen) FROM recent_grads);

# Major_category is one of the 5 highest group level sums for the Total column
SELECT Major, Major_category FROM recent_grads
WHERE Major_category IN (select Major_category from recent_grads
group by Major_category
order by SUM(Total) DESC
limit 5);

## < JOIN >


# Three Tables Join
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

# Four Tables Join
SELECT r.name region, a.name account, 
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;



## < CASE WHEN >

SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

# -- transfer to this kind query

SELECT account_id, CASE WHEN standard_qty = 0 OR standard_qty IS NULL THEN 0
                        ELSE standard_amt_usd/standard_qty END AS unit_price
FROM orders
LIMIT 10;

# More complicated and grouping aggregation

SELECT a.name, SUM(total_amt_usd) total_spent, 
     CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
     WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
     ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
GROUP BY a.name
ORDER BY 2 DESC;








