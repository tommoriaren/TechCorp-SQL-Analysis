show databases;
create database techcorp;
use techcorp;

show tables from techcorp;

create table Products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50), 
    price DECIMAL(10,2),
    stock_quantity INT
    );
select * from products;
alter table Products add column discount decimal(5,2) DEFAULT 0;

create table customer (
		customer_id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(100) UNIQUE,
        phone VARCHAR(20),
        address TEXT(200)
        );
SELECT * FROM CUSTOMER;

create table orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT, 
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
    );
select * from orders;

create table orderdetails (
		orderdetails_id INT auto_increment PRIMARY KEY,
        order_id INT,
        product_id INT, 
        quantity INT,
        unit_price decimal(10,2),
        FOREIGN KEY (order_id) REFERENCES Orders(order_id),
        FOREIGN KEY (product_id) references products(product_id)
        );
select * from orderdetails;

create table employees (
			employee_id int auto_increment PRIMARY KEY,
            first_name varchar(50),
            last_name varchar(50),
            email varchar(100),
            phone varchar(20),
            hire_date date,
            department varchar(50)
            );
select * from employees;

create table supporttickets (
				tiket_id int auto_increment primary key,
                customer_id int, 
                employee_id int,
                issue text,
                status varchar(20),
                created_at datetime,
                resolve_at datetime,
                foreign key (customer_id) references customer(customer_id),
                foreign key (employee_id) references employees(employee_id)
                );
select * from supporttickets;
alter table Supporttickets rename column resolve_at to resolved_at;
alter table supporttickets rename column tiket_id to ticket_id;
		