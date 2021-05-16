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

Create table Student1 (StudentId int Primary Key,StudentName varchar(50),FatherName varchar(50),DateOfBirth datetime
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

	

--	1. top , top percent, distinct

select top 100 * from Student

select top 50 percent * from Student

select * from Student
select distinct Fee from Student
select distinct sectionId from Student
select distinct sectionId,Fee from Student
select distinct FatherName from Student

----order by
select * 
from Student
order by StudentName desc

select * 
from Student
order by Fee desc,SectionId asc

select * 
from Student
order by 6,5 desc

------Top Nth Salary
select * from Employee

Insert into Employee ([Employee Name],DateOfBirth,MonthySalary,Gender) values ('Nizam','1992-04-05',30250.201,'Male')
Insert into Employee ([Employee Name],DateOfBirth,MonthySalary) values ('Azharuddin','1985-03-10',17550.601)
--Insert into Employee (DateOfBirth,MonthySalary) values ('1985-03-10',37550.601)
Insert into Employee ([Employee Name],MonthySalary) values ('Farhan',28520.101)
Insert into Employee ([Employee Name],DateOfBirth,MonthySalary) values ('Zain','1989-03-10',19000.601)


select top 1 * from Employee order by MonthySalary desc  ---Highest Salary

select top 1 * from Employee order by MonthySalary   ---Lowest Salary

select top 5 MonthySalary From Employee order by MonthySalary desc

select * from Employee 
		where MonthySalary = 
						(select Min(MonthySalary) from Employee where MonthySalary in 
								(select distinct top 4 MonthySalary from Employee order by MonthySalary desc) )

---Find out the second eldest employee from employee table ---Assignment
select * from Employee order by dateofbirth desc
--special functions (isnull, nullif, coalesce)

--where condition with And, Or, Between, In, Not In, greater than (>),less than (<), Greater than or equal to (>=), less than or equal to (<=)
--, not equal to (<>,!=), equal to (=)
select * 
from Employee 
where (EmployeeId = 101 and [Employee Name] = 'Nizam') or (MonthySalary = 30250.20)

select * 
from Employee 
where DateOfBirth between '1980-01-01 00:00:00.000' and '1989-12-31 00:00:00.000'

--ISNULL, NullIf, coalesce

select EmployeeId,[Employee Name],ISNULL(DateOfBirth,'1900-01-01 00:00:00.000'),MonthySalary,Gender from Employee
select EmployeeId,[Employee Name],DateOfBirth,MonthySalary,Gender from Employee

Update Employee Set DateOfBirth = '1900-01-01 00:00:00.000' where DateOfBirth is null

select EmployeeId,NULLIF([Employee Name],'Nizam') as [A],DateOfBirth as DOB,MonthySalary,Gender from Employee

Coalesce
select * from Employee 
Alter table Employee Add CasualName varchar(100)

Update Employee set CasualName = [Employee Name]+' Bhai'

Update Employee set CasualName = Null where EmployeeId in (103,110,108)
Update Employee set [Employee Name] = Null where EmployeeId in (108)

select EmployeeId,[Employee Name],CasualName
		,ISNULL(CasualName,[Employee Name]) ISNULLExpressionName 
		,Coalesce(CasualName,[Employee Name],'Unknown') ISNULLExpressionName 
from Employee 

-----Case statement
Insert into Employee ([Employee Name],DateOfBirth,MonthySalary,Gender) values ('ABC','1992-12-05',30250.201,'Female')
Insert into Employee ([Employee Name],DateOfBirth,MonthySalary,Gender) values ('BCD','1985-07-10',17550.601,'Female')
--Insert into Employee (DateOfBirth,MonthySalary) values ('1985-03-10',37550.601)
Insert into Employee ([Employee Name],MonthySalary,Gender) values ('CDE',28520.101,'Female')
Insert into Employee ([Employee Name],DateOfBirth,MonthySalary,Gender) values ('DEF','1989-05-10',19000.601,'Female')

Update Employee set Gender = 'M' where Gender = 'Male'
Update Employee set Gender = 'F' where Gender = 'FeMale'

select EmployeeId
,[Employee Name]
,DateOfBirth
,MonthySalary
,Gender 
,Case 
	When Gender = 'M' then 'Male' 
	When Gender = 'F' then 'Female' 
End as Gender1
,Case 
	When Gender = 'M' then 'Male' 
	Else 'Female'
End as Gender2
,CasualName
from Employee

select * from Employee
---system functions String functions,Datetime functions, int functions

select count(*) from Employee
select count(distinct [Employee Name]) from Employee

select Max(EmployeeId) from Employee
select Min(EmployeeId) from Employee
select Avg(EmployeeId) from Employee

select Max(MonthySalary) from Employee
select Min(MonthySalary) from Employee
select Avg(MonthySalary) from Employee
select SUM(MonthySalary) from Employee  --371214.70

select *,GetDate() CurrentDate,GetUTCDate() CurrentUTCDate from Employee
select GetDate(),Getutcdate()
'2021-04-18 15:24:18.780','2021-04-18 09:54:18.780'
select *,DateAdd(Year,10,DateOfBirth) from Employee  --Year
select *,DateAdd(Month,2,DateOfBirth) from Employee  --Month
select *,DateAdd(day,5,DateOfBirth) from Employee  --day
select *,DateAdd(Year,-10,DateOfBirth) from Employee  -- Negative Year

select *,DateDiff(year,DateOfBirth,GetDate()) from Employee  --DateDiff year
select *,DateDiff(month,DateOfBirth,GetDate()) from Employee  --DateDiff month
select *,DateDiff(day,DateOfBirth,GetDate()) from Employee  --DateDiff day

select *,DateName(Month,DateOfBirth) from Employee  --DateName() month
select *,DateName(week,DateOfBirth) from Employee  --DateName() week
select *,DateName(weekday,DateOfBirth) from Employee  --DateName() weekday

select *,Datepart(year,DateOfBirth) from Employee --DatePart year
select *,Datepart(month,DateOfBirth) from Employee --DatePart month
select *,Datepart(week,DateOfBirth) from Employee --DatePart week
select *,Datepart(day,DateOfBirth) from Employee --DatePart day
select *,Datepart(hour,DateOfBirth) from Employee --DatePart hour

select *,Year(DateOfBirth) from Employee
select *,Month(DateOfBirth) from Employee
select *,day(DateOfBirth) from Employee

select *,ISDate(DateOfBirth) from Employee

--String Functions
select ASCII('a'),ASCII('A'),ASCII(' '),ASCII('$')
select Char(97),Char(65),Char(32),Char(36)

select *,Charindex('a',[Employee Name],1) from Employee  --Charindex
select *,Charindex('a',[Employee Name],2) from Employee  --Charindex

select *,Left([Employee Name],2) from Employee --Left
select *,Right([Employee Name],2) from Employee --Right

select *,Lower([Employee Name]) from Employee --Lower
select *,upper([Employee Name]) from Employee --upper

select *,LTRIM([Employee Name]) from Employee --Ltrim
select *,RTRIM([Employee Name]) from Employee --Rtrim
select RTRIM('Nizam ')  'Nizam'
select LTRIM(' Zain')  'Zain'
select RTRIM(LTRIM(' Azhar '))  'Azhar'

select *,Replace([Employee Name],'Syed','SD.') from Employee  --Replace
select *,Replace([Employee Name],'Mohammed','Md.') from Employee  --Replace

select *,Reverse([Employee Name]) from Employee  --Reverse

select *,SUBString([Employee Name],3,4) from Employee  --Substring(Column or value, starting position,length)


Alter table Employee add EmailAccount nvarchar(200)
select *,lower(Replace([Employee Name],' ',''))+'@gmail.com' from Employee

Update Employee set EmailAccount = lower(Replace([Employee Name],' ',''))+'@gmail.com'
---
select *,substring from Employee

/* Assignment
Using substring,replace,charindex change emailaccount column values from @gmail.com to @yahoo.com
for example azharuddin@gmail.com should be displayed as azharuddin@yahoo.com.
and null should be replaced by 'unknown@yahoo.com'
*/
select * from Employee
select Gender,Sum(MonthySalary) from Employee group by Gender

select Gender,Max(MonthySalary) from Employee group by Gender order by Gender desc


select Gender,Max(MonthySalary) from Employee 
group by Gender
having Max(MonthySalary) < 35000

select Gender,count(MonthySalary) from Employee 
group by Gender
having count(MonthySalary) < 35000
Order by Gender desc

---More examples on Group by
--Ranking functions

 1. ROW_Number()  --get a unique sequential number for each row in the specified data
 2. Rank()  --
 3. Dense_Rank()
 4. NTILE()


create table Student (StudentName nvarchar(50),[Subject] nvarchar(50),Marks int)
insert into Student values ('Nizam','Maths',90)
insert into Student values ('Nizam','Science',70)
insert into Student values ('Nizam','English',55)
insert into Student values ('Azhar','Maths',70)
insert into Student values ('Azhar','Science',60)
insert into Student values ('Azhar','English',45)
insert into Student values ('Feroz','Maths',70)
insert into Student values ('Feroz','Science',90)
insert into Student values ('Feroz','English',65)
insert into Student values ('Amjad','Maths',60)
insert into Student values ('Amjad','Science',80)
insert into Student values ('Amjad','English',75)

select *,ROW_Number() over (order by marks desc)
from Student 

select *,ROW_Number() over (partition by [Subject] order by marks desc)
from Student 

select *,Rank() over (partition by [Subject] order by marks desc)
from Student 

select *,Dense_Rank() over (partition by [Subject] order by marks desc)
from Student 

select *,NTILE(5) over (order by StudentName)
from Student 
/*We use the NTILE(N) function to distribute the number of rows in the specified (N) number of groups.
Each row group gets its rank as per the specified condition. We need to specify the value for the desired number of groups.
*/
;with cte as (
select *,ROW_Number() over (partition by [Employee Name] order by EmployeeId) RW
From Employee
)
delete from cte where RW>1
select * from Employee

--delete from Employee where EmployeeId = 110
--Insert into Employee ([Employee Name],DateOfBirth,MonthySalary,Gender) values ('ABC','1992-12-05',30250.201,'Female')

/* Common Table Expression, also called as CTE in short form, is a temporary named result set 
that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement*/


select *, SUBSTRING(right(emailaccount,9),1,5) from EMPLOYEE

select *, SUBSTRING(right(emailaccount,9),1,5) from EMPLOYEE
Select *,SUBSTRING (Emailaccount, CHARINDEX ('@',Emailaccount,1),5) as domain FROM Employee

select *
,SUBSTRING(emailaccount
			,CHARINDEX('@',emailaccount,1)+1,LEN(EmailAccount)-CHARINDEX('@',emailaccount,1)-CHARINDEX('.',reverse(emailaccount),1)) 
			--,CHARINDEX('@',emailaccount,1)
			--,LEN(EmailAccount)-CHARINDEX('@',emailaccount,1)-CHARINDEX('.',reverse(emailaccount),1)
			,SUBSTRING(emailaccount,CHARINDEX('@',emailaccount,1)+1,LEN(EmailAccount)) 
from EMPLOYEE	

update Employee set EmailAccount = 'cde@in.com' where EmployeeId = 114

--Variables:
static variable @
tabular variable @

declare @Date datetime,@User nvarchar(50),@Int int
set @Date = getdate()
set @User = 'Nizam'
set @Int = 101100
select @Int

declare @Table table (Id int, [Name] nvarchar(50))
insert into @Table values (1,'A')
insert into @Table values (2,'B')
insert into @Table values (3,'C')
select * from @Table

--temporary table:
--local temp table (#)  --only current session 
--global temp table (##) --can be used in separate sessions
Create table #Employee (EmployeeId int,EmployeeName nvarchar(50))
insert into #Employee values (1,'A')
insert into #Employee values (2,'B')
insert into #Employee values (3,'C')

select * from #Employee

Create table ##Employee1 (EmployeeId int,EmployeeName nvarchar(50))
insert into ##Employee1 values (1,'A')
insert into ##Employee1 values (2,'B')
insert into ##Employee1 values (3,'C')

select * from ##Employee1
drop table ##Employee1


--1. Conditional Statementswor
	--if, else if, while (timecalender)

	Declare @Action nvarchar(50)
	set @Action = 'Update'

	If @Action = 'Insert'
	Begin
		select 'You are under Insert action'
	End
	Else
	Begin
		select 'You are under Else Condition'
	End

	If (@Action = 'Insert')
	Begin
	End
	Else
	Begin
		
	End

---------------Else If
	Declare @Action nvarchar(50)
	set @Action = 'delete'

	If @Action = 'Insert'
	Begin
		select 'You are under Insert action'
	End
	Else If @Action = 'Update'
	Begin
		Select 'You are under Update action'
	End
	Else
	Begin
		select 'You are under Else Condition'
	End


	select * from Employee
	Declare @EmployeeName nvarchar(50)='Ahmed'
	--set @EmployeeName='Ahmed'
	If exists(select 1 from Employee where [Employee Name] = @EmployeeName)
	Begin 
		select 'Employee '+@EmployeeName+' already exists'
	End
	Else
	Begin
		insert into Employee ([Employee Name],DateOfBirth,MonthySalary,Gender,CasualName,EmailAccount) 
					values (@EmployeeName,'1995-07-30 00:00:00.000',15000,'M',@EmployeeName + ' Bhai',@EmployeeName+'@gmail.com')
		
		select 'New Employee '+@EmployeeName+' recorded in the table'
	End

select * From Employee 
delete From Employee where [Employee Name] = 'Ahmed'

---While (Loop)
select * from Employee
select * from SubEmployee
drop table SubEmployee
Create table SubEmployee (EmployeeId int,EmployeeName nvarchar(50),Age int)
insert into SubEmployee
select EmployeeId,[Employee Name],28 from Employee

declare @I int,@MaxI int,@EmployeeId int,@EmployeeName nvarchar(50),@DateOfBirth datetime
set @I = (select Min(EmployeeId) from Employee)
set @MaxI = (select Max(EmployeeId) from Employee)
While (@I<=@MaxI)
Begin
	select @EmployeeId=EmployeeId,@EmployeeName=[Employee Name],@DateOfBirth=DateOfBirth from Employee where EmployeeId = @I

	If (@EmployeeId is not null)
	Begin 
	insert into SubEmployee (EmployeeId,EmployeeName,Age)
	select @EmployeeId,@EmployeeName,DateDiff(year,@DateOfBirth,getdate()) as Age
	End

	Set @I = @I+1
	set @EmployeeId = Null
	set @EmployeeName = Null
	Set @DateOfBirth =null
End
select * from Employee
select * from SubEmployee
truncate tab0le SubEmployee
select *,ROW_Number() over (order by [Employee Name]) RW from Employee

---Cursors
--syntax
Declare Cursor for
Query
Open Cursor
Fetch from cursor
While @@Fetch_status = 0
Begin
End
Close Cursor
Deallocate cursor

--Example
Declare @EmployeeId int,@EmployeeName nvarchar(50),@DateOfBirth datetime
Declare Employee_Cursor Cursor For
	select EmployeeId from Employee 
Open Employee_Cursor
Fetch Next from Employee_Cursor into @EmployeeId
While @@FETCH_STATUS = 0
Begin 
	select @EmployeeName=[Employee Name],@DateOfBirth=DateOfBirth from Employee where EmployeeId = @EmployeeId
	
	insert into SubEmployee (EmployeeId,EmployeeName,Age)
	select @EmployeeId,@EmployeeName,DateDiff(year,@DateOfBirth,getdate()) as Age

	Fetch Next from Employee_Cursor into @EmployeeId
End
Close Employee_Cursor
Deallocate Employee_Cursor;
------------------------
--union , union all & eXcept
select EmployeeId,[Employee Name] from Employee
Union all
select EmployeeId,EmployeeName from SubEmployee

select EmployeeId,[Employee Name] from Employee
Union
select EmployeeId,EmployeeName from SubEmployee

--Except
insert into Employee ([Employee Name],DateOfBirth,MonthySalary,Gender,CasualName,EmailAccount) 
					values ('Imad','2000-07-30 00:00:00.000',1000,'M','Imad' + ' Bhai','imad'+'@gmail.com')

select EmployeeId,[Employee Name] from Employee  --(Employee-SubEmployee)
Except
select EmployeeId,EmployeeName from SubEmployee

select EmployeeId,EmployeeName from SubEmployee  --(SubEmployee-Employee)
Except
select EmployeeId,[Employee Name] from Employee

--Intersect
select EmployeeId,[Employee Name] from Employee  --(Employee-SubEmployee)
Intersect
select EmployeeId,EmployeeName from SubEmployee

---system objects
select * from sys.tables  --for all tables in the database
select * from sys.all_columns where object_id = 5575058 --for all columns of all tables in the database
select * from sys.procedures
select * from sys.sysprocesses


--Join
1. Inner Join
2. Left Join or Left Outer Join
3. Right Join or Right Outer Join
4. Full Join
5. Cross Join

select * from DimProductCategory where ProductCategoryKey = 3
select * from DimProductSubcategory where ProductSubcategoryKey = 21
select * from DimProduct where ProductKey = 488

select DP.ProductKey,DP.EnglishProductName,DP.StandardCost,DP.Color,DPSC.ProductSubcategoryKey,DPSC.EnglishProductSubcategoryName
,DPC.ProductCategoryKey,DPC.EnglishProductCategoryName
from DimProduct DP
Inner Join DimProductSubcategory DPSC on DP.ProductSubcategoryKey = DPSC.ProductSubcategoryKey
Inner Join DimProductCategory DPC on DPSC.ProductCategoryKey = DPC.ProductCategoryKey

---Left Join
select DimProduct.ProductKey,DimProduct.EnglishProductName,DimProduct.StandardCost,DimProduct.Color,DimProductSubcategory.ProductSubcategoryKey,ISNULL(DimProductSubcategory.EnglishProductSubcategoryName,'UnknownSubCategory') EnglishProductSubcategoryName
,DimProductCategory.ProductCategoryKey,DimProductCategory.EnglishProductCategoryName
from DimProduct   --606
Left Join DimProductSubcategory  on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey  ---397
Left Join DimProductCategory on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey  --297

--Right Join
select DimProduct.ProductKey,DimProduct.EnglishProductName,DimProduct.StandardCost,DimProduct.Color,DimProductSubcategory.ProductSubcategoryKey,ISNULL(DimProductSubcategory.EnglishProductSubcategoryName,'UnknownSubCategory') EnglishProductSubcategoryName
,DimProductCategory.ProductCategoryKey,DimProductCategory.EnglishProductCategoryName
from DimProductCategory
Inner Join DimProductSubcategory  on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey  --297 --606
Right Join DimProduct   on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey  ---397

--Full Join  -- Try with 2 simple tables 

--Cross Join
select * from DimProductSubcategory 
select * from DimProductCategory

select DimProductSubcategory.ProductSubcategoryKey,DimProductCategory.ProductCategoryKey
from DimProductSubcategory 
Cross Join DimProductCategory
order by 1

--Self Join
select * 
from DimProductCategory A
inner join DimProductCategory B on A.ProductCategoryKey = B.ProductCategoryKey

select * from DimProductSubcategory

---Common table expression

;with cte as 
(
select DP.ProductKey,DP.EnglishProductName,DP.StandardCost,DP.Color,DPSC.ProductSubcategoryKey,DPSC.EnglishProductSubcategoryName
,DPC.ProductCategoryKey,DPC.EnglishProductCategoryName
from DimProduct DP
Inner Join DimProductSubcategory DPSC on DP.ProductSubcategoryKey = DPSC.ProductSubcategoryKey
Inner Join DimProductCategory DPC on DPSC.ProductCategoryKey = DPC.ProductCategoryKey
)
select * from cte

---transactions
Begin Tran
delete from DimProduct where EnglishProductName = 'Bearing Ball'

select * from DimProduct where EnglishProductName = 'Bearing Ball'
commit Tran

--Exception Handling

BEGIN TRY
BEGIN TRANSACTION;
Update DimProduct set EnglishProductName = 'B' where EnglishProductName = 'Blade'
Update DimProduct1 set ProductSubcategoryKey = 'A' where EnglishProductName = 'B'
COMMIT TRANSACTION;   
END TRY    

BEGIN CATCH                  
ROLLBACK TRANSACTION; 
DECLARE @ErrorMessage nvarchar(4000),    
    @ErrorLine int,     
    @ErrorProcedure nvarchar(4000),
    @ErrorSeverity int,        
    @ErrorState int           
            
SELECT                  
  @ErrorMessage = ERROR_MESSAGE(),       
  @ErrorLine = ERROR_LINE(),       
  @ErrorProcedure = ERROR_PROCEDURE(),                  
  @ErrorState = ERROR_STATE(),     
  @ErrorSeverity = ERROR_SEVERITY();     
   
 RAISERROR (@ErrorMessage, -- Message text.                  
    @ErrorSeverity, -- Severity.                  
    @ErrorState -- State.                  
    );                  
                  
END CATCH   
 

 select * from DimProduct where EnglishProductName = 'B'
-----Group by repeat

select top 10000 CustomerProfileId,QuoteId,TPID,ContractNumber,PCBValue from QuoteHistorical
order by 1,2,3

select CustomerProfileId,SUM(PCBValue) PCBValue from QuoteHistorical 
where CustomerProfileId = 700010
group by CustomerProfileId
order by 1

select top 10000 CustomerProfileId,QuoteId,TPID,ContractNumber,PCBValue from QuoteHistorical where CustomerProfileId = 700010 order by 1,2
select CustomerProfileId,SUM(PCBValue) PCBValue from QuoteHistorical 
where CustomerProfileId = 700010
group by CustomerProfileId


select CustomerProfileId,QuoteID,SUM(PCBValue) PCBValue from QuoteHistorical 
where CustomerProfileId = 700010
group by CustomerProfileId,QuoteID

--select top 10000 CustomerProfileId,QuoteId,TPID,ContractNumber,PCBValue from QuoteHistorical where CustomerProfileId = 700010 order by 1,2
select CustomerProfileId,QuoteID,TPID,SUM(PCBValue) PCBValue from QuoteHistorical 
where CustomerProfileId = 700010
group by CustomerProfileId,QuoteID,TPID

select Gender,MarritalStatus,Count(*) from DimCustomer group by Gender,MarritalStatus

select MarritalStatus,Gender,Count(*) from DimCustomer group by MarritalStatus,Gender

---Pivot & Unpivot
--converting rows to column is called Pivot
--Coverting columns to rows is called unpivot

Create table #Student (StudentName nvarchar(50),[Subject] nvarchar(50),Marks int)
insert into #Student Values ('Nizam','Hindi',70)
insert into #Student Values ('Nizam','English',60)
insert into #Student Values ('Nizam','Maths',50)
insert into #Student Values ('Nizam','Science',80)
insert into #Student Values ('Nizam','Social',70)
insert into #Student Values ('Amjad','Hindi',75)
insert into #Student Values ('Amjad','English',79)
insert into #Student Values ('Amjad','Maths',70)
insert into #Student Values ('Amjad','Science',88)
insert into #Student Values ('Amjad','Social',91)
insert into #Student Values ('Feroz','Hindi',70)
insert into #Student Values ('Feroz','English',70)
insert into #Student Values ('Feroz','Maths',65)
insert into #Student Values ('Feroz','Science',71)
insert into #Student Values ('Feroz','Social',73)
insert into #Student Values ('Azhar','Hindi',74)
insert into #Student Values ('Azhar','English',75)
insert into #Student Values ('Azhar','Maths',80)
insert into #Student Values ('Azhar','Science',81)
insert into #Student Values ('Azhar','Social',90)
insert into #Student Values ('Hameed','Hindi',95)
insert into #Student Values ('Hameed','English',56)
insert into #Student Values ('Hameed','Maths',66)
insert into #Student Values ('Hameed','Science',60)
insert into #Student Values ('Hameed','Social',77)

--Pivot
select * 
from #Student S
Pivot (Max(Marks) for [Subject] in ([Hindi],[English],[Maths],[Science],[Social]) ) as Pvt

Create table #Student2 (StudentName nvarchar(50),Hindi int,English int,Maths int,Science int,Social int)
insert into #Student2 values ('Amjad',75,79,70,88,91)
insert into #Student2 values ('Azhar',74,75,80,81,90)
insert into #Student2 values ('Feroz',70,70,65,71,73)
insert into #Student2 values ('Hameed',95,56,66,60,77)
insert into #Student2 values ('Nizam',70,60,50,80,70)

--Unpivot
select * 
from #Student2 S
UnPivot (Marks for [Subject] in ([Hindi],[English],[Maths],[Science],[Social])) UnP

------Sub Queries (Correlated/UnCorrelated)
--Uncorrelated Sub Query: A sub query which does not depend on out main query
--Correlated Sub Query: A sub query which depend on out main query
drop table department
CREATE TABLE department
( 
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL, 
  capacity INT NULL, 
)

INSERT INTO department 
  VALUES (1, 'English', 300), 
         (2, 'Computer', 450), 
         (3, 'Civil', 400),
         (4, 'Maths', 400),
         (5, 'History', 300)

select * from #department

CREATE TABLE student3
(  
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  gender VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  dep_id INT NOT NULL    
)

INSERT INTO student3
  VALUES (1, 'Jolly', 'Female', 20, 4), 
         (2, 'Jon', 'Male', 22, 3),
         (3, 'Sara', 'Female', 25, 4),
         (4, 'Laura', 'Female', 18, 2),
         (5, 'Alan', 'Male', 20, 3),
         (6, 'Kate', 'Female', 22, 2),
         (7, 'Joseph', 'Male', 18, 2),
         (8, 'Mice', 'Male', 23, 1),
         (9, 'Wise', 'Male', 21, 5),
         (10, 'Elis', 'Female', 27, 2);

select * from #department
select * from #student3

--Uncorrelated Sub Query

select * from #student3 where dep_id = (select id from #department where [Name] = 'Maths')

Select S.*,D.name 
from #student3 S
Join #department D on S.dep_id = D.id
where D.[name] = 'Maths'

select * from #student3 where dep_id in (select id from #department )

--Correlated Sub Query

get all the students of all the departments whose age is greater than the average age in that department.
select * from #Student3 order by dep_id

select * from #Student3 S1 where Age >= (select Avg(Age) from #student3 S2 where S1.dep_id = S2.dep_id)

select *,(select Name from #department D where S.dep_id = D.Id) Dept_name
from #student3 S

-----Views
--Its a virtual table defined by the query 
/*Views are mainly created for security purpose in order to restrict user access to specific columns. 
These are also created for simplification purpose in order to encapsulate frequently executed, complex queries that read from multiple tables each time.*/
/*
it is a virtual table
	it is aobject of a database 
	it is used for resolved result set (reuasability) or security
	it reduces the network traffic
	query is saved on the server
*/
Create View VW_Student 
as
Select S.*,D.name Dept_Name
from student3 S
Join department D on S.dep_id = D.id

select * from VW_Student
drop view VW_department

Create View VW_department
as
select Id,name from department

select * from VW_department

insert into VW_department (Id,name)
values (6,'Science')

select * from department 

select * from VW_Student
insert into VW_Student (Id,[name],Gender,Age,dep_id,Dept_Name)
values (11,'Nizam','Male',27,6,'Science')

---User Define Functions
/*
	1. Scalar Function  --Returns single value
	2. inline Function  --Returns tabular structure
	3. Table valued Function  --Returns Tabular structure
*/

--Scalar Function

Create function dbo.FnGetOrderValue (@OrderQuantity int,@ProductValue float)
returns float
as
Begin 
	return (@OrderQuantity*@ProductValue)
	
End

select dbo.FnGetOrderValue (5,-99)
drop function dbo.FnFindAge
Create function dbo.FnFindAge (@DateOfBirth datetime)
returns int
as
Begin 
	Declare @TotalValue Int
	set @TotalValue = Datediff(year,@DateOfBirth,getdate())
	
	Return @TotalValue
End


select getdate()
select dbo.FnFindAge ('1992-03-05 00:00:00.000')

---Inline Function
drop function dbo.InlineExample
Create Function dbo.InlineExample (@dept_Name nvarchar(50))
returns table
as
return (
Select S.*,D.name Dept_Name
from student3 S
Join department D on S.dep_id = D.id
where D.[name] = @dept_Name
)


---Multivalued function
Create Function dbo.Multivalued1 (@dept_Name nvarchar(50))
returns @Table table (Id int,Name nvarchar(50),gender nvarchar(10),age int,dep_id int,Dept_name nvarchar(50))
as
Begin


insert into @Table
Select S.*,D.name Dept_Name 
from student3 S
Join department D on S.dep_id = D.id
where D.[name] = @dept_Name

Return;

End
select * from dbo.Multivalued1('Computer')

---Cross Apply
--XML, JSON

select * 
from department for xml path('row'),Root('rows')
/*<Department>
  <id>1</id>
  <name>English</name>
  <capacity>300</capacity>
</Department>
<Department>
  <id>2</id>
  <name>Computer</name>
  <capacity>450</capacity>
</Department>
<Department>
  <id>3</id>
  <name>Civil</name>
  <capacity>400</capacity>
</Department>
<Department>
  <id>4</id>
  <name>Maths</name>
  <capacity>400</capacity>
</Department>
<Department>
  <id>5</id>
  <name>History</name>
  <capacity>300</capacity>
</Department>
<Department>
  <id>6</id>
  <name>Science</name>
</Department>*/

select * from department for xml Auto
/*<department id="1" name="English" capacity="300" />
<department id="2" name="Computer" capacity="450" />
<department id="3" name="Civil" capacity="400" />
<department id="4" name="Maths" capacity="400" />
<department id="5" name="History" capacity="300" />
<department id="6" name="Science" />*/


Declare @XML xml
set @XML = '<rows>
  <row>
    <id>1</id>
    <name>English</name>
    <capacity>300</capacity>
  </row>
  <row>
    <id>2</id>
    <name>Computer</name>
    <capacity>450</capacity>
  </row>
  <row>
    <id>3</id>
    <name>Civil</name>
    <capacity>400</capacity>
  </row>
  <row>
    <id>4</id>
    <name>Maths</name>
    <capacity>400</capacity>
  </row>
  <row>
    <id>5</id>
    <name>History</name>
    <capacity>300</capacity>
  </row>
  <row>
    <id>6</id>
    <name>Science</name>
  </row>
</rows>'

--SELECT  
--       Tbl.Col.value('id', 'varchar(50)'),  
--       Tbl.Col.value('name', 'varchar(50)'),  
--       Tbl.Col.value('capacity', 'varchar(50)')
--FROM   @XMLData.nodes('//Department') Tbl(Col)

select * from OPENXML(@XML, '/rows/row/',2)
with (
 id nvarchar(50)  
,[name] nvarchar(50) 
,capacity nvarchar(50) 
) A

---JSON
select * from department for JSON auto
select * from department for JSON auto,include_null_values
select * from department for JSON path ,Root('Depart')
/*[{
	"id": 1,
	"name": "English",
	"capacity": 300
	},
	{
	"id": 2,
	"name": "Computer",
	"capacity": 450
	},
	{
	"id": 3,
	"name": "Civil",
	"capacity": 400
	},
	{
	"id": 4,
	"name": "Maths",
	"capacity": 400
	},
	{
	"id": 5,
	"name": "History",
	"capacity": 300
	},
	{
	"id": 6,
	"name": "Science"
	}]*/

Declare @JSON nvarchar(max) 
Set @JSON = '[{"id": 1,"name": "English","capacity": 300},{"id": 2,"name": "Computer","capacity": 450},{"id": 3,"name": "Civil","capacity": 400},
	{"id": 4,"name": "Maths","capacity": 400},{"id": 5,"name": "History","capacity": 300},{"id": 6,"name": "Science"}]'

select * from OPENJSON(@JSON)
with (
	id int
	,[name] nvarchar(50)
	,capacity nvarchar(50)
)

Declare @JSON1 nvarchar(max) 
Set @JSON1 = '[{"id": 1,"name": "English","capacity": 300},{"id": 2,"name": "Computer","capacity": 450},{"id": 3,"name": "Civil","capacity": 400},
	{"id": 4,"name": "Maths","capacity": 400},{"id": 5,"name": "History","capacity": 300},{"id": 6,"name": "Science"}]'
select * 
from Student3 S
CROSS Apply OPENJSON(@JSON1)
with 
(
	id int
	,[name] nvarchar(50)
) D
where S.dep_Id = D.Id

Declare @JSON1 nvarchar(max) 
Set @JSON1 = '{"Depart": [{"id": 1,"name": "English","capacity": 300},{"id": 2,"name": "Computer","capacity": 450},{"id": 3,"name": "Civil","capacity": 400},
{"id": 4,"name": "Maths","capacity": 400},{"id": 5,"name": "History","capacity": 300},{"id": 6,"name": "Science"}]}'

