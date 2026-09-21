
CREATE DATABASE company_db;

SHOW DATABASES;

USE company_db;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);

DESC departments;

INSERT INTO departments
VALUES (1, 'Computer Science');

INSERT INTO departments
VALUES (2, 'Mechanical');

query:- SELECT * FROM departments;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    email VARCHAR(100) UNIQUE,

    salary DECIMAL(10,2) CHECK (salary > 0),

    city VARCHAR(50) DEFAULT 'Bangalore',

    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);


query:- 
INSERT INTO employees
(employee_id, name, email, salary, department_id)
VALUES
(101, 'Rahul', 'rahul@gmail.com', 50000, 1);

SELECT * FROM employees;