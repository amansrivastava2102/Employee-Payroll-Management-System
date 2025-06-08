USE EmployeePayrollDB;

-- 1. Basic Employee Information
-- List all employees with their department and job title
SELECT e.emp_id, e.first_name, e.last_name, d.dept_name, j.job_title
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
JOIN Job j ON e.job_id = j.job_id
ORDER BY e.emp_id;

-- 2. Employee Contact Details
-- List employee names with their contact information and address
SELECT 
    e.emp_id, 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name, 
    c.email, 
    c.phone,
    CONCAT(a.street, ', ', a.city, ', ', a.state, ' ', a.postal_code, ', ', a.country) AS full_address
FROM Employee e
JOIN ContactInfo c ON e.emp_id = c.emp_id
JOIN Address a ON e.emp_id = a.emp_id
ORDER BY e.emp_id;

-- 3. Department Hierarchy
-- List departments with their managers
SELECT 
    d.dept_id, 
    d.dept_name, 
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    d.location,
    d.budget
FROM Department d
JOIN Employee e ON d.manager_id = e.emp_id
ORDER BY d.dept_id;

-- 4. Employee Hierarchy
-- List employees with their managers
SELECT 
    e1.emp_id, 
    CONCAT(e1.first_name, ' ', e1.last_name) AS employee_name,
    e2.emp_id AS manager_id, 
    CONCAT(e2.first_name, ' ', e2.last_name) AS manager_name
FROM Employee e1
LEFT JOIN Employee e2 ON e1.manager_id = e2.emp_id
ORDER BY e1.emp_id;

-- 5. Salary Information
-- List current salaries for all employees with their pay grade
SELECT 
    e.emp_id, 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    s.base_salary,
    pg.grade_name,
    pg.hourly_rate,
    pg.tax_percentage
FROM Employee e
JOIN Salary s ON e.emp_id = s.emp_id
JOIN PayGrade pg ON s.grade_id = pg.grade_id
WHERE s.end_date IS NULL
ORDER BY e.emp_id;

-- 6. Payroll Summary
-- Show the total payroll expenses by department for the most recent pay period
SELECT 
    d.dept_id,
    d.dept_name,
    COUNT(p.emp_id) AS employee_count,
    SUM(p.basic_pay) AS total_basic_pay,
    SUM(p.overtime_pay) AS total_overtime_pay,
    SUM(p.bonus) AS total_bonus,
    SUM(p.tax_deduction) AS total_tax,
    SUM(p.other_deductions) AS total_deductions,
    SUM(p.net_pay) AS total_net_pay
FROM Payroll p
JOIN Employee e ON p.emp_id = e.emp_id
JOIN Department d ON e.dept_id = d.dept_id
WHERE p.pay_period_start = '2022-05-01'
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_id;

-- 7. Project Assignment
-- List all projects with the count of employees assigned to each
SELECT 
    p.project_id,
    p.project_name,
    COUNT(ep.emp_id) AS employee_count,
    p.budget
FROM Project p
LEFT JOIN EmployeeProject ep ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name, p.budget
ORDER BY employee_count DESC;

-- 8. Leave Summary
-- Count of leave days taken by each employee by leave type
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    l.leave_type,
    COUNT(l.leave_id) AS leave_count,
    SUM(DATEDIFF(l.end_date, l.start_date) + 1) AS total_days
FROM Employee e
JOIN EmployeeLeave l ON e.emp_id = l.emp_id
WHERE l.status = 'Approved'
GROUP BY e.emp_id, e.first_name, e.last_name, l.leave_type
ORDER BY e.emp_id, total_days DESC;

-- 9. Attendance Report
-- Calculate working hours for each employee for a specific week
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    a.attendance_date,
    a.time_in,
    a.time_out,
    TIMESTAMPDIFF(HOUR, a.time_in, a.time_out) AS hours_worked
FROM Employee e
JOIN Attendance a ON e.emp_id = a.emp_id
WHERE a.attendance_date BETWEEN '2022-05-02' AND '2022-05-06'
ORDER BY e.emp_id, a.attendance_date;

-- 10. Benefits Enrollment
-- List all employees with their benefits
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    b.benefit_name,
    eb.enrollment_date
FROM Employee e
JOIN EmployeeBenefit eb ON e.emp_id = eb.emp_id
JOIN Benefit b ON eb.benefit_id = b.benefit_id
ORDER BY e.emp_id, b.benefit_name;

-- 11. Dependents by Employee
-- List employees with the count of their dependents
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(d.dependent_id) AS dependent_count
FROM Employee e
LEFT JOIN Dependent d ON e.emp_id = d.emp_id
GROUP BY e.emp_id, e.first_name, e.last_name
ORDER BY dependent_count DESC;

-- 12. Performance Review Analysis
-- Average performance rating by department
SELECT 
    d.dept_id,
    d.dept_name,
    ROUND(AVG(pr.rating), 2) AS avg_rating,
    COUNT(pr.emp_id) AS review_count
FROM Department d
JOIN Employee e ON d.dept_id = e.dept_id
JOIN PerformanceReview pr ON e.emp_id = pr.emp_id
GROUP BY d.dept_id, d.dept_name
ORDER BY avg_rating DESC;

