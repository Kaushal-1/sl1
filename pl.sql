-- Create the Employee table
CREATE TABLE Employee (
    Empid NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Basic_Salary NUMBER,
    Type VARCHAR2(20)
);

-- Insert sample data
INSERT INTO Employee VALUES (1, 'John Doe', 30000, 'Permanent');
INSERT INTO Employee VALUES (2, 'Jane Doe', 25000, 'Temporary');

-- Create the Salary table
CREATE TABLE Salary (
    Empid NUMBER PRIMARY KEY,
    Gross_Salary NUMBER,
    Deductions NUMBER,
    Net_Salary NUMBER
);

-- Calculate and insert salary data
DECLARE
    v_income_tax CONSTANT NUMBER := 2000;
BEGIN
    FOR emp IN (SELECT * FROM Employee) LOOP
        -- Calculate DA and HRA for Permanent employees
        IF emp.Type = 'Permanent' THEN
            INSERT INTO Salary VALUES (
                emp.Empid,
                emp.Basic_Salary * 1.15 + LEAST(emp.Basic_Salary * 0.12, 20000),
                v_income_tax,
                (emp.Basic_Salary * 1.15 + LEAST(emp.Basic_Salary * 0.12, 20000)) - v_income_tax
            );
        -- For Temporary employees, only basic salary and deductions are considered
        ELSIF emp.Type = 'Temporary' THEN
            INSERT INTO Salary VALUES (
                emp.Empid,
                emp.Basic_Salary,
                v_income_tax,
                emp.Basic_Salary - v_income_tax
            );
        END IF;
    END LOOP;
END;
/

-- Create the areas table
CREATE TABLE areas (
    length NUMBER,
    breadth NUMBER,
    area NUMBER,
    perimeter NUMBER
);

-- PL/SQL block to calculate and insert values
DECLARE
    v_breadth CONSTANT NUMBER := 10;
BEGIN
    FOR v_length IN 10..20 LOOP
        -- Calculate area and perimeter for each length
        INSERT INTO areas VALUES (
            v_length,
            v_breadth,
            v_length * v_breadth, -- Area
            2 * (v_length + v_breadth) -- Perimeter
        );
    END LOOP;
END;
/
