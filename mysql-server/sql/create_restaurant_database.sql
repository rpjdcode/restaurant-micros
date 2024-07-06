CREATE DATABASE IF NOT EXISTS restaurantdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE restaurantdb;

-- BEGIN ESTRUCTURA DE BASE DE DATOS

-- Tipos de producto
CREATE TABLE product_types(
	id INT(11) AUTO_INCREMENT NOT NULL,
	name VARCHAR(100) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT NULL,
	CONSTRAINT pk_product_types PRIMARY KEY(id),
	CONSTRAINT uq_product_types UNIQUE(name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Productos
CREATE TABLE products(
	id INT(11) AUTO_INCREMENT NOT NULL,
	name VARCHAR(80) NOT NULL,
	product_type INT(11) NOT NULL,
	price DECIMAL(6,2) NOT NULL,
	active TINYINT(1) NOT NULL DEFAULT 0,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT NULL,
	CONSTRAINT pk_products PRIMARY KEY(id),
	CONSTRAINT uq_products_name UNIQUE(name),
	CONSTRAINT fk_products_types FOREIGN KEY(product_type) REFERENCES product_types(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Comandas/Órdenes
CREATE TABLE orders(
	id INT(11) NOT NULL,
	paid TINYINT(1) NOT NULL DEFAULT 0,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT NULL,
	CONSTRAINT pk_orders PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Productos encontrados en cada comanda/orden
CREATE TABLE products_orders(
	product_id INT(11) NOT NULL,
	order_id INT(11) NOT NULL,
	quantity INT(5) NOT NULL,
	CONSTRAINT pk_po PRIMARY KEY(product_id, order_id),
	CONSTRAINT fk_po_product FOREIGN KEY(product_id) REFERENCES products(id),
	CONSTRAINT fk_po_order FOREIGN KEY(order_id) REFERENCES orders(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Pago de comandas/órdenes
CREATE TABLE orders_payment(
	order_id INT(11) NOT NULL,
	amount DECIMAL(6,2) NOT NULL,
	payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	payment_type ENUM('PAYPAL', 'BIZUM', 'CARD', 'CASH') DEFAULT 'CASH',
	CONSTRAINT fk_orderpayment_order FOREIGN KEY(order_id) REFERENCES orders(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- END ESTRUCTURA DE BASE DE DATOS

-- BEGIN INSERCIONES

INSERT INTO product_types(id, name) VALUES
(1, 'Dessert'),
(2, 'Seafood'),
(3, 'Veggie'),
(4, 'Fruit'),
(5, 'Drink'),
(6, 'Starter'),
(7, 'Sandwich'),
(8, 'Entrée');

INSERT INTO products (id, name, product_type, price, active) VALUES
(1, 'Chocolate Cake', 1, 4.50, 1),
(2, 'Ice Cream', 1, 3.00, 1),
(3, 'Grilled Salmon', 2, 12.00, 1),
(4, 'Shrimp Cocktail', 2, 8.50, 1),
(5, 'Veggie Burger', 3, 6.00, 1),
(6, 'Caesar Salad', 3, 5.50, 1),
(7, 'Apple', 4, 1.00, 1),
(8, 'Orange', 4, 1.00, 1),
(9, 'Cola', 5, 1.50, 1),
(10, 'Water', 5, 1.00, 1),
(11, 'French Fries', 6, 2.50, 1),
(12, 'Spring Rolls', 6, 4.00, 1),
(13, 'Ham Sandwich', 7, 3.50, 1),
(14, 'Chicken Sandwich', 7, 4.00, 1),
(15, 'Steak', 8, 15.00, 1),
(16, 'Pasta', 8, 10.00, 1);

INSERT INTO orders (id, paid) VALUES
(1, 0),
(2, 1),
(3, 0),
(4, 1);

INSERT INTO products_orders (product_id, order_id, quantity) VALUES
(1, 1, 2),
(5, 1, 1),
(9, 1, 3),
(3, 2, 1),
(11, 2, 2),
(8, 2, 1),
(2, 3, 1),
(10, 3, 2),
(15, 4, 1),
(12, 4, 1);

INSERT INTO orders_payment (order_id, amount, payment_type) VALUES
(2, 30.00, 'CARD'),
(4, 20.00, 'PAYPAL');

-- END INSERCIONES