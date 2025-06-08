-- Employee Payroll Management System Database Schema (Simplified)

-- Create the database
CREATE DATABASE IF NOT EXISTS EmployeePayrollDB;
USE EmployeePayrollDB;

-- Create Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(15, 2),
    manager_id INT NULL
);

-- Create Job table
CREATE TABLE Job (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL,
    min_salary DECIMAL(10, 2),
    max_salary DECIMAL(10, 2)
);

-- Create Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender CHAR(1),
    hire_date DATE NOT NULL,
    dept_id INT,
    job_id INT,
    manager_id INT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    FOREIGN KEY (job_id) REFERENCES Job(job_id)
);

-- Add self-reference for Employee manager
ALTER TABLE Employee
ADD CONSTRAINT fk_manager_emp
FOREIGN KEY (manager_id) REFERENCES Employee(emp_id);

-- Update Department with manager_id foreign key
ALTER TABLE Department
ADD CONSTRAINT fk_manager
FOREIGN KEY (manager_id) REFERENCES Employee(emp_id);

-- Create ContactInfo table
CREATE TABLE ContactInfo (
    contact_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

-- Create Address table
CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

-- Create BankAccount table
CREATE TABLE BankAccount (
    account_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    bank_name VARCHAR(100),
    account_number VARCHAR(50),
    branch_code VARCHAR(50),
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

-- Create PayGrade table
CREATE TABLE PayGrade (
    grade_id INT PRIMARY KEY,
    grade_name VARCHAR(20) NOT NULL,
    hourly_rate DECIMAL(10, 2) NOT NULL,
    tax_percentage DECIMAL(5, 2) NOT NULL
);

-- Create Salary table
CREATE TABLE Salary (
    salary_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    grade_id INT NOT NULL,
    base_salary DECIMAL(12, 2) NOT NULL,
    effective_date DATE NOT NULL,
    end_date DATE,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (grade_id) REFERENCES PayGrade(grade_id)
);

-- Create Project table
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15, 2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Create EmployeeProject table
CREATE TABLE EmployeeProject (
    emp_id INT,
    project_id INT,
    role VARCHAR(50),
    assignment_date DATE,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

-- Create Attendance table
CREATE TABLE Attendance (
    emp_id INT,
    attendance_date DATE,
    time_in TIME,
    time_out TIME,
    PRIMARY KEY (emp_id, attendance_date),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

-- Create EmployeeLeave table
CREATE TABLE EmployeeLeave (
    leave_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    leave_type VARCHAR(30) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

-- Create Benefit table
CREATE TABLE Benefit (
    benefit_id INT PRIMARY KEY,
    benefit_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create EmployeeBenefit table
CREATE TABLE EmployeeBenefit (
    emp_id INT,
    benefit_id INT,
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (emp_id, benefit_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (benefit_id) REFERENCES Benefit(benefit_id)
);

-- Create HealthInsurance table
CREATE TABLE HealthInsurance (
    benefit_id INT PRIMARY KEY,
    provider VARCHAR(100) NOT NULL,
    policy_number VARCHAR(50),
    coverage_amount DECIMAL(12, 2),
    FOREIGN KEY (benefit_id) REFERENCES Benefit(benefit_id) ON DELETE CASCADE
);

-- Create RetirementPlan table
CREATE TABLE RetirementPlan (
    benefit_id INT PRIMARY KEY,
    plan_type VARCHAR(50) NOT NULL,
    contribution_percentage DECIMAL(5, 2),
    vesting_period INT,
    FOREIGN KEY (benefit_id) REFERENCES Benefit(benefit_id) ON DELETE CASCADE
);

-- Create Payroll table
CREATE TABLE Payroll (
    payroll_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    pay_period_start DATE NOT NULL,
    pay_period_end DATE NOT NULL,
    basic_pay DECIMAL(12, 2) NOT NULL,
    overtime_pay DECIMAL(10, 2) DEFAULT 0,
    bonus DECIMAL(10, 2) DEFAULT 0,
    tax_deduction DECIMAL(10, 2) DEFAULT 0,
    other_deductions DECIMAL(10, 2) DEFAULT 0,
    net_pay DECIMAL(12, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(30),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- Create Dependent table
CREATE TABLE Dependent (
    emp_id INT,
    dependent_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    relationship VARCHAR(30) NOT NULL,
    date_of_birth DATE,
    PRIMARY KEY (emp_id, dependent_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

-- Create PerformanceReview table
CREATE TABLE PerformanceReview (
    review_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    reviewer_id INT NOT NULL,
    review_date DATE NOT NULL,
    rating INT,
    comments TEXT,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (reviewer_id) REFERENCES Employee(emp_id)
); 