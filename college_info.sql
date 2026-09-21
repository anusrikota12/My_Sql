
CREATE DATABASE company_db;


SHOW DATABASES;

USE company_db;

CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    duration INT CHECK(duration>0),
    fees DECIMAL(10,2) CHECK(fees>0)
);

DESC courses;

INSERT INTO courses(course_id,course_name,duration)
VALUES(11,'Java',6);
INSERT INTO courses(course_id,course_name,duration,fees)
VALUES(22,'Python',6,32000);


SELECT * FROM courses;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age> 5),
    city VARCHAR(50) DEFAULT 'Tenali',
    course_id INT,
    FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
);

 
INSERT INTO students
(student_id, student_name, email, age, course_id)
VALUES
(101, 'Anu', 'anu@gmail.com', 20, 1);

SELECT * FROM students;