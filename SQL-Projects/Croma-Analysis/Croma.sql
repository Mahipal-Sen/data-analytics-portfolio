create database Croma;
use Croma;

select * from manufactures ;
select * from product_inventory ;
# 1.Select the names of all the products in the inventory.

select product_name from product_inventory ;

# 2.Select the names and the prices of all the products in the inventory.

select product_name, product_price  from product_inventory ;

# 3.Use an Alias "Name" and print all the product names

select product_name Name from product_inventory ;

# 4.Select the name of the products with a price less than or equal to 8000 Indian Rupees.

select product_name from product_inventory where product_price <=8000;

# 5.Select all the products with a price between 2000 and 10000 Indian Rupees.

select *  from product_inventory where product_price between 2000 and 10000;

# 6.List the details of all such products whose manufacturer_code is 6.

select * from product_inventory where manufacturer_code=6;

# 7.List the details of all such products whose manufacturer_code is 6 as well as their price is greater than 5000.

select * from product_inventory where manufacturer_code=6 and product_price >5000;

# 8.List the details of all such products other than whose manufacturer_code is 6.

select * from product_inventory where  manufacturer_code!=6;

# 9.Select the name of the products whose name starts with 'M'.

select product_name  from product_inventory where product_name  like 'm%';

# 10.List the name of products whose name starts with "M" and ends with "D".

select product_name  from product_inventory where product_name  like 'm%' and product_name like '%d';

# 11.List the name of products which starts from "M" ends with "D" but also has ONLY 9 characters in between.

select product_name  from product_inventory where product_name  like 'm_________d';

# 12.Concatenate name of the product with its price in a single column.


select concat(product_name,' ',Product_price) from product_inventory ;
# 13.Select the name and price in dollars (i.e. the price must be divided by 80.)


select product_name , product_price/80 Price_in_Dollars from product_inventory ;
# 14.Compute the average price of all the products in Indian Rupees.

select avg(product_price) from product_inventory ;

# 15.Compute the average price of all products with manufacturer code equal to 3.

select avg(product_price),manufacturer_code  from product_inventory where manufacturer_code=3 ;


# 16.What is the total cost of products where manufacturer_code is 2?

select sum(product_price),manufacturer_code  from product_inventory where manufacturer_code=2 ;


# 17.Compute the number of products with a price greater than or equal to 5000.

select count(product_name) from product_inventory where product_price >=5000;

# 18.Select the name and price of all products with a price larger than or equal to 5000 Indian Rupees and sort them by price (in descending order), and then by their name (in ascending order).

select product_name, product_price  from product_inventory 
where product_price >=5000
order by product_price desc, product_name asc;


# 19.Select all the data from the inventory, including all the data for each product's manufacturer.

select * from product_inventory t 
join manufactures m 
on t.manufacturer_code = m.manufacturer_code ;


# 20.Select the product name, price, and manufacturer name of all the products.

select t.product_name ,t.product_price ,m.manufacturer_name  from product_inventory t 
join manufactures m 
on t.manufacturer_code = m.manufacturer_code ;

# 21.Select the average price of each manufacturer's products, showing only the manufacturer's code.


select avg(product_price ),manufacturer_code from product_inventory  
group by manufacturer_code;

# 22.Select the average price of each manufacturer's products, showing the manufacturer's name.

select avg(t.product_price ),t.manufacturer_code,m.manufacturer_name  from product_inventory t
join manufactures m 
on m.manufacturer_code = t.manufacturer_code 
group by manufacturer_code,m.manufacturer_name ;

# 23.Select the names of manufacturer whose products have an average price greater than or equal to 5000 Indian Rupees.

select m.manufacturer_name,avg(t.product_price ) as avg_product  from product_inventory t 
inner join manufactures m 
on m.manufacturer_code = t.manufacturer_code 
group by m.manufacturer_name  
having avg(t.product_price) >= 5000
;


# 24.Select the name and price of the cheapest product.

select product_name ,t.product_price  from product_inventory t 
where product_price = 
(
select min(product_price ) from product_inventory 
)
;


select min(product_price ) from product_inventory ;

# 25.Select the name of each manufacturer along with the name and price of its most expensive product

select m.manufacturer_name, t.product_name, t.product_price
from product_inventory t
join manufactures m 
on m.manufacturer_code = t.manufacturer_code
where t.product_price = (
    select max(product_price)
    from product_inventory
    where manufacturer_code = t.manufacturer_code
);



# 26.Add a new product: Speaker with a price 1000 INR and manufacturer code 10.

insert into product_inventory  (product_code, product_name,product_price,manufacturer_code) values  
(21,'speakers',1000,10);

# 27.Update the name of the product "Speakers" to "Wired Speakers".

update product_inventory t set product_name= 'Wired Speakers' where t.product_name ='speakers';

# 28.Apply a 10% discount to all products. 

UPDATE product_inventory t 
SET product_price  = product_price * 0.90;




# 29.Apply a 10% discount to all products with a price greater than or equal to 5000 Indian Rupees.

UPDATE product_inventory t 
SET product_price  = product_price * 0.90 where t.product_price >=5000; 
# 30.List the name of the products along with their manufacturer name and price and arrange them as per their price.

select m.manufacturer_name , t.product_name ,t.product_price  from manufactures m 
join product_inventory t 
on m.manufacturer_code =t.manufacturer_code
order by product_price desc  ;



