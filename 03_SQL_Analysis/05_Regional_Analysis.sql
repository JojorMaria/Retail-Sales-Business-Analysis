/* Enter "USE {database};" to start exploring your data. */
USE superstore;

/*
==============================
  Regional Analysis
==============================
*/
-- Sales Performance by Region
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

-- Profit Performance by Region
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY region
ORDER BY total_profit DESC;

-- Sales and Profit by State
SELECT
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY state
ORDER BY total_sales DESC;

-- Top 10 States by Sales
SELECT
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

-- Bottom 10 States by Profit
SELECT
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY state
ORDER BY total_profit ASC
LIMIT 10;

-- Sales Performance by City
SELECT
    state,
    city,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY state, city
ORDER BY total_sales DESC
LIMIT 10;