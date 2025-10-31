USE Princekay
SELECT * FROM calendar_year_rev

-- Replacing NULL with N/A
UPDATE calendar_year_rev
SET 
    Calendar_Year = COALESCE(Calendar_Year, 'N/A'),
    Land_Class = COALESCE(Land_Class, 'N/A'),
    Land_Category = COALESCE(Land_Category, 'N/A'),
    State = COALESCE(State, 'N/A'),
    County = COALESCE(County, 'N/A'),
    Offshore_Region = COALESCE(Offshore_Region, 'N/A'),
    Revenue_Type = COALESCE(Revenue_Type, 'N/A'),
    Mineral_Lease_Type = COALESCE(Mineral_Lease_Type, 'N/A'),
    Commodity = COALESCE(Commodity, 'N/A'),
    Product = COALESCE(Product, 'N/A')

SELECT * FROM calendar_year_rev

-- Dropping the FIPS_Code column
ALTER TABLE calendar_year_rev
DROP COLUMN FIPS_Code;


-- Total Revenue
SELECT ROUND(SUM(Revenue), 2) AS Total_Revenue 
FROM calendar_year_rev;


-- Average Annual Revenue
SELECT ROUND(AVG(Annual_Revenue), 2) AS Average_Annual_Revenue
FROM (
    SELECT Calendar_Year, SUM(Revenue) AS Annual_Revenue
    FROM calendar_year_rev
    GROUP BY Calendar_Year
) AS YearlyRevenue;


-- Revenue contribution by State
SELECT State, 
ROUND(SUM(Revenue), 2) AS Total_Revenue, 
ROUND((SUM(Revenue) / (SELECT SUM(Revenue) FROM calendar_year_rev)) * 100, 2) AS Revenue_Percentage
FROM calendar_year_rev 
GROUP BY State 
ORDER BY Total_Revenue DESC;


-- Revenue contribution by Product
SELECT Product, 
ROUND(SUM(Revenue), 2) AS Total_Revenue, 
ROUND((SUM(Revenue) / (SELECT SUM(Revenue) FROM calendar_year_rev)) * 100, 2) AS Revenue_Percentage
FROM calendar_year_rev 
GROUP BY Product 
ORDER BY Total_Revenue DESC;


-- Onshore vs Offshore Revenue
SELECT Land_Category, 
ROUND(SUM(Revenue), 2) AS Total_Revenue, 
ROUND((SUM(Revenue) / (SELECT SUM(Revenue) FROM calendar_year_rev)) * 100, 2) AS Revenue_Percentage
FROM calendar_year_rev 
GROUP BY Land_Category 
ORDER BY Total_Revenue DESC;


-- Calculating Total Revenue Per Year
SELECT Calendar_Year, 
ROUND(SUM(Revenue), 2) AS Total_Revenue 
FROM calendar_year_rev 
GROUP BY Calendar_Year 
ORDER BY Calendar_Year ASC;

SELECT Calendar_Year, 
ROUND(SUM(Revenue), 2) AS Total_Revenue 
FROM calendar_year_rev 
GROUP BY Calendar_Year 
ORDER BY Total_Revenue DESC;


--Ranking Top States by Total Revenue
SELECT State, 
ROUND(SUM(Revenue), 2) AS Total_Revenue 
FROM calendar_year_rev 
GROUP BY State 
ORDER BY Total_Revenue DESC;


-- Calculating Total Revenue by Revenue Type
SELECT Revenue_Type,
ROUND(SUM(Revenue), 2) AS Total_Revenue_by_Revenue_Type
FROM calendar_year_rev
GROUP BY Revenue_Type
ORDER BY Total_Revenue_by_Revenue_Type DESC;


-- Total Revenue by Commodity
SELECT Commodity,
ROUND(SUM(Revenue), 2) AS Total_Revenue_by_Commodity
FROM calendar_year_rev
GROUP BY Commodity
ORDER BY Total_Revenue_by_Commodity DESC;


-- Total Revenue by Mineral Lease Type
SELECT Mineral_Lease_Type, 
ROUND(SUM(Revenue), 2) AS Total_Revenue_by_Mineral_Lease_Type
FROM calendar_year_rev 
GROUP BY Mineral_Lease_Type 
ORDER BY Total_Revenue_by_Mineral_Lease_Type DESC;


-- Total Revenue by Land Class
SELECT Land_Class,
ROUND(SUM(Revenue), 2) AS Total_Revenue_by_Land_Class
FROM calendar_year_rev
GROUP BY Land_Class
ORDER BY Total_Revenue_by_Land_Class DESC;


