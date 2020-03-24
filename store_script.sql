-- CREATE DATABASE
CREATE DATABASE store;

-- SELECT DATABASE
USE store;

-- CREATE TABLES
   
CREATE TABLE PRODUCTS(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(45) NOT NULL,
    category_id INT NOT NULL,
    product_weight VARCHAR(2),
    stock INT NOT NULL,
    product_price FLOAT NOT NULL
    );

CREATE TABLE PRODUCTS_CATEGORY(
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(45)
    );

CREATE TABLE CUSTOMER(
    dni VARCHAR(8) PRIMARY KEY,
    registration_date DATE NOT NULL,
    sale_id INT NOT NULL
    );

CREATE TABLE CUSTOMER_DETAILS(
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    address VARCHAR(45) NOT NULL,
    city VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    dni VARCHAR(8) NOT NULL,
    
    PRIMARY KEY (customer_id, dni)
    );

CREATE TABLE SALES(
    sale_id INT AUTO_INCREMENT,
    customer_id INT,
    date_sale DATE NOT NULL,
    total FLOAT NOT NULL,
    
    PRIMARY KEY (sale_id, customer_id)
    );
  
CREATE TABLE SALES_DETAILS(
    sale_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    product_price FLOAT NOT NULL,
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
    
-- INSERT

INSERT INTO products_category (type) VALUES ('T-SHIRT');
INSERT INTO products_category (type) VALUES ('SWEATERS');
INSERT INTO products_category (type) VALUES ('DENIM');
INSERT INTO products_category (type) VALUES ('PANTS');
INSERT INTO products_category (type) VALUES ('JACKET');

