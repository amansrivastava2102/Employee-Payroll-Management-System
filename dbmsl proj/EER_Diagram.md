# Enhanced Entity-Relationship (EER) Diagram
## Employee Payroll Management System

```
+-------------------+        +-------------------+        +-------------------+
| DEPARTMENT        |        | EMPLOYEE          |        | JOB               |
+-------------------+        +-------------------+        +-------------------+
| PK dept_id        |<------o| PK emp_id         |o-------| PK job_id         |
|  dept_name        |        |  first_name       |        |  job_title        |
|  location         |        |  last_name        |        |  min_salary       |
|  budget           |        |  date_of_birth    |        |  max_salary       |
| FK manager_id     |<-------+  gender           |        +-------------------+
+-------------------+        |  hire_date        |
        ^                    | FK dept_id         |
        |                    | FK job_id          |        +-------------------+
        |                    | FK manager_id      |-------o| PERFORMANCE REVIEW|
        |                    +-------------------+        +-------------------+
        |                            | 1                   | PK review_id      |
        |                            |                     | FK emp_id         |
        |                            |                     | FK reviewer_id    |
        |                            |                     |  review_date      |
+-------------------+        +-------v---------+           |  rating           |
| PROJECT           |        |                 |           |  comments         |
+-------------------+        |                 |           +-------------------+
| PK project_id     |        |                 |
|  project_name     |        |                 |           +-------------------+
|  start_date       |        |                 |           | SALARY            |
|  end_date         |        |                 |           +-------------------+
|  budget           |        |                 |           | PK salary_id      |
| FK dept_id        |<-------+                 |           | FK emp_id         |
+-------------------+        |                 |----------o| FK grade_id       |
        |                    |                 |           |  base_salary      |
        |                    |                 |           |  effective_date   |
        v                    |                 |           |  end_date         |
+-------------------+        |                 |           +-------------------+
| EMPLOYEE_PROJECT  |        |                 |                   ^
+-------------------+        |                 |                   |
| PK emp_id         |<-------+                 |           +-------------------+
| PK project_id     |        |                 |           | PAY_GRADE         |
|  role             |        |                 |           +-------------------+
|  assignment_date  |        |                 |           | PK grade_id       |
+-------------------+        |                 |           |  grade_name       |
                             |                 |           |  hourly_rate      |
                             |                 |           |  tax_percentage   |
+-------------------+        |                 |           +-------------------+
| CONTACT_INFO      |        |                 |
+-------------------+        |                 |           +-------------------+
| PK contact_id     |        |                 |           | PAYROLL           |
| FK emp_id         |<-------+                 |           +-------------------+
|  email            |        |                 |           | PK payroll_id     |
|  phone            |        |                 |-----------| FK emp_id         |
+-------------------+        |                 |           |  pay_period_start |
                             |                 |           |  pay_period_end   |
                             |                 |           |  basic_pay        |
+-------------------+        |                 |           |  overtime_pay     |
| ADDRESS           |        |                 |           |  bonus            |
+-------------------+        |                 |           |  tax_deduction    |
| PK address_id     |        |                 |           |  other_deductions |
| FK emp_id         |<-------+                 |           |  net_pay          |
|  street           |        |                 |           |  payment_date     |
|  city             |        |                 |           |  payment_method   |
|  state            |        |                 |           +-------------------+
|  postal_code      |        |                 |
|  country          |        |                 |
+-------------------+        |                 |           +-------------------+
                             |                 |           | ATTENDANCE        |
                             |                 |           +-------------------+
+-------------------+        |                 |-----------| PK emp_id         |
| BANK_ACCOUNT      |        |                 |           | PK attendance_date|
+-------------------+        |                 |           |  time_in          |
| PK account_id     |        |                 |           |  time_out         |
| FK emp_id         |<-------+                 |           +-------------------+
|  bank_name        |        |                 |
|  account_number   |        |                 |
|  branch_code      |        |                 |           +-------------------+
|  is_primary       |        |                 |           | EMPLOYEE_LEAVE    |
+-------------------+        |                 |           +-------------------+
                             |                 |-----------| PK leave_id       |
                             |                 |           | FK emp_id         |
                             |                 |           |  leave_type       |
+-------------------+        |                 |           |  start_date       |
| DEPENDENT         |        |                 |           |  end_date         |
+-------------------+        |                 |           |  status           |
| PK emp_id         |<-------+                 |           +-------------------+
| PK dependent_id   |        |                 |
|  first_name       |        |                 |
|  last_name        |        |                 |           +-------------------+
|  relationship     |        |                 |           | EMPLOYEE_BENEFIT  |
|  date_of_birth    |        |                 |           +-------------------+
+-------------------+        |                 |-----------| PK emp_id         |
                             |                 |           | PK benefit_id     |
                             |                 |           |  enrollment_date  |
                             |                 |           +-------------------+
                             |                 |                   |
                             |                 |                   v
                             +-----------------+           +-------------------+
                                                           | BENEFIT           |
                                                           +-------------------+
                                                           | PK benefit_id     |
                                                           |  benefit_name     |
                                                           |  description      |
                                                           +-------------------+
                                                                     |
                                                        +------------+------------+
                                                        |                         |
                                                        v                         v
                                           +-------------------+       +-------------------+
                                           | HEALTH_INSURANCE  |       | RETIREMENT_PLAN   |
                                           +-------------------+       +-------------------+
                                           | PK benefit_id     |       | PK benefit_id     |
                                           |  provider         |       |  plan_type        |
                                           |  policy_number    |       |  contribution_pct |
                                           |  coverage_amount  |       |  vesting_period   |
                                           +-------------------+       +-------------------+
```

