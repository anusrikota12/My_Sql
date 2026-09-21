1. creating a databse:-

query:- REATE DATABASE company_db;



2. show the database that which we created:-

query:- 
SHOW DATABASES;


3. using database:-

query:- USE company_db;


4. create departments table:-

query:- 
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);


5. description for departments table:-

query:- DESC departments;


6. inserting values into departments table:-

query:- 
INSERT INTO departments
VALUES (1, 'Computer Science');


7. inserting values:-

query:- 
INSERT INTO departments
VALUES (2, 'Mechanical');


8. show the departments table:-

query:- SELECT * FROM departments;


9. creating employees table:-

query:- 
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


10. inserting employees values into the table:-

query:- 
INSERT INTO employees
(employee_id, name, email, salary, department_id)
VALUES
(101, 'Rahul', 'rahul@gmail.com', 50000, 1);