--Retrieve only those employees that belong to a department and are assigned permissions on the folders
SELECT f.FolderId, f.AccessType, e.EmpName, d.DeptName, c.CountryName, c.Continent
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d
ON e.DeptId=d.DepartmentId
INNER JOIN COUNTRY c
ON c.CountryId=d.CountryId
INNER JOIN FOLDER f
ON f.EmpId=e.EmpId;
