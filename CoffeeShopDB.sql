//CREATING THE TABLES

/* Creates the "COFFEE_SHOP" table*/
CREATE TABLE `COFFEE_SHOP` (
 `shop_id` int unsigned,
 `shop_name` varchar(50),
 `city` varchar(50),
 `state` char(2),
 PRIMARY KEY (`shop_id`)
 );
 
 
/* Creates the "EMPLOYEE" table*/
CREATE TABLE `EMPLOYEE`(
 `employee_id` int unsigned,
 `first_name` varchar(30),
 `last_name` varchar(30),
 `hire_date` date,
 `job_title` varchar(30),
 `shop_id` int unsigned,
 PRIMARY KEY (`employee_id`),
 FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP(shop_id)
 );
 
/* Creates the "SUPPLIER" table */
CREATE TABLE `SUPPLIER`(
 `supplier_id` int unsigned,
 `company_name` varchar(50),
 `country` varchar(30),
 `sales_contact_name` varchar(60),
 `email` varchar(50) NOT NULL,
 PRIMARY KEY (`supplier_id`)
 );
 
/* Creates the "COFFEE" table */  
CREATE TABLE `COFFEE`(
 `coffee_id` int unsigned,
 `shop_id` int unsigned,
 `supplier_id` int unsigned,
 `coffee_name` varchar(30),
 `price_per_pound` NUMERIC(5,2) signed,
 PRIMARY KEY (`coffee_id`),
 FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP(shop_id),
 FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id)
 );


// INSERTING INFROMATION INTO THE TABLES

/* Adds Rows into the COFFEE_SHOP table */
INSERT INTO `COFFEE_SHOP` (`shop_id`,`shop_name`,`city`,`state`) 
VALUES
('1', 'Jaunty Coffee Co.', 'Seattle', 'WA'),
('2', 'Jaunty Coffee Co.', 'Bellevue', 'WA'),
('3', 'Jaunty Coffee Co.', 'Redmond', 'WA');
 
 
/* Adds rows to the EMPLOYEE table */
INSERT INTO `EMPLOYEE`(`employee_id`,`first_name`,`last_name`,`hire_date`,`job_title`,`shop_id`) 
VALUES
('1', 'Paige', 'Turner', '2023-01-17', 'Coffee Drinker', '1'),
('2', 'Kay', 'Keurig', '2023-01-17', 'Coffee Maker', '2'),
('3', 'May', 'McCoffee', '2023-01-17', 'Coffee Quality Assurance', '3');
 
/* Adds rows to the SUPPLIER table */
INSERT INTO `SUPPLIER` (`supplier_id`, `company_name`, `country`, `sales_contact_name`, `email`) 
VALUES
('1', 'Energy Bean Packing Co.', 'United States', 'Joe Brewman', 'Joe.Brewman@energybeanpc.com'),     
('2', 'Caffeinated Caravan', 'United States', 'Buzz Grande', 'Buzz.Grande@caffinatedcaravan.com'),
('3', 'Macchiato Mercantile', 'Canada', 'Phil McCup', 'Phil.McCup@macchiato.mercantile.com');
 
/* Adds rows to the COFFEE table */
INSERT INTO `COFFEE` (`coffee_id`, `shop_id`, `supplier_id`, `coffee_name`, `price_per_pound`) 
VALUES
('1', '1', '1', 'Java Jolt', '1.75'),
('2', '2', '2', 'Road Trip Roast', '1.66'),
('3', '3', '3', 'Merchants Delight', '1.27');

//CREATING A VIEW

/* Creates view of the ‘employee’ table and outputs the full name in one column */  
CREATE VIEW employeeInfo 
AS SELECT employee_id, concat_ws(' ', first_name, last_name) AS employee_full_name, hire_date, job_title, shop_id 
FROM EMPLOYEE; 

// CREATING AN INDEX
/* creates index of the coffee table */ 
CREATE INDEX coffee_name 
ON COFFEE (coffee_name); 


//JOIN QUERY OUTPUTTING INFORMATION FROM MUTIPLE TABLES
/*Join query*/ 
Select employee.first_name, employee.last_name, coffee_shop.shop_name, coffee.coffee_name 
from employee 
join coffee_shop 
on EMPLOYEE.employee_id = COFFEE_SHOP.shop_id 
join coffee 
on EMPLOYEE.employee_id = COFFEE.coffee_id; 
