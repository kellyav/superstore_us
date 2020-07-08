-- see the database table Orders
SELECT *
FROM dbo.Orders;

-- 1. Which state(s) is the superstore most succesful in? Least?
--Top 10 results:
SELECT SUM(sales) AS state_sales, State
FROM dbo.Orders
GROUP BY State
ORDER BY state_sales DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
--note here LIMIT 10 was not used.It produces an error if run in SSMS

SELECT SUM(sales) AS state_sales, State
FROM dbo.Orders
GROUP BY State
ORDER BY state_sales
OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY;


-- 2. Most succesful product? Least?

--Breakdown by Top vs Worst Sellers:
--Top 10 Categories (with the addition of best sub-category within the category):
SELECT SUM(sales) AS prod_sales, Category, [Sub-Category]
FROM dbo.Orders
GROUP BY Category, [Sub-Category]
ORDER BY prod_sales DESC;

--Top 10 Sub-Categories (aka the products themselves):
SELECT SUM(sales) AS prod_sales, [Sub-Category]
FROM dbo.Orders
GROUP BY [Sub-Category]
ORDER BY prod_sales DESC
OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY;

--Worst 10 Categories:
SELECT SUM(sales) AS prod_sales, Category, [Sub-Category]
FROM dbo.Orders
GROUP BY Category, [Sub-Category]
ORDER BY prod_sales;

--Worst 10 Sub-Categories (aka the products themselves):
SELECT SUM(sales) AS prod_sales, [Sub-Category]
FROM dbo.Orders
GROUP BY [Sub-Category]
ORDER BY prod_sales
OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY;

--Breakdown by Top vs Worst Profits:
--Top 10 Categories (with the addition of best sub-category within the category):
SELECT SUM(sales) AS prod_sales, Category, [Sub-Category]
FROM dbo.Orders
GROUP BY Category, [Sub-Category]
ORDER BY prod_sales DESC;

--Top 10 Sub-Categories (aka the products themselves):
SELECT SUM(profit) AS prod_prof, [Sub-Category]
FROM dbo.Orders
GROUP BY [Sub-Category]
ORDER BY prod_prof DESC
OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY;

--Worst 10 Categories:
SELECT SUM(profit) AS prod_prof, Category, [Sub-Category]
FROM dbo.Orders
GROUP BY Category, [Sub-Category]
ORDER BY prod_prof;

--Worst 10 Sub-Categories (aka the products themselves):
SELECT SUM(profit) AS prod_prof, [Sub-Category]
FROM dbo.Orders
GROUP BY [Sub-Category]
ORDER BY prod_prof
OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY;


-- 3. Where can we trim some loses? Which products?

SELECT AVG(sales) AS avg_sales
FROM dbo.Orders;
-- the average sales on any given product is 229.8, so approx. 230.

SELECT AVG(Profit) AS avg_prof
FROM dbo.Orders;
-- the average profit on any given product is 28.6, or approx 29.


-- Average sales per sub-cat
SELECT AVG(sales) AS avg_sales, [Sub-Category]
FROM dbo.Orders
GROUP BY [Sub-Category]
ORDER BY avg_sales DESC;

-- Average profit per sub-cat
SELECT AVG(Profit) AS avg_prof, [Sub-Category]
FROM dbo.Orders
GROUP BY [Sub-Category]
ORDER BY avg_prof DESC;
