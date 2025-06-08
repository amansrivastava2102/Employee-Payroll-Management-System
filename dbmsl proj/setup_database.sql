-- Execute all scripts in order
SOURCE database_schema.sql;
SOURCE sample_data_part1.sql;
SOURCE sample_data_part2.sql;
SOURCE sample_data_part3.sql;
SOURCE sample_data_part4.sql;

-- Verify data has been inserted
SELECT 'Department' AS Table_Name, COUNT(*) AS Row_Count FROM Department
UNION ALL
SELECT 'Employee', COUNT(*) FROM Employee
UNION ALL
SELECT 'Job', COUNT(*) FROM Job
UNION ALL
SELECT 'ContactInfo', COUNT(*) FROM ContactInfo
UNION ALL
SELECT 'Address', COUNT(*) FROM Address
UNION ALL
SELECT 'BankAccount', COUNT(*) FROM BankAccount
UNION ALL
SELECT 'PayGrade', COUNT(*) FROM PayGrade
UNION ALL
SELECT 'Salary', COUNT(*) FROM Salary
UNION ALL
SELECT 'Project', COUNT(*) FROM Project
UNION ALL
SELECT 'EmployeeProject', COUNT(*) FROM EmployeeProject
UNION ALL
SELECT 'Attendance', COUNT(*) FROM Attendance
UNION ALL
SELECT 'EmployeeLeave', COUNT(*) FROM EmployeeLeave
UNION ALL
SELECT 'Benefit', COUNT(*) FROM Benefit
UNION ALL
SELECT 'EmployeeBenefit', COUNT(*) FROM EmployeeBenefit
UNION ALL
SELECT 'HealthInsurance', COUNT(*) FROM HealthInsurance
UNION ALL
SELECT 'RetirementPlan', COUNT(*) FROM RetirementPlan
UNION ALL
SELECT 'Payroll', COUNT(*) FROM Payroll
UNION ALL
SELECT 'Dependent', COUNT(*) FROM Dependent
UNION ALL
SELECT 'PerformanceReview', COUNT(*) FROM PerformanceReview; 