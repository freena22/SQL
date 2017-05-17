# SQL Basic Knowledge
-----

#### SQL Data Structure
##### Text and string types
- text — a string of any length, like Python str or unicode types.
- char(n) — a string of exactly n characters.
- varchar(n) — a string of up to n characters.
##### Numeric types
- integer — an integer value, like Python int.
- real — a floating-point value, like Python float. Accurate up to six decimal places.
- double precision — a higher-precision floating-point value. Accurate up to 15 decimal places.
- decimal — an exact decimal value.
##### Date and time types
- date — a calendar date; including year, month, and day.
- time — a time of day.
- timestamp — a date and time together.
#### See the tables in different environments
```sh
PostgreSQL: \dt and \d tablename
MySQL: show tables and describe tablename
SQLite: .table and .schema tablename
```
## SQLite 
#### Environment Set Up
```sh
$  sqlite3 chinook.db  # use the database
sqlite>
```
#### Basic Commands
```sh
- sqlite> .help
- sqlite> .tables    # see what tables are in your database
- sqlite> .schema Album  # see the schema of your tables (datatype,primary key, foreign key
- sqlite> .exit
```
#### Using SQLite3 in Python
```sh
# Making Connection
import sqlite3
conn = sqlite3.connect('jobs.db')
# Creating A Cursor And Running A Query
cursor = conn.cursor()  
query = "SELECT * FROM recent_grads;"  # SQL query as a string
cursor.execute(query) # Execute the query, covert the results to tuples and store as a local varaible
results = cursor.fetchall()  # Fetch the full results set as a list of tuples
print(results[0:3])
# fetchone() and fetchmany()
cursor.execute(query)
first_result = cursor.fitchone()
five_results = cursor.fitchmany(5)  
# Closing the Database Connection
conn.close()   
# All Practice
data = sqlite3.connect('jobs.db')
query='SELECT Major FROM recent_grads ORDER BY Major desc;'
result = data.cursor().execute(query).fetchall()
data.close()
# Pandas
pd.read_sql_query()
```
#### Basic SQL Sytax
```sh
QUERT = '''
SELECT ordernames.name, COUNT(*) as num
FROM taxonomy, animals, ordernames
WHERE animals.species = taxonomy.name AND taxonomy.t_order = ordernames.t_order
GROUP BY odernames.name
ORDER BY odernames.name desc;
```
```sh
** WHERE is a restriction on the source tables (execute first)
** HAVING is a restriction on the result ... after aggregation!
```
#### Database 
Chinook Database - https://chinookdatabase.codeplex.com/releases/view/55681

