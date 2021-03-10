-- Question 1: Return a list of employees with Job Titles and Department Names
SELECT e.emp_name, j.jobtitle, d.department
FROM Employee e
JOIN JobMapping m ON m.emp_id = e.employee_id
JOIN Job j ON j.job_id = m.job_id
JOIN Department d ON d.department_id = m.department_id;

-- Question 2: Insert Web Programmer as a new job title
INSERT INTO Job (jobtitle) VALUES ('Web Programmer');

-- Question 3: Correct the job title from web programmer to web developer
UPDATE Job
SET jobtitle = 'Web Developer'
WHERE jobtitle = 'Web Programmer';

--Question 4: Delete the job title Web Developer from the database
DELETE FROM Job 
WHERE jobtitle = 'Web Developer';

-- Question 5: How many employees are in each department?
SELECT d.department, COUNT(DISTINCT e.employee_id)
FROM Employee e
JOIN JobMapping m ON m.emp_id = e.employee_id
JOIN Department d ON d.department_id = m.department_id
GROUP BY d.department;

SELECT d.department, COUNT(e.employee_id)
FROM Employee e
JOIN JobMapping m ON m.emp_id = e.employee_id
JOIN Department d ON d.department_id = m.department_id
WHERE m.end_date > Now()
GROUP BY d.department;

-- Question 6: Write a query that returns current and past jobs (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.
SELECT e.emp_name, j.jobtitle, d.department, e2.emp_name AS manager_name, m.start_date, m.end_date
FROM Employee e
JOIN JobMapping m ON m.emp_id = e.employee_id
JOIN Job j ON j.job_id = m.job_id
JOIN Department d ON d.department_id = m.department_id
JOIN Employee e2 ON e2.employee_id = m.manager_id
WHERE e.emp_name = 'Toni Lembeck';