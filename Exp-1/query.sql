-- Active: 1707211291333@@127.0.0.1@3306@college
CREATE DATABASE college;
USE college;

CREATE TABLE STUDENT (
    USN VARCHAR(10) PRIMARY KEY,
    SName VARCHAR(50),
    Address VARCHAR(100),
    Phone VARCHAR(15),
    Gender CHAR(1)
);

CREATE TABLE SEMSEC (
    SSID VARCHAR(10) PRIMARY KEY,
    Sem INT,
    Sec CHAR(1)
);

CREATE TABLE CLASS (
    USN VARCHAR(10),
    SSID VARCHAR(10),
    PRIMARY KEY (USN, SSID),
    FOREIGN KEY (USN) REFERENCES STUDENT(USN),
    FOREIGN KEY (SSID) REFERENCES SEMSEC(SSID)
);

CREATE TABLE SUBJECT (
    Subcode VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100),
    Sem INT,
    Credits INT
);

CREATE TABLE IAMARKS (
    USN VARCHAR(10),
    Subcode VARCHAR(10),
    SSID VARCHAR(10),
    Test1 INT,
    Test2 INT,
    Test3 INT,
    FinalIA INT,
    PRIMARY KEY (USN, Subcode, SSID),
    FOREIGN KEY (USN) REFERENCES STUDENT(USN),
    FOREIGN KEY (Subcode) REFERENCES SUBJECT(Subcode),
    FOREIGN KEY (SSID) REFERENCES SEMSEC(SSID)
);

-- SHOW TABLES;

SELECT DISTINCT S.Address
FROM STUDENT S
JOIN CLASS C ON S.USN = C.USN
JOIN IAMARKS I ON C.USN = I.USN
GROUP BY S.USN, I.SSID
HAVING COUNT(DISTINCT I.Subcode) >= 3;


