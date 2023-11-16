1.DDL to implement the above schema:
-- Table creation with primary and foreign key constraints
CREATE TABLE Dept (
 Deptno INT PRIMARY KEY,
 Name VARCHAR(255),
 Location VARCHAR(255),
 Managerempid INT,
 CONSTRAINT fk_manager FOREIGN KEY (Managerempid) REFERENCES Employees(empid)
); Refer pg3 for constraint part
CREATE TABLE Employees (
 empid INT PRIMARY KEY,
 name VARCHAR(255),
 address VARCHAR(255),
 city VARCHAR(255),
 dob DATE,
 date_of_joining DATE,
 gender CHAR(1) CHECK (gender IN ('M', 'F')),
 salary DECIMAL(10, 2),
 deptno INT,
 CONSTRAINT fk_dept FOREIGN KEY (deptno) REFERENCES Dept(Deptno)
);
CREATE TABLE Project (
 Projectid INT PRIMARY KEY,
 title VARCHAR(255),
 city VARCHAR(255)
);
SQL Queries:
Consider the given Database Schema: for problem statement 1
Dept (Deptno , Name , Location, Managerempid)
Employees (name, empid, address, city, dob, date_of_joining,gender, salary, deptno)
Gender must take value ‘M’ or ‘F’.
Project(Projectid, title,city).
Works (empid , Projectid, total_hrs_worked);
Dependant(empid, name_of_dependant, age, relation)
Primary Key is underlined.
1. Develop DDL to implement the above schema enforcing primary key, check constraints (F and 
M for gender) and foreign key constraints.
2. Insert data in each table . 
3. Add column Mobile number in employee table
4. Update mobile numbers for each employee.
Develop DML to Populate Database
5. Develop a SQL query to list employees having name starting with ‘S’
6. Develop a SQL query to list department having location ‘Building 1’
7. Develop a SQL query to list employee having joining year 2019 to 2020
8. Develop a SQL query to Find the names and cities of residence of all employees who work for 
“Banking project”
9. Develop a SQL query to find time required for “Banking project”
10. Develop a SQL query to Find all employees in the database who live in the same cities as the 
project for which they work
CREATE TABLE Works (
 empid INT,
 Projectid INT,
 total_hrs_worked INT,
 PRIMARY KEY (empid, Projectid),
 CONSTRAINT fk_emp FOREIGN KEY (empid) REFERENCES Employees(empid),
 CONSTRAINT fk_project FOREIGN KEY (Projectid) REFERENCES Project(Projectid)
);
CREATE TABLE Dependant (
 empid INT,
 name_of_dependant VARCHAR(255),
 age INT,
 relation VARCHAR(255),
 PRIMARY KEY (empid, name_of_dependant),
 CONSTRAINT fk_dependant_emp FOREIGN KEY (empid) REFERENCES Employees(empid)
);
2. Insert data in each table:
-- Insert data into Dept
INSERT INTO Dept VALUES (1, 'HR', 'Building 1', 101);
-- Insert data into Employees
INSERT INTO Employees VALUES (101, 'John Doe', '123 Main St', 'City1', '1990-01-01', '2020-01-
01', 'M', 50000.00, 1);
-- Insert data into Project
INSERT INTO Project VALUES (1, 'Banking Project', 'City2');
-- Insert data into Works
INSERT INTO Works VALUES (101, 1, 40);
-- Insert data into Dependant
INSERT INTO Dependant VALUES (101, 'Jane Doe', 10, 'Child');
3. Add column Mobile number in the employee table:
ALTER TABLE Employees
ADD COLUMN Mobile_number VARCHAR(20);
4. Update mobile numbers for each employee:
UPDATE Employees
SET Mobile_number = '123-456-7890'
WHERE empid = 101;
5. SQL query to list employees having name starting with ‘S’:
SELECT * FROM Employees
WHERE name LIKE 'S%';
6. SQL query to list departments having location ‘Building 1’:
SELECT * FROM Dept
WHERE Location = 'Building 1';
7. SQL query to list employees having joining year 2019 to 2020:
SELECT * FROM Employees
WHERE YEAR(date_of_joining) BETWEEN 2019 AND 2020;
8. SQL query to find names and cities of residence of all employees who work for “Banking project”:
SELECT E.name, E.city
FROM Employees E
JOIN Works W ON E.empid = W.empid
JOIN Project P ON W.Projectid = P.Projectid
WHERE P.title = 'Banking Project';
9. SQL query to find time required for “Banking project”:
SELECT E.name, W.total_hrs_worked
FROM Employees E
JOIN Works W ON E.empid = W.empid
JOIN Project P ON W.Projectid = P.Projectid
WHERE P.title = 'Banking Project';
10. SQL query to find all employees in the database who live in the same cities as the project for
which they work:
SELECT E.name, E.city
FROM Employees E
JOIN Works W ON E.empid = W.empid
JOIN Project P ON W.Projectid = P.Projectid
WHERE E.city = P.city;Employees(empid) );
To add constriants after creating table and inserting data in all tables do the following
If you've already created a table and you want to add constraints or foreign keys afterward, you 
can use the `ALTER TABLE` statement. Here's an example:
1. Adding a Check Constraint:
ALTER TABLE Employees
ADD CONSTRAINT chk_gender CHECK (gender IN ('M', 'F'));
This assumes that the `Employees` table already exists, and you want to add a `CHECK` 
constraint for the `gender` column.
2. Adding a Foreign Key Constraint:
ALTER TABLE Dept
ADD CONSTRAINT fk_manager FOREIGN KEY (Managerempid) REFERENCES 
Employees(empid);
This assumes that the `Dept` table already exists, and you want to add a foreign key constraint 
for the `Managerempid` column referencing the `empid` column in the `Employees` table.


 1. DDL to implement the above schema:
