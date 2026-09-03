

#=====================================================
         # Global Superstore Analysis
#=====================================================


use Global_Superstore;


#=====================================================
              # 1. DATA EXPLORATION
#=====================================================


select * 
from data
limit 5;

desc data;

select count(*) 
from data;

select min(Profit) as min_Profit , max(Profit) as max_Profit
from data;

select min(Sales) as min_Sales , max(Sales) as max_Sales
from data;

select round(avg(Profit)) as avg_Profit , round(avg(Sales)) as avg_Sales
from data;



#=====================================================
         # 2. CUSTOMER DISTRIBUTION
#=====================================================



select Category , 
count(Category) as count_of_catagory
from data
group by Category ;

select Country , 
count(Country) as count
from data
group by Country
order by  count desc;

select City , 
count(City) as count
from data
group by City 
order by count desc;

select Order_Priority , 
count(Order_Priority) as count
from data
group by Order_Priority 
order by count desc;

select Region , 
count(Region) as count 
from data
group by Region 
order by count desc;

select Segment , 
count(Segment) as count
from data
group by Segment 
order by count desc;

select Ship_Mode , 
count(Ship_Mode) as count
from data
group by Ship_Mode 
order by count desc;

select Sub_Category , 
count(Sub_Category) as count
from data
group by Sub_Category 
order by count desc;


select Order_ID ,count(*) as count
from data
group by Order_ID
having count(*) > 1;

select Customer_Name,
sum(Sales) as total_sales , 
sum(Profit) as total_profit,
rank() over ( order by sum(Sales) desc) as rank_
from data
group by Customer_Name
having sum(Profit) > 0
limit 5;



#=====================================================
         # 3. SALES ANALYSIS
#=====================================================



select sum(Sales) as Total_Sales
from data;

select round(sum(Profit)) as Total_Profit
from data;

select sum(Quantity) as Total_Quantity_Sold
from data;

select Category , sum(Sales) as Total_Sales
from data
group by Category
order by Total_sales desc;

select Category , round(sum(Profit)) as Total_Profit
from data
group by Category
order by Total_Profit desc;

select Market , sum(Sales) as Total_Sales
from data
group by Market
order by Total_sales desc;

select Market , round(sum(Profit)) as Total_Profit
from data
group by Market
order by Total_Profit desc;

select * 
from data
order by Sales desc
limit 10;



#=====================================================
         # 4. PROFIT ANALYSIS
#=====================================================


select 
Category,
sum(Profit) as Total_Profit
from data
group by Category
order by Total_Profit desc;

select 
Sub_Category,
round(sum(Profit)) as Total_Profit , rank() over(order by sum(Profit) desc) as Rank_
from data 
group by Sub_Category
order by Total_Profit desc
limit 1;

select
Sub_Category,
round(sum(Profit)) as Total_Profit , rank() over(order by sum(Profit) desc) as Rank_
from data
group by Sub_Category
order by Total_Profit
limit 1 ;

select
Sub_Category,
round(sum(Profit)) as Total_Profit 
from data
group by Sub_Category
having Total_Profit < 0;

select
Sub_Category,
round(sum(Profit)) as Total_Profit , rank() over(order by sum(Profit) desc) as Rank_
from data
group by Sub_Category
order by Total_Profit desc
limit 10  ;

select
Sub_Category,
round(sum(Profit)) as Total_Profit , rank() over(order by sum(Profit)  desc) as Rank_
from data
group by Sub_Category
order by Total_Profit
limit 10 ;

select
Sub_Category,
round(sum(Profit)) as Total_Profit , 
round(avg(Profit)) as Avg_Profit,
rank() over(order by round(avg(Profit)) desc) as Rank_
from data
group by Sub_Category
order by Avg_Profit desc;

select
Category,
round(sum(Profit)) as Total_Profit , 
round(avg(Profit)) as Avg_Profit,
rank() over(order by round(avg(Profit)) desc) as Rank_
from data
group by Category
order by Avg_Profit desc;

