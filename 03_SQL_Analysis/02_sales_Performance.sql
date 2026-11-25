/* Enter "USE {database};" to start exploring your data. */
USE superstore;

/*
==============================
  Sales Performance Analysis
==============================
*/
-- Total Company Sales for each columns sales, profit, order_id, customer_id, and profit
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_quantity,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales;

-- Yearly Sales Analysis
SELECT
    YEAR(order_date) AS year,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY YEAR(order_date)
ORDER BY year;

-- Monthly Sales Analysis
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    MONTHNAME(order_date) AS month_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    year,
    month;

-- Year-over-Year (YoY) Sales Growth
WITH yearly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        SUM(sales) AS total_sales
    FROM superstore_sales
    GROUP BY YEAR(order_date)
),
sales_growth AS (
    SELECT
        year,
        total_sales,
        LAG(total_sales) OVER (ORDER BY year) AS previous_year_sales
    FROM yearly_sales
)
SELECT
    year,
    total_sales,
    previous_year_sales,
    ROUND(
        (total_sales - previous_year_sales)
        / NULLIF(previous_year_sales, 0) * 100,
        2
    ) AS sales_growth_percentage
FROM sales_growth
ORDER BY year;