-- Table creation with primary and foreign key constraints
CREATE TABLE Dept (
 Deptno INT PRIMARY KEY,
 Name VARCHAR(255),
 Location VARCHAR(255),
 Managerempid INT,
 CONSTRAINT fk_manager FOREIGN KEY (Managerempid) REFERENCES Employees(empid)
);
CREATE TABLE Employees (
 empid INT PRIMARY KEY,
 name VARCHAR(255),
 address VARCHAR(255),
 city VARCHAR(255),
 dob DATE,
 date_of_joining DATE,
 gender CHAR(1) CHECK (gender IN ('M', 'F')),
 salary DECIMAL(10, 2),
 deptno INT,
 CONSTRAINT fk_dept FOREIGN KEY (deptno) REFERENCES Dept(Deptno)
);
CREATE TABLE Project (
 Projectid INT PRIMARY KEY,
 title VARCHAR(255),
 city VARCHAR(255)
);
CREATE TABLE Works (
 empid INT,
 Projectid INT,
 total_hrs_worked INT,
SQL Queries:
 Consider the given Database Schema: for problem statement 1
Dept (Deptno , Name , Location, Managerempid)
Employees (name, empid, address, city, dob, date_of_joining,gender, salary, deptno)
Gender must take value ‘M’ or ‘F’.
Project(Projectid, title,city).
Works (empid , Projectid, total_hrs_worked);
Dependant(empid, name_of_dependant, age, relation)
Primary Key is underlined.
1. Develop DDL to implement the above schema enforcing primary key, check constraints (F and 
M for gender) and foreign key constraints.
2. Insert data in each table 
3. “Testing Project”is canceled so delete that entry from project
4. Develop a SQL query to display all employees having salary > 50000
5. Develop a SQL query to display all projects of “Pune”
6. Develop a SQL query to display all dependants of employee id 102
7. Develop a SQL query to Find the number of employees working on each project.
8. Develop a SQL query to find average salary of each department
9. Develop a SQL query to display senior person of “Testing Department”
10. Create a view containing the total number of employees whose project location is “Pune”
 PRIMARY KEY (empid, Projectid),
 CONSTRAINT fk_emp FOREIGN KEY (empid) REFERENCES Employees(empid),
 CONSTRAINT fk_project FOREIGN KEY (Projectid) REFERENCES Project(Projectid)
);
CREATE TABLE Dependant (
 empid INT,
 name_of_dependant VARCHAR(255),
 age INT,
 relation VARCHAR(255),
 PRIMARY KEY (empid, name_of_dependant),
 CONSTRAINT fk_dependant_emp FOREIGN KEY (empid) REFERENCES Employees(empid)
);
2. Insert data in each table:
-- Insert data into Dept
INSERT INTO Dept VALUES (1, 'HR', 'Building 1', 101);
INSERT INTO Dept VALUES (2, 'IT', 'Building 2', 102);
-- Insert data into Employees
INSERT INTO Employees VALUES (101, 'John Doe', '123 Main St', 'City1', '1990-01-01', '2020-01-
01', 'M', 50000.00, 1);
INSERT INTO Employees VALUES (102, 'Jane Smith', '456 Oak St', 'City2', '1985-05-15', '2018-06-
01', 'F', 60000.00, 2);
-- Insert data into Project
INSERT INTO Project VALUES (1, 'Banking Project', 'City2');
INSERT INTO Project VALUES (2, 'IT Upgrade', 'City1');
INSERT INTO Project VALUES (3, 'Testing Project', 'Pune');
-- Insert data into Works
INSERT INTO Works VALUES (101, 1, 40);
INSERT INTO Works VALUES (102, 2, 35);
-- Assuming some data for "Testing Project" here
-- Insert data into Dependant
INSERT INTO Dependant VALUES (101, 'Jane Doe Jr.', 5, 'Child');
INSERT INTO Dependant VALUES (102, 'Bob Smith', 8, 'Spouse');
3. “Testing Project” is canceled, so delete that entry from the project:
DELETE FROM Project WHERE title = 'Testing Project';
4. SQL query to display all employees having salary > 50000:
SELECT * FROM Employees WHERE salary > 50000;
5. SQL query to display all projects of “Pune”:
SELECT * FROM Project WHERE city = 'Pune';
6. SQL query to display all dependants of employee id 102:
SELECT * FROM Dependant WHERE empid = 102;
7. SQL query to Find the number of employees working on each project:
SELECT Project.title, COUNT(Works.empid) AS num_employees
FROM Project
LEFT JOIN Works ON Project.Projectid = Works.Projectid
GROUP BY Project.title;
8. SQL query to find average salary of each department:
SELECT Dept.Name, AVG(Employees.salary) AS avg_salary
FROM Dept
JOIN Employees ON Dept.Deptno = Employees.deptno
GROUP BY Dept.Name;
9. SQL query to display senior person of “Testing Department”:
SELECT *FROM Employees
WHERE deptno = (SELECT Deptno FROM Dept WHERE Name = 'Testing Department')
ORDER BY date_of_joining ASC
LIMIT 1;
10. Create a view containing the total number of employees whose project location is “Pune”:
CREATE VIEW EmployeesInPune AS
SELECT E.*FROM Employees E
JOIN Works W ON E.empid = W.empid
JOIN Project P ON W.Projectid = P.Projectid
WHERE P.city = 'Pune'
