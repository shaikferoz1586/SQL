/* 2ND Assignment
Using substring,replace,charindex change emailaccount column values from @gmail.com to @yahoo.com
for example azharuddin@gmail.com should be displayed as azharuddin@yahoo.com.
and null should be replaced by 'unknown@yahoo.com'*/

 select * from Employee

alter table employee add emailaccount nvarchar (200)

select *from Employee

Update Employee set EmailAccount = lower(Replace([Employee Name],' ',''))+'@gmail.com'

select *from Employee

select *,lower(Replace([Employee Name],' ',''))+'@yahoo.com' from Employee

select * from Employee

update Employee set [Employee Name] = NULL where EmployeeId = 111

select * from Employee

select *, Replace (emailaccount , '@GMAIL.COM ','@YAHOO.COM') FROM  Employee

select *, Replace (emailaccount , 'NULL','@YAHOO.COM') FROM  EmPLOYEE 

ALTER TABLE EMPLOYEE ADD EMPLOYEENAME VARCHAR(200) AFTER  [EMPLOYEE NAME]

select * from Employee
update employee  set EmployeeName = 'mohammedzain' where   EmployeeId = 106
update employee  set EmployeeName = 'shaiksalama' where   EmployeeId = 107
update employee  set EmployeeName = 'syedakram' where   EmployeeId = 111
update employee  set EmployeeName = 'syedsameer' where   EmployeeId = 110
update employee  set EmployeeName = 'syedbilal' where   EmployeeId = 113

alter table employee drop column [employee name]
alter table employee drop column  emailaccount
alter table employee drop UC_EMPLOYEE
alter table employee drop column [employee name]

alter table employee add emailaccount nvarchar (200)

select *from Employee

Update Employee set EmailAccount = lower(Replace(EmployeeName,' ',''))+'@gmail.com'

select *from Employee

select *, REPLACE(emailaccount,'@gmail.com','@yahoo.com') from  Employee

select ISNULL(EMAILACCOUNT,'UNKNOWN@GMAIL.COM') from Employee


select *from Employee
---------------------------------------------------------------------------- 

---Find out the second eldest employee from employee table --- 1ST Assignment
select * from Employee


SELECT * FROM Employee
WHERE DateOfBirth = 
                    (SELECT MAX(DATEOFBIRTH) FROM Employee WHERE DateOfBirth IN 
                    (SELECT DISTINCT TOP 2 DateOfBirth FROM Employee ORDER BY DateOfBirth ))
                    
SELECT DISTINCT DateOfBirth FROM EMPLOYEE 
SELECT TOP 100 * FROM Employee                   