 -- create database 
  create database Sales_Project;
  use sales_Project;
  -- Create Table
CREATE TABLE `retail sales analysis` (
    transactions_id INT,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(10),
    quantiy INT,
    price_per_unit INT,
    cogs INT,
    total_sale INT
);
-- insert Data 
drop table sales_table ;
-- using Table data import Wizard
-- see the data 
insert  into `retail sales analysis` (sale_date, customer_id, age) value (01-02-2022, 55, 12), (01-03-2022, 55, 22),(01-04-2022, 65, 11),(01-09-2022, 22, 26);
select count(*) from `retail sales analysis`;

--            Data cleaning
alter table `retail sales analysis` rename column ï»¿transactions_id to transactions_id;
-- Check NULL value
select * from`retail sales analysis` where
transactions_id is null or sale_date is null or
sale_time is null or customer_id is null or gender is null
or age is null or category is null or quantiy is null
or price_per_unit is null or cogs is null or total_sale is null;

-- turn off safe mood 
set sql_safe_updates = 0;
-- delete null value 
delete from `retail sales analysis` where 
transactions_id is null or sale_date is null or
sale_time is null or customer_id is null or gender is null
or age is null or category is null or quantiy is null
or price_per_unit is null or cogs is null or total_sale is null;

select * from `retail sales analysis`;

-- Data Exploration

-- 1. how many sales we have 
select count(total_sale) as no_of_Sales 
from `retail sales analysis`;

-- 2. how many customer we have 
select count(distinct customer_id ) no_of_customer 
from `retail sales analysis`;

-- 3 write a sql query to retrieve all column for sales made on 2022-11-25
select * from `retail sales analysis` 
where sale_date = '2022-11-25';

-- 4. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of nov-2022
select * from `retail sales analysis` 
where category = 'Clothing' and quantiy >3 and sale_date like '2022-11%' ;

-- 5. Write a SQL query to calculate the total sales (total sale) for each category.
select category,sum(total_sale) as total_sales 
from`retail sales analysis` group by 1 with rollup;

-- 6. Write a SQL query to find all transactions where the total sale is greater than 1800.
select * from `retail sales analysis` where total_sale > 1800 ;

-- 7.  Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
 select gender,count(transactions_id) no_of_transaction 
 from `retail sales analysis` group by 1 with rollup ;                                  
 
 -- 8.  Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
 select * from 
 (
	select Extract(month from sale_date) as month ,
			Extract(year from sale_date) as year, 
			round(avg(total_sale),2)as avg_sales,
            rank() over(partition by 
			Extract(year from sale_date) order by avg(total_sale) desc) as 'rank_no' 
	from `retail sales analysis` group by 1,2 
 )   as table1
	where rank_no = 1 ;
  
-- 9. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(age),0) as customer_avg_age 
from `retail sales analysis` where category = "Beauty" ;

-- 10. Write a SQL query to find the top 5 customers based on the highest total sales.
select customer_id,total_sale 
from `retail sales analysis` order by total_sale desc limit 5 ;

-- 11.  Write a SQL query to find the number of unique customers who purchased items from each category.
select category,count(distinct customer_id) no_of_unique_customer  
from `retail sales analysis` group by 1;

-- 12. Write a SQL query to create each shift and number of orders (Example morning <12, Afternoon Between 12 & 17, Evening >17)
with shift_wise_sales as 
(
	select * , 
		case
			when extract(hour from  sale_time) 	<12 then "Morning"
			when extract(hour from  sale_time) between 12 and  17 then  "Afternoon"
			else "Evening"
		end  as shift 
		from `retail sales analysis`
    )
    select shift , 
    count(transactions_id) as no_of_order from shift_wise_sales
    group by shift  ;
    
    





