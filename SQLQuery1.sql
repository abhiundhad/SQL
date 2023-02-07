create database northwind
use [northwind]
go
create table products
(
productID int not null primary key,
ProductName nvarchar(40) not null,
SupplierID int not null,
CategoryID int not null,
QuantityPerUnit  nvarchar(20) not null,
UnitPrice decimal(10,4) not null,
UnitsInStock smallint not null,
UnitsOnOrder smallint null,
ReorderLevel smallint null,
Discontinued bit
)
insert into products values
(1,'chai',1,1,'10 boxes x 20 bags',18.0000,39,0,10,0),
(2,'Chang',1,1,'24 - 12 oz bottles',19.0000,17,40,25,0),
(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10.0000,13,70,25,0),
(4,'Chef Anton"s Cajun Seasoning',2,2,'48 - 6 oz jars',22.0000,53,0,0,1),
(5,'Chef Anton"s Gumbo Mix',2,2,'36 boxes',21.3500,0,0,0,0),
(6,'Grandma"s Boysenberry Spread',3,2,'12 - 8 oz jars',25.0000,120,0,25,0),
(7,'Uncle Bob"s Organic Dried Pears',3,7,'12 - 1 lb pkgs',30.0000,15,0,10,0),
(8,'Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40.0000,6,0,0,0),
(9,'Mishi Kobe Niku',4,6,'18 - 500 g pkgs.',97.0000,29,0,0,1),
(10,'Ikura',4,8,'12 - 200 ml jars',31.0000,31,0,10,0),
(11,'Queso Cabrales',5,4,'1 kg pkg.',21,22,30,30,0),
(12,'Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38,86,0,0,0),
(13,'konbu',6,8,'2 kg box ',6,24,0,5,0),
(14,'tofu',6,7,'40 - 100 g pkgs.',23.25,35,0,0,0),
(15,'Genen Shouyu ',6,2,'24 - 250 ml bottles',15.5,39,0,5,0)
select * from products
select productID,ProductName,UnitPrice from products where (UnitPrice)<20
select productID,ProductName,UnitPrice from products where (UnitPrice)>15 and (UnitPrice)<25
select ProductName,UnitPrice from products where (UnitPrice)>(select avg(UnitPrice) from products)

select top 10 ProductName,UnitPrice from products order by UnitPrice desc
select Count(ProductName) from products GROUP BY Discontinued;
select ProductName,  UnitsOnOrder , UnitsInStock from products where (((Discontinued)=0) AND ((UnitsInStock)<UnitsOnOrder));











