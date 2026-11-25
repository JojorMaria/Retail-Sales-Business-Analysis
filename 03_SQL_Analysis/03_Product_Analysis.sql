/* Enter "USE {database};" to start exploring your data. */
USE superstore;

/*
==============================
  Product Analysis
==============================
*/
-- 	Sales by Category
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

-- Sales by Sub-Category
SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(quantity) AS total_quantity
FROM superstore_sales
GROUP BY
    category,
    sub_category
ORDER BY total_sales DESC;

-- Profit by Category
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY category
ORDER BY total_profit DESC;

-- Profit by Sub-Category
SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY
    category,
    sub_category
ORDER BY total_profit ASC;

-- Top 10 Best-Selling Products
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(quantity) AS total_quantity
FROM superstore_sales
GROUP BY
    product_id,
    product_name,
    category,
    sub_category
ORDER BY total_sales DESC
LIMIT 10;

-- Top 10 Most Profitable Products
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY
    product_id,
    product_name,
    category,
    sub_category
ORDER BY total_profit DESC
LIMIT 10;

-- Bottom 10 Least Profitable Products
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY
    product_id,
    product_name,
    category,
    sub_category
ORDER BY total_profit ASC
LIMIT 10;