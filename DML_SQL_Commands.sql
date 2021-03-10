
-- Import data from staging

--Import Data From Staging Table

INSERT INTO Education(education_level)
    SELECT DISTINCT education_lvl
    FROM proj_stg;

INSERT INTO Employee(employee_id, emp_name, email, education_id, hiredate)
    SELECT DISTINCT s.Emp_ID, s.Emp_NM, s.Email, ed.education_id, s.hire_dt
    FROM proj_stg as s
    JOIN Education as ed
    ON s.education_lvl = ed.education_level;

INSERT INTO Job(jobtitle)
    SELECT DISTINCT job_title
    FROM proj_stg;

INSERT INTO Department(department)
    SELECT DISTINCT department_nm
    FROM proj_stg;

INSERT INTO OfficeLocation(location_name, location_address,
        city, state)
    SELECT DISTINCT location, address, city, state
    FROM proj_stg;

INSERT INTO Salary(salary)
    SELECT DISTINCT salary
    FROM proj_stg;

INSERT INTO JobMapping(emp_id, job_id, salary_id, department_id, 
    officelocation_id, start_date, end_date, manager_id)
    SELECT e.employee_id, j.job_id, s.salary_id, d.department_id, 
            o.officelocation_id, proj.start_dt, proj.end_dt,
           (SELECT employee_id from Employee WHERE emp_name = proj.manager) AS manager_id
    FROM proj_stg as proj
    JOIN Employee as e ON proj.Emp_ID = e.employee_id
    JOIN Job as j ON proj.job_title = j.jobtitle
    JOIN Department as d ON proj.Department_nm = d.department
    JOIN Salary as s ON proj.salary = s.salary
    JOIN OfficeLocation AS o ON proj.location = o.location_name;



