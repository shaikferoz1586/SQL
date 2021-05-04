Create Table Employee (EmployeeId int identity(101,1), [Employee Name] varchar(100) Not Null,DateOfBirth DateTime Null
						,MonthySalary decimal(18,2),Gender varchar(10) Default('Male') )

select [Employee Name] from Employee

Insert into Employee ([Employee Name],DateOfBirth,MonthySalary,Gender) values ('Syed Nizam Uddin','1992-04-05',35250.201,'Male')
Insert into Employee ([Employee Name],DateOfBirth,MonthySalary) values ('Mohammed Azharuddin','1985-03-10',37550.601)
Insert into Employee (DateOfBirth,MonthySalary) values ('1985-03-10',37550.601)
Insert into Employee ([Employee Name],MonthySalary) values ('Inzemam',38520.101)
Insert into Employee ([Employee Name],DateOfBirth,MonthySalary) values ('Mohammed Zain','1989-03-10',39000.601)

select * from Employee

Alter table Employee Add Check (MonthySalary<40000)

Alter table Employee Add MaritalStatus varchar(10),Education varchar(20)

Update Employee set MaritalStatus = 'Married'

Update Employee set MaritalStatus = 'Married',Education = 'M.Com'
where MaritalStatus is null and EmployeeId = 107

Update Employee set Education = 'B.tech' where [Employee Name] = 'Syed Nizam Uddin'
Update Employee set Education = 'B.tech' where EmployeeId = 101
Update Employee set Education = 'M.tech' where EmployeeId = 102
Update Employee set Education = 'B.com' where EmployeeId = 104
Update Employee set Education = 'M.com' where EmployeeId = 106

delete from Employee where EmployeeId = 106

select * from Employee

Alter table Employee drop constraint UQ__Employee__67C761223AA30E09
Alter table Employee Add constraint CN_Employee_EmployeeName_Unique Unique ([Employee Name]) 

--Primary key syntax when creating a table
Create table Student (StudentId int Primary Key,StudentName varchar(50),FatherName varchar(50),DateOfBirth datetime,SectionId int)

/*Primary key syntax when table already exists*/
Create table Student (StudentId int not null,StudentName varchar(50),FatherName varchar(50),DateOfBirth datetime)
Alter table Student Add Constraint PK_Student_StudentId Primary Key (StudentId)

select * from Student
drop table Student

Insert into Student (StudentName ,FatherName ,DateOfBirth )
values ('Nizam','Shafi','1992-04-05')

Insert into Student (StudentName ,FatherName ,DateOfBirth )
values ('Hameed','ABC','1994-04-05')
drop table Section

--Foreign key syntax when creating a table
Create table Section (SectionId int Primary Key,SectionName varchar(50))

Create table Student (StudentId int Primary Key,StudentName varchar(50),FatherName varchar(50),DateOfBirth datetime
,SectionId int Foreign Key references Section(SectionId))

--Foreign key syntax when table already exists
Create table Section (SectionId int Primary Key,SectionName varchar(50))

Create table Student (StudentId int Primary Key,StudentName varchar(50),FatherName varchar(50),DateOfBirth datetime
,SectionId int)

Alter table Student Add Constraint FK_Student_SectionId Foreign Key (SectionId) references Section (SectionId)

Insert into Section (SectionId,SectionName) values (101,'Section A'),(102,'Section B'),(103,'Section C'),(104,'Section D')
select * from Section

Insert into Student (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1001,'Nizam','ABC','1994-04-05',103)
Insert into Student (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1002,'Azhar','BCD','1993-04-05',104)
Insert into Student (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1003,'Feroz','CDE','1992-04-05',101)
Insert into Student (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1004,'Hameed','DEF','1991-04-05',102)
Insert into Student (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1005,'Zain','EFG','1990-04-05',103)

drop table Student

select * from Student

select * from Section
delete from Student where sectionid = 104
delete from Section where SectionId = 103
Update Student set SectionId = 104 where StudentId = 1005

--Clustered Index
Create clustered Index Ix_Student_StudentId on Student (StudentId Desc)

--Non Clustered Index

Create Nonclustered Index Non_Ix_Student_StudentName on Student (StudentName)
Create Nonclustered Index Non_Ix_Student_StudentName_FatherName on Student (StudentName,FatherName)

