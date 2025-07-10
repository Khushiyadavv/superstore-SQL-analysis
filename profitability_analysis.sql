-- Overall Profitability Summary

SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM 
    orders;

-- Profit by Category and Sub-Category

SELECT 
    Category,
    Sub_Category,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit
FROM 
    orders
GROUP BY 
    Category, Sub_Category
ORDER BY 
    Total_Profit ASC;
    
    -- Profit by Region and State

SELECT 
    Region,
    State,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Region, State
ORDER BY 
    Total_Profit ASC;
    
-- Products with High Sales but Negative Profit

SELECT 
    Product_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Product_Name
HAVING 
    SUM(Profit) < 0 AND SUM(Sales) > 500
ORDER BY 
    Total_Profit ASC;
    
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

-- Profit by Segment

SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM 
    orders
GROUP BY 
    Segment
ORDER BY 
    Total_Profit DESC;
    
    -- Top 5 Most Profitable Products

SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Product_Name
ORDER BY 
    Total_Profit DESC
LIMIT 5;

-- Bottom 5 Least Profitable Products

SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    orders
GROUP BY 
    Product_Name
ORDER BY 
    Total_Profit ASC
LIMIT 5;