-- 13. Employee with Multiple Projects
-- Find employees who are assigned to more than one project
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(ep.project_id) AS project_count,
    GROUP_CONCAT(p.project_name SEPARATOR ', ') AS project_list
FROM Employee e
JOIN EmployeeProject ep ON e.emp_id = ep.emp_id
JOIN Project p ON ep.project_id = p.project_id
GROUP BY e.emp_id, e.first_name, e.last_name
HAVING COUNT(ep.project_id) > 1
ORDER BY project_count DESC;

-- 14. Salary History
-- Show salary changes for employees who have had more than one salary record
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    s1.effective_date AS old_effective_date,
    s1.base_salary AS old_salary,
    s2.effective_date AS new_effective_date,
    s2.base_salary AS new_salary,
    ROUND((s2.base_salary - s1.base_salary) / s1.base_salary * 100, 2) AS percentage_increase
FROM Employee e
JOIN Salary s1 ON e.emp_id = s1.emp_id
JOIN Salary s2 ON e.emp_id = s2.emp_id
WHERE s1.end_date IS NOT NULL
AND s2.effective_date > s1.effective_date
ORDER BY e.emp_id, s1.effective_date;

-- 15. Top Earners by Department
-- Find the highest paid employee in each department
WITH RankedSalaries AS (
    SELECT 
        e.emp_id,
        e.first_name,
        e.last_name,
        e.dept_id,
        d.dept_name,
        s.base_salary,
        RANK() OVER (PARTITION BY e.dept_id ORDER BY s.base_salary DESC) AS salary_rank
    FROM Employee e
    JOIN Department d ON e.dept_id = d.dept_id
    JOIN Salary s ON e.emp_id = s.emp_id
    WHERE s.end_date IS NULL
)
SELECT 
    dept_id,
    dept_name,
    emp_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    base_salary
FROM RankedSalaries
WHERE salary_rank = 1
ORDER BY base_salary DESC;

-- 16. Project Budget vs Department Budget
-- Compare project budgets with their department's total budget
SELECT 
    d.dept_id,
    d.dept_name,
    d.budget AS department_budget,
    COUNT(p.project_id) AS project_count,
    SUM(p.budget) AS total_project_budget,
    ROUND((SUM(p.budget) / d.budget) * 100, 2) AS budget_utilization_percentage
FROM Department d
LEFT JOIN Project p ON d.dept_id = p.dept_id
GROUP BY d.dept_id, d.dept_name, d.budget
ORDER BY budget_utilization_percentage DESC;

-- 17. Complex Query: Employee Compensation Analysis
-- Analyze total compensation (salary, overtime, bonus) by job title and department
SELECT 
    j.job_title,
    d.dept_name,
    COUNT(e.emp_id) AS employee_count,
    ROUND(AVG(s.base_salary), 2) AS avg_base_salary,
    ROUND(AVG(p.overtime_pay), 2) AS avg_overtime,
    ROUND(AVG(p.bonus), 2) AS avg_bonus,
    ROUND(AVG(s.base_salary + p.overtime_pay + p.bonus), 2) AS avg_total_compensation
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
JOIN Job j ON e.job_id = j.job_id
JOIN Salary s ON e.emp_id = s.emp_id
JOIN Payroll p ON e.emp_id = p.emp_id
WHERE s.end_date IS NULL
AND p.pay_period_start = '2022-05-01'
GROUP BY j.job_title, d.dept_name
ORDER BY avg_total_compensation DESC;

-- 18. Nested Query: Employees Who Have Not Taken Leave
-- Find employees who have not taken any leave
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.dept_name,
    j.job_title
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
JOIN Job j ON e.job_id = j.job_id
WHERE e.emp_id NOT IN (
    SELECT DISTINCT emp_id FROM EmployeeLeave
)
ORDER BY e.emp_id;

-- 19. Benefit Enrollment Rate by Department
-- Calculate the percentage of employees enrolled in each benefit by department
SELECT 
    d.dept_id,
    d.dept_name,
    b.benefit_id,
    b.benefit_name,
    COUNT(eb.emp_id) AS enrolled_employees,
    (SELECT COUNT(*) FROM Employee WHERE dept_id = d.dept_id) AS total_employees,
    ROUND(COUNT(eb.emp_id) / (SELECT COUNT(*) FROM Employee WHERE dept_id = d.dept_id) * 100, 2) AS enrollment_percentage
FROM Department d
CROSS JOIN Benefit b
LEFT JOIN EmployeeBenefit eb ON b.benefit_id = eb.benefit_id
LEFT JOIN Employee e ON eb.emp_id = e.emp_id AND e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name, b.benefit_id, b.benefit_name
ORDER BY d.dept_id, enrollment_percentage DESC;

-- 20. Performance to Salary Correlation
-- Analyze if there's a correlation between performance ratings and salary
SELECT 
    pr.rating,
    COUNT(e.emp_id) AS employee_count,
    ROUND(AVG(s.base_salary), 2) AS avg_salary,
    MIN(s.base_salary) AS min_salary,
    MAX(s.base_salary) AS max_salary
FROM Employee e
JOIN PerformanceReview pr ON e.emp_id = pr.emp_id
JOIN Salary s ON e.emp_id = s.emp_id
WHERE s.end_date IS NULL
GROUP BY pr.rating
ORDER BY pr.rating; 