----Insert, Insert Into,Update,Delete, Truncate
--Insert through giving values manually
Insert into TableName (Columns....) values (Values according to the column order)
--Insert from another table

Create table Student6300 (StudentId int Primary Key,StudentName varchar(50),FatherName varchar(50),DateOfBirth datetime
,SectionId int)
Insert into Student1 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1006,'Inzemam','ABC','1994-04-05',103)
Insert into Student1 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1007,'Imad','BCD','1993-04-05',104)
Insert into Student1 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1008,'Farooq','CDE','1992-04-05',101)
Insert into Student1 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1009,'Amjad','DEF','1991-04-05',102)
Insert into Student1 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1010,'Farhan','EFG','1990-04-05',103)
truncate table Student1
select * from Student
select * from Student1

Insert into Student (StudentId,StudentName,FatherName,DateOfBirth,SectionId)
select StudentId,StudentName,FatherName,DateOfBirth,SectionId from Student1 where SectionId <> 104

--Create a Copy table 
select * into Student_bkp from Student  --Full data copy
select * into Student_bkp from Student where 1=2  --Copy only table structure
select * into Student_bkp from Student where SectionId = 103  --Copy with partial data

Drop table Student_bkp
select StudentId,StudentName from Student
select * from Student_bkp

----- Delete and Truncate
Select * from Employee
delete from Employee where EmployeeId in (102,104) --Deleting rows based on conditions
delete from Employee --Deleting complete rows of the table 

Truncate table Employee

---Order of Query Execution
	SELECT 		TOP,DISTINCT,COLUMN,FUNCTIONS,EXP,SUB QUERY,
	FROM 		TABLE,FUNCTION,VIEW,PIVOT,UNPIVOT,JOIN,CROSS APPLY
	WHERE		<,>,=,<>,AND,OR,IN,NOT IN,BETWEEN
	GROUP BY 	COLUMN NAME
	HAVING		<,>,=,<>,AND,OR,IN,NOT IN,BETWEEN
	ORDER BY	COLUMN NAME

	Select EmployeeId,[Employee Name],DateOfBirth,MonthySalary,Gender,MaritalStatus,Education
	from Employee
	where EmployeeId = 101
	Group by [Employee Name]
	Having 
	Order by 

	select * from Student order by SectionId
	Alter table Student Add Fee int
	Update Student set Fee = 1200 where StudentId >1005

	101   2200
	102   2200
	103   4400

	select SectionId,Sum(Fee)
	from Student
	group by SectionId
	SELECT *FROM Employee
	Create table Student1586 (StudentId int Primary Key,StudentName varchar(50),FatherName varchar(50),DateOfBirth datetime
,ATTANDANCE VARCHAR (20),SectionId int)
 SELECT *FROM Student1586
  sp_help student1586 
  select * into Student from aaaa
  select  *from Student
  select *from Student_6300
  Create Nonclustered Index Non_Ix_Student_Student6300_remark on Student (StudentName,remark)
  select *from Student_6300
Insert into Student6300 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1006,'Inzemam','ABC','1994-04-05',103)
Insert into Student6300 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1007,'Imad','BCD','1993-04-05',104)
Insert into Student6300 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1008,'Farooq','CDE','1992-04-05',101)
Insert into Student6300 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1009,'Amjad','DEF','1991-04-05',102)
Insert into Student6300 (StudentId,StudentName,FatherName,DateOfBirth,SectionId) values (1010,'Farhan','EFG','1990-04-05',103)
select *from Student_6300
select *from Student6300
select * into student6301 from student6300
create nonclustered index non_ix_student6300_studentname on student6300 (studentname)
alter table student_6300 

