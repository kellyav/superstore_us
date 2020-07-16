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

