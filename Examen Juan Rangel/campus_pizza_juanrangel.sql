CREATE DATABASE IF NOT EXISTS campus_pizza;
USE campus_pizza;

CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(100) NOT NULL,
    consumir_en_el_lugar BOOLEAN
);
TRUNCATE TABLE clientes;

INSERT INTO clientes (nombre_cliente, consumir_en_el_lugar)
VALUES
('Juan rangel', FALSE),
('Emily Rodríguez', TRUE),
('Alejandro Sandoval', TRUE);

CREATE TABLE IF NOT EXISTS menu (
	id_comida INT PRIMARY KEY AUTO_INCREMENT,
	nombre_comida VARCHAR(100),
    disponible BOOLEAN
);
TRUNCATE TABLE menu;

INSERT INTO menu (nombre_comida, disponible)
VALUES
('Pizzas', TRUE),
('Panzarottis', FALSE),
('Bebidas', TRUE),
('Postres', FALSE);

CREATE TABLE IF NOT EXISTS pedidos (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    fecha_pedido DATETIME,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

TRUNCATE TABLE pedidos;

CREATE TABLE IF NOT EXISTS pizzas (
	id_pizza INT PRIMARY KEY AUTO_INCREMENT,
    nombre_pizza VARCHAR (100),
    ventas_pizza INT,
    ingredientes VARCHAR(100),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);
TRUNCATE TABLE pizzas;

INSERT INTO pizzas (nombre_pizza, ventas_pizza, ingredientes)
VALUES
('Hawaiana', 50, 'Piña'),
('Pollo champiñon', 80, 'Champiñones'),
('Mexicana', 50, 'Pimenton');

CREATE TABLE IF NOT EXISTS panzarottis (
	id_panzarottis INT PRIMARY KEY AUTO_INCREMENT,
    nombre_panzarottis VARCHAR (100),
    ventas_panzarottis INT,
    ingredientes VARCHAR(100),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);
TRUNCATE TABLE panzarottis;

INSERT INTO panzarottis (nombre_panzarottis, ventas_panzarottis, ingredientes)
VALUES
('Hawaiana', 50, 'Piña'),
('Pollo champiñon', 80, 'Champiñones'),
('Mexicana', 50, 'Pimenton');
