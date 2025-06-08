# Employee Payroll Management System
## Database Management System Project Report

### 1. Introduction

The Employee Payroll Management System is a comprehensive database solution designed to handle the payroll operations of an organization. This system manages employee data, salary information, attendance, leave, benefits, and other aspects related to employee management and payroll processing. The database is normalized and includes various types of entities, attributes, and relationships as required in professional database design.

### 2. Project Objectives

- Design a normalized database schema for payroll management
- Implement various types of attributes (simple, compound, complex)
- Create both strong and weak entities
- Establish various types of relationships including IS-A hierarchies
- Populate the database with at least 15 sample records per table
- Develop SQL queries to retrieve and analyze the data

### 3. Database Design

#### 3.1 Entity Types

- **Strong Entities**: Department, Employee, Job, Project, PayGrade, Benefit
- **Weak Entities**: Attendance (depends on Employee), Dependent (depends on Employee)
- **IS-A Relationships**: Benefit as parent entity with HealthInsurance and RetirementPlan as child entities

#### 3.2 Attribute Types

- **Simple Attributes**: emp_id, first_name, hire_date, etc.
- **Composite Attributes**: Address (broken down into street, city, state, postal_code, country)
- **Multi-valued Attributes**: BankAccount (an employee can have multiple bank accounts)
- **Complex Attributes**: ContactInfo (composite information about how to reach an employee)

#### 3.3 Relationship Types

- **One-to-Many**: Department to Employee, Employee to Dependent
- **Many-to-Many**: Employee to Project (through EmployeeProject), Employee to Benefit (through EmployeeBenefit)
- **Self-Referential**: Manager to Employee relationship in the Employee table
- **Identifying Relationship**: Employee to Attendance, Employee to Dependent

#### 3.4 ER Diagram

```
                                    +-------------+
                                    | Department  |
                                    +-------------+
                                    | dept_id (PK)|
                                    | dept_name   |
                                    | location    |
                                    | budget      |
                                    +------+------+
                                           |
                                           | manages
                                           | 1
                                    +------v------+        +-----------+
                                    |  Employee   |<-------| Job       |
                                    +-------------+        +-----------+
                                    | emp_id (PK) |        | job_id    |
                                    | first_name  |        | job_title |
                                    | last_name   |        | min_salary|
                                    | hire_date   |        | max_salary|
                                    +------+------+        +-----------+
                                           |
                                           | 1
                                           |
        +---------------+          +-------+--------+          +----------------+
        |  ContactInfo  |<---------+                +--------->| Address        |
        +---------------+          |                |          +----------------+
        | contact_id    |          |                |          | address_id     |
        | email         |          |                |          | street         |
        | phone         |          |                |          | city, state    |
        +---------------+          |                |          | postal_code    |
                                   |                |          | country        |
        +---------------+          |                |          +----------------+
        |  BankAccount  |<---------+                |
        +---------------+   0..*   |                |   0..*    +----------------+
        | account_id    |          |                +---------->| Attendance     |
        | bank_name     |          |                |          +----------------+
        | account_number|          |                |          | attendance_date|
        | branch_code   |          |                |          | time_in        |
        | is_primary    |          |                |          | time_out       |
        +---------------+          |                |          +----------------+
                                   |                |
                                   |                |   0..*    +----------------+
        +---------------+          |                +---------->| EmployeeLeave  |
        | PayGrade      |          |                |          +----------------+
        +---------------+          |                |          | leave_id       |
        | grade_id      |          |                |          | leave_type     |
        | grade_name    |          |                |          | start_date     |
        | hourly_rate   |          |                |          | end_date       |
        | tax_percentage|          |                |          | status         |
        +------+--------+          |                |          +----------------+
               |                   |                |
               |                   |                |   0..*    +----------------+
        +------v--------+          |                +---------->| Dependent      |
        | Salary        |<---------+                |          +----------------+
        +---------------+          |                |          | dependent_id   |
        | salary_id     |          |                |          | first_name     |
        | base_salary   |          |                |          | last_name      |
        | effective_date|          |                |          | relationship   |
        | end_date      |          |                |          | date_of_birth  |
        +---------------+          |                |          +----------------+
                                   |                |
                                   |                |            +----------------+
        +---------------+          |                |            | Benefit        |
        | Payroll       |<---------+                +----------->| (via EmpBenefit)|
        +---------------+          |                |   0..*     +----------------+
        | payroll_id    |          |                |            | benefit_id     |
        | pay_period    |          |                |            | benefit_name   |
        | basic_pay     |          +----------------+            | description    |
        | overtime_pay  |                 |                      +--------+-------+
        | bonus         |                 |                               |
        | deductions    |                 | 0..*                          | 
        | net_pay       |        +--------v--------+                      |
        +---------------+        | PerformanceReview|                     |
                                 +-----------------+                      |
                                 | review_id       |             +--------v--------+
                                 | reviewer_id     |             |                 |
                                 | review_date     |    +--------+ HealthInsurance |
                                 | rating          |    |        +-----------------+
                                 | comments        |    |        | provider        |
                                 +-----------------+    |        | policy_number   |
                                                        |        | coverage_amount |
                                                        |        +-----------------+
                                                        |
                                               +--------v--------+
                                               | RetirementPlan  |
                                               +-----------------+
                                               | plan_type       |
                                               | contribution_pct|
                                               | vesting_period  |
                                               +-----------------+

        +---------------+                      +----------------+
        | Project       |<-------------------->| EmployeeProject|<---- Employee
        +---------------+      1        0..*   +----------------+     0..*  1
        | project_id    |                      | role           |
        | project_name  |                      | assignment_date|
        | start_date    |                      +----------------+
        | end_date      |
        | budget        |
        +---------------+
```

