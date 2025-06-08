USE EmployeePayrollDB;

-- Insert sample data for Department
INSERT INTO Department (dept_id, dept_name, location, budget) VALUES
(1, 'Human Resources', 'Floor 1, East Wing', 1000000.00),
(2, 'Finance', 'Floor 2, West Wing', 1500000.00),
(3, 'Information Technology', 'Floor 3, North Wing', 2000000.00),
(4, 'Marketing', 'Floor 2, South Wing', 1800000.00),
(5, 'Operations', 'Floor 1, South Wing', 2500000.00),
(6, 'Sales', 'Floor 4, East Wing', 3000000.00),
(7, 'Research and Development', 'Floor 5, North Wing', 4000000.00),
(8, 'Customer Service', 'Floor 1, West Wing', 1200000.00),
(9, 'Legal', 'Floor 6, East Wing', 1600000.00),
(10, 'Administration', 'Floor 6, West Wing', 900000.00),
(11, 'Quality Assurance', 'Floor 4, South Wing', 1100000.00),
(12, 'Production', 'Floor 7, North Wing', 3500000.00),
(13, 'Logistics', 'Floor 3, South Wing', 1700000.00),
(14, 'Procurement', 'Floor 5, West Wing', 1300000.00),
(15, 'Public Relations', 'Floor 4, West Wing', 1400000.00);

-- Insert sample data for Job
INSERT INTO Job (job_id, job_title, min_salary, max_salary) VALUES
(1, 'HR Manager', 60000.00, 90000.00),
(2, 'Financial Analyst', 55000.00, 85000.00),
(3, 'Software Developer', 70000.00, 120000.00),
(4, 'Marketing Specialist', 50000.00, 80000.00),
(5, 'Operations Manager', 65000.00, 95000.00),
(6, 'Sales Representative', 40000.00, 75000.00),
(7, 'Research Scientist', 75000.00, 130000.00),
(8, 'Customer Service Rep', 35000.00, 55000.00),
(9, 'Legal Counsel', 80000.00, 150000.00),
(10, 'Administrative Assistant', 32000.00, 48000.00),
(11, 'QA Engineer', 60000.00, 90000.00),
(12, 'Production Supervisor', 50000.00, 80000.00),
(13, 'Logistics Coordinator', 45000.00, 70000.00),
(14, 'Procurement Specialist', 48000.00, 75000.00),
(15, 'PR Specialist', 52000.00, 82000.00),
(16, 'IT Support Specialist', 45000.00, 70000.00),
(17, 'Database Administrator', 72000.00, 110000.00),
(18, 'UI/UX Designer', 65000.00, 95000.00),
(19, 'Project Manager', 75000.00, 120000.00),
(20, 'Executive Assistant', 45000.00, 70000.00);

-- Insert sample data for Employee
INSERT INTO Employee (emp_id, first_name, last_name, date_of_birth, gender, hire_date, dept_id, job_id, manager_id) VALUES
(1, 'John', 'Smith', '1980-05-15', 'M', '2010-01-15', 1, 1, NULL),
(2, 'Mary', 'Johnson', '1985-08-20', 'F', '2012-03-10', 2, 2, NULL),
(3, 'Robert', 'Williams', '1978-11-30', 'M', '2009-07-22', 3, 3, NULL),
(4, 'Patricia', 'Brown', '1990-02-25', 'F', '2015-05-18', 4, 4, NULL),
(5, 'Michael', 'Jones', '1982-09-12', 'M', '2011-11-05', 5, 5, NULL);

-- Insert more employees with manager references
INSERT INTO Employee (emp_id, first_name, last_name, date_of_birth, gender, hire_date, dept_id, job_id, manager_id) VALUES
(6, 'Linda', 'Wilson', '1988-07-03', 'F', '2014-02-28', 6, 6, 5),
(7, 'James', 'Taylor', '1975-12-18', 'M', '2008-10-15', 7, 7, 3),
(8, 'Elizabeth', 'Anderson', '1992-04-09', 'F', '2017-08-21', 8, 8, 1),
(9, 'William', 'Thomas', '1983-06-22', 'M', '2013-01-14', 9, 9, 2),
(10, 'Jennifer', 'Garcia', '1995-03-17', 'F', '2018-11-30', 10, 10, 4),
(11, 'David', 'Martinez', '1979-10-05', 'M', '2010-06-12', 11, 11, 3),
(12, 'Maria', 'Rodriguez', '1986-01-28', 'F', '2015-03-19', 12, 12, 5),
(13, 'Richard', 'Hernandez', '1991-09-15', 'M', '2016-07-08', 13, 13, 5),
(14, 'Susan', 'Lopez', '1984-11-11', 'F', '2012-12-03', 14, 14, 2),
(15, 'Joseph', 'Gonzalez', '1977-08-24', 'M', '2009-09-16', 15, 15, 4),
(16, 'Laura', 'Wilson', '1989-05-19', 'F', '2014-10-27', 3, 16, 3),
(17, 'Thomas', 'Lewis', '1981-03-02', 'M', '2011-05-14', 3, 17, 3),
(18, 'Sarah', 'Lee', '1993-07-30', 'F', '2017-02-09', 3, 18, 3),
(19, 'Charles', 'Walker', '1976-12-07', 'M', '2008-04-23', 3, 19, 3),
(20, 'Jessica', 'Hall', '1990-06-14', 'F', '2015-09-11', 10, 20, 4);

