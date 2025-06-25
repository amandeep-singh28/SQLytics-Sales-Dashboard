CREATE DATABASE project1;

SET GLOBAL local_infile = 1;

USE project1;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    market VARCHAR(50)
);



LOAD DATA LOCAL INFILE 'C:/Users/amand/OneDrive/Desktop/Project/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);



LOAD DATA LOCAL INFILE 'C:/Users/amand/OneDrive/Desktop/Project/products_clean.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


CREATE TABLE orders (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id INT,
    product_id VARCHAR(20),
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT,
    shipping_cost FLOAT,
    order_priority VARCHAR(50),
    year INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

LOAD DATA LOCAL INFILE 'C:/Users/amand/OneDrive/Desktop/Project/orders_clean.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select * from orders;


-- TOP 10 CUSTOMERS BY TOTAL SALES
SELECT customer_name AS Name, SUM(o.sales) AS Total_Sales FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY Total_Sales DESC LIMIT 10;

-- TOP 10 PRODUCTS BY TOTAL SALES
SELECT product_name AS Product_Name, SUM(sales) AS Total_Sales FROM products p
INNER JOIN orders o ON p.product_id = o.product_id
GROUP BY product_name
ORDER BY Total_Sales DESC LIMIT 10;

-- TOTAL SALES, QUANTITY, PROFIT (For KPI Block In Excel)
SELECT ROUND(SUM(sales), 2) AS Total_Sales,
ROUND(SUM(quantity), 2) AS Total_Quantity,
ROUND(SUM(profit), 2) AS Total_Profit
FROM orders;

-- YEARLY SALES TREND ANALYSIS
SELECT year AS Year, SUM(sales) AS Total_Sales
FROM orders
GROUP BY year;

-- SALES BY SUB-CATEGORY
SELECT p.sub_category AS Sub_Category, SUM(o.sales) AS Total_Sales
FROM products p
INNER JOIN orders o ON p.product_id = o.product_id
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

-- PROFIT BY REGION
SELECT c.region AS Region, ROUND(SUM(o.profit), 2) AS Total_Profit
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY Region
ORDER BY Total_Profit DESC; 

-- ORDER WITH SHIPPING DELAY > 5 DAYS
SELECT order_id AS Order_ID, DATEDIFF(ship_date, order_date) AS Shipping_Delay
FROM orders
WHERE DATEDIFF(ship_date, order_date) > 5;

-- SALES BY ORDER_PRIORITY
SELECT order_priority AS Order_Priority,
SUM(sales) as Total_Sales
FROM orders
GROUP BY Order_Priority
ORDER BY FIELD(Order_Priority, 'Critical', 'High', 'Medium', 'Low');

-- RANK OF CUSTOMERS VIA TOTAL_SALES
SELECT c.customer_name AS Customer_Name, SUM(o.sales) AS Total_Sales,
RANK() OVER(ORDER BY SUM(o.sales) DESC) AS Sales_Rank
FROM customers c INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- RUNNING TOTAL SALES BY YEAR
SELECT year AS Year, order_id AS Order_ID, ROUND(sales, 2) AS Order_Sales,SUM(sales)
OVER (PARTITION BY year ORDER BY order_id) AS Running_Sales
FROM orders;

-- PERCENTAGE OF TOTAL_SALES
SELECT c.customer_name AS Customer_Name, SUM(o.sales) AS Customer_Sales,
ROUND(100.0 * SUM(o.sales) / SUM(SUM(o.sales)) OVER (), 2) AS Percent_Of_Total
FROM customers c INNER JOIN orders o on c.customer_id = o.customer_id 
GROUP BY c.customer_name;