### 4. Normalization

The database is normalized to:
- **1NF**: All tables have a primary key, and no repeating groups
- **2NF**: All non-key attributes are fully dependent on the primary key
- **3NF**: No transitive dependencies
- **BCNF**: Every determinant is a candidate key

### 5. Database Schema and Tables

The database consists of the following tables:

1. **Department**: Stores department information
2. **Job**: Contains job titles and salary ranges
3. **Employee**: Core employee information with references to department, job, and manager
4. **ContactInfo**: Employee contact details
5. **Address**: Employee address information
6. **BankAccount**: Employee bank account information (multiple accounts possible)
7. **PayGrade**: Salary grade definitions
8. **Salary**: Employee salary history
9. **Project**: Project details
10. **EmployeeProject**: Many-to-many relationship between employees and projects
11. **Attendance**: Daily attendance records (weak entity)
12. **EmployeeLeave**: Employee leave requests
13. **Benefit**: Available benefits (parent in IS-A relationship)
14. **EmployeeBenefit**: Many-to-many relationship between employees and benefits
15. **HealthInsurance**: Insurance details (child in IS-A relationship)
16. **RetirementPlan**: Retirement plan details (child in IS-A relationship)
17. **Payroll**: Monthly payroll records
18. **Dependent**: Employee dependents (weak entity)
19. **PerformanceReview**: Employee performance evaluations

### 6. Sample Data

Each table has been populated with at least 15 sample records to demonstrate the functionality of the database. The sample data includes:

- 15 departments and job positions
- 20 employees with varying roles and departments
- Multiple projects with employee assignments
- Salary records including historical data
- Leave records with different types and statuses
- Benefits and enrollment information
- Attendance records
- Performance reviews

### 7. SQL Queries

The system includes a comprehensive set of SQL queries to demonstrate the functionality of the database:

1. **Basic Employee Information**: List of employees with their department and job title
2. **Employee Contact Details**: Employee names with contact information and address
3. **Department Hierarchy**: Departments with their managers
4. **Employee Hierarchy**: Employees with their managers
5. **Salary Information**: Current salaries for all employees with their pay grade
6. **Payroll Summary**: Total payroll expenses by department
7. **Project Assignment**: Projects with count of employees assigned
8. **Leave Summary**: Count of leave days taken by each employee by leave type
9. **Attendance Report**: Working hours calculation for each employee
10. **Benefits Enrollment**: Employees with their benefits
11. **Dependents by Employee**: Employees with count of dependents
12. **Performance Review Analysis**: Average performance rating by department
13. **Employees with Multiple Projects**: Employees assigned to more than one project
14. **Salary History**: Salary changes for employees over time
15. **Top Earners by Department**: Highest paid employee in each department
16. **Project Budget vs Department Budget**: Comparison of project budgets to department budgets
17. **Employee Compensation Analysis**: Analysis of total compensation by job title and department
18. **Employees Who Have Not Taken Leave**: Finding employees with no leave records
19. **Benefit Enrollment Rate**: Percentage of employees enrolled in each benefit by department
20. **Performance to Salary Correlation**: Analysis of correlation between performance ratings and salary

### 8. Implementation

The database was implemented using MySQL. The implementation process included:

1. Creating the database schema using SQL scripts
2. Populating the database with sample data
3. Testing the relationships and constraints
4. Developing and testing the SQL queries
5. Creating batch files for easy setup and query execution

### 9. Challenges and Solutions

During the implementation, several challenges were encountered:

1. **Reserved Keyword Issue**: The table named "Leave" conflicted with a MySQL reserved keyword, so it was renamed to "EmployeeLeave"
2. **Circular Dependencies**: The circular dependency between Department and Employee (department has a manager who is an employee, employee belongs to a department) was resolved by initially creating the tables with NULL constraints and then adding the foreign key constraints after data insertion
3. **Complex Relationships**: The IS-A relationship between Benefit and its child entities was implemented using shared primary keys

### 10. Conclusion

The Employee Payroll Management System successfully demonstrates a comprehensive database design with various types of entities, relationships, and attributes. The database is fully normalized and includes a wide range of SQL queries to retrieve and analyze the data. The system can be easily extended to include additional functionality as needed.

### 11. Future Enhancements

Potential enhancements for the system include:

1. Adding user authentication and access control
2. Implementing stored procedures for complex operations
3. Creating views for commonly accessed data
4. Adding triggers for automatic calculations and updates
5. Developing a front-end interface for easier data management

### 12. Project Files

1. **simplified_schema.sql**: SQL script to create the database and tables
2. **sample_data_part1.sql, sample_data_part2.sql, sample_data_part3.sql, sample_data_part4.sql**: Sample data scripts
3. **queries.sql**: Various SQL queries for analysis and reporting
4. **run_db_setup.bat**: Batch file to run all setup scripts
5. **run_query.bat**: Batch file to run example queries
6. **instructions.txt**: Instructions for using the system
7. **README.md**: Project documentation
8. **Project_Report.md**: This comprehensive project report 