select
Segment,
round(sum(Profit)) as Total_Profit , 
round(avg(Profit)) as Avg_Profit,
rank() over(order by round(avg(Profit)) desc) as Rank_
from data
group by Segment
order by Avg_Profit desc;



#=====================================================
         # 5. CUSTOMER ANALYSIS
#=====================================================



select 
count(*) as Total_Customers_order_count,
count(distinct(Customer_Name)) as Unique_customer_Count
from data;

select Customer_Name,
count(Quantity) as Total_Quantity,
round(sum(Profit)) as Total_Profit
from data
group by Customer_Name
order by Total_Profit desc
limit 10;

select Customer_Name,
count(Quantity) as Total_Quantity,
round(sum(Sales)) as Total_Sales
from data
group by Customer_Name
order by Total_Sales desc
limit 10;

select Customer_Name,
count(Quantity) as Total_Quantity_order
from data
group by Customer_Name
order by Total_Quantity_order desc;

select 
Customer_Name,
avg(Sales) as Avg_sales
from data
group by Customer_Name
having Avg_sales > (select avg(Sales) from data)
order by Avg_Sales desc;

select Customer_Name,
sum(Profit) as Total_profit
from data
group by Customer_Name , Profit
having sum(Profit) < 0
order by Total_profit ;

select Segment,
sum(Sales) as Total_Sales
from data
group by Segment
order by Total_Sales desc;

select Segment,
round(sum(Profit)) as Total_Profit
from data
group by Segment
order by Total_Profit desc;



#=====================================================
         # 6. GEOGRAPHICAL ANALYSIS
#=====================================================



select Country,
sum(Sales) as Total_sales
from data
group by Country
order by Total_sales desc;

select Country,
round(sum(Profit)) as Total_Profit
from data
group by Country
order by Total_Profit desc;

select Country,
sum(Sales) as Total_sales , rank() over ( order by sum(Sales) desc) as Rank_
from data
group by Country
order by Total_sales desc
limit 10;

select Country,
round(sum(Profit)) as Total_Profit , rank() over ( order by round(sum(Profit)) desc) as Rank_
from data
group by Country
order by Total_Profit desc 
limit 10;

select State,
sum(Sales) as Total_sales
from data
group by State
order by Total_sales desc;

select State,
round(sum(Profit)) as Total_Profit
from data
group by State
order by Total_Profit desc;

select City,
sum(Sales) as Total_sales
from data
group by City
order by Total_sales desc
limit 10;

select City,
round(sum(Profit)) as Total_Profit
from data
group by City
order by Total_Profit desc
limit 10;



#=====================================================
         # 7. DISCOUNT ANALYSIS
#=====================================================



select avg(Discount) as Avg_Discount
from data;

select Category,
round(avg(Discount),5) as Avg_Discount
from data
group by Category
order by Avg_Discount desc;

select Sub_Category,
round(avg(Discount),5) as Avg_Discount
from data
group by Sub_Category
order by Avg_Discount desc;

select Product_Name,
round(avg(Discount),5) as Avg_Discount
from data
group by Product_Name
order by Avg_Discount desc
limit 5;

select Product_Name,
round(avg(Discount),5) as Avg_Discount
from data
group by Product_Name
having Avg(Discount) > (select avg(Discount) from data)
order by Avg_Discount desc;

select sum(Profit) as total_profit
from data
where Discount > ( select avg(Discount) from data);

SELECT ROUND(Discount,1) AS Discount_Bucket,
round(SUM(Profit)) AS Total_Profit
FROM data
GROUP BY Discount_Bucket
ORDER BY Discount_Bucket;



#=====================================================
         # 8. TIME-BASED ANALYSIS
#=====================================================



select Year,sum(Sales)
from data
group by Year;

select Year,round(sum(Profit))
from data
group by Year;

select Year,sum(Quantity) as Total_Quantity
from data
group by Year;