select * from OPENJSON(@JSON1,'$.Depart')
with (
	id int
	,[name] nvarchar(50)
	,capacity nvarchar(50)
)

----Stored Procedure
--A set of statements running together
Create procedure Testprocedure
as
Begin
	
	Create table Product (ProductId int,ProductName nvarchar(50),SellingCost float,ProductCost float,discount int)

	insert into Product values (1,'Wheels',500,300,10)
	insert into Product values (1,'Side Mirror',1000,700,15)
	insert into Product values (1,'front mirror',1500,1300,5)
	insert into Product values (1,'Break Liner',600,400,15)

		select * from Product 

	Drop table Product 
	
	

	
End

Alter procedure Testprocedure
as
Begin
	
	Create table Product (ProductId int,ProductName nvarchar(50),SellingCost float,ProductCost float,discount int)

	insert into Product values (1,'Wheels',500,300,10)
	insert into Product values (1,'Side Mirror',1000,700,15)
	insert into Product values (1,'front mirror',1500,1300,5)
	insert into Product values (1,'Break Liner',600,400,15)

		select * from Product 

	Drop table Product 
		
End


execute Testprocedure
	select * from Product 
exec Testprocedure


Alter Procedure TestJSON (@JSON nvarchar(max))
as
Begin
	
	select * from OPENJSON(@JSON,'$.Depart')
	with 
	(
		id int,
		[name] nvarchar(50),
		capacity int
	)

