-- CREATE DATABASE
CREATE DATABASE store;

-- SELECT DATABASE
USE store;

-- CREATE SEQUENCE
/* Creamos la secuencia para poder insertar datos de valores auto incrementables*/

CREATE SEQUENCE id_increment
INCREMENT BY 1 
START WITH 1 
MAXVALUE 99999 
MINVALUE 1;

-- CREATE TABLES
   
CREATE TABLE PRODUCTS(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(45) NOT NULL,
    category_id INT NOT NULL,
    product_weight VARCHAR(2),
    stock INT NOT NULL,
    product_price NUMBER(*,2) NOT NULL
    );

CREATE TABLE PRODUCTS_CATEGORY(
    category_id INT PRIMARY KEY,
    type VARCHAR(45)
    );

CREATE TABLE CUSTOMER(
    dni VARCHAR(8) PRIMARY KEY,
    registration_date DATE NOT NULL,
    sale_id INT NOT NULL
    );

CREATE TABLE CUSTOMER_DETAILS(
    customer_id INT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    address VARCHAR(45) NOT NULL,
    city VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    dni VARCHAR(8) NOT NULL,
    
    PRIMARY KEY (customer_id, dni)
    );

CREATE TABLE SALES(
    sale_id INT,
    customer_id INT,
    date_sale DATE NOT NULL,
    total NUMBER(*,2) NOT NULL,
    
    PRIMARY KEY (sale_id, customer_id)
    );
  
CREATE TABLE SALES_DETAILS(
    sale_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    product_price NUMBER(*,2) NOT NULL,
    quantity INT NOT NULL
    ); 

-- FOREIGN KEYS

ALTER TABLE products
ADD CONSTRAINT FK_products_categoryid
    FOREIGN KEY (category_id)
    REFERENCES products_category (category_id);
    
ALTER TABLE customer_details
ADD CONSTRAINT FK_customerdetails_dni
    FOREIGN KEY (dni)
    REFERENCES customer (dni);

ALTER TABLE sales
ADD CONSTRAINT FK_salesdetails_saleid
    FOREIGN KEY (sale_id)
    REFERENCES sales_details (sale_id);
    
ALTER TABLE sales_details
ADD CONSTRAINT FK_salesdetails_productid
    FOREIGN KEY (product_id)
    REFERENCES products (product_id);
