CREATE DATABASE db_city_of_meat;
USE db_city_of_meat;

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
	('Carnes Bovinas', 'Carnes de boi e novilho'),
  ('Carnes de Frango', 'Carnes de frango e galinha'),
  ('Carnes de Porco', 'Carnes de porco e leitão'),
  ('Carnes de Cordeiro', 'Carnes de cordeiro e carneiro'),
  ('Outras Carnes', 'Outras variedades de carnes');


INSERT INTO tb_product(name, price, description, availability, category_id)
VALUES 
	('Filet Mignon', 60.99, 'Corte nobre de carne bovina 1kg', true, 1),
  ('Peito de Frango', 17.49, 'Peito de frango fresco 1kg', true, 2),
  ('Costeleta de Porco', 40.99, 'Costeletas de porco temperadas 1kg', true, 3),
  ('Pernil de Cordeiro', 44.99, 'Pernil de cordeiro assado 1kg', true, 4),
  ('Linguiça Toscana', 69.99, 'Linguiça toscana para churrasco 5kg', true, 5),
  ('Alcatra', 21.99, 'Corte de carne bovina para grelhar 1kg', true, 1),
  ('Sobrecoxa de Frango', 14.99, 'Sobrecoxa de frango temperada 1kg', true, 2),
  ('Costelinha de Porco', 30.99, 'Costelinhas de porco ao molho barbecue 1un.', true, 3);

SELECT * FROM tb_product
WHERE price > 50.00;

SELECT * FROM tb_product
WHERE price BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_product
WHERE name LIKE "C%";

SELECT p.*, c.name AS category_name
FROM tb_product AS p INNER JOIN tb_category AS c
ON (p.category_id = c.id);

SELECT p.*, c.name AS category_name
FROM tb_product AS p INNER JOIN tb_category AS c
ON (p.category_id = c.id)
WHERE c.name LIKE "Carnes de Frango";