Alter table Student_6300 Add Constraint pk_Student_6300_SectionId  primary Key
Alter table Student Add Constraint FK_Student6300_Sectionsubject Foreign Key (Sectionid) references Section (Sectionid)
select *from Student1586
select *from student6301
select *from Student6300
alter table student6301 add constraint fk_student6300_sectionid foreign key (sectionid) references studentid (sectionid)
alter table student6301 
CREATE TABLE shoeb (SN INT IDENTITY(1,1)  ,EMPLOYEENAME VARCHAR (100),CONTACT INT,FEEDBACK VARCHAR (50),SECTION INT)
SELECT *FROM YOUNUS
Insert into shoeb(EMPLOYEENAME,CONTACT,FEEDBACK,Section) values ('Inzemam',6302,'GOOD','102')
Insert into shoeb(EMPLOYEENAME,CONTACT,FEEDBACK,Section) values ('younus',6350,'GOOD','103')
Insert into shoeb(EMPLOYEENAME,CONTACT,FEEDBACK,Section) values ('moin',6302,'GOOD','104')
Insert into shoeb(EMPLOYEENAME,CONTACT,FEEDBACK,Section) values ('obed',6301,'GOOD',105)
select *from BILAL
alter table bilal add constraint sn  primary key (sn)
select*from shoeb
alter table bilal add constraint fk_BILAL_section foreign key (section) references (SHOEB) (sn)
Alter table Student Add Constraint FK_Student_SectionId Foreign Key (SectionId) references Section (SectionId)
select *from BILAL
select *FROM shoeb
ALTER TABLE BILAL ADD CONSTRAINT FK_BILAL_SN_SECTION FOREIGN KEY  (SECTION) REFERENCES SHOEB (SN)
ALTER TABLE SHOEB DROP CONSTRAINT PK_SN PRIMARY KEY (SN)
ALTER TABLE SHOEB DROP CONSTRAINT PK_SN
ALTER TABLE SHOEB DROP CONSTRAINT
ALTER TABLE SHOEB DROP COLUMN SECTION
SELECT * FROM shoeb   
ALTER TABLE SHOEB ADD SECTION INT
INSERT INTO shoeb (EMPLOYEENAME, SECTION) VALUES ('INZEMAM', 104) 
INSERT INTO shoeb (EMPLOYEENAME, SECTION) VALUES ('YOUNUS', 105) 
INSERT INTO shoeb (EMPLOYEENAME, SECTION) VALUES ('MOIN', 106) 
INSERT INTO shoeb (EMPLOYEENAME, SECTION) VALUES ('OBED', 107)
UPDATE  SHOEB  SET SECTION = 109 WHERE (SN = 4)  
UPDATE  SHOEB  SET SECTION = 110 WHERE (SN = 1)  
UPDATE  SHOEB  SET SECTION = 111 WHERE (SN = 2)  
UPDATE  SHOEB  SET SECTION = 112 WHERE (SN = 3)  
SELECT *FROM SHOEB
SELECT *FROM shoeb
ALTER TABLE SHOEB ADD CONSTRAINT PK_EMP PRIMARY KEY (EMPLOYEENAME) 
ALTER TABLE SHOEB ADD CONSTRAINT CN UNIQUE  (SECTION) 
Alter table Employee Add constraint CN_Employee_EmployeeName_Unique Unique ([Employee Name]) 
ALTER TABLE SHOEB DROP CONSTRAINT PK_SEC
ALTER TABLE SHOEB ADD CONSTRAINT SECTION NOT NULL 
--;KSDJUHGSSKXJGNS/J'DGDD--
/* SLDFKS;LOHK;LCFHKRODKFBKLDTMH;CKFMHd>MLOSASGNDHF*/
 CREATE TABLE STUDENT5 (SN INT IDENTITY(1,1) PRIMARY KEY ,STUDENTNAME VARCHAR (100)NOT NULL,CONTACT INT,FEEDBACK VARCHAR (50),SECTION INT NOT NULL)
SELECT *FROM STUDENT5
CREATE TABLE SECTION (SECTIONID INT NOT NULL,SECTIONNAME INT PRIMARY KEY)
--DDD
INSERT INTO SECTION ( STUDENTNAME,CONTACT,FEEDBACK,SECTION) VALUES ('AZHARBHAI',9874562,'GOOD',102)
INSERT INTO SECTION ( STUDENTNAME,CONTACT,FEEDBACK,SECTION) VALUES ('AMJADBHAI',123456,'GOOD',102)
INSERT INTO SECTION ( STUDENTNAME,CONTACT,FEEDBACK,SECTION) VALUES ('MATEENBHAI',998544,'GOOD',103)
INSERT INTO SECTION ( SectionId,SectionName) VALUES (1,102) 
INSERT INTO SECTION ( SectionId,SectionName) VALUES (1,103)
INSERT INTO SECTION ( SectionId,SectionName) VALUES (1,104)
INSERT INTO SECTION ( SectionId,SectionName) VALUES (1,105)
SELECT *FROM STUDENT5
SELECT *FROM SECTION

