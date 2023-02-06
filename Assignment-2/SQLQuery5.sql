create database database4
create table salesman
(
salesman_id int not null primary key,
name nvarchar(40) not null,
city nvarchar(40) not null,
commission decimal(10,4) not null
)

insert into salesman values
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12)
select * from salesman

create table customer 
(
customer_id  int not null primary key,
cust_name nvarchar(40) not null,
city nvarchar(40) not null,
grade int  null,
salesman_id  int not null foreign key references salesman(salesman_id)
)


insert into customer values
(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green',' London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'Brad Guzan','London',null,5005)
select * from customer

create table orders 
(ord_no int not null primary key,
purch_amt float not null,
ord_date date not null,
customer_id int not null foreign key references customer(customer_id),
salesman_id int not null foreign key references salesman(salesman_id)
)
insert into orders values 
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.6 ,'2012-04-25',3002,5001)
select * from orders
//**1**//
select salesman.name , customer.cust_name ,customer.city, salesman.city
from salesman join customer
on salesman.city = customer.city
//**2**//
select orders.ord_no, orders.purch_amt,customer.cust_name,customer.city
from orders,customer
where customer.customer_id=orders.customer_id and  purch_amt between 500 and 2000
//**3**//
select customer.cust_name,customer.city,salesman.city,salesman.name,salesman.commission
from customer inner join salesman
on customer.salesman_id=salesman.salesman_id
//**4**//
select customer.cust_name,customer.city,salesman.name,salesman.commission
from customer inner join salesman
on  salesman.salesman_id=customer.salesman_id
where salesman.commission>0.12

/** 5**//
select customer.cust_name,customer.city,salesman.name,salesman.city,salesman.commission
from customer inner join salesman
on  salesman.salesman_id=customer.salesman_id
where customer.city<>salesman.city and salesman.commission>0.12

//**6**//
select orders.ord_no,orders.ord_date,orders.purch_amt,customer.cust_name,customer.grade,salesman.name,.salesman.commission
from orders join customer on orders.customer_id=customer.customer_id
           join salesman on orders.salesman_id=salesman.salesman_id



//**7**//


select customer.customer_id,customer.cust_name,customer.city as[Custermer city ],customer.grade,salesman.salesman_id,salesman.name as [salesman name],salesman.city as [salesman city],salesman.commission,orders.ord_no,orders.ord_date,orders.purch_amt
from orders  inner join customer on orders.customer_id=customer.customer_id 
inner join  salesman on orders.salesman_id=salesman.salesman_id

 

//**8**//
select customer.cust_name,customer.city,customer.grade,.salesman.name,.salesman.city
from customer join salesman
on customer.salesman_id=salesman.salesman_id
order by customer.customer_id  

//**9**//
select customer.cust_name,customer.city,customer.grade,.salesman.name,.salesman.city
from customer join salesman
on customer.salesman_id=salesman.salesman_id
where customer.grade<300 order by customer.customer_id


//**10**//
select customer.cust_name,customer.city,orders.ord_no,orders.ord_date,orders.purch_amt
from customer join orders
on customer.customer_id=orders.customer_id
order by orders.ord_date

//**11**//
select customer.cust_name,customer.city,orders.ord_no,orders.ord_date,orders.purch_amt,salesman.name as[salesman name],salesman.commission
from customer join orders on customer.customer_id=orders.customer_id join salesman on customer.salesman_id=salesman.salesman_id


//**12*//
SELECT salesman.name AS "Salesman" 
FROM customer  
RIGHT OUTER JOIN salesman  
ON salesman.salesman_id=customer.salesman_id 
ORDER BY salesman.salesman_id 

//**13**//

select salesman.name as[salesman name] ,customer.cust_name,customer.city as[customer city], customer.grade,orders.ord_no,orders.ord_date,orders.purch_amt
FROM customer  
RIGHT OUTER JOIN salesman  
ON salesman.salesman_id=customer.salesman_id 
RIGHT OUTER JOIN orders  
ON orders.customer_id=customer.customer_id

//**14**//

SELECT customer.cust_name,customer.city as[customer city] ,customer.grade, 
salesman.name AS "Salesman", 
orders.ord_no, orders.ord_date, orders.purch_amt 
FROM customer  
RIGHT OUTER JOIN salesman  
ON salesman.salesman_id=customer.salesman_id 
LEFT OUTER JOIN orders  
ON orders.customer_id=customer.customer_id 
WHERE orders.purch_amt>=2000 
AND customer.grade IS NOT NULL

//**15**//
SELECT customer.cust_name,customer.city as[customer city],customer.grade, 
salesman.name AS "Salesman", 
orders.ord_no, orders.ord_date, orders.purch_amt 
FROM customer  
RIGHT OUTER JOIN salesman  
ON salesman.salesman_id=customer.salesman_id 
LEFT OUTER JOIN orders  
ON orders.customer_id=customer.customer_id 
WHERE orders.purch_amt>=2000 
AND customer.grade IS NOT NULL


//**16**//
SELECT customer.cust_name,customer.city as [customer city], orders.ord_no,
orders.ord_date,orders.purch_amt AS "Order Amount" 
FROM customer  
FULL OUTER JOIN orders  
ON customer.customer_id=orders.customer_id 
WHERE customer.grade IS NOT NULL

//**17**//
SELECT * 
FROM salesman a 
CROSS JOIN customer b

//**18**//
SELECT * 
FROM salesman  
CROSS JOIN customer  
WHERE salesman.city=customer.city

//**19**//


SELECT * 
FROM salesman  
CROSS JOIN  customer 
WHERE salesman.city IS NOT NULL 
AND customer.grade IS NOT NULL

//**20**//
SELECT * 
FROM salesman  
CROSS JOIN customer  
WHERE salesman.city IS NOT NULL 
AND customer.grade IS NOT NULL 
AND  salesman.city<>customer.city
