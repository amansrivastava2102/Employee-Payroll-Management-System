-- EMPLOYEE PAYROLL MANAGEMENT SYSTEM: NORMALIZATION QUERIES
-- This file contains CREATE TABLE, INSERT, and SELECT statements for each normalization level

-- ########################
-- UNNORMALIZED DATA TABLES
-- ########################

-- Create the unnormalized table
CREATE TABLE EmployeeData_Unnormalized (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(20),
    ZIP VARCHAR(10),
    DeptName VARCHAR(50),
    DeptLocation VARCHAR(100),
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2),
    BankName VARCHAR(50),
    AccountNumber VARCHAR(20),
    Projects TEXT,
    Dependents TEXT,
    Benefits TEXT
);

-- Insert data into unnormalized table
INSERT INTO EmployeeData_Unnormalized VALUES
(101, 'John', 'Doe', 'john@email.com', '555-1234', '123 Main St', 'Anytown', 'CA', '12345', 
 'Engineering', 'Building A', 'Developer', 85000.00, 'First Bank', '12345678', 
 'Project X, Project Y', 'Jane Doe (Spouse), Jimmy Doe (Child)', 'Health Insurance, 401k');

INSERT INTO EmployeeData_Unnormalized VALUES
(102, 'Mary', 'Smith', 'mary@email.com', '555-5678', '456 Oak Ave', 'Othertown', 'NY', '54321', 
 'Marketing', 'Building B', 'Manager', 95000.00, 'Second Bank', '87654321',
 'Project Z', 'Tom Smith (Spouse)', 'Health Insurance, Life Insurance, 401k');

-- Query the unnormalized table
SELECT * FROM EmployeeData_Unnormalized;


-- #####################
-- FIRST NORMAL FORM (1NF)
-- #####################

-- Create 1NF tables
CREATE TABLE Employee_1NF (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(20),
    ZIP VARCHAR(10),
    DeptName VARCHAR(50),
    DeptLocation VARCHAR(100),
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2),
    BankName VARCHAR(50),
    AccountNumber VARCHAR(20)
);

CREATE TABLE EmployeeProject_1NF (
    EmployeeID INT,
    ProjectName VARCHAR(50),
    PRIMARY KEY (EmployeeID, ProjectName),
    FOREIGN KEY (EmployeeID) REFERENCES Employee_1NF(EmployeeID)
);

CREATE TABLE EmployeeDependent_1NF (
    EmployeeID INT,
    DependentName VARCHAR(100),
    Relationship VARCHAR(50),
    PRIMARY KEY (EmployeeID, DependentName),
    FOREIGN KEY (EmployeeID) REFERENCES Employee_1NF(EmployeeID)
);

CREATE TABLE EmployeeBenefit_1NF (
    EmployeeID INT,
    BenefitType VARCHAR(50),
    PRIMARY KEY (EmployeeID, BenefitType),
    FOREIGN KEY (EmployeeID) REFERENCES Employee_1NF(EmployeeID)
);

-- Insert data into 1NF tables
INSERT INTO Employee_1NF VALUES
(101, 'John', 'Doe', 'john@email.com', '555-1234', '123 Main St', 'Anytown', 'CA', '12345', 
 'Engineering', 'Building A', 'Developer', 85000.00, 'First Bank', '12345678');

INSERT INTO Employee_1NF VALUES
(102, 'Mary', 'Smith', 'mary@email.com', '555-5678', '456 Oak Ave', 'Othertown', 'NY', '54321', 
 'Marketing', 'Building B', 'Manager', 95000.00, 'Second Bank', '87654321');

INSERT INTO EmployeeProject_1NF VALUES
(101, 'Project X'),
(101, 'Project Y'),
(102, 'Project Z');

INSERT INTO EmployeeDependent_1NF VALUES
(101, 'Jane Doe', 'Spouse'),
(101, 'Jimmy Doe', 'Child'),
(102, 'Tom Smith', 'Spouse');

