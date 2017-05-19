### Modifying Data in Tables

# Check the data types of each column in a table SQLite
pragma table_info(facts)

# Inserting Data Into A Table With Missing Value
INSERT INTO facts
VALUES(262, 'dq','DataquestLand', Null, 40000, 20000, 500000, 100, 50, 10, 20, 
	'2016-02-25 12:00:00', '2016-02-25 12:00:00');

# Updating Rows
UPDATE facts
SET name = 'New Zealand', code = 'nz'
WHERE name = 'Australia';

# Deleting Rows
DELETE FROM facts
WHERE name = 'Canada';

# Adding Column 
ALTER TABLE facts
ADD awesomeness integer;
ADD leader text;

# Removing Columns
ALTER TABLE facts
DROP COLUMN awesomeness

# Creating Tables
CREATE TABLE factbook.states
(      # factbook -- dbName/ states -- tableName
    id integer PRIMARY KEY,
    name text,
    area integer,
    country integer,
    FOREIGN KEY (country) REFERENCES facts(id)
);     

# Querying Across Foreign Keys
SELECT * FROM landmarks
INNER JOIN facts
ON landmarks.country = facts.id

