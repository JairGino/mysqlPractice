CREATE DATABASE db_construction_store;
USE db_construction_store;

CREATE TABLE tb_category(
  id INT AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
  description TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE tb_product(
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(8, 2),
  description TEXT,
  stock_quantity INT NOT NULL,
  category_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES tb_category(id)
);

INSERT INTO tb_category (name, description)
VALUES
  ('Ferramentas', 'Diversas ferramentas para construção e reforma.'),
  ('Material Elétrico', 'Componentes elétricos e eletrônicos.'),
  ('Hidráulica', 'Produtos relacionados a sistemas hidráulicos.'),
  ('Pintura', 'Tintas e acessórios para pintura.'),
  ('Madeira', 'Materiais de madeira para construção.');

INSERT INTO tb_product (name, price, description, stock_quantity, category_id)
VALUES
  ('Martelo', 29.99, 'Martelo de construção resistente.', 50, 1),
  ('Furadeira Elétrica', 189.99, 'Furadeira de alta potência.', 20, 1),
  ('Tubo PVC', 9.99, 'Tubo de PVC para encanamento.', 100, 3),
  ('Tinta Látex', 49.99, 'Tinta látex branca de qualidade.', 30, 4),
  ('Parafuso', 0.50, 'Parafuso de fixação.', 500, 1),
  ('Interruptor Elétrico', 8.99, 'Interruptor para iluminação.', 50, 2),
  ('Verniz', 39.99, 'Verniz para madeira de alta durabilidade.', 15, 5),
  ('Cimento Portland', 22.99, 'Saco de cimento para construção.', 40, 1);


SELECT * FROM tb_product
WHERE price > 100.00;

SELECT * FROM tb_product
WHERE price BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_product
WHERE name LIKE "%c%";

SELECT p.*, c.name AS category_name
FROM tb_product AS p INNER JOIN tb_category AS c
ON (p.category_id = c.id);

SELECT p.*, c.name AS category_name
FROM tb_product AS p INNER JOIN tb_category AS c
ON (p.category_id = c.id)
WHERE c.name LIKE "Ferramentas";
