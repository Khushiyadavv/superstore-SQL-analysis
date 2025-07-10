-- Grouping data by discount level (rounded to nearest 0.1)

SELECT 
    ROUND(Discount, 1) AS Discount_Level,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM 
    orders
GROUP BY 
    ROUND(Discount, 1)
ORDER BY 
    Discount_Level;

-- Compare orders with and without discounts

SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        ELSE 'Discount Applied'
    END AS Discount_Status,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM 
    orders
GROUP BY 
    Discount_Status;
    
    -- Check if some categories are more sensitive to discounting

SELECT 
    Category,
    ROUND(AVG(Discount), 2) AS Avg_Discount,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percent
FROM 
    orders
GROUP BY 
    Category
ORDER BY 
    Profit_Margin_Percent ASC;

-- Orders with high discounts and negative profit

SELECT 
    Order_ID,
    Customer_Name,
    Product_Name,
    Discount,
    Sales,
    Profit
FROM 
    orders
WHERE 
    Discount >= 0.3 AND Profit < 0
ORDER BY 
    Discount DESC;
    
    -- Which sub-categories lose the most due to discounts?

SELECT 
    Sub_Category,
    ROUND(AVG(Discount), 2) AS Avg_Discount,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percent
FROM 
    orders
GROUP BY 
    Sub_Category
ORDER BY 
    Profit_Margin_Percent ASC;

