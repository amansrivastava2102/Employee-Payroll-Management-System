USE EmployeePayrollDB;

-- Insert sample data for BankAccount
INSERT INTO BankAccount (account_id, emp_id, bank_name, account_number, branch_code, is_primary) VALUES
(1, 1, 'Chase Bank', '1234567890', 'NY001', 1),
(2, 2, 'Bank of America', '2345678901', 'CA002', 1),
(3, 3, 'Wells Fargo', '3456789012', 'IL003', 1),
(4, 4, 'Citibank', '4567890123', 'TX004', 1),
(5, 5, 'US Bank', '5678901234', 'AZ005', 1),
(6, 6, 'PNC Bank', '6789012345', 'PA006', 1),
(7, 7, 'TD Bank', '7890123456', 'TX007', 1),
(8, 8, 'Capital One', '8901234567', 'CA008', 1),
(9, 9, 'SunTrust', '9012345678', 'TX009', 1),
(10, 10, 'BB&T', '0123456789', 'CA010', 1),
(11, 11, 'Regions Bank', '1122334455', 'TX011', 1),
(12, 12, 'Fifth Third Bank', '2233445566', 'FL012', 1),
(13, 13, 'KeyBank', '3344556677', 'TX013', 1),
(14, 14, 'Huntington Bank', '4455667788', 'OH014', 1),
(15, 15, 'M&T Bank', '5566778899', 'IN015', 1),
(16, 1, 'Bank of America', '6677889900', 'NY016', 0),
(17, 3, 'Chase Bank', '7788990011', 'IL017', 0),
(18, 5, 'Wells Fargo', '8899001122', 'AZ018', 0),
(19, 7, 'Citibank', '9900112233', 'TX019', 0),
(20, 9, 'US Bank', '0011223344', 'TX020', 0);

-- Insert sample data for PayGrade
INSERT INTO PayGrade (grade_id, grade_name, hourly_rate, tax_percentage) VALUES
(1, 'Entry Level', 15.00, 15.00),
(2, 'Junior', 22.50, 18.00),
(3, 'Mid-Level', 30.00, 22.00),
(4, 'Senior', 45.00, 25.00),
(5, 'Expert', 60.00, 28.00),
(6, 'Manager', 52.50, 30.00),
(7, 'Director', 75.00, 32.00),
(8, 'Executive', 90.00, 35.00),
(9, 'C-Level', 125.00, 37.00),
(10, 'Intern', 12.00, 10.00),
(11, 'Contractor', 50.00, 15.00),
(12, 'Part-Time', 18.00, 15.00),
(13, 'Trainee', 14.00, 12.00),
(14, 'Specialist', 35.00, 22.00),
(15, 'Consultant', 65.00, 25.00);

-- Insert sample data for Salary
INSERT INTO Salary (salary_id, emp_id, grade_id, base_salary, effective_date, end_date) VALUES
(1, 1, 7, 150000.00, '2022-01-01', NULL),
(2, 2, 6, 105000.00, '2022-01-01', NULL),
(3, 3, 7, 150000.00, '2022-01-01', NULL),
(4, 4, 6, 105000.00, '2022-01-01', NULL),
(5, 5, 7, 150000.00, '2022-01-01', NULL),
(6, 6, 4, 90000.00, '2022-01-01', NULL),
(7, 7, 5, 120000.00, '2022-01-01', NULL),
(8, 8, 2, 45000.00, '2022-01-01', NULL),
(9, 9, 5, 120000.00, '2022-01-01', NULL),
(10, 10, 2, 45000.00, '2022-01-01', NULL),
(11, 11, 4, 90000.00, '2022-01-01', NULL),
(12, 12, 4, 90000.00, '2022-01-01', NULL),
(13, 13, 3, 65000.00, '2022-01-01', NULL),
(14, 14, 3, 65000.00, '2022-01-01', NULL),
(15, 15, 4, 90000.00, '2022-01-01', NULL),
(16, 16, 3, 65000.00, '2022-01-01', NULL),
(17, 17, 4, 90000.00, '2022-01-01', NULL),
(18, 18, 3, 65000.00, '2022-01-01', NULL),
(19, 19, 4, 90000.00, '2022-01-01', NULL),
(20, 20, 2, 45000.00, '2022-01-01', NULL);

