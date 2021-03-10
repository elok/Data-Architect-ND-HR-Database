-- Drop Tables if Exists
DROP TABLE IF EXISTS JobMapping;
DROP TABLE IF EXISTS OfficeLocation;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Salary;
DROP TABLE IF EXISTS Job;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Education;


-- Create Tables

CREATE TABLE Education(
    education_id SERIAL PRIMARY KEY,
    education_level VARCHAR(50)
);

CREATE TABLE Employee(
    employee_id VARCHAR(128) PRIMARY KEY,
    emp_name VARCHAR(128),
    email VARCHAR(128),
    education_id INT REFERENCES Education(education_id),
    hiredate DATE
);

CREATE TABLE Job(
    job_id SERIAL PRIMARY KEY,
    jobtitle VARCHAR(128)
);

CREATE TABLE Salary(
    salary_id SERIAL PRIMARY KEY,
    salary int
);

CREATE TABLE Department(
    department_id SERIAL PRIMARY KEY,
    department VARCHAR(128)
);

CREATE TABLE OfficeLocation(
    officelocation_id SERIAL PRIMARY KEY,
    location_name VARCHAR(128),
    location_address VARCHAR(128), 
    city VARCHAR(128),
    state VARCHAR(128)
);

CREATE TABLE JobMapping(
    emp_id VARCHAR(128) REFERENCES Employee(employee_id),
    job_id INT REFERENCES Job(job_id),
    salary_id INT REFERENCES Salary(salary_id),
    department_id INT REFERENCES Department(department_id),
    officelocation_id INT REFERENCES OfficeLocation(officelocation_id),
    start_date DATE,
    end_date DATE,
    manager_id VARCHAR(128) REFERENCES Employee(employee_id),
    PRIMARY KEY (emp_id, job_id)
);
