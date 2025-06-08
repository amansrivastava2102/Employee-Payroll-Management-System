USE EmployeePayrollDB;

-- Insert sample data for Payroll
INSERT INTO Payroll (payroll_id, emp_id, pay_period_start, pay_period_end, basic_pay, overtime_pay, bonus, tax_deduction, other_deductions, net_pay, payment_date, payment_method) VALUES
(1, 1, '2022-04-01', '2022-04-30', 12500.00, 0.00, 0.00, 3750.00, 500.00, 8250.00, '2022-05-05', 'Direct Deposit'),
(2, 2, '2022-04-01', '2022-04-30', 8750.00, 0.00, 0.00, 2625.00, 350.00, 5775.00, '2022-05-05', 'Direct Deposit'),
(3, 3, '2022-04-01', '2022-04-30', 12500.00, 1500.00, 0.00, 4200.00, 500.00, 9300.00, '2022-05-05', 'Direct Deposit'),
(4, 4, '2022-04-01', '2022-04-30', 8750.00, 0.00, 0.00, 2625.00, 350.00, 5775.00, '2022-05-05', 'Direct Deposit'),
(5, 5, '2022-04-01', '2022-04-30', 12500.00, 0.00, 0.00, 3750.00, 500.00, 8250.00, '2022-05-05', 'Direct Deposit'),
(6, 6, '2022-04-01', '2022-04-30', 7500.00, 0.00, 0.00, 1875.00, 300.00, 5325.00, '2022-05-05', 'Direct Deposit'),
(7, 7, '2022-04-01', '2022-04-30', 10000.00, 0.00, 0.00, 2800.00, 400.00, 6800.00, '2022-05-05', 'Direct Deposit'),
(8, 8, '2022-04-01', '2022-04-30', 3750.00, 200.00, 0.00, 790.00, 150.00, 3010.00, '2022-05-05', 'Direct Deposit'),
(9, 9, '2022-04-01', '2022-04-30', 10000.00, 0.00, 0.00, 2800.00, 400.00, 6800.00, '2022-05-05', 'Direct Deposit'),
(10, 10, '2022-04-01', '2022-04-30', 3750.00, 0.00, 0.00, 750.00, 150.00, 2850.00, '2022-05-05', 'Direct Deposit'),
(11, 11, '2022-04-01', '2022-04-30', 7500.00, 0.00, 0.00, 1875.00, 300.00, 5325.00, '2022-05-05', 'Direct Deposit'),
(12, 12, '2022-04-01', '2022-04-30', 7500.00, 500.00, 0.00, 2000.00, 300.00, 5700.00, '2022-05-05', 'Direct Deposit'),
(13, 13, '2022-04-01', '2022-04-30', 5416.67, 0.00, 0.00, 1300.00, 216.67, 3900.00, '2022-05-05', 'Direct Deposit'),
(14, 14, '2022-04-01', '2022-04-30', 5416.67, 0.00, 0.00, 1300.00, 216.67, 3900.00, '2022-05-05', 'Direct Deposit'),
(15, 15, '2022-04-01', '2022-04-30', 7500.00, 0.00, 0.00, 1875.00, 300.00, 5325.00, '2022-05-05', 'Direct Deposit'),
(16, 16, '2022-04-01', '2022-04-30', 5416.67, 400.00, 0.00, 1383.33, 216.67, 4216.67, '2022-05-05', 'Direct Deposit'),
(17, 17, '2022-04-01', '2022-04-30', 7500.00, 0.00, 0.00, 1875.00, 300.00, 5325.00, '2022-05-05', 'Direct Deposit'),
(18, 18, '2022-04-01', '2022-04-30', 5416.67, 0.00, 0.00, 1300.00, 216.67, 3900.00, '2022-05-05', 'Direct Deposit'),
(19, 19, '2022-04-01', '2022-04-30', 7500.00, 300.00, 0.00, 1950.00, 300.00, 5550.00, '2022-05-05', 'Direct Deposit'),
(20, 20, '2022-04-01', '2022-04-30', 3750.00, 0.00, 0.00, 750.00, 150.00, 2850.00, '2022-05-05', 'Direct Deposit');

-- Insert next month's payroll data
INSERT INTO Payroll (payroll_id, emp_id, pay_period_start, pay_period_end, basic_pay, overtime_pay, bonus, tax_deduction, other_deductions, net_pay, payment_date, payment_method) VALUES
(21, 1, '2022-05-01', '2022-05-31', 12500.00, 0.00, 1000.00, 4050.00, 500.00, 8950.00, '2022-06-05', 'Direct Deposit'),
(22, 2, '2022-05-01', '2022-05-31', 8750.00, 0.00, 750.00, 2850.00, 350.00, 6300.00, '2022-06-05', 'Direct Deposit'),
(23, 3, '2022-05-01', '2022-05-31', 12500.00, 1800.00, 1000.00, 4590.00, 500.00, 10210.00, '2022-06-05', 'Direct Deposit'),
(24, 4, '2022-05-01', '2022-05-31', 8750.00, 0.00, 750.00, 2850.00, 350.00, 6300.00, '2022-06-05', 'Direct Deposit'),
(25, 5, '2022-05-01', '2022-05-31', 12500.00, 0.00, 1000.00, 4050.00, 500.00, 8950.00, '2022-06-05', 'Direct Deposit');