## Legend

- **PK**: Primary Key
- **FK**: Foreign Key
- **1-to-Many Relationship**: `-----|>` (one side) and `-----o` (many side)
- **Many-to-Many Relationship**: Through junction tables (e.g., EMPLOYEE_PROJECT, EMPLOYEE_BENEFIT)
- **IS-A Relationship**: BENEFIT is a parent entity with HEALTH_INSURANCE and RETIREMENT_PLAN as child entities

## Relationship Details

1. **Department-Employee**: One department can have many employees (1:N)
2. **Employee-Job**: One job can be assigned to many employees (1:N)
3. **Employee-Manager**: One employee can manage many employees (1:N, self-referential)
4. **Department-Manager**: One employee can manage one department (1:1)
5. **Department-Project**: One department can have many projects (1:N)
6. **Employee-Project**: Many employees can work on many projects (M:N via EMPLOYEE_PROJECT)
7. **Employee-ContactInfo**: One employee has one contact info record (1:1)
8. **Employee-Address**: One employee has one address (1:1)
9. **Employee-BankAccount**: One employee can have multiple bank accounts (1:N)
10. **Employee-Salary**: One employee can have multiple salary records over time (1:N)
11. **PayGrade-Salary**: One pay grade can apply to many salary records (1:N)
12. **Employee-Attendance**: One employee has many attendance records (1:N)
13. **Employee-EmployeeLeave**: One employee can have many leave records (1:N)
14. **Employee-Dependent**: One employee can have many dependents (1:N)
15. **Employee-Benefit**: Many employees can have many benefits (M:N via EMPLOYEE_BENEFIT)
16. **Benefit-HealthInsurance/RetirementPlan**: IS-A relationship with inheritance
17. **Employee-Payroll**: One employee has many payroll records (1:N)
18. **Employee-PerformanceReview**: One employee can have many performance reviews (1:N)

## Key Database Features

1. **Strong Entities**: Department, Employee, Job, Project, PayGrade, Benefit
2. **Weak Entities**: Attendance, Dependent
3. **IS-A Relationship**: Benefit with HealthInsurance, RetirementPlan
4. **Composite Attributes**: Address (decomposed into street, city, state, etc.)
5. **Multi-valued Attributes**: BankAccount
6. **Complex Relationships**: Self-referential (Employee-Manager), Many-to-Many (Employee-Project, Employee-Benefit)

This EER diagram provides a detailed visual representation of the Employee Payroll Management System's database structure, showing all entities, relationships, key attributes, and cardinalities. 