select Year,sum(Sales) as Highest_sales
from data
group by Year
order by Highest_sales desc
limit 1;

select Year,round(sum(Profit)) as Highest_profit
from data
group by Year
order by Highest_Profit desc
limit 1;


#=====================================================
         # 9. CTE & WINDOW FUNCTIONS
#=====================================================


select Category,
sum(Sales) as Total_sales , rank() over ( order by sum(Sales) desc ) Rank_
from data
group by Category;

select Sub_Category,
round(sum(Profit)) as Total_Profit , rank() over ( order by round(sum(Profit)) desc ) Rank_
from data
group by Sub_Category;

select Customer_Name,
sum(Sales) as Total_sales , rank() over ( order by sum(Sales) desc ) Rank_
from data
group by Customer_Name
limit 10;

select Country,
round(sum(Profit)) as Total_profit , rank() over ( order by round(sum(Profit)) desc ) Rank_
from data
group by Country
limit 10;

select Product_Name , 
sum(Sales) as Total_sales , row_number() over ( order by sum(Sales) desc) Row_number_
from data
group by Product_Name
order by Total_sales desc ;

select Market , 
round(sum(Profit)) as Total_profit , rank() over ( order by sum(Profit) desc) as Rank_
from data
group by Market
order by Total_profit desc ;



#=====================================================
         # 10. HAVING ANALYSIS
#=====================================================



select Category,sum(Sales) as Total_sales
from data
group by Category
having sum(Sales) > 4000000;

select Sub_Category,round(sum(Profit)) as Total_Profit
from data
group by Sub_Category
having sum(Profit) > 100000
order by Total_Profit desc;

select Country,sum(Quantity) as Total_order
from data
group by Country
having sum(Quantity) > 5000
order by Total_order desc;

select Customer_Name,sum(Sales) as Total_sales
from data
group by Customer_Name
having sum(Sales) > 10000
order by Customer_Name desc;

select Market,round(sum(Profit)) as Total_Profit
from data
group by Market
having sum(Profit) > 100000
order by Total_Profit desc;

select City,sum(Quantity) as Total_order
from data
group by City
having sum(Quantity) > 1000
order by Total_order desc;



#=====================================================
         # 11. VIEWS
#=====================================================



create view customer_information as
select
Customer_ID,
Customer_Name
from data;

create view product_information as
select
Customer_ID,
Category,
Sub_Category,
Segment,
Order_Priority,
Product_ID,
Quantity,
Product_Name
from data;

create view order_information as
select
Customer_ID,
Product_ID,
Order_Date,
Order_ID,
Row_ID,
Order_Priority,
Ship_Mode,
Ship_Date
from data;

create view Sales_and_Profit_information as
select
Customer_ID,
Profit,
Sales,
Discount,
Shipping_Cost
from data;

create view geographical_information as
select
Customer_ID,
Country,
State,
City,
Market,
Market2,
Region
from data;


#=====================================================
         # 12. JOINS
#=====================================================



select
a.Customer_ID,
Customer_Name,
Country,
State,
City,
Segment,
Category,
Sub_Category,
Product_Name,
Quantity,
b.Order_Priority,
Ship_Mode,
Shipping_Cost,
Sales,
Discount,
Profit
from customer_information as a
join product_information as b on
	a.Customer_ID = b.Customer_ID
join order_information as c on
	a.Customer_ID = c.Customer_ID
join Sales_and_Profit_information as d on
	a.Customer_ID = d.Customer_ID
join geographical_information as e on
	a.Customer_ID = e.Customer_ID;



#=====================================================
         # 13. Business Insights
#=====================================================



-Strong sales growth.
-Technology leads profitability.
-Tables are loss-making.
-Regional profitability varies sharply. 
-Segment wise Consumers  leads.
-Profit growth and Sales growth are increasing.
-Improve Southeast Asia profitability. 
-Focus on Canada.
-Focus more on Furniture and office supplies. 
-Focus more on Top customers.
