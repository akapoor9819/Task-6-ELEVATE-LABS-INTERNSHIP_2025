DROP TABLE IF EXISTS sales;

CREATE TABLE sales(
product_id INT,
sales_date DATE,
sales_representatives VARCHAR(20),
region VARCHAR(20),
sales_amount FLOAT,
quantity_sold INT,
product_category VARCHAR(30),
unit_cost FLOAT,
unit_price FLOAT,
customer_type VARCHAR(30),
discount FLOAT,
payment_method VARCHAR(70),
sales_channel VARCHAR(30),
region_and_sales_representatives VARCHAR(50)
);