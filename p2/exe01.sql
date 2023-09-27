CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classe(
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE tb_character(
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  level INT,
  defense_power INT,
  attack_power INT,
  class_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (class_id) REFERENCES tb_classe(id)
 );
 
INSERT INTO tb_classe (name, description)
VALUES
    ('Guerreiro', 'Uma classe de personagem forte e focada em combate corpo a corpo.'),
    ('Mago', 'Uma classe de personagem lançador de feitiços especializado em magia.'),
    ('Ladrão', 'Uma classe de personagem furtiva e ágil com habilidades de stealth.'),
    ('Arqueiro', 'Uma classe de personagem de ataque à distância que usa arcos e flechas.'),
    ('Sacerdote', 'Uma classe de personagem curandeiro com poderes divinos.');


INSERT INTO tb_character (name, level, defense_power, attack_power, class_id)
VALUES
    ('personagem 1', 30, 1000, 200, 1),
    ('personagem 2', 40, 800, 1000, 2),
    ('personagem 3', 25, 800, 300, 4),
    ('personagem 4', 10, 400, 100, 3),
    ('personagem 5', 28, 1200, 100, 1),
    ('personagem 6', 18, 500, 200, 3),
    ('personagem 7', 35, 1200, 800, 5),
    ('personagem 8', 50, 5000, 5000, 2);

SELECT *
FROM tb_character
WHERE attack_power > 2000;

SELECT *
FROM tb_character
WHERE defense_power BETWEEN 1000 AND 2000;

SELECT *
FROM tb_character
WHERE name LIKE "P%";

SELECT *
FROM tb_character INNER JOIN tb_classe
ON (tb_character.class_id = tb_classe.id);

SELECT *
FROM tb_character INNER JOIN tb_classe
ON (tb_character.class_id = tb_classe.id)
WHERE tb_classe.id = 2;