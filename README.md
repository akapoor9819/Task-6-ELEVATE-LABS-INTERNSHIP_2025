# Hello!
# This is my solution for Sales Trend Analysis using aggregations. For this task, I worked with a sample sales dataset in PostgreSQL and wrote SQL queries to find monthly trends.

# Task Overview
### The goal was to analyze:

- Monthly total revenue

- Monthly total order volume

- Sales trends by month, product, and region

- Top 5 months by revenue

- I also learned how to handle NULLs and missing values during aggregations.

### Tools Used
- PostgreSQL (pgAdmin 4 for writing and running queries)

# SQL

## My Approach
### Monthly Revenue:
- Used SUM(sales_amount) to calculate total revenue for each month. Extracted year and month from the date column to group results.

### Monthly Order Volume:
- Used COUNT(DISTINCT product_id) to count unique orders for each month.

### Trend Analysis:
- Grouped sales by year and month to understand trends. Ordered the results to show time-series sales movement.

### Breakdown by Region and Product:
- Ran queries to split revenue by region and product to spot best-sellers and strong areas.

### Top 5 Months by Sales:
- Sorted monthly totals in descending order to pick out the best months by revenue.

### Handling NULLs:
- Used COALESCE(sales_amount, 0) so that missing values don't break total calculations.

# Key SQL Queries Used
### 1. Monthly Revenue
- SELECT EXTRACT(YEAR FROM sales_date) AS year,
       EXTRACT(MONTH FROM sales_date) AS month,
       SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY year, month
ORDER BY year, month;

### 2. Monthly Order Volume
- SELECT EXTRACT(YEAR FROM sales_date) AS year,
       EXTRACT(MONTH FROM sales_date) AS month,
       COUNT(DISTINCT product_id) AS total_orders
FROM sales
GROUP BY year, month
ORDER BY year, month;

### 3. Breakdown by Region
- SELECT region,
       SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

### 4. Top 5 Months by Revenue
- SELECT EXTRACT(YEAR FROM sales_date) AS year,
       EXTRACT(MONTH FROM sales_date) AS month,
       SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 5;

### 5. Handling NULLs in Aggregation
- SELECT EXTRACT(YEAR FROM sales_date) AS year,
       EXTRACT(MONTH FROM sales_date) AS month,
       SUM(COALESCE(sales_amount,0)) AS monthly_revenue
FROM sales
GROUP BY year, month;

### 6. Handling NULLs and Missing Values in Aggregation Calculations
- SELECT
	EXTRACT(YEAR FROM sales_date) AS year,
	EXTRACT(MONTH FROM sales_date) AS month,
	SUM(COALESCE(sales_amount, 0)) AS monthly_revenue
FROM sales
GROUP BY year, month;

### 7. Using GROUP BY and ORDER BY to sort and Present Time Series Results
- SELECT
	EXTRACT(YEAR FROM sales_date) AS year,
	EXTRACT(MONTH FROM sales_date) AS month,
	COUNT(DISTINCT product_id) AS total_orders
FROM sales
GROUP BY year, month
ORDER BY year, month ASC;