End

Exec TestJSON '{"Depart": [{"id": 1,"name": "English","capacity": 300},{"id": 2,"name": "Computer","capacity": 450},{"id": 3,"name": "Civil","capacity": 400},
{"id": 4,"name": "Maths","capacity": 400},{"id": 5,"name": "History","capacity": 300},{"id": 6,"name": "Science"}]}'

Create function FnGetJSON (@JSON nvarchar(max))
returns table
as
return (select * from OPENJSON(@JSON,'$.Depart')
	with 
	(
		id int,
		[name] nvarchar(50),
		capacity int
	))

select * from dbo.FnGetJSON ('{"Depart": [{"id": 1,"name": "English","capacity": 300},{"id": 2,"name": "Computer","capacity": 450},{"id": 3,"name": "Civil","capacity": 400},
{"id": 4,"name": "Maths","capacity": 400},{"id": 5,"name": "History","capacity": 300},{"id": 6,"name": "Science"}]}')

Alter Procedure TestJSON (@JSON nvarchar(max))
as
Begin
	
	select * from dbo.FnGetJSON(@JSON)

End

Exec TestJSON '{"Depart": [{"id": 1,"name": "English","capacity": 300},{"id": 2,"name": "Computer","capacity": 450},{"id": 3,"name": "Civil","capacity": 400},
{"id": 4,"name": "Maths","capacity": 400},{"id": 5,"name": "History","capacity": 300},{"id": 6,"name": "Science"}]}'

