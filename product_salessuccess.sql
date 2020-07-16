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
