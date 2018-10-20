DROP IF EXISTS bamazon;
CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
  item_id INT NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  department_name VARCHAR(50) NULL,
  price DECIMAL(10, 4),
  stock_quantity INT NULL,
  PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("AM4 Backplate", "Electronics", "4.00", "100")

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("Pet Rock", "Toys", "5.00", "10")

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("Gr­ey Hoodie", "Clothing", "20.00", "50")

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("New Book", "Education", "19.99", "36")

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("Red Pen", "Education", "2.00", "500")

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("HDMI Cable, 5ft", "Electronics", "15.00", "20")

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("NVIDIA GeForce GTX 1080ti", "Electronics", "499.99", "5")

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("Meme Hat", "Clothing", "50.00", "90")

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("Crystal Bepis", "Food", "10.00", "20")

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUE ("Black Hoodie", "Clothing", "20.00", "50")

