-- Total number of unique customers

SELECT 
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM 
    orders;
    
-- Profit per customer

SELECT 
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM 
    orders
GROUP BY 
    Customer_ID, Customer_Name
ORDER BY 
    Total_Profit DESC;

-- Top 10 profitable customers

SELECT 
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Customer_ID, Customer_Name
ORDER BY 
    Total_Profit DESC
LIMIT 10;

-- Customers who buy a lot but are not profitable

SELECT 
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Customer_ID, Customer_Name
HAVING 
    SUM(Profit) < 0 AND SUM(Sales) > 1000
ORDER BY 
    Total_Profit ASC;

-- Average sales and profit per customer segment

SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    ROUND(SUM(Sales)/COUNT(DISTINCT Customer_ID), 2) AS Avg_Sales_Per_Customer,
    ROUND(SUM(Profit)/COUNT(DISTINCT Customer_ID), 2) AS Avg_Profit_Per_Customer
FROM 
    orders
GROUP BY 
    Segment;
    
   -- Number of unique customers by state

SELECT 
    State,
    COUNT(DISTINCT Customer_ID) AS Customer_Count
FROM 
    orders
GROUP BY 
    State
ORDER BY 
    Customer_Count DESC;
 
-- Top 10 customers by number of orders

SELECT 
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Orders_Count
FROM 
    orders
GROUP BY 
    Customer_ID, Customer_Name
ORDER BY 
    Orders_Count DESC
LIMIT 10;
