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

INSERT INTO products
VALUE ("Pet Rock", "Toys", "5.00", "10")

VALUE ("Gr­éy Hoodie", "‡╩↓↔", "NaN", "-0")

