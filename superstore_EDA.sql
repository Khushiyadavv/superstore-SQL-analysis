CREATE DATABASE superstore_db;
USE superstore_db;

CREATE TABLE orders (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(150),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(4,2),
    Profit DECIMAL(10,2)
);

-- Step 1: Preview the data
SELECT * FROM orders;

-- Step 2: Count total number of rows
SELECT COUNT(*) AS total_orders FROM orders;

-- Step 3: Check for duplicate Order IDs
SELECT Order_ID, COUNT(*) AS count
FROM orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;

-- to inspect columns
SELECT * FROM orders LIMIT 1;

ALTER TABLE orders 
rename column `row id` to row_id,
  RENAME COLUMN `Order ID` TO Order_ID,
  RENAME COLUMN `Order Date` TO Order_Date,
  RENAME COLUMN `Ship Date` TO Ship_Date,
  RENAME COLUMN `Ship Mode` TO Ship_Mode,
  RENAME COLUMN `Customer ID` TO Customer_ID,
  RENAME COLUMN `Customer Name` TO Customer_Name,
  RENAME COLUMN `Postal Code` TO Postal_Code,
  RENAME COLUMN `Product ID` TO Product_ID,
  RENAME COLUMN `Sub-Category` TO Sub_Category,
  RENAME COLUMN `Product Name` TO Product_Name;

SELECT *
FROM orders
WHERE Order_ID IN (
  SELECT Order_ID
  FROM orders
  GROUP BY Order_ID
  HAVING COUNT(*) > 1
);

-- to check real duplicate data
select* from orders
group by row_id, order_id, order_date, ship_date, ship_mode, customer_id, customer_name, segment, 
country, city, state, postal_code, region, product_id, category, sub_category, 
product_name, sales, quantity, discount, profit
HAVING COUNT(*) > 1;

-- How many orders are in the dataset
SELECT COUNT(DISTINCT Order_ID) AS total_orders
FROM orders;

-- What is the total sales and total profit?
SELECT 
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders;

-- Top 5 most profitable products
SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Product_Name
ORDER BY total_profit DESC
LIMIT 5;

-- Which regions are losing profit?
SELECT 
    Region,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Region
ORDER BY total_profit ASC;