-- Insert sample data for Dependent
INSERT INTO Dependent (emp_id, dependent_id, first_name, last_name, relationship, date_of_birth) VALUES
(1, 1, 'Emily', 'Smith', 'Spouse', '1982-03-25'),
(1, 2, 'Jacob', 'Smith', 'Child', '2010-07-12'),
(2, 1, 'Andrew', 'Johnson', 'Spouse', '1984-11-18'),
(3, 1, 'Karen', 'Williams', 'Spouse', '1980-05-07'),
(3, 2, 'Michael', 'Williams', 'Child', '2012-02-28'),
(3, 3, 'Lisa', 'Williams', 'Child', '2014-09-15'),
(4, 1, 'Daniel', 'Brown', 'Spouse', '1991-12-03'),
(5, 1, 'Sandra', 'Jones', 'Spouse', '1985-04-22'),
(5, 2, 'James', 'Jones', 'Child', '2013-08-10'),
(6, 1, 'David', 'Wilson', 'Spouse', '1990-01-14'),
(8, 1, 'Robert', 'Anderson', 'Spouse', '1993-09-30'),
(9, 1, 'Jennifer', 'Thomas', 'Spouse', '1984-07-08'),
(9, 2, 'Ethan', 'Thomas', 'Child', '2015-11-23'),
(12, 1, 'Carlos', 'Rodriguez', 'Spouse', '1988-03-17'),
(12, 2, 'Sofia', 'Rodriguez', 'Child', '2016-05-04'),
(13, 1, 'Monica', 'Hernandez', 'Spouse', '1992-08-26'),
(13, 2, 'Ricardo', 'Hernandez', 'Child', '2020-12-10'),
(15, 1, 'Patricia', 'Gonzalez', 'Spouse', '1979-06-19'),
(15, 2, 'Miguel', 'Gonzalez', 'Child', '2011-10-07'),
(15, 3, 'Isabella', 'Gonzalez', 'Child', '2014-04-15');

-- Insert sample data for PerformanceReview
INSERT INTO PerformanceReview (review_id, emp_id, reviewer_id, review_date, rating, comments) VALUES
(1, 6, 5, '2021-12-15', 4, 'Consistently exceeds expectations. Great team player.'),
(2, 7, 3, '2021-12-15', 5, 'Outstanding performance. Innovative solutions.'),
(3, 8, 1, '2021-12-16', 3, 'Meets expectations. Should focus on improving communication skills.'),
(4, 9, 2, '2021-12-16', 4, 'Very reliable and thorough work. Well respected by peers.'),
(5, 10, 4, '2021-12-17', 3, 'Satisfactory performance. Needs to improve organizational skills.'),
(6, 11, 3, '2021-12-17', 4, 'Strong technical skills. Could take more initiative.'),
(7, 12, 5, '2021-12-18', 4, 'Good leadership skills. Team consistently meets targets.'),
(8, 13, 5, '2021-12-18', 3, 'Adequate performance. Needs to improve decision-making.'),
(9, 14, 2, '2021-12-19', 4, 'Detail-oriented and efficient. Great analytical skills.'),
(10, 15, 4, '2021-12-19', 4, 'Creative and effective. Well-liked by clients.'),
(11, 16, 3, '2021-12-20', 3, 'Competent technical skills. Needs to improve teamwork.'),
(12, 17, 3, '2021-12-20', 5, 'Exceptional database management skills. Great mentor to junior staff.'),
(13, 18, 3, '2021-12-21', 4, 'Innovative design solutions. Good project management.'),
(14, 19, 3, '2021-12-21', 4, 'Effective coordinator. Good at managing project timelines.'),
(15, 20, 4, '2021-12-22', 3, 'Reliable support staff. Could be more proactive.'),
(16, 1, 1, '2021-12-22', 5, 'Outstanding leadership of HR department. Strategic vision.'),
(17, 2, 2, '2021-12-23', 4, 'Strong financial acumen. Well-organized department.'),
(18, 3, 3, '2021-12-23', 5, 'Excellent technical leadership. Department exceeds objectives.'),
(19, 4, 4, '2021-12-24', 4, 'Creative marketing strategies. Good team management.'),
(20, 5, 5, '2021-12-24', 5, 'Exceptional operations management. Significant cost savings.'); 