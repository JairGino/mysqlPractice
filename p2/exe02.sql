CREATE DATABASE db_pizzaria;
USE db_pizzaria;

CREATE TABLE tb_category(
	id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE tb_pizza(
	id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  ingredients TEXT,
  price DECIMAL(8,2) NOT NULL,
  availability BOOLEAN,
  category_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES tb_category (id)
);

INSERT INTO tb_category (name, description)
VALUES
    ('Tradicional', 'Sabores clássicos de pizza, como Margherita e Pepperoni.'),
    ('Especial', 'Criações únicas e especiais de pizza.'),
    ('Sobremesas', 'Pizzas doces para amantes de sobremesas.'),
    ('Vegetariana', 'Opções de pizza vegetariana.'),
    ('Frutos do Mar', 'Pizzas com deliciosos ingredientes de frutos do mar.');

INSERT INTO tb_pizza (name, ingredients, price, availability, category_id)
VALUES
    ('Margherita', 'Molho de tomate, queijo mussarela, manjericão fresco', 29.99, true, 1), 
    ('Calabresa', 'Molho de tomate, queijo mussarela, calabresa', 32.99, true, 1),  
    ('Brigadeiro', 'Leite condensado, chocolate granulado', 25.99, true, 3),
    ('Vegetariana', 'Molho de tomate, queijo mussarela, palmito, pimentão, cebola', 31.99, true, 4),
    ('Frutos do Mar', 'Molho branco, queijo mussarela, camarão, lula, mariscos', 45.99, false, 5),
    ('Quatro Queijos', 'Molho de tomate, queijo mussarela, parmesão, gorgonzola, catupiry', 36.99, true, 1),
    ('Chocolate com Morango', 'Chocolate, morangos frescos, açúcar de confeiteiro', 27.99, true, 3),
    ('Marguerita Especial', 'Molho de tomate, mussarela de búfala, manjericão fresco', 39.99, true, 2),
    ('Pizza de Frutos do Mar Premium', 'Molho branco, queijo mussarela, camarão gigante, lagosta, vieiras, caviar', 79.99, true, 5); 
    
SELECT * FROM tb_pizza
WHERE price > 45.00;
    
SELECT * FROM tb_pizza
WHERE price BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizza
WHERE name LIKE "M%";

SELECT * 
FROM tb_pizza INNER JOIN tb_category
ON (tb_pizza.category_id = tb_category.id);


SELECT * 
FROM tb_pizza INNER JOIN tb_category
ON (tb_pizza.category_id = tb_category.id)
WHERE tb_category.name LIKE "Tradicional";

-- ----------------------------------------
DELETE FROM tb_pizza;

SELECT * FROM tb_pizza;