ALTER TABLE STUDENT5 ADD CONSTRAINT FK_STUDENT5_SECTION FOREIGN KEY (SECTION) REFERENCES SECTION (SECTIONNAME)

--Create a Copy table 
select * into Student_bkp from Student  --Full data copy
select * into Student_bkp from Student where 1=2  --Copy only table structure
select * into Student_bkp from Student where SectionId = 103  --Copy with partial data
SELECT * INTO STUDENT8  FROM STUDENT WHERE 1=2

select *from STUDENT5
select * from student6
alter table student5 add constraint fk_student5_contact foreign key (contact) references student6 (sn)
alter table student6 add constraint pk_SN primary key (SN)
alter column contact add constraint not null where table  student6

SELECT  * INTO STUDENT7 FROM STUDENT6
SELECT *FROM STUDENT7
ALTER TABLE STUDENT7 ADD CONSTRAINT PK_SECTION PRIMARY KEY (SECTION)
CREATE TABLE SECTION2 (SECTIONID INT PRIMARY KEY,SECTIONNAME VARCHAR (30))
INSERT INTO SECTION2 (SECTIONID,SECTIONNAME) VALUES (102,'SYED')
INSERT INTO SECTION2 (SECTIONID,SECTIONNAME) VALUES (103,'MOHAMMED')
INSERT INTO SECTION2 (SECTIONID,SECTIONNAME) VALUES (104,'UDDIN')
INSERT INTO SECTION2 (SECTIONID,SECTIONNAME) VALUES (105,'KHAN')
SELECT *FROM SECTION2
ALTER TABLE STUDENT6 ADD CONSTRAINT FK_STUDENT6_SECTION FOREIGN KEY (SECTION) REFERENCES SECTION2 (SECTIONID)
SELECT *FROM STUDENT6
--Create a Copy table 
select * into Student_bkp from Student  --Full data copy
select * into Student_bkp from Student where 1=2  --Copy only table structure
select * into Student_bkp from Student where SectionId = 103  --Copy with partial data
SELECT * INTO STUDENT9  FROM STUDENT5 WHERE 1=3
SELECT *FROM STUDENT9
ALTER TABLE STUDENT9 ADD CONSTRAINT PK_SN9 PRIMARY KEY (SN) 
ALTER TABLE STUDENT9 ADD INT IDENTITY KEY (1,1) (SN) 
ALTER TABLE STUDENT9 ADD INT IDENTITY  ON
CREATE TABLE STUDENT10 (STID INT IDENTITY (1,1) PRIMARY KEY , STDNAME VARCHAR (50) NOT NULL,CONTACT VARCHAR,SECTION INT) 
SELECT * FROM STUDENT10
SELECT * INTO STUDENT11 FROM STUDENT5 WHERE SECTION =(102)
SELECT * FROM STUDENT11
UPDATE STUDENT11 SET SECTION=100 WHERE SN = 2
UPDATE STUDENT11 SET FEEDBACK = good WHERE SN = 2
alter table student11 alter column feedback int
alter table student11 drop column feedback  
alter table student11 modify column feedback int 
alter table student11 modify studentname int
alter table student11 add column xxxx int
select * into student12 from STUDENT8
select * from student12
insert into student12 (studentname,studentclass,Gender,studentsubject,remark,feedback) values ('syed','database','male','SQL','bad','oknot')
select * from student12
insert into student12([student section]) values (1)
update student12 set [student section] where studentname = shaik
alter table student12 drop column [student section]  
insert into student12 (studentname,studentclass,Gender,studentsubject,remark,feedback) values ('md','database','male','SQL','dd','absent')
delete from  student12 where studentid in (1,2)
select *from student12
----- Delete and Truncate
Select * from Employee
delete from Employee where EmployeeId in (102,104) --Deleting rows based on conditions
delete from Employee --Deleting complete rows of the table 

delete from student12 where  studentID IN (3)
SELECT * FROM student12