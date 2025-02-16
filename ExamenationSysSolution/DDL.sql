						--Creating DatabaseExaminationSystem
create database ExaminationSystem
on
primary 
(
	name='MasterFile', --logical name 
	--filename='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MasterFile.mdf', --physical (path)
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MasterFile.mdf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
filegroup StudentsFG
(
name='SecondaryFile1', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SecondaryFile1.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
/*
(
name='SecondaryFile2', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SecondaryFile2.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='SecondaryFile3', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SecondaryFile3.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='SecondaryFile4', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SecondaryFile4.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='SecondaryFile5', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SecondaryFile5.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
*/
filegroup ExamsFG
(
name='ThirdFile1', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ThirdFile1.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
/*
(
name='ThirdFile2', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ThirdFile2.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='ThirdFile3', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ThirdFile3.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='ThirdFile4', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ThirdFile4.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='ThirdFile5', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ThirdFile5.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
*/
--
filegroup ResultsFG
(
name='FourthFile1', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FourthFile1.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
/*
(
name='FourthFile2', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FourthFile2.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='FourthFile3', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FourthFile3.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='FourthFile4', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FourthFile4.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='FourthFile5', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FourthFile5.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
*/
--
filegroup Intakes_Tracks_BranchesFG
(
name='InTrBrFile1', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\InTrBrFile1.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
)
/*
,
(
name='FifthFile2', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FifthFile2.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='FifthFile3', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FifthFile3.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='FifthFile4', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FifthFile4.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
(
name='FifthFile5', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FifthFile5.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
)
*/
,
filegroup Training_Instructors_CoursesFG 
(
name='TrInsCrsFile1', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TrInsCrsFile1.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
filegroup QuestionFG
(
name='QuestionFile1', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QuestionFile1.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
filegroup AnswerFG
(
name='AnswerFile1', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AnswerFile1.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
),
filegroup AccountFG
(
name='AccountFile1', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AccountFile1.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
)
Log on 
(
	name='ExaminationSystemLogFile', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExaminationSystemLogFile.ldf', --physical (path)
	size=100MB,
	filegrowth=10MB,
	Maxsize=unlimited
)

-- After creating the database, I use ALTER DATABASE to add a new filegroup and file
alter database ExaminationSystem 
add filegroup NextFG  ---> Added a new filegroup called NextFG

-- Adding a new file to the newly created filegroup NextFG
alter database ExaminationSystem 
add file 
(
    name='NextFile2', --logical name 
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\NextFile2.ndf', --physical (path)
	size=20MB,
	filegrowth=10%,
	Maxsize=unlimited
)to filegroup NextFG --Added new file NextFile1 to the filegroup NextFG
---------------------------------------------------------------------------------------------
--After Creating Database ExaminationSystem we Adding Tables using DDL Queries.....
Use ExaminationSystem

--1-Question Table
Create table Question 
(
	Id int primary key identity,
	Body nvarchar(100),
	Degree float ,
	QuestionType nvarchar(50),
	CourseId int foreign key references Course(Id)
) on QuestionFG
--2-MCQ Table
Create Table MCQ
(
	Id int primary key identity,
	QuestionId int Foreign key references Question(Id)
) on QuestionFG
--3-Choices Table
Create Table Choices
(
	Id int primary key identity ,
	choice nvarchar(200),
	IsTrue bit,
	McqId int foreign key references MCQ(Id)
) on QuestionFG

--4-True_False Table
Create Table True_False
(
	Id int primary key identity ,
	Answer nvarchar(200),
	QuestionId int foreign key references Question(Id)
)on QuestionFG

--5-WrittenQuestion Table
Create Table WrittenQuestion
(
	Id int primary key identity ,
	BestAnswer nvarchar(200),
	Keywords   nvarchar(200),
	QuestionId int foreign key references Question(Id)
) on QuestionFG

--6-Exam Table
Create Table Exam
(
	Id int primary key identity ,
	Name nvarchar(50),
	StartTime   datetime,
	EndTime   datetime,
	Duration  as (datediff(Minute,StartTime,EndTime)) persisted, --DrivenAttribute
	[Type] nvarchar(50),
	TotalGradesOfExam float,
	CourseId int foreign key references Course(Id),
	InsId int foreign key references Instructor(Id),
	/*
	CourseId int,
    InsId int, 
    CONSTRAINT FK_Course foreign key (CourseId) references Course(Id),
    CONSTRAINT FK_Instructor foreign key (InsId) references Instructor(Id)
	*/
) on  ExamsFG

--7-Student Table
Create table Student
(
	Id int Primary key identity,
	Fname nvarchar(50),
	Lname nvarchar(50), 
	City  nvarchar(50),
	ZibCode int,
	Phone int ,
	Gender char(1) check (Gender in ('M','F')),
	BirthDate date,
	Age as (year(getdate())-year(BirthDate)),
	AccountId int foreign key references Account(Id),
	Brn_Track_IntakeId int foreign key references Branch_Track_Intake(Id)
	/*
	AccountId int,
    Brn_Track_IntakeId int, 
    CONSTRAINT FK_AccountId foreign key (AccountId) references Account(Id),
    CONSTRAINT FK_Brn_Track_IntakeId foreign key (Brn_Track_IntakeId) references Branch_Track_Intake(Id)
	*/
) on StudentsFG

--8-Instructor Table

Create Table Instructor
(
	Id int Primary key identity,
	Fname nvarchar(50),
	Lname nvarchar(50), 
	City  nvarchar(50),
	ZibCode int,
	Phone int ,
	Gender char(1) check (Gender in ('M','F')),
	BirthDate date,
	Age as (year(getdate())-year(BirthDate)),
	Salary float ,
	AccountId int foreign key references Account(Id)
)on NextFG

--9-Course Table
Create Table Course
(
	Id int primary key identity,
	Crs_Name nvarchar(50),
	[Description] nvarchar(100),
	MaxDegree int,
	MinDegree int,
	DurationHours int,
)on Training_Instructors_CoursesFG

--10-TrainingManager Table
Create table TrainingManager
(
	Id int Primary key identity,
	Fname nvarchar(50),
	Lname nvarchar(50),
    AccountId int foreign key references Account(Id)
)on Training_Instructors_CoursesFG

--11-Branch Table
Create Table Branch
(
	Id int primary key identity,
	[Name] nvarchar(50),
	[Location] nvarchar(50),
	TrainingMng int foreign key references TrainingManager(Id)
)on Intakes_Tracks_BranchesFG

--12-Track Table
Create table Track
(
	Id int primary key identity,
	[Name] nvarchar(50),
	[Description] nvarchar(200),
)on Intakes_Tracks_BranchesFG

--13-Intake Table
Create table Intake
(
	Id int primary key identity,
	[Name] nvarchar(50),
	IntakeYear int
)on Intakes_Tracks_BranchesFG

--14-Account Table
Create table Account
(
	Id int primary key identity,
	[UserName] nvarchar(200),
	[Password] varchar(20),
)on AccountFG

--15-Exam_Question Table
Create table Exam_Question
(
	Id int Primary key identity,
	Mark float ,
	ExamId int foreign key references Exam(Id),
	QuestionId int foreign key references Question(Id)
) on ExamsFG

--16-Student_Exam Table
Create Table Student_Exam
(
	Id int Primary Key identity,
	Score int ,
	StudentId int foreign key references Student(Id),
	ExamId int foreign key references Exam(Id)
) on ResultsFG

--17-Student_Answer_Details Table
Create Table Student_Answer_Details
(
	Id int primary key identity ,
	ManualScore int ,
	StudentId int foreign key references Student(Id),
	Exam_QuestionId int foreign key references Exam_Question(Id)
) on ResultsFG

--18-Answer_MCQ Table
Create table Answer_MCQ
(
	Id int Primary key identity,
	Student_Answer_DetailsId int foreign key references Student_Answer_Details(Id),
	McqId int foreign key references MCQ(Id)
	
)on AnswerFG

--19-Answer_True_False Table
Create Table Answer_True_False
(
	Id int primary key,
	Student_Answer_DetailsId int foreign key references Student_Answer_Details(Id),
	True_FalseId int foreign key references True_False(Id)
)on AnswerFG

--20-Answer_Written Table
Create Table Answer_Written
(
	Id int primary key,
	Student_Answer_DetailsId int foreign key references Student_Answer_Details(Id),
	WrittenId int foreign key references WrittenQuestion(Id)
)on AnswerFG

--21-Answer_Choice Table
Create Table Answer_Choice
(
	Id int primary key,
	Answer_MCQId int foreign key references Answer_MCQ(Id),
	ChoiceId int foreign key references Choices(Id)
)on AnswerFG
--22-Instructor_Course_History Table
Create table Instructor_Course_History
(
	InsId int ,
	CrsId int ,
	ClassId int,
	StartDate Datetime not null,
	EndDate DateTime,
	Duration  as (datediff(month,StartDate,EndDate)/12.0) persisted, --DrivenAttribute
	 Constraint PK_Instructor_Course_History primary key (InsId, CrsId,ClassId ,StartDate), 
     Constraint FK_Instructor foreign key (InsId) references Instructor(Id) on delete no action,
     Constraint FK_Course foreign key (CrsId) references Course(Id) on delete no action,
	 Constraint FK_Class foreign key (ClassId) references Class(Id) on delete no action,
	 CONSTRAINT UQ_Class_Course UNIQUE (ClassId, CrsId)
)on Training_Instructors_CoursesFG
--23-Class Table
/*Note ==> each course may be teacher by one instructor in each class (Instructor may be changed for 
other class in other year).*/
CREATE TABLE Class
(
    Id int primary key identity,
    [Name] nvarchar(50) not  null, -- ??? ????? (??? "Spring 2024 - A")
    [Year] int not null check ([Year] >= 2000), -- ????? ????????
    Semester nvarchar(20) check (Semester in ('Spring', 'Summer', 'Fall', 'Winter')), -- ????? ???????
    CrsId int not null, -- ?????? ???????? ???? ?????

    constraint FK_Class_Course foreign key (CrsId) references Course(Id) on delete cascade,
    
    -- ?????? ?? ??? ????? ??? ????? ???? ?????? ?? ??? ????? ?????? ???????
    constraint UQ_Class unique (CrsId, Year, Semester)
)on NextFG

--24-Instructor_Course_Student Table
Create table Instructor_Course_Student
(
	ClassId int not null,
	StdId   int not null,
	CrsId   int not null,
	InsId   int not null,
	EnrollmentDate date default getdate(),
	Evaluation int check (Evaluation between 0 and 100),
	constraint PK_Ins_Crs_Std primary key (CrsId, ClassId, StdId), -- ?? ???? ???? ?????? ??? ??? ????
    constraint FK_Student foreign key (StdId) references Student(Id) on delete No Action,
    constraint FK_Course_Student foreign key (CrsId) references Course(Id) on delete No Action,
    constraint FK_Class_Student foreign key (ClassId) references Class(Id) on delete No Action,
    constraint FK_Instructor_Student foreign key (InsId) references Instructor(Id) on delete No Action,

    constraint UQ_Course_Class unique (CrsId, ClassId, InsId) -- ?? ???? ?? ??? ???? ???? ?????? ???? ???? ???
) on NextFG

--25-Branch_Track_Intake Table
Create table Branch_Track_Intake
(
	Id int primary Key Identity,
	BranchId int foreign key references Branch(Id),
	TrackId int foreign key references Track(Id),
	Intake int foreign key references Intake(Id),

) on NextFG






