/* 3. Where can we trim some loses? Which products?

We can do this by calculating the average sales and profits, and comparing the values to that average.
If the sales or profits are below average, then they are not best sellers and 
can be analyzed deeper to see if its worth selling thema anymore. */

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
