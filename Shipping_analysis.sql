-- Analyze total sales, profit, and average delivery time by shipping mode

SELECT 
    Ship_Mode,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(DATEDIFF(Ship_Date, Order_Date)), 2) AS Avg_Delivery_Days
FROM 
    orders
GROUP BY 
    Ship_Mode
ORDER BY 
    Total_Profit DESC;
    
   -- Find out which regions prefer which shipping modes and how profitable each is

SELECT 
    Region,
    Ship_Mode,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Region, Ship_Mode
ORDER BY 
    Region, Total_Profit DESC;
 
 -- Check orders that took more than 5 days to deliver

SELECT 
    Order_ID,
    Customer_Name,
    Ship_Mode,
    Order_Date,
    Ship_Date,
    DATEDIFF(Ship_Date, Order_Date) AS Delivery_Days,
    Sales,
    Profit
FROM 
    orders
WHERE 
    DATEDIFF(Ship_Date, Order_Date) > 5
ORDER BY 
    Delivery_Days DESC;

-- Create delivery speed buckets and analyze their profitability

SELECT 
    CASE 
        WHEN DATEDIFF(Ship_Date, Order_Date) <= 2 THEN 'Fast (≤2 Days)'
        WHEN DATEDIFF(Ship_Date, Order_Date) BETWEEN 3 AND 5 THEN 'Moderate (3–5 Days)'
        ELSE 'Slow (>5 Days)'
    END AS Delivery_Speed,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM 
    orders
GROUP BY 
    Delivery_Speed
ORDER BY 
    Delivery_Speed;
    
    -- Orders with high discounts and longer delivery — potential churn zone

SELECT 
    Order_ID,
    Customer_Name,
    Ship_Mode,
    Discount,
    DATEDIFF(Ship_Date, Order_Date) AS Delivery_Days,
    Sales,
    Profit
FROM 
    orders
WHERE 
    Discount >= 0.3 AND DATEDIFF(Ship_Date, Order_Date) > 5 AND Profit < 0
ORDER BY 
    Delivery_Days DESC;
    