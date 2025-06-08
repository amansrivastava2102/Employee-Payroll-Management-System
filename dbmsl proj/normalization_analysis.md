# Database Normalization Analysis for Employee Payroll Management System

## Original Unnormalized Data
Before beginning the normalization process, let's consider an unnormalized table that might contain all employee-related information:

**EmployeeData (Unnormalized)**
| EmployeeID | FirstName | LastName | Email | Phone | Street | City | State | ZIP | DeptName | DeptLocation | JobTitle | Salary | BankName | AccountNumber | Projects | Dependents | Benefits |
|------------|-----------|----------|-------|-------|--------|------|-------|-----|----------|--------------|----------|--------|----------|---------------|----------|------------|----------|
| 101 | John | Doe | john@email.com | 555-1234 | 123 Main St | Anytown | CA | 12345 | Engineering | Building A | Developer | 85000 | First Bank | 12345678 | Project X, Project Y | Jane Doe (Spouse), Jimmy Doe (Child) | Health Insurance, 401k |
| 102 | Mary | Smith | mary@email.com | 555-5678 | 456 Oak Ave | Othertown | NY | 54321 | Marketing | Building B | Manager | 95000 | Second Bank | 87654321 | Project Z | Tom Smith (Spouse) | Health Insurance, Life Insurance, 401k |

## First Normal Form (1NF)
The first step is to eliminate repeating groups and ensure atomic values.

### Before 1NF
In the unnormalized table above, we have multi-valued attributes:
- Projects (an employee can work on multiple projects)
- Dependents (an employee can have multiple dependents)
- Benefits (an employee can have multiple benefits)

### After 1NF

**Employee_1NF**
| EmployeeID | FirstName | LastName | Email | Phone | Street | City | State | ZIP | DeptName | DeptLocation | JobTitle | Salary | BankName | AccountNumber |
|------------|-----------|----------|-------|-------|--------|------|-------|-----|----------|--------------|----------|--------|----------|---------------|
| 101 | John | Doe | john@email.com | 555-1234 | 123 Main St | Anytown | CA | 12345 | Engineering | Building A | Developer | 85000 | First Bank | 12345678 |
| 102 | Mary | Smith | mary@email.com | 555-5678 | 456 Oak Ave | Othertown | NY | 54321 | Marketing | Building B | Manager | 95000 | Second Bank | 87654321 |

**EmployeeProject_1NF**
| EmployeeID | ProjectName |
|------------|-------------|
| 101 | Project X |
| 101 | Project Y |
| 102 | Project Z |

**EmployeeDependent_1NF**
| EmployeeID | DependentName | Relationship |
|------------|---------------|--------------|
| 101 | Jane Doe | Spouse |
| 101 | Jimmy Doe | Child |
| 102 | Tom Smith | Spouse |

**EmployeeBenefit_1NF**
| EmployeeID | BenefitType |
|------------|-------------|
| 101 | Health Insurance |
| 101 | 401k |
| 102 | Health Insurance |
| 102 | Life Insurance |
| 102 | 401k |

## Second Normal Form (2NF)
2NF requires that the table is in 1NF and all non-key attributes are fully functionally dependent on the entire primary key.

### Before 2NF
In our 1NF tables, we have partial dependencies:
- In Employee_1NF, department attributes (DeptName, DeptLocation) depend only on DeptName, not the entire EmployeeID
- JobTitle and Salary may depend on the job position rather than the specific employee
- Bank details depend on the account, not directly on the employee

### After 2NF

**Employee_2NF**
| EmployeeID | FirstName | LastName | Email | Phone | Street | City | State | ZIP | DeptID | JobID | BankAccountID |
|------------|-----------|----------|-------|-------|--------|------|-------|-----|--------|-------|---------------|
| 101 | John | Doe | john@email.com | 555-1234 | 123 Main St | Anytown | CA | 12345 | D1 | J1 | B1 |
| 102 | Mary | Smith | mary@email.com | 555-5678 | 456 Oak Ave | Othertown | NY | 54321 | D2 | J2 | B2 |

