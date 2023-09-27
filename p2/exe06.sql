CREATE DATABASE db_course;
USE db_course;

CREATE TABLE tb_category(
  id INT AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
  description TEXT,
  difficulty_level ENUM("Beginner", "Intermediate", "Advanced") NOT NULL,
  language ENUM("English", "Portuguese", "Spanish") NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tb_course(
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  duration_hours INT NOT NULL,
  course_instructor VARCHAR(255),
  category_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES tb_category(id)
);

INSERT INTO tb_category (name, description, difficulty_level, language)
VALUES
	('Programming Basics', 'An introduction to programming concepts.', 'Beginner', 'English'),
  ('Web Development', 'Learn to build websites and web applications.', 'Intermediate', 'English'),
  ('Data Science', 'Explore data analysis and machine learning.', 'Intermediate', 'English'),
  ('Advanced Algorithms', 'In-depth study of advanced algorithms.', 'Advanced', 'English'),
  ('Spanish Language', 'Learn to speak and write in Spanish.', 'Beginner', 'Spanish');


INSERT INTO tb_course (name, description, price, duration_hours, course_instructor, category_id)
VALUES
	('Python Fundamentals', 'Basic Python programming concepts and syntax.', 250.00, 30, 'John Smith', 1),
  ('Full Stack Web Development', 'Master the art of full-stack web development.', 1100.00, 120, 'Alice Johnson', 2),
  ('Machine Learning with Python', 'Explore machine learning techniques with Python.', 750.99, 60, 'Eleanor Brown', 3),
  ('Advanced Data Structures', 'In-depth study of complex data structures.', 399.99, 45, 'Michael Lee', 4),
  ('Spanish for Beginners', 'A beginner-level course for learning Spanish.', 150.00, 20, 'Maria Rodriguez', 5),
  ('JavaScript Mastery', 'Advanced JavaScript programming and frameworks.', 400.00, 40, 'David Wilson', 2),
  ('Statistical Analysis', 'Statistical methods and data analysis.', 449.99, 50, 'Sophia Garcia', 3),
  ('Advanced Algorithms and Complexity', 'Advanced algorithms and time complexity analysis.', 499.99, 60, 'Daniel Brown', 4);


SELECT * FROM tb_course
WHERE price > 500.00;

SELECT * FROM tb_course
WHERE price BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_course
WHERE name LIKE "%J%";

SELECT tb_course.*, c.name AS category_name
FROM tb_course INNER JOIN tb_category AS c
ON (tb_course.category_id = c.id);

SELECT tb_course.*, c.name AS category_name
FROM tb_course INNER JOIN tb_category AS c
ON (tb_course.category_id = c.id)
WHERE c.name LIKE "Web Development";
