
-- Import data from staging

--Import Data From Staging Table

INSERT INTO Education(education_level)
    SELECT DISTINCT education_lvl
    FROM proj_stg;

INSERT INTO Employee(id, emp_name, email, education_id, hiredate)
    SELECT DISTINCT s.Emp_ID, s.Emp_NM, s.Email, ed.id, s.hire_dt
    FROM proj_stg as s
    JOIN Education as ed
    ON s.education_lvl = ed.education_level;

INSERT INTO Job(jobtitle)
    SELECT DISTINCT job_title
    FROM proj_stg;

INSERT INTO Department(department)
    SELECT DISTINCT department_nm
    FROM proj_stg;

INSERT INTO OfficeLocation(location_name, location_address)
    SELECT DISTINCT location, address
    FROM proj_stg;

INSERT INTO State(id, state_name)
    SELECT DISTINCT loc.id, s.state
    FROM proj_stg as s
    JOIN OfficeLocation as loc
    ON s.location = loc.location_name;

INSERT INTO City(city, state_id)
    SELECT DISTINCT s.city, st.id
    FROM proj_stg as s
    JOIN State as st
    ON s.state = st.state_name;

INSERT INTO Salary(salary)
    SELECT DISTINCT salary
    FROM proj_stg;

INSERT INTO JobMapping(emp_id, job_id, salary_id, department_id, 
    officelocation_id, start_date, end_date, manager_id)
    SELECT e.id, j.id, s.id, d.id, o.id,
           proj.start_dt, 
           proj.end_dt,
           (SELECT id from Employee WHERE emp_name = proj.manager) AS manager_id
    FROM proj_stg as proj
    JOIN Employee as e ON proj.Emp_ID = e.id
    JOIN Job as j ON proj.job_title = j.jobtitle
    JOIN Department as d ON proj.Department_nm = d.department
    JOIN Salary as s ON proj.salary = s.salary
    JOIN OfficeLocation AS o ON proj.location = o.location_name;



