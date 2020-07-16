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
