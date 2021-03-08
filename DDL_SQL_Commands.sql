-- Drop Tables if Exists
DROP TABLE IF EXISTS JobMapping;
DROP TABLE IF EXISTS OfficeLocation;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS State;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Salary;
DROP TABLE IF EXISTS Job;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Education;


-- Create Tables

CREATE TABLE Education(
    id SERIAL PRIMARY KEY,
    education_level VARCHAR(50)
);

CREATE TABLE Employee(
    id VARCHAR(128) PRIMARY KEY,
    emp_name VARCHAR(128),
    email VARCHAR(128),
    education_id INT REFERENCES Education(id),
    hiredate DATE
);

CREATE TABLE Job(
    id SERIAL PRIMARY KEY,
    jobtitle VARCHAR(128)
);

CREATE TABLE Salary(
    id SERIAL PRIMARY KEY,
    salary int
);

CREATE TABLE Department(
    id SERIAL PRIMARY KEY,
    department VARCHAR(128)
);

CREATE TABLE State(
    id SERIAL PRIMARY KEY,
    state_name VARCHAR(128)
);

CREATE TABLE City(
    id SERIAL PRIMARY KEY,
    city VARCHAR(128),
    state_id INT REFERENCES State(id)
);

CREATE TABLE OfficeLocation(
    id SERIAL PRIMARY KEY,
    location_name VARCHAR(128),
    location_address VARCHAR(128), 
    city_id INT REFERENCES City(id)
);

CREATE TABLE JobMapping(
    emp_id VARCHAR(128) REFERENCES Employee(id),
    job_id INT REFERENCES Job(id),
    salary_id INT REFERENCES Salary(id),
    department_id INT REFERENCES Department(id),
    officelocation_id INT REFERENCES Department(id),
    start_date DATE,
    end_date DATE,
    manager_id VARCHAR(128) REFERENCES Employee(id),
    PRIMARY KEY (emp_id, job_id)
);
