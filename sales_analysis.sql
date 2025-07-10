-- Monthly Sales Trend

SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%Y'), '%Y-%m') AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
    orders
GROUP BY 
    Month
ORDER BY 
    Month;

-- Top 10 Products by Sales

SELECT 
    Product_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
    orders
GROUP BY 
    Product_Name
ORDER BY 
    Total_Sales DESC
LIMIT 10;

-- Sales and Profit by Category and Sub-Category

SELECT 
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Category, Sub_Category
ORDER BY 
    Total_Profit DESC;

-- Sales and Profit by Region and State

SELECT 
    Region,
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Region, State
ORDER BY 
    Total_Profit DESC;
    
    -- Sales and Profit by Segment

SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Segment
ORDER BY 
    Total_Sales DESC;

-- Sales and Profit by Ship Mode

SELECT 
    Ship_Mode,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(*) AS Orders_Count
FROM 
    orders
GROUP BY 
    Ship_Mode
ORDER BY 
    Total_Sales DESC;

-- Average Discount vs Profit by Sub-Category

SELECT 
    Sub_Category,
    ROUND(AVG(Discount), 2) AS Avg_Discount,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Sub_Category
ORDER BY 
    Avg_Discount DESC;
    
-- Top 10 Profitable Products

SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Product_Name
ORDER BY 
    Total_Profit DESC
LIMIT 10;

-- Bottom 10 Products by Profit

SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Product_Name
ORDER BY 
    Total_Profit ASC
LIMIT 10;

