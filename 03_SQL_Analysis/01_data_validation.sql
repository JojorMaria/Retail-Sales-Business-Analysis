/* Enter "USE {database};" to start exploring your data. */
-- User SupreStore Database
USE superstore;

-- Print Database Superstore_sales output
SELECT * FROM `superstore`.`superstore_sales` LIMIT 100;

/*
==============================
      Data Validation
==============================
*/
-- Checking the total number of data entries
SELECT COUNT(*) AS total_rows FROM superstore_sales;

-- Checking Duplicates
SELECT
    row_id,
    COUNT(*) AS total_duplicate
FROM superstore_sales
GROUP BY row_id
HAVING COUNT(*) > 1;




