# superstore_us
Analyze the Orders table, from the SuperstoreUS database, using SQL and Tableau.

From the AWS instance: *ec2–52–14–205–70.us-east-2.compute.amazonaws.com*

## Basis:
Quantify growth percentages based on Profit. This is how 'success' will be defined. See which states have more profit, or growth increase, than others.

Profit may vary state to state due to taxes and cost of living. Number of Sales is another factor.

1. Which state(s) is the Superstore most succesful in? Least?

*answered by running overall_success.sql*

2. Most succesful product? Least?

*answered by running product_profits.sql and product_salessuccess.sql*


3. Where can we trim some loses? Which products?

*answered by running trim_loses.sql*


## Tableau:

See the *Superstore_analysis2.pdf* file for a screenshot of the interactive dashboard.

### New variables
- *2015, 2016, 2017, 2018:* These 4 variables represent total Sales per respective year.

Computation: IF DATEPART('year', [Ship Date])=2017 THEN [Sales] ELSE 0 END

- *Total Pct. Change:* A computation using the difference between 2015 and 2018 total respective sales, diveded by the total Sales. Represents overall negative or positive growth, as a percentage.

Computation: (SUM([2018 (Sales)]) - SUM([2015 (Sales)])) / SUM([Sales])

- *ProfitMargin:*  measure of profitability, broken down by (Sub)Category and again by State. 

Computation: SUM(Profit) / SUM(Sales)


### Dashboard details
I. Map of the USA, color coded by total Profit per State

Filters to see which states have positive or negative total profit growth percentage. 


II. Sales Growth (%) by Category Chart

Visualizes which categories of products are increasing in Sales. 
Color coded red to represent negative growth and green to represent positive growth.

III. Histogram of Negative Profit Margin
Dashboard is filtered to only include negative profit margin. This is a tool to visualize exactly where, and which products, are causing loss in Profit. We want to minimize these negative bars as much as possible. 


## Potential consequences from this analysis:
1. Optimize locations.
  Idenitfy which states are doing well and which are not. Shows where improvement needs to be made, or where stores may need to close and relocate. 

2. Optimize product availability and selection.
The combination of the profit chart and histogram should make it clear what changes need to be made in the business. Negative profit means you are loosing money. The goal is to minimize this as much as possible by looking what tends to lose the most money, and where.

## Requirements
See the requirements.txt file in this repo for more details, and installation instructions.

- Tableau Desktop
- SQL Server Management Studio (SSMS).
- A windows computer (for SSMS)

Note: I was denied permissions using SSMS to create a table of the outputs of these queries due to the db not beng mine. The db has permission restrictions.