-- Top 10 County by total Revenue
SELECT TOP 10 County, 
ROUND(SUM(Revenue), 2) AS Total_Revenue 
FROM calendar_year_rev 
GROUP BY County 
ORDER BY Total_Revenue DESC;


-- Total Revenue by Land Category
SELECT Land_Category, 
ROUND(SUM(Revenue), 2) AS Total_Revenue_by_Land_Category 
FROM calendar_year_rev  
GROUP BY Land_Category 
ORDER BY Total_Revenue_by_Land_Category DESC;


-- Top 10 Products by Total Revenue
SELECT TOP 10 Product, 
ROUND(SUM(Revenue), 2) AS Total_Revenue 
FROM calendar_year_rev 
GROUP BY Product 
ORDER BY Total_Revenue DESC;


-- Year over Year Growth rate
SELECT 
    c1.Calendar_Year,
    ROUND(SUM(c1.Revenue), 2) AS Total_Revenue,
    ROUND(
        ((SUM(c1.Revenue) - SUM(c2.Revenue)) / NULLIF(SUM(c2.Revenue), 0)) * 100, 2
    ) AS YoY_Growth_Percentage
FROM calendar_year_rev c1
LEFT JOIN calendar_year_rev c2 
    ON c1.Calendar_Year = c2.Calendar_Year + 1
GROUP BY c1.Calendar_Year
ORDER BY c1.Calendar_Year;


-- Detecting Sudden Revenue Rise and Drops
WITH RevenueChange AS (
  SELECT 
    CAST(c1.Calendar_Year AS INT) AS Calendar_Year, 
    ROUND(SUM(c1.Revenue), 2) AS Total_Revenue, 
    ROUND( ((SUM(c1.Revenue) - SUM(c2.Revenue)) / NULLIF(SUM(c2.Revenue), 0)) * 100, 2 ) AS YoY_Growth_Percentage 
  FROM 
    calendar_year_rev c1 
    LEFT JOIN calendar_year_rev c2 ON CAST(c1.Calendar_Year AS INT) = CAST(c2.Calendar_Year AS INT) + 1 
  WHERE 
    c1.Calendar_Year NOT LIKE 'N/A' 
    AND c2.Calendar_Year NOT LIKE 'N/A' 
  GROUP BY 
    CAST(c1.Calendar_Year AS INT)
)
SELECT 
  *, 
  CASE 
    WHEN YoY_Growth_Percentage > 30 THEN 'Rise' 
    WHEN YoY_Growth_Percentage < -30 THEN 'Drop' 
    ELSE 'Stable' 
  END AS Anomaly_Flag 
FROM 
  RevenueChange 
ORDER BY 
  Calendar_Year;


-- Revenue Patterns by Commodity
SELECT Calendar_Year, Commodity, 
ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM calendar_year_rev
GROUP BY Calendar_Year, Commodity
ORDER BY Calendar_Year, Total_Revenue DESC;


-- Pareto Analysis (80/20 Rule): Identifying Key Revenue Contributors
-- The Pareto Principle suggests that 80% of the revenue comes from 20% of commodities or states. We'll analyze:
-- Top Commodities driving revenue
--Top States contributing the most

-- Pareto Analysis for Commodities
WITH CommodityRevenue AS (
    SELECT 
        Commodity, 
        ROUND(SUM(Revenue), 2) AS Total_Revenue
    FROM calendar_year_rev
    GROUP BY Commodity
), RankedCommodity AS (
    SELECT 
        Commodity, 
        Total_Revenue, 
        Total_Revenue * 100.0 / SUM(Total_Revenue) OVER () AS Revenue_Percentage,
        SUM(Total_Revenue) OVER (ORDER BY Total_Revenue DESC) 
            * 100.0 / SUM(Total_Revenue) OVER () AS Cumulative_Percentage
    FROM CommodityRevenue
)
SELECT 
    Commodity, 
    Total_Revenue, 
    ROUND(Revenue_Percentage, 2) AS Revenue_Percentage, 
    ROUND(Cumulative_Percentage, 2) AS Cumulative_Percentage,
    CASE 
        WHEN Cumulative_Percentage <= 80 THEN 'Top 20%' 
        ELSE 'Remaining 80%' 
    END AS Pareto_Category
FROM RankedCommodity
ORDER BY Cumulative_Percentage;


