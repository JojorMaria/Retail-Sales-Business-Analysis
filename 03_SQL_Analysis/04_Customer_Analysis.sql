/* Enter "USE {database};" to start exploring your data. */
USE superstore;

/*
==============================
  Costumer Analysis
==============================
*/
-- Total Customers and Segmentation
SELECT
    segment,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;

-- Sales and Profit for each Customer
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC;

-- Top 10 Customers by Sales
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Top 10 Most Profitable Customers
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY customer_id, customer_name
ORDER BY total_profit DESC
LIMIT 10;

-- Customer Order Frequency
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY customer_id, customer_name
ORDER BY total_orders DESC;

-- Average Order Value (AOV)
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    ROUND(
        SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value
FROM superstore_sales
GROUP BY customer_id, customer_name
ORDER BY average_order_value DESC;