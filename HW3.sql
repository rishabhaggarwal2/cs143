Question 1
--------------------
a.
CHECK (weight <= 3)

b.
CREATE TRIGGER T
AFTER INSERT ON Laptop
REFERENCING NEW ROW AS row
FOR EACH ROW WHEN row.weight > 3
BEGIN
	UPDATE Laptop
	SET weight = NULL
	where model =  row.model
END


Question 2
--------------------
a.
CREATE VIEW EmployeeNames AS
SELECT ename FROM Employees;

CREATE VIEW DeptInfo AS
SELECT dept, AVG(salary) avgsalary
FROM Employees GROUP BY dept;

b.
SELECT, DELETE on EmployeeNames
SELECT on DeptInfo

c.
The previous answer does not ensure this.
While he only has access to the employee name view,
he can delete all all employees except the one he wants to 
see the salary for. Then the avgsalary would just show
that employees salary.

d.
UPDATE DeptInfo
SET avgsalary = 5000 WHERE dept = 'Toy';

e.
GRANT SELECT, UPDATE ON Employees TO Joe WITH GRANT OPTION
GRANT SELECT, UPDATE ON EmployeeNames TO Joe WITH GRANT OPTION

No, because he does not have SELECT permissions on DeptInfo.

f.
REVOKE SELECT ON EmployeeNames FROM Joe CASCADE
This will remove AllNames since its dependent on EmployeeNames 
and Joe does not have access to that. He will still have access to
the Employees so he can still create and share new views on that.


Question 3
--------------------
