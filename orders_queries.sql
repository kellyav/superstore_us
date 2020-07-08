-- see the database table Orders
SELECT *
FROM dbo.Orders;

--Which state(s) is the superstore most succesful in? Least?
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

--Most succesful product? Least?
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