-- Pareto Analysis for States
WITH StateRevenue AS (
    SELECT 
        State, 
        ROUND(SUM(Revenue), 2) AS Total_Revenue
    FROM calendar_year_rev
    GROUP BY State
), RankedState AS (
    SELECT 
        State, 
        Total_Revenue, 
        Total_Revenue * 100.0 / SUM(Total_Revenue) OVER () AS Revenue_Percentage,
        SUM(Total_Revenue) OVER (ORDER BY Total_Revenue DESC) 
            * 100.0 / SUM(Total_Revenue) OVER () AS Cumulative_Percentage
    FROM StateRevenue
)
SELECT 
    State, 
    Total_Revenue, 
    ROUND(Revenue_Percentage, 2) AS Revenue_Percentage, 
    ROUND(Cumulative_Percentage, 2) AS Cumulative_Percentage,
    CASE 
        WHEN Cumulative_Percentage <= 80 THEN 'Top 20%' 
        ELSE 'Remaining 80%' 
    END AS Pareto_Category
FROM RankedState
ORDER BY Cumulative_Percentage;


-- Revenue vs Lease Type
SELECT Mineral_Lease_Type, 
ROUND(SUM(Revenue), 2) AS Total_Revenue, 
COUNT(*) AS Transaction_Count
FROM calendar_year_rev
GROUP BY Mineral_Lease_Type
ORDER BY Total_Revenue DESC;


-- Revenue by Commodity
SELECT Commodity, 
ROUND(SUM(Revenue), 2) AS Total_Revenue, 
COUNT(*) AS Transaction_Count
FROM calendar_year_rev
GROUP BY Commodity
ORDER BY Total_Revenue DESC;


-- Revenue vs Revenue type
SELECT Revenue_Type, 
ROUND(SUM(Revenue), 2) AS Total_Revenue, 
COUNT(*) AS Transaction_Count
FROM calendar_year_rev
GROUP BY Revenue_Type
ORDER BY Total_Revenue DESC;


-- Revenue vs Land Category
SELECT Land_Category, 
ROUND(SUM(Revenue), 2) AS Total_Revenue, 
COUNT(*) AS Transaction_Count
FROM calendar_year_rev
GROUP BY Land_Category
ORDER BY Total_Revenue DESC;


-- Lease Profitability
SELECT Mineral_Lease_Type, 
ROUND(SUM(Revenue), 2) AS Total_Revenue, 
COUNT(*) AS Transaction_Count, 
ROUND(AVG(Revenue), 2) AS Avg_Revenue_Per_Transaction
FROM calendar_year_rev
GROUP BY Mineral_Lease_Type
ORDER BY Total_Revenue DESC;


-- Moving Average Forecasting
WITH RevenueHistory AS (
    SELECT 
        Calendar_Year, 
        ROUND(SUM(Revenue), 2) AS Total_Revenue
    FROM calendar_year_rev
    GROUP BY Calendar_Year
),
Moving_Avg AS (
    SELECT 
        Calendar_Year, 
        Total_Revenue, 
        ROUND(AVG(Total_Revenue) OVER (ORDER BY Calendar_Year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS Moving_Average
    FROM RevenueHistory
)
SELECT 
    Calendar_Year, 
    Total_Revenue, 
    Moving_Average 
FROM Moving_Avg
ORDER BY Calendar_Year;


-- Linear Trend Analysis
WITH RevenueHistory AS (
    SELECT 
        Calendar_Year, 
        SUM(Revenue) AS Total_Revenue
    FROM calendar_year_rev
    GROUP BY Calendar_Year
),
LinearTrend AS (
    SELECT 
        Calendar_Year, 
        Total_Revenue,
        ROW_NUMBER() OVER (ORDER BY Calendar_Year) AS Year_Index
    FROM RevenueHistory
),
TrendCoefficients AS (
    SELECT 
        COUNT(*) AS n,
        SUM(Year_Index) AS SumX, 
        SUM(Total_Revenue) AS SumY, 
        SUM(Year_Index * Year_Index) AS SumX2, 
        SUM(Year_Index * Total_Revenue) AS SumXY
    FROM LinearTrend
),
CalculateTrend AS (
    SELECT 
        (n * SumXY - SumX * SumY) / (n * SumX2 - SumX * SumX) AS Slope,
        (SumY - ((n * SumXY - SumX * SumY) / (n * SumX2 - SumX * SumX)) * SumX) / n AS Intercept
    FROM TrendCoefficients
)
SELECT 
    (SELECT MAX(Calendar_Year) FROM RevenueHistory) + 1 AS Predicted_Year, 
    ROUND((SELECT Slope FROM CalculateTrend) * (SELECT MAX(Year_Index) + 1 FROM LinearTrend) + 
          (SELECT Intercept FROM CalculateTrend), 2) AS Predicted_Revenue;