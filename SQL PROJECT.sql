CREATE DATABASE sales;
USE sales;

CREATE TABLE Superstore (
    RowID INT,
    OrderID VARCHAR(50),
    OrderDate VARCHAR(50),
    ShipDate VARCHAR(50),
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(50),
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Region VARCHAR(50),
    ProductID VARCHAR(50),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(255),
    Sales DOUBLE,
    Quantity INT,
    Discount DOUBLE,
    Profit DOUBLE
);

select * from sales_data;

#Total Sales 
 
SELECT SUM(Sales) AS TotalSales
FROM sales_data;

# total profot

select sum(profit) as TotalProfit
from sales_data;

# top 10 product 

select 
ProductName,
 sum(sales) as Revenue
 from superstore
group by  ProductName
order by Revenue desc
limit 10;

#Region wise sales

select 
region,
sum(sales) as revenue
from superstore 
group by region 
order by revenue desc;

#Monthly sales trend 

select month(Orderdate) as monthno,
sum(sales) as revenue 
from superstore 
group by month(orderdate)
order by Monthno;

# Most profitable category 

select category,
sum(profit) as profit 
from superstore
group by category 
order by profit desc;

# Loss making products

select ProductName,
sum(profit) as loss
from superstore
group by productname
having loss < 0
order by loss;


# window function 
# rank productname by sales

select 
productname,
sales,
rank() over( order by sales desc) as SalesRank
from superstore;

# CTE 

with regionsales as(
select region,
sum(sales) as revenue 
from superstore 
group by region)
select * from regionsales
where revenue > 10000;

# case staement 
select
    ProductName,
    Profit,
   case
       when Profit > 500 then 'High Profit'
        when Profit > 0 then 'Moderate Profit'
        else 'Loss'
    end as ProfitStatus
from Superstore;
