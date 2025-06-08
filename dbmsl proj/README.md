# Employee Payroll Management System

A comprehensive database management system for employee payroll processing, featuring a normalized database design with various entity types, relationships, and attribute types.

## Features

- **Fully Normalized Database**: Designed to 3NF/BCNF normalization standards
- **Various Entity Types**: Strong entities, weak entities, and IS-A relationships
- **Multiple Attribute Types**: Simple, composite, multi-valued, and complex attributes
- **Diverse Relationships**: One-to-many, many-to-many, self-referential, and identifying relationships
- **Sample Data**: At least 15 records per table
- **20 SQL Queries**: Ranging from simple retrieval to complex analytics

## Database Schema

The database consists of 19 tables including:

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

## ER Diagram

The ER diagram showing the relationships between all entities can be found in the Project_Report.md file.

## How to Use

1. Run the database setup:
   ```
   .\run_db_setup.bat
   ```

2. Run example queries:
   ```
   .\run_query.bat
   ```

3. To run your own queries:
   ```
   mysql -u root -p"your_password" -D EmployeePayrollDB < your_query_file.sql
   ```

## Project Files

1. **simplified_schema.sql**: SQL script to create the database and tables
2. **sample_data_part1.sql, sample_data_part2.sql, sample_data_part3.sql, sample_data_part4.sql**: Sample data scripts
3. **queries.sql**: Various SQL queries for analysis and reporting
4. **run_db_setup.bat**: Batch file to run all setup scripts
5. **run_query.bat**: Batch file to run example queries
6. **instructions.txt**: Instructions for using the system
7. **Project_Report.md**: Comprehensive project report
8. **Employee_Payroll_Management_System_Report.pdf**: PDF version of the project report

## Technologies Used

- MySQL Database
- SQL for data manipulation and queries
- Batch scripting for automation 