/*
Amber's conglomerate corporation just acquired some new companies. 
Each of the companies follows this hierarchy: 

1) Founder
    -> Lead Manager
        -> Senior Manager
            -> Manager
                -> Employee

Given the table schemas below, write a query to print the company_code,
founder name, total number of lead managers, total number of senior managers,
total number of managers, and total number of employees.
Order your output by ascending company_code.

Note:
- The tables may contain duplicate records.
- The company_code is string, so the sorting should not be numeric. 
For example, if the company_codes are C_1, C_2, and C_10, 
then the ascending company_codes will be C_1, C_10, and C_2.
*/

/*
*********************
Company:
| company_code | founder |

*********************
Lead_Manager:
| lead_manager_code | company_code |

*********************
Senior_Manager:
| senior_manager_code | lead_manager_code | company_code |

*********************
Manager: 
| manager_code | senior_manager_code | lead_manager_code | company_code |

*********************
Employee:
| employee_code | manager_code | senior_manager_code | lead_manager_code | company_code |
*/

-- Revisar la tabla de Employee

SELECT * FROM Employee;

SELECT * FROM Manager;

SELECT * FROM Company
ORDER BY company_code;