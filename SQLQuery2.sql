-- 🔍 List All User-Created Databases
SELECT name 
FROM sys.databases
WHERE database_id > 4;

-- 📂 Switch to the Project Database
USE ProjectPerformanceDB;

-- 📄 Preview the Portfolio Table
SELECT TOP 10 * FROM dbo.portfolio;

-- 📈 Create CPI View: Cost Performance Index per Project
CREATE OR ALTER VIEW cpi AS
SELECT 
    projectid,
    projectname,
    CAST(SUM(plannedcost) AS DECIMAL(10,2)) / NULLIF(CAST(SUM(actualcost) AS DECIMAL(10,2)), 0) AS CPI
FROM portfolio
GROUP BY projectid, projectname;

-- 📉 Create SPI View: Schedule Performance Index per Project
CREATE OR ALTER VIEW spi AS
SELECT 
    projectid,
    projectname,
    CAST(SUM(plannedhours) AS DECIMAL(10,2)) / NULLIF(CAST(SUM(actualhours) AS DECIMAL(10,2)), 0) AS SPI
FROM portfolio
GROUP BY projectid, projectname;

-- ⏱️ Create Time Variance View: Planned vs. Actual Hours
CREATE OR ALTER VIEW time_variance AS
SELECT 
    projectid,
    projectname,
    CAST(SUM(plannedhours) AS DECIMAL(10,2)) - CAST(SUM(actualhours) AS DECIMAL(10,2)) AS TimeVariance
FROM portfolio
GROUP BY projectid, projectname;

-- 📊 Create Combined View: CPI, SPI, and Time Variance
CREATE OR ALTER VIEW vw_Combined AS
SELECT
    projectid,
    projectname,
    CAST(SUM(plannedcost) AS DECIMAL(10,2)) / NULLIF(SUM(actualcost), 0) AS CPI,
    CAST(SUM(plannedhours) AS DECIMAL(10,2)) / NULLIF(SUM(actualhours), 0) AS SPI,
    SUM(plannedhours) - SUM(actualhours) AS TimeVariance
FROM portfolio
GROUP BY projectid, projectname;

-- ❌ Drop Temporary Summary Table (if it exists)
DROP TABLE IF EXISTS project_summary;

-- 📥 View the Final Combined Project Metrics
SELECT * FROM vw_Combined;

-- 🧭 Confirm Active Database
SELECT DB_NAME() AS CurrentDatabase;
