-- create database
use shipping_analysis;

-- SELECT STATEMENT 
select * from shipping_1 Limit10;
select * from shipping_2 limit 20;

-- WHERE CONDITION
select mode_of_shipment from shipping_1
where customer_rating >= 2;

select discount_offered from shipping_2
where gender="F";

-- ORDER BY AND GROUP BY
select mode_of_shipment, gender from shipping_1
where customer_rating
order by customer_care_calls desc
limit 100;

select warehouse_block from shipping_2
where class=1
group by warehouse_block 
limit 25;

-- INNER, LEFT, RIGHT JOINS
select mode_of_shipping,weight_in_gms
from shipping_1
inner join shipping_2 on shipping_1.mode_of_shipping = shipping_2.mode_of_shipping;

select shipping_1.warehouse_block as block_1,
	   shipping_1.customer_care_calls,
	   shipping_2.gender,
       shipping_2.weight_in_gms from shipping_1
left join shipping_2 on shipping_1.warehouse_block = shipping_2.warehouse_block;

-- AGGREGATE FUNCTION
select sum(cost_of_the_product) as Total_cost
from shipping_1;

select avg(weight_in_gms) as Weight_gms
from shipping_2;

-- SUBQUERIES
select *from shipping_1
where cost_of_the_product > (
    select avg(cost_of_the_product) from shipping_1);
    
-- VIEW ANALYSIS
create view mode_shipping as
select warehouse_block, gender from shipping_1;

select * from mode_shipping
order by gender asc;

drop view mode_shipping;

-- INDEX
show indexes from shipping_2;

create index customer_rating_idx on shipping_2(customer_rating);
show indexes from shipping_2;

select * from shipping_2
where customer_rating=3;
















 


