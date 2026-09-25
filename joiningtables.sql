CREATE DATABASE company_db1;
USE company_db1;
CREATE TABLE departments(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    department_id INT,
    manager_id INT,
    joining_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY(manager_id) REFERENCES employees(employee_id)
);
CREATE TABLE projects(
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2),
    start_date DATE 
);
CREATE TABLE employee_projects(
    employee_id INT,
    project_id INT,
    assigned_date DATE,
    PRIMARY KEY(employee_id,project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
INSERT INTO departments(department_name,location)
VALUES 
('IT','Bangalore'),
('HR','Hyderabad'),
('Finance','Mumbai'),
('Sales','Delhi');
INSERT INTO employees(employee_name,email,salary,department_id,manager_id,joining_date)
VALUES 
('Rahul','rahul@gmail.com',75000,1,NULL,'2022-01-10'),
('Priya', 'priya@gmail.com', 65000, 1, 1, '2023-03-15'),
('Amit', 'amit@gmail.com', 55000, 2, NULL, '2021-07-20'),
('Sneha', 'sneha@gmail.com', 60000, 2, 3, '2024-02-12'),
('Arjun', 'arjun@gmail.com', 80000, 3, NULL, '2020-11-05'),
('Kiran', 'kiran@gmail.com', 50000, 4, NULL, '2023-08-18'),
('Neha', 'neha@gmail.com', 70000, 1, 1, '2024-01-25');
INSERT INTO projects
(project_name, budget, start_date)
VALUES
('E-Commerce Application', 500000, '2024-01-01'),
('Banking Application', 800000, '2024-03-01'),
('HR Management System', 300000, '2024-05-01');
INSERT INTO employee_projects
(employee_id, project_id, assigned_date)
VALUES
(1, 1, '2024-01-05'),
(2, 1, '2024-01-10'),
(7, 1, '2024-02-01'),
(1, 2, '2024-03-05'),
(5, 2, '2024-03-10'),
(3, 3, '2024-05-05'),
(4, 3, '2024-05-10');



USE company_db2;
SELECT e.employee_name, d.department_name 
FROM employees e 
INNER JOIN departments d 
ON e.department_id=d.department_id;




USE company_db2;
SELECT e.employee_name, d.department_name 
FROM employees e
LEFT JOIN departments d
ON e.department_id=d.department_id;



SELECT e.employee_name AS employee,
m.employee_name As manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id=m.employee_id;



SELECT e.employee_name,p.project_name 
FROM employees e
CROSS JOIN projects p;

SELECT e.employee_name, d.department_name, p.project_name
FROM employees e
INNER JOIN departments d
ON e.department_id=d.department_id
INNER JOIN employee_projects ep
ON e.employee_id=ep.employee_id
INNER JOIN projects p
ON ep.project_id=p.project_id;


SELECT e.employee_name,p.project_name,p.budget
FROM employees e
JOIN employee_projects ep
ON e.employee_id=ep.employee_id
JOIN projects p
ON ep.project_id=p.project_id
WHERE p.budget>400000;


SELECT e.employee_name,d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id;


SELECT e.employee_name, e.salary, d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id;

SELECT e.employee_name, d.department_name
FROM employees e
JOIN departments d
WHERE department_name='IT';



SELECT e.employee_name,
p.project_name,
ep.assigned_date
FROM employees e
JOIN employee_projects ep
ON e.employee_id=ep.employee_id
JOIN projects p
ON ep.project_id=p.project_id;


SELECT e.employee_name,
p.project_name
FROM employees e
JOIN employee_projects ep
ON e.employee_id=ep.employee_id
JOIN projects p
ON ep.project_id=p.project_id
WHERE project_name='E-Commerce Application';


SELECT e.employee_name,
p.project_name,
ep.assigned_date
FROM employees e
JOIN employee_projects ep
ON e.employee_id=ep.employee_id
JOIN projects p
ON ep.project_id=p.project_id
WHERE project_name='Banking Application';


Create view employee_department_view AS
SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_name,
    d.location
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;


select * 
from employee_department_view;

CREATE VIEW high_salary_employees as
select
    employee_id,
    employee_name,
    salary
from employees
where salary>60000;


SELECT UPPER(employee_name)
FROM employees;


SELECT LOWER(employee_name)
FROM employees;


SELECT employee_name, LENGTH(employee_name) AS name_length
FROM employees;


SELECT COUNT(*) AS total_employees
FROM employees;

SELECT SUM(salary) AS total_salary
FROM employees;

SELECT AVG(salary) AS average_salary
FROM employees;

SELECT MAX(salary) AS highest_salary
FROM employees;

SELECT MIN(salary) AS lowest_salary
FROM employees;



SELECT ROUND(AVG(salary),2) AS average_salary
FROM employees;



CREATE VIEW employee_details AS 
SELECT
    e.employee_id,
    e.employee_name,
    e.email,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id;


CREATE VIEW it_employees AS 
SELECT
    e.employee_id,
    e.employee_name,
    e.email,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
WHERE d.department_name='IT';