INSERT INTO EmployeeBenefit_1NF VALUES
(101, 'Health Insurance'),
(101, '401k'),
(102, 'Health Insurance'),
(102, 'Life Insurance'),
(102, '401k');

-- Query 1NF tables
SELECT * FROM Employee_1NF;
SELECT * FROM EmployeeProject_1NF;
SELECT * FROM EmployeeDependent_1NF;
SELECT * FROM EmployeeBenefit_1NF;


-- #####################
-- SECOND NORMAL FORM (2NF)
-- #####################

-- Create 2NF tables
CREATE TABLE Department_2NF (
    DeptID VARCHAR(10) PRIMARY KEY,
    DeptName VARCHAR(50),
    DeptLocation VARCHAR(100)
);

CREATE TABLE Job_2NF (
    JobID VARCHAR(10) PRIMARY KEY,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE BankAccount_2NF (
    BankAccountID VARCHAR(10) PRIMARY KEY,
    BankName VARCHAR(50),
    AccountNumber VARCHAR(20)
);

CREATE TABLE Employee_2NF (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(20),
    ZIP VARCHAR(10),
    DeptID VARCHAR(10),
    JobID VARCHAR(10),
    BankAccountID VARCHAR(10),
    FOREIGN KEY (DeptID) REFERENCES Department_2NF(DeptID),
    FOREIGN KEY (JobID) REFERENCES Job_2NF(JobID),
    FOREIGN KEY (BankAccountID) REFERENCES BankAccount_2NF(BankAccountID)
);

-- EmployeeProject_2NF, EmployeeDependent_2NF, EmployeeBenefit_2NF same as 1NF

-- Insert data into 2NF tables
INSERT INTO Department_2NF VALUES
('D1', 'Engineering', 'Building A'),
('D2', 'Marketing', 'Building B');

INSERT INTO Job_2NF VALUES
('J1', 'Developer', 85000.00),
('J2', 'Manager', 95000.00);

INSERT INTO BankAccount_2NF VALUES
('B1', 'First Bank', '12345678'),
('B2', 'Second Bank', '87654321');

INSERT INTO Employee_2NF VALUES
(101, 'John', 'Doe', 'john@email.com', '555-1234', '123 Main St', 'Anytown', 'CA', '12345', 'D1', 'J1', 'B1'),
(102, 'Mary', 'Smith', 'mary@email.com', '555-5678', '456 Oak Ave', 'Othertown', 'NY', '54321', 'D2', 'J2', 'B2');

-- Query 2NF tables
SELECT * FROM Department_2NF;
SELECT * FROM Job_2NF;
SELECT * FROM BankAccount_2NF;
SELECT * FROM Employee_2NF;


-- #####################
-- THIRD NORMAL FORM (3NF)
-- #####################

-- Create 3NF tables
CREATE TABLE ContactInfo_3NF (
    ContactInfoID VARCHAR(10) PRIMARY KEY,
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Address_3NF (
    AddressID VARCHAR(10) PRIMARY KEY,
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(20),
    ZIP VARCHAR(10)
);

CREATE TABLE Project_3NF (
    ProjectID VARCHAR(10) PRIMARY KEY,
    ProjectName VARCHAR(50)
);

CREATE TABLE Benefit_3NF (
    BenefitID VARCHAR(10) PRIMARY KEY,
    BenefitType VARCHAR(50)
);

CREATE TABLE Employee_3NF (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DeptID VARCHAR(10),
    JobID VARCHAR(10),
    AddressID VARCHAR(10),
    ContactInfoID VARCHAR(10),
    BankAccountID VARCHAR(10),
    FOREIGN KEY (DeptID) REFERENCES Department_2NF(DeptID),
    FOREIGN KEY (JobID) REFERENCES Job_2NF(JobID),
    FOREIGN KEY (AddressID) REFERENCES Address_3NF(AddressID),
    FOREIGN KEY (ContactInfoID) REFERENCES ContactInfo_3NF(ContactInfoID),
    FOREIGN KEY (BankAccountID) REFERENCES BankAccount_2NF(BankAccountID)
);

CREATE TABLE EmployeeProject_3NF (
    EmployeeID INT,
    ProjectID VARCHAR(10),
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee_3NF(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Project_3NF(ProjectID)
);

CREATE TABLE Dependent_3NF (
    DependentID VARCHAR(10) PRIMARY KEY,
    EmployeeID INT,
    DependentName VARCHAR(100),
    Relationship VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employee_3NF(EmployeeID)
);

CREATE TABLE EmployeeBenefit_3NF (
    EmployeeID INT,
    BenefitID VARCHAR(10),
    PRIMARY KEY (EmployeeID, BenefitID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee_3NF(EmployeeID),
    FOREIGN KEY (BenefitID) REFERENCES Benefit_3NF(BenefitID)
);

-- Insert data into 3NF tables
INSERT INTO ContactInfo_3NF VALUES
('C1', 'john@email.com', '555-1234'),
('C2', 'mary@email.com', '555-5678');

INSERT INTO Address_3NF VALUES
('A1', '123 Main St', 'Anytown', 'CA', '12345'),
('A2', '456 Oak Ave', 'Othertown', 'NY', '54321');

INSERT INTO Project_3NF VALUES
('P1', 'Project X'),
('P2', 'Project Y'),
('P3', 'Project Z');

INSERT INTO Benefit_3NF VALUES
('B1', 'Health Insurance'),
('B2', '401k'),
('B3', 'Life Insurance');

INSERT INTO Employee_3NF VALUES
(101, 'John', 'Doe', 'D1', 'J1', 'A1', 'C1', 'B1'),
(102, 'Mary', 'Smith', 'D2', 'J2', 'A2', 'C2', 'B2');

INSERT INTO EmployeeProject_3NF VALUES
(101, 'P1'),
(101, 'P2'),
(102, 'P3');

INSERT INTO Dependent_3NF VALUES
('D1', 101, 'Jane Doe', 'Spouse'),
('D2', 101, 'Jimmy Doe', 'Child'),
('D3', 102, 'Tom Smith', 'Spouse');

INSERT INTO EmployeeBenefit_3NF VALUES
(101, 'B1'),
(101, 'B2'),
(102, 'B1'),
(102, 'B2'),
(102, 'B3');

-- Query 3NF tables
SELECT * FROM ContactInfo_3NF;
SELECT * FROM Address_3NF;
SELECT * FROM Project_3NF;
SELECT * FROM Benefit_3NF;
SELECT * FROM Employee_3NF;
SELECT * FROM EmployeeProject_3NF;
SELECT * FROM Dependent_3NF;
SELECT * FROM EmployeeBenefit_3NF;


-- #####################
-- BOYCE-CODD NORMAL FORM (BCNF)
-- #####################

-- Create BCNF tables
CREATE TABLE PayGrade_BCNF (
    PayGradeID VARCHAR(10) PRIMARY KEY,
    GradeLevel VARCHAR(50),
    BaseSalary DECIMAL(10,2)
);

CREATE TABLE Job_BCNF (
    JobID VARCHAR(10) PRIMARY KEY,
    JobTitle VARCHAR(50),
    PayGradeID VARCHAR(10),
    FOREIGN KEY (PayGradeID) REFERENCES PayGrade_BCNF(PayGradeID)
);

CREATE TABLE Salary_BCNF (
    SalaryID VARCHAR(10) PRIMARY KEY,
    EmployeeID INT,
    BaseSalary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    EffectiveDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee_3NF(EmployeeID)
);

-- Insert data into BCNF tables
INSERT INTO PayGrade_BCNF VALUES
('PG1', 'Entry', 85000.00),
('PG2', 'Mid-Level', 95000.00);

INSERT INTO Job_BCNF VALUES
('J1', 'Developer', 'PG1'),
('J2', 'Manager', 'PG2');

INSERT INTO Salary_BCNF VALUES
('S1', 101, 85000.00, 5000.00, '2023-01-01'),
('S2', 102, 95000.00, 10000.00, '2023-01-01');

-- Query BCNF tables
SELECT * FROM PayGrade_BCNF;
SELECT * FROM Job_BCNF;
SELECT * FROM Salary_BCNF;


-- #####################
-- FOURTH NORMAL FORM (4NF)
-- #####################
-- Already in 4NF with our existing tables

-- #####################
-- FIFTH NORMAL FORM (5NF)
-- #####################

-- Create 5NF tables (example based on benefits available by job and department)
CREATE TABLE JobBenefit_5NF (
    JobID VARCHAR(10),
    BenefitID VARCHAR(10),
    PRIMARY KEY (JobID, BenefitID),
    FOREIGN KEY (JobID) REFERENCES Job_BCNF(JobID),
    FOREIGN KEY (BenefitID) REFERENCES Benefit_3NF(BenefitID)
);

CREATE TABLE DeptBenefit_5NF (
    DeptID VARCHAR(10),
    BenefitID VARCHAR(10),
    PRIMARY KEY (DeptID, BenefitID),
    FOREIGN KEY (DeptID) REFERENCES Department_2NF(DeptID),
    FOREIGN KEY (BenefitID) REFERENCES Benefit_3NF(BenefitID)
);

CREATE TABLE JobDept_5NF (
    JobID VARCHAR(10),
    DeptID VARCHAR(10),
    PRIMARY KEY (JobID, DeptID),
    FOREIGN KEY (JobID) REFERENCES Job_BCNF(JobID),
    FOREIGN KEY (DeptID) REFERENCES Department_2NF(DeptID)
);

-- Insert data into 5NF tables
INSERT INTO JobBenefit_5NF VALUES
('J1', 'B1'),
('J1', 'B2'),
('J2', 'B1'),
('J2', 'B2'),
('J2', 'B3');

INSERT INTO DeptBenefit_5NF VALUES
('D1', 'B1'),
('D1', 'B2'),
('D1', 'B3'),
('D2', 'B1'),
('D2', 'B2');

INSERT INTO JobDept_5NF VALUES
('J1', 'D1'),
('J1', 'D2'),
('J2', 'D1'),
('J2', 'D2');

-- Query 5NF tables
SELECT * FROM JobBenefit_5NF;
SELECT * FROM DeptBenefit_5NF;
SELECT * FROM JobDept_5NF;


-- #####################
-- JOIN QUERIES TO RETRIEVE ORIGINAL DATA
-- #####################

-- Unnormalized data joined from normalized tables (1NF to 5NF)
SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName,
    c.Email,
    c.Phone,
    a.Street,
    a.City,
    a.State,
    a.ZIP,
    d.DeptName,
    d.DeptLocation,
    j.JobTitle,
    pg.BaseSalary AS Salary,
    b.BankName,
    b.AccountNumber,
    GROUP_CONCAT(DISTINCT p.ProjectName) AS Projects,
    GROUP_CONCAT(DISTINCT CONCAT(dep.DependentName, ' (', dep.Relationship, ')')) AS Dependents,
    GROUP_CONCAT(DISTINCT ben.BenefitType) AS Benefits
FROM Employee_3NF e
JOIN ContactInfo_3NF c ON e.ContactInfoID = c.ContactInfoID
JOIN Address_3NF a ON e.AddressID = a.AddressID
JOIN Department_2NF d ON e.DeptID = d.DeptID
JOIN Job_BCNF j ON e.JobID = j.JobID
JOIN PayGrade_BCNF pg ON j.PayGradeID = pg.PayGradeID
JOIN BankAccount_2NF b ON e.BankAccountID = b.BankAccountID
JOIN EmployeeProject_3NF ep ON e.EmployeeID = ep.EmployeeID
JOIN Project_3NF p ON ep.ProjectID = p.ProjectID
JOIN Dependent_3NF dep ON e.EmployeeID = dep.EmployeeID
JOIN EmployeeBenefit_3NF eb ON e.EmployeeID = eb.EmployeeID
JOIN Benefit_3NF ben ON eb.BenefitID = ben.BenefitID
GROUP BY e.EmployeeID; 