CREATE DATABASE db_wellness_pharmacy;
USE db_wellness_pharmacy;

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
  availability BOOLEAN,
  category_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES tb_category(id)
);


INSERT INTO tb_category(name, description)
VALUES 
	('Medicamentos', 'Categoria de produtos relacionados a medicamentos.'),
  ('Cuidados com a Pele', 'Produtos para cuidados com a pele e beleza.'),
  ('Vitaminas e Suplementos', 'Suplementos vitamínicos e minerais.'),
  ('Higiene Pessoal', 'Produtos de higiene pessoal e cuidados diários.'),
  ('Bebês e Crianças', 'Produtos para bebês e crianças.');


INSERT INTO tb_product(name, price, description, availability, category_id)
VALUES 
	('Aspirina', 10.99, 'Analgésico e antitérmico', true, 1), 
  ('Creme Hidratante', 17.99, 'Para hidratação da pele', true, 2),
  ('Vitamina C', 13.49, 'Suplemento de vitamina C', true, 3), 
  ('Sabonete', 6.99, 'Sabonete em barra', true, 4),
  ('Fralda Descartável', 20.99, 'Fralda para bebês', true, 5), 
  ('Protetor Solar FPS 30', 14.99, 'Protetor solar para pele', true, 2),
  ('Multivitamínico Infantil', 17.49, 'Suplemento vitamínico para crianças', true, 5),
  ('Shampoo Anticaspa', 11.99, 'Shampoo para tratamento de caspa', true, 4);

SELECT * FROM tb_product
WHERE price > 50.00;

SELECT * FROM tb_product
WHERE price BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_product
WHERE name LIKE "C%";

SELECT p.*, c.name AS category_name
FROM tb_product AS p INNER JOIN tb_category AS c
ON (p.category_id = c.id);

SELECT p.*, c.name AS category_name
FROM tb_product AS p INNER JOIN tb_category AS c
ON (p.category_id = c.id)
WHERE c.name LIKE "Medicamentos";