-- Update Department manager_id
UPDATE Department SET manager_id = 1 WHERE dept_id = 1;
UPDATE Department SET manager_id = 2 WHERE dept_id = 2;
UPDATE Department SET manager_id = 3 WHERE dept_id = 3;
UPDATE Department SET manager_id = 4 WHERE dept_id = 4;
UPDATE Department SET manager_id = 5 WHERE dept_id = 5;
UPDATE Department SET manager_id = 6 WHERE dept_id = 6;
UPDATE Department SET manager_id = 7 WHERE dept_id = 7;
UPDATE Department SET manager_id = 8 WHERE dept_id = 8;
UPDATE Department SET manager_id = 9 WHERE dept_id = 9;
UPDATE Department SET manager_id = 10 WHERE dept_id = 10;
UPDATE Department SET manager_id = 11 WHERE dept_id = 11;
UPDATE Department SET manager_id = 12 WHERE dept_id = 12;
UPDATE Department SET manager_id = 13 WHERE dept_id = 13;
UPDATE Department SET manager_id = 14 WHERE dept_id = 14;
UPDATE Department SET manager_id = 15 WHERE dept_id = 15;

-- Insert sample data for ContactInfo
INSERT INTO ContactInfo (contact_id, emp_id, email, phone) VALUES
(1, 1, 'john.smith@company.com', '555-123-4567'),
(2, 2, 'mary.johnson@company.com', '555-234-5678'),
(3, 3, 'robert.williams@company.com', '555-345-6789'),
(4, 4, 'patricia.brown@company.com', '555-456-7890'),
(5, 5, 'michael.jones@company.com', '555-567-8901'),
(6, 6, 'linda.wilson@company.com', '555-678-9012'),
(7, 7, 'james.taylor@company.com', '555-789-0123'),
(8, 8, 'elizabeth.anderson@company.com', '555-890-1234'),
(9, 9, 'william.thomas@company.com', '555-901-2345'),
(10, 10, 'jennifer.garcia@company.com', '555-012-3456'),
(11, 11, 'david.martinez@company.com', '555-123-7890'),
(12, 12, 'maria.rodriguez@company.com', '555-234-8901'),
(13, 13, 'richard.hernandez@company.com', '555-345-9012'),
(14, 14, 'susan.lopez@company.com', '555-456-0123'),
(15, 15, 'joseph.gonzalez@company.com', '555-567-1234'),
(16, 16, 'laura.wilson@company.com', '555-678-2345'),
(17, 17, 'thomas.lewis@company.com', '555-789-3456'),
(18, 18, 'sarah.lee@company.com', '555-890-4567'),
(19, 19, 'charles.walker@company.com', '555-901-5678'),
(20, 20, 'jessica.hall@company.com', '555-012-6789');

-- Insert sample data for Address
INSERT INTO Address (address_id, emp_id, street, city, state, postal_code, country) VALUES
(1, 1, '123 Oak Street', 'New York', 'NY', '10001', 'USA'),
(2, 2, '456 Pine Avenue', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 3, '789 Maple Road', 'Chicago', 'IL', '60601', 'USA'),
(4, 4, '101 Elm Boulevard', 'Houston', 'TX', '77001', 'USA'),
(5, 5, '202 Cedar Lane', 'Phoenix', 'AZ', '85001', 'USA'),
(6, 6, '303 Birch Drive', 'Philadelphia', 'PA', '19101', 'USA'),
(7, 7, '404 Spruce Court', 'San Antonio', 'TX', '78201', 'USA'),
(8, 8, '505 Willow Way', 'San Diego', 'CA', '92101', 'USA'),
(9, 9, '606 Cherry Street', 'Dallas', 'TX', '75201', 'USA'),
(10, 10, '707 Aspen Circle', 'San Jose', 'CA', '95101', 'USA'),
(11, 11, '808 Redwood Place', 'Austin', 'TX', '73301', 'USA'),
(12, 12, '909 Magnolia Avenue', 'Jacksonville', 'FL', '32201', 'USA'),
(13, 13, '111 Sequoia Road', 'Fort Worth', 'TX', '76101', 'USA'),
(14, 14, '222 Fir Lane', 'Columbus', 'OH', '43201', 'USA'),
(15, 15, '333 Alder Street', 'Indianapolis', 'IN', '46201', 'USA'),
(16, 16, '444 Poplar Court', 'Charlotte', 'NC', '28201', 'USA'),
(17, 17, '555 Sycamore Avenue', 'San Francisco', 'CA', '94101', 'USA'),
(18, 18, '666 Juniper Road', 'Seattle', 'WA', '98101', 'USA'),
(19, 19, '777 Hickory Drive', 'Denver', 'CO', '80201', 'USA'),
(20, 20, '888 Cypress Lane', 'Boston', 'MA', '02201', 'USA'); 