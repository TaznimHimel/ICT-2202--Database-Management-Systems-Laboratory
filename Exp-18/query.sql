CREATE DATABASE employer;
USE employer;

CREATE TABLE Employee (
    person_name VARCHAR(100),
    street VARCHAR(100),
    city VARCHAR(50),
    PRIMARY KEY (person_name)
);

CREATE TABLE Company (
    company_name VARCHAR(100),
    city VARCHAR(50),
    PRIMARY KEY (company_name)
);

CREATE TABLE Works (
    person_name VARCHAR(100),
    company_name VARCHAR(100),
    salary DECIMAL(10, 2),
    PRIMARY KEY (person_name, company_name),
    FOREIGN KEY (person_name) REFERENCES Employee(person_name),
    FOREIGN KEY (company_name) REFERENCES Company(company_name)
);

CREATE TABLE Manages (
    person_name VARCHAR(100),
    manager_name VARCHAR(100),
    PRIMARY KEY (person_name, manager_name),
    FOREIGN KEY (person_name) REFERENCES Employee(person_name),
    FOREIGN KEY (manager_name) REFERENCES Employee(person_name)
);


UPDATE Employee
SET city = 'New York'
WHERE person_name = 'Jonshon';


SELECT company_name, COUNT(person_name) AS num_employees
FROM Works
GROUP BY company_name
ORDER BY num_employees DESC
LIMIT 1;

SELECT company_name, SUM(salary) AS total_payroll
FROM Works
GROUP BY company_name
ORDER BY total_payroll ASC
LIMIT 1;

SELECT company_name, AVG(salary) AS avg_salary
FROM Works
GROUP BY company_name
HAVING avg_salary > (
    SELECT AVG(salary)
    FROM Works
    WHERE company_name = 'First Bank Corporation'
);