-- Insert historical salary data
INSERT INTO Salary (salary_id, emp_id, grade_id, base_salary, effective_date, end_date) VALUES
(21, 1, 6, 120000.00, '2020-01-01', '2021-12-31'),
(22, 2, 5, 95000.00, '2020-01-01', '2021-12-31'),
(23, 3, 6, 120000.00, '2020-01-01', '2021-12-31'),
(24, 4, 5, 95000.00, '2020-01-01', '2021-12-31'),
(25, 5, 6, 120000.00, '2020-01-01', '2021-12-31');

-- Insert sample data for Project
INSERT INTO Project (project_id, project_name, start_date, end_date, budget, dept_id) VALUES
(1, 'HR System Upgrade', '2022-02-01', '2022-08-31', 500000.00, 1),
(2, 'Financial Reporting System', '2022-03-15', '2022-12-31', 750000.00, 2),
(3, 'Cloud Migration', '2022-01-10', '2022-10-31', 1200000.00, 3),
(4, 'Digital Marketing Campaign', '2022-04-01', '2022-07-31', 350000.00, 4),
(5, 'Operations Efficiency', '2022-02-15', '2023-02-14', 600000.00, 5),
(6, 'Sales Automation', '2022-05-01', '2022-11-30', 450000.00, 6),
(7, 'New Product Research', '2022-01-01', '2023-01-31', 900000.00, 7),
(8, 'Customer Support Portal', '2022-03-01', '2022-09-30', 550000.00, 8),
(9, 'Legal Documentation System', '2022-06-01', '2023-03-31', 400000.00, 9),
(10, 'Office Relocation', '2022-07-01', '2022-12-15', 300000.00, 10),
(11, 'Quality Management System', '2022-02-01', '2022-11-30', 650000.00, 11),
(12, 'Manufacturing Modernization', '2022-04-15', '2023-04-14', 1500000.00, 12),
(13, 'Supply Chain Optimization', '2022-03-01', '2022-12-31', 700000.00, 13),
(14, 'Vendor Management Portal', '2022-05-15', '2023-01-31', 420000.00, 14),
(15, 'PR Campaign', '2022-06-01', '2022-09-30', 280000.00, 15),
(16, 'Data Center Upgrade', '2022-07-01', '2023-01-31', 1100000.00, 3),
(17, 'Mobile App Development', '2022-01-15', '2022-08-31', 650000.00, 3),
(18, 'Security Enhancement', '2022-05-01', '2022-10-31', 500000.00, 3),
(19, 'AI Implementation', '2022-08-01', '2023-06-30', 1300000.00, 3),
(20, 'Office Automation', '2022-04-01', '2022-10-31', 350000.00, 10);

-- Insert sample data for EmployeeProject
INSERT INTO EmployeeProject (emp_id, project_id, role, assignment_date) VALUES
(1, 1, 'Project Manager', '2022-02-01'),
(2, 2, 'Project Manager', '2022-03-15'),
(3, 3, 'Project Manager', '2022-01-10'),
(4, 4, 'Project Manager', '2022-04-01'),
(5, 5, 'Project Manager', '2022-02-15'),
(6, 6, 'Team Lead', '2022-05-01'),
(7, 7, 'Team Lead', '2022-01-01'),
(8, 8, 'Team Member', '2022-03-01'),
(9, 9, 'Team Lead', '2022-06-01'),
(10, 10, 'Team Member', '2022-07-01'),
(11, 11, 'Team Lead', '2022-02-01'),
(12, 12, 'Team Lead', '2022-04-15'),
(13, 13, 'Team Lead', '2022-03-01'),
(14, 14, 'Team Lead', '2022-05-15'),
(15, 15, 'Team Lead', '2022-06-01'),
(16, 3, 'Developer', '2022-01-10'),
(17, 3, 'Database Admin', '2022-01-10'),
(18, 3, 'UI Designer', '2022-01-10'),
(19, 3, 'Team Lead', '2022-01-10'),
(20, 10, 'Coordinator', '2022-07-01'),
(1, 9, 'HR Advisor', '2022-06-01'),
(2, 13, 'Financial Advisor', '2022-03-01'),
(3, 16, 'Technical Lead', '2022-07-01'),
(4, 15, 'Marketing Advisor', '2022-06-01'),
(5, 12, 'Operations Advisor', '2022-04-15'),
(16, 17, 'Developer', '2022-01-15'),
(17, 18, 'Security Specialist', '2022-05-01'),
(18, 19, 'UI/UX Lead', '2022-08-01'),
(19, 16, 'Project Coordinator', '2022-07-01'); 