**Department_2NF**
| DeptID | DeptName | DeptLocation |
|--------|----------|--------------|
| D1 | Engineering | Building A |
| D2 | Marketing | Building B |

**Job_2NF**
| JobID | JobTitle | Salary |
|-------|----------|--------|
| J1 | Developer | 85000 |
| J2 | Manager | 95000 |

**BankAccount_2NF**
| BankAccountID | BankName | AccountNumber |
|---------------|----------|---------------|
| B1 | First Bank | 12345678 |
| B2 | Second Bank | 87654321 |

**EmployeeProject_2NF** (unchanged from 1NF as it has no partial dependencies)
| EmployeeID | ProjectName |
|------------|-------------|
| 101 | Project X |
| 101 | Project Y |
| 102 | Project Z |

**EmployeeDependent_2NF** (unchanged from 1NF)
| EmployeeID | DependentName | Relationship |
|------------|---------------|--------------|
| 101 | Jane Doe | Spouse |
| 101 | Jimmy Doe | Child |
| 102 | Tom Smith | Spouse |

**EmployeeBenefit_2NF** (unchanged from 1NF)
| EmployeeID | BenefitType |
|------------|-------------|
| 101 | Health Insurance |
| 101 | 401k |
| 102 | Health Insurance |
| 102 | Life Insurance |
| 102 | 401k |

## Third Normal Form (3NF)
3NF requires that the table is in 2NF and all attributes are directly dependent on the primary key (eliminating transitive dependencies).

### Before 3NF
In our 2NF tables, we have transitive dependencies:
- Address attributes (Street, City, State, ZIP) might be better organized as a separate entity
- In Employee_2NF, attributes depend on DeptID, JobID, and BankAccountID which are not part of the primary key

### After 3NF

**Employee_3NF**
| EmployeeID | FirstName | LastName | DeptID | JobID | AddressID | ContactInfoID | BankAccountID |
|------------|-----------|----------|--------|-------|-----------|---------------|---------------|
| 101 | John | Doe | D1 | J1 | A1 | C1 | B1 |
| 102 | Mary | Smith | D2 | J2 | A2 | C2 | B2 |

**ContactInfo_3NF**
| ContactInfoID | Email | Phone |
|---------------|-------|-------|
| C1 | john@email.com | 555-1234 |
| C2 | mary@email.com | 555-5678 |

**Address_3NF**
| AddressID | Street | City | State | ZIP |
|-----------|--------|------|-------|-----|
| A1 | 123 Main St | Anytown | CA | 12345 |
| A2 | 456 Oak Ave | Othertown | NY | 54321 |

**Department_3NF** (unchanged from 2NF)
| DeptID | DeptName | DeptLocation |
|--------|----------|--------------|
| D1 | Engineering | Building A |
| D2 | Marketing | Building B |

**Job_3NF** (unchanged from 2NF)
| JobID | JobTitle | BaseSalary |
|-------|----------|------------|
| J1 | Developer | 85000 |
| J2 | Manager | 95000 |

**BankAccount_3NF** (unchanged from 2NF)
| BankAccountID | BankName | AccountNumber |
|---------------|----------|---------------|
| B1 | First Bank | 12345678 |
| B2 | Second Bank | 87654321 |

**Project_3NF**
| ProjectID | ProjectName |
|-----------|-------------|
| P1 | Project X |
| P2 | Project Y |
| P3 | Project Z |

**EmployeeProject_3NF**
| EmployeeID | ProjectID |
|------------|-----------|
| 101 | P1 |
| 101 | P2 |
| 102 | P3 |

**Dependent_3NF**
| DependentID | EmployeeID | DependentName | Relationship |
|-------------|------------|---------------|--------------|
| D1 | 101 | Jane Doe | Spouse |
| D2 | 101 | Jimmy Doe | Child |
| D3 | 102 | Tom Smith | Spouse |

