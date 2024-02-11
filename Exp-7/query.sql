-- DEPARTMENT table
CREATE TABLE DEPARTMENT (
    DNo INT PRIMARY KEY,
    DName VARCHAR(100),
    MgrSSN INT,
    MgrStartDate DATE
);

-- DLOCATION table
CREATE TABLE DLOCATION (
    DNo INT,
    DLoc VARCHAR(100),
    PRIMARY KEY (DNo, DLoc),
    FOREIGN KEY (DNo) REFERENCES DEPARTMENT(DNo)
);

-- PROJECT table
CREATE TABLE PROJECT (
    PNo INT PRIMARY KEY,
    PName VARCHAR(100),
    PLocation VARCHAR(100),
    DNo INT,
    FOREIGN KEY (DNo) REFERENCES DEPARTMENT(DNo)
);

-- EMPLOYEE table
CREATE TABLE EMPLOYEE (
    SSN INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Sex CHAR(1),
    Salary DECIMAL(10, 2),
    SuperSSN INT,
    DNo INT,
    FOREIGN KEY (DNo) REFERENCES DEPARTMENT(DNo),
    FOREIGN KEY (SuperSSN) REFERENCES EMPLOYEE(SSN)
);

-- WORKS_ON table
CREATE TABLE WORKS_ON (
    SSN INT,
    PNo INT,
    Hours DECIMAL(5, 2),
    PRIMARY KEY (SSN, PNo),
    FOREIGN KEY (SSN) REFERENCES EMPLOYEE(SSN),
    FOREIGN KEY (PNo) REFERENCES PROJECT(PNo)
);

-- Insert
INSERT INTO EMPLOYEE (SSN, Name, Address, Sex, Salary, SuperSSN, DNo)
VALUES ('1', 'John Doe', '123 Main St', 'M', 50000, '2', 1);

-- Update
UPDATE EMPLOYEE
SET Address = '456 Elm St'
WHERE SSN = '1';

-- Delete
DELETE FROM EMPLOYEE
WHERE SSN = '1';

SELECT Name, SUM(Salary) as TotalSalary, COUNT(*) as Count
FROM EMPLOYEE
GROUP BY Name;

SELECT Name
FROM EMPLOYEE
ORDER BY Name DESC;

