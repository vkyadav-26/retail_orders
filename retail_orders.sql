create table df_orders(
	[order_id] int primary key,
	[order_date] date,
	[ship_mode] varchar(20),
	[segment] varchar(20),
	[country] varchar(20),
	[city] varchar(20),
	[state] varchar(20),
	[postal_code] varchar(20),
	[region] varchar(20),
	[category] varchar(20),
	[sub_category] varchar(20),
	[product_id] varchar(50),
	[quantity] int,
	[discount] decimal(7,2),
	[sale_price] decimal(7,2),
	[profit] decimal(7,2)
	)


-- run this code in python notebook  df.to_sql('df_orders',con=conn, index=False,if_exists='append') 

select * from df_orders

-- what is the top 10 highest revenue generating products

SELECT TOP 10
    product_id, 
    SUM(sale_price) AS Rev_generated
FROM 
    df_orders
GROUP BY 
    product_id 
ORDER BY 
    Rev_generated DESC;


-- what is the top 5 highest selling product in each region
select * from df_orders;

with cte as
(SELECT
	region, 
	product_id, 
	SUM(quantity) as qty
FROM
	df_orders
GROUP BY 
	region,
	product_id)
Select * from
(select 
	*, 
	ROW_NUMBER() over(partition by region order by qty) as rn
from cte) A
where rn<=5


-- find month over month growth comparison from 2022 and 2023 sales ed jan 2022 vs jan 2023
select * from df_orders;

with cte1 as 
(select 
	Year(order_date) as order_year, 
	Month(order_date) as order_month, 
	sum(sale_price) as sales 
from df_orders
group by Year(order_date), MONTH(order_date))
select 
	order_month,
	sum(case when order_year = 2022 then sales else 0 end) as sales_2022,
	sum(case when order_year = 2023 then sales else 0 end) as sales_2023
from cte1
group by order_month
order by order_month

-- For each category, which month had the highest sales
with cte as
(select
	FORMAT(order_date,'yyyyMM') as Year_month,
	category, 
	SUM(sale_price) as sales
from
	df_orders
group by
	FORMAT(order_date,'yyyyMM'),category)
select * from
(select 
	*, 
	ROW_NUMBER() over(partition by category order by sales desc) as rn
from cte) A
where rn=1

-- Which subcategory had the highest growth by profit in 2023 compared to 2022
select * from df_orders
select distinct(sub_category) from df_orders;

with cte as
(select sub_category, YEAR(order_date) as order_year, sum(Profit) as profit
from df_orders
group by sub_category, YEAR(order_date))
-- order by sub_category, YEAR(order_date)
select TOP 10 *,
	(profit_2023-profit_2022)*100/profit_2022 as growth from
(select 
	sub_category,
	sum(case when order_year = 2022 then profit else 0 end) as profit_2022,
	sum(case when order_year = 2023 then profit else 0 end) as profit_2023
from cte
group by sub_category) A
order by growth desc;









	