**Benefit_3NF**
| BenefitID | BenefitType |
|-----------|-------------|
| B1 | Health Insurance |
| B2 | 401k |
| B3 | Life Insurance |

**EmployeeBenefit_3NF**
| EmployeeID | BenefitID |
|------------|-----------|
| 101 | B1 |
| 101 | B2 |
| 102 | B1 |
| 102 | B2 |
| 102 | B3 |

## Boyce-Codd Normal Form (BCNF)
BCNF is a stricter version of 3NF where every determinant must be a candidate key.

### Before BCNF
In our 3NF design, we have a potential issue if:
- Salary might be determined by both JobID and PayGrade, but neither alone is a candidate key

### After BCNF

**Job_BCNF**
| JobID | JobTitle | PayGradeID |
|-------|----------|------------|
| J1 | Developer | PG1 |
| J2 | Manager | PG2 |

**PayGrade_BCNF**
| PayGradeID | GradeLevel | BaseSalary |
|------------|------------|------------|
| PG1 | Entry | 85000 |
| PG2 | Mid-Level | 95000 |

**Salary_BCNF**
| SalaryID | EmployeeID | BaseSalary | Bonus | EffectiveDate |
|----------|------------|------------|-------|---------------|
| S1 | 101 | 85000 | 5000 | 2023-01-01 |
| S2 | 102 | 95000 | 10000 | 2023-01-01 |

(All other tables remain the same as in 3NF)

## Fourth Normal Form (4NF)
4NF addresses multi-valued dependencies, requiring that a table is in BCNF and has no multi-valued dependencies.

### Before 4NF
In our current design:
- An employee can have multiple projects and multiple benefits, but these are independent of each other
- This is already handled by our separate junction tables

### After 4NF
Our design is already in 4NF because we've separated the multi-valued dependencies into distinct junction tables:
- EmployeeProject_3NF connects employees to projects
- EmployeeBenefit_3NF connects employees to benefits

## Fifth Normal Form (5NF) / Project-Join Normal Form (PJNF)
5NF decomposes tables to eliminate join dependencies that aren't implied by candidate keys.

### Before 5NF
Consider if we tracked which benefits are available for which job titles in which departments:

**JobDeptBenefit** table (not in 5NF)
| JobID | DeptID | BenefitID |
|-------|--------|-----------|
| J1 | D1 | B1 |
| J1 | D1 | B2 |
| J1 | D2 | B1 |
| J2 | D1 | B1 |
| J2 | D1 | B2 |
| J2 | D1 | B3 |
| J2 | D2 | B1 |
| J2 | D2 | B2 |

### After 5NF
We decompose this into three binary relationships:

**JobBenefit_5NF**
| JobID | BenefitID |
|-------|-----------|
| J1 | B1 |
| J1 | B2 |
| J2 | B1 |
| J2 | B2 |
| J2 | B3 |

**DeptBenefit_5NF**
| DeptID | BenefitID |
|--------|-----------|
| D1 | B1 |
| D1 | B2 |
| D1 | B3 |
| D2 | B1 |
| D2 | B2 |

**JobDept_5NF**
| JobID | DeptID |
|-------|--------|
| J1 | D1 |
| J1 | D2 |
| J2 | D1 |
| J2 | D2 |

This completes the normalization process from unnormalized data through 5NF for the Employee Payroll Management System.

## Summary of Normalization Benefits

1. **1NF**: Eliminated repeating groups and ensured atomic values
2. **2NF**: Removed partial dependencies on primary keys
3. **3NF**: Eliminated transitive dependencies
4. **BCNF**: Ensured all determinants are candidate keys
5. **4NF**: Addressed multi-valued dependencies
6. **5NF**: Eliminated join dependencies not implied by keys

The final database schema is highly normalized, reducing redundancy and avoiding update anomalies while maintaining data integrity. 