Alter function FnGetJSON (@JSON nvarchar(max))
returns table
as
return (exec TestJSON(@JSON))

--Can we call procedure inside the function  --No
--Can we call procedure inside the procedure  --Yes
--Can we call function inside the procedure  --Yes
--Can we call function inside the function  --Yes

Create table [TestUser] (UserId int,UserName nvarchar(100),DisplayName nvarchar(100),[Password] nvarchar(100),IsActive bit)
Insert into [TestUser] values (1,'syednizam100@gmail.com','Syed Nizam Uddin','Pass@123',1)
Insert into [TestUser] values (2,'Feroz100@gmail.com','Shaik Feroz','abc@123',1)
Insert into [TestUser] values (3,'Azhar100@gmail.com','Mohammed Azhar Uddin','xyz@123',1)
Insert into [TestUser] values (4,'Amjad100@gmail.com','Amjad Ali','Pass@321',1)
select * from [TestUser]

Alter Procedure LoginTest (@UserName nvarchar(50),@Password nvarchar(50))
as
Begin
declare @Displayname nvarchar(50)

If Exists(select 1 from [TestUser] where UserName = @UserName)
Begin 
	Print 'UserName exists'

	If (@Password = (select [Password] from [TestUser] where UserName = @UserName))
	Begin 
		
		Set @Displayname = (select DisplayName from [TestUser] where UserName = @UserName)
		Print 'Password matched'
		select 'Login Successful for User '+ @Displayname 
	End
	Else
	Begin
	    
		Set @Displayname = (select DisplayName from [TestUser] where UserName = @UserName)
		Print 'Password Unmatched'
		select 'Login Denied for User ' +@Displayname + '. Reason: Incorrect Password'
	End
End
Else
Begin
	Select 'Login Denied. Reason: Incorrect UserName'
End

End

Exec LoginTest 'syednizam100@gmail.com','Pass@321'

----Triggers (For/After Triggers/Instead Of Triggers)
/*

*/
select * from [Testuser]
Create table TestLog (TableName nvarchar(50),[Action] nvarchar(100),RecordTime datetime)

Create Trigger ForTriggerEx on [Testuser]
After Insert
as
Insert into TestLog values ('Testuser','user inserted',getdate())


Insert into [TestUser] values (4,'syednizam100@yahoo.com','Syed Nizam Uddin2','Pass@1234',1)

select * from [Testuser]
select * from TestLog

Create Trigger InsteadTriggerEx on [Testuser]
Instead Of Update
as
Insert into TestLog values ('Testuser','User tried to update',getdate())

Update [Testuser] set IsActive = 0 where UserId = 1





