SELECT * FROM sales;

SELECT COUNT(*) FROM sales;


-- ---------------------------1. MONTHLY Revenue Calculations-----------------------------
SELECT
	EXTRACT(YEAR FROM sales_date) AS year,
	EXTRACT(MONTH FROM sales_date) AS month,
	SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY year, month
ORDER BY year, month;


-- ---------------------------2. MONTHLY Order Volume Calculations-------------------------
SELECT
	EXTRACT(YEAR FROM sales_date) AS year,
	EXTRACT(MONTH FROM sales_date) AS month,
	COUNT(DISTINCT product_id) AS total_id
FROM sales
GROUP BY year, month
ORDER BY year, month;


--  -------------3. Aggregating Sales to Analyze Overall Time based Trends----------------
SELECT
	EXTRACT(YEAR FROM sales_date) AS year,
	EXTRACT(MONTH FROM sales_date) AS month,
	SUM(sales_amount) AS total_revenue,
	COUNT(DISTINCT product_id) AS total_id
FROM sales
GROUP BY year, month
ORDER BY year, month;


-- ------------------------------4. Breaking down Sales Data-------------------------------
SELECT
	region, customer_type,
	COUNT(DISTINCT product_id) AS total_orders,
	SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY region, customer_type
ORDER BY total_revenue DESC;


-- ------------------------------5. Top 5 Months by Sales----------------------------------
SELECT
	EXTRACT(YEAR FROM sales_date) AS year,
	EXTRACT(MONTH FROM sales_date) AS month,
	SUM(sales_amount) AS monthly_revenue
FROM sales
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 5;


-- ------------6. Handling NULLs and Missing Values in Aggregation Calculations-------------
SELECT
	EXTRACT(YEAR FROM sales_date) AS year,
	EXTRACT(MONTH FROM sales_date) AS month,
	SUM(COALESCE(sales_amount, 0)) AS monthly_revenue
FROM sales
GROUP BY year, month;


-- ---------7. Using GROUP BY and ORDER BY to sort and Present Time Series Results-----------
SELECT
	EXTRACT(YEAR FROM sales_date) AS year,
	EXTRACT(MONTH FROM sales_date) AS month,
	COUNT(DISTINCT product_id) AS total_orders
FROM sales
GROUP BY year, month
ORDER BY year, month ASC;