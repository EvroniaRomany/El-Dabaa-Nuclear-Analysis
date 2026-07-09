use reactor
go


---- 1)Why is the VVER reactor the best choice for Egypt?
SELECT
    r.Reactor_Type,
    ROUND(AVG(f.Capacity_Factor),2) AS Avg_Capacity_Factor,
    ROUND(AVG(f.Availability),2) AS Avg_Availability,
    ROUND(AVG(f.ROI),2) AS Avg_ROI,
    ROUND(AVG(f.Net_Profit_USD),2) AS Avg_Net_Profit,
    ROUND(AVG(f.Total_Operating_Cost_USD),2) AS Avg_Operating_Cost
FROM  [fact ] f
JOIN Dim_Reactor r
    ON f.Reactor_idd = r.Reactor_ID
GROUP BY r.Reactor_Type
ORDER BY Avg_ROI DESC;

---Availability (%)=إجمالي ساعات الفترة / إجمالي ساعات الجاهزية​×100

--ROI= صافى الربح /الاستثمار )×100

-- 2) Which countries and plant  have an average capacity factor above 80%?  استغلال القدرة الفعلية
SELECT top 5
 p.Plant_Name, p.Country,
    ROUND(AVG(f.Capacity_Factor),2) AS Avg_Capacity
FROM [fact ] f
JOIN Dim_Plant p
ON f.Plant_ID = p.Plant_ID
GROUP BY p.Plant_Name ,p.Country
HAVING AVG(f.Capacity_Factor) > 80
ORDER BY Avg_Capacity DESC;


 
 -- 3) What is the average operating cost for each reactor type?
 SELECT top 10
    r.Reactor_Type,r.Reactor_Model,
    ROUND(AVG(f.Total_Operating_Cost_USD),2) AS Avg_Operating_Cost
FROM [fact ] f
JOIN Dim_Reactor r
ON f.Reactor_idd = r.Reactor_ID
GROUP BY r.Reactor_Type ,r.Reactor_Model
ORDER BY Avg_Operating_Cost DESC;


--4) What is the average ROI for each reactor type?

SELECT
    r.Reactor_Type,
    ROUND(AVG(f.ROI),2) AS Avg_ROI
FROM [fact ] f
JOIN dim_reactor r
ON f.Reactor_idd = r.Reactor_id
GROUP BY r.Reactor_Type
ORDER BY Avg_ROI DESC;

---5) Which plants generated more than 1 billion USD in revenue?
SELECT top 10
    p.Plant_Name,
    SUM(f.Revenue_USD) AS Total_Revenue
FROM [fact ] f
JOIN Dim_Plant p
ON f.Plant_ID = p.Plant_ID
GROUP BY p.Plant_Name
HAVING SUM(f.Revenue_USD) > 1000000000
ORDER BY Total_Revenue DESC;
  
-- 6) Count the number of plants in each country   المحطة النووية

SELECT
    Country,
    COUNT(Plant_ID) AS Number_of_Plants
FROM Dim_Plant
GROUP BY Country
ORDER BY Number_of_Plants DESC;


---7) What is the average revenue for each year?
SELECT top 5
    d.Year,
    ROUND(AVG(f.Revenue_USD),2) AS Avg_Revenue
FROM [fact ] f
JOIN Dim_Date d
ON f.date_idd = d.Date_ID
GROUP BY d.Year
ORDER BY d.Year;

---8) Which countries have the highest average electricity generation?
SELECT top 5
    p.Country,
    ROUND(AVG(f.Energy_Generated_MWh),2) AS Avg_Electricity
FROM [fact ] f
JOIN Dim_Plant p
ON f.Plant_ID = p.Plant_ID
GROUP BY p.Country
ORDER BY Avg_Electricity DESC;

  --9) Which reactor type generated the highest total net profit?
SELECT TOP 5
    r.Reactor_Type,
    SUM(f.Net_Profit_USD) AS Total_Net_Profit
FROM  [fact ] f
JOIN Dim_Reactor r
    ON f.Reactor_idd = r.Reactor_ID
GROUP BY r.Reactor_Type
ORDER BY Total_Net_Profit DESC;


 ---10) What is the total revenue generated for top 5 country? 
 SELECT  top 5
 p.Plant_Name  , p.Country, 
    SUM(f.Revenue_USD) AS Total_Revenue
FROM  [fact ] f
JOIN Dim_Plant p
ON f.Plant_ID = p.Plant_ID
GROUP BY p.Country , p.Plant_Name
ORDER BY Total_Revenue DESC;

  ---11)Find the total maintenance cost for each reactor type.

  SELECT
    r.Reactor_Type,
    SUM(f.Maintenance_Cost_USD) AS Total_Maintenance_Cost
FROM [fact ] f
JOIN Dim_Reactor r
ON f.Reactor_idd = r.Reactor_ID
GROUP BY r.Reactor_Type
ORDER BY Total_Maintenance_Cost DESC;



  --12) Classify each record's performance based on its capacity factor
SELECT TOP 10
    r.Reactor_Type,
    f.Capacity_Factor,
    CASE
        WHEN f.Capacity_Factor >= 90 THEN 'Excellent'
        WHEN f.Capacity_Factor >= 80 THEN 'Good'
        WHEN f.Capacity_Factor >= 70 THEN 'Average'
        ELSE 'Poor'
    END AS Performance
FROM [fact ] f
JOIN Dim_Reactor r
    ON r.Reactor_ID = f.Reactor_idd;









---13)Which reactor types have an average ROI greater than 20%?
SELECT
    r.Reactor_Type,
    ROUND(AVG(f.ROI),2) AS Avg_ROI
FROM [fact ] f
JOIN Dim_Reactor r
ON f.Reactor_idd = r.Reactor_ID
GROUP BY r.Reactor_Type
HAVING AVG(f.ROI) > 20
ORDER BY Avg_ROI DESC;