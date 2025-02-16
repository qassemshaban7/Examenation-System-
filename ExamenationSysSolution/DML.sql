---->INSERT INTO Answer_True_False
select * from exammanagement.Answer_True_False
select * from exammanagement.Student_Answer_Details
select * from exammanagement.true_false
select * from exammanagement.mcq
select * from exammanagement.Answer_Written



INSERT INTO Answer_True_False (id, Student_Answer_DetailsId, True_FalseId)
VALUES
(1, 1, 1), (2, 1, 2), (3, 2, 3), (4, 2, 4), (5, 3, 5), (6, 3, 6), (7, 4, 7), (8, 4, 8), (9, 5, 9),
(10, 5, 10), (11, 6, 11), (12, 6, 12), (13, 7, 13), (14, 7, 14), (15, 8, 15), (16, 8, 16), (17, 9, 17),
(18, 9, 1), (19, 10, 2), (20, 10, 3), (21, 11, 4), (22, 11, 5), (23, 12, 6), (24, 12, 7), (25, 13, 8),
(26, 13, 9), (27, 14, 10), (28, 14, 11), (29, 15, 12), (30, 15, 13), (31, 16, 14), (32, 16, 15), (33, 17, 16),
(34, 17, 17), (35, 1, 1), (36, 1, 2), (37, 2, 3), (38, 2, 4), (39, 3, 5), (40, 3, 6), (41, 4, 7),
(42, 4, 8), (43, 5, 9), (44, 5, 10), (45, 6, 11), (46, 6, 12), (47, 7, 13), (48, 7, 14), (49, 8, 15),
(50, 8, 16), (51, 9, 17), (52, 9, 1), (53, 10, 2), (54, 10, 3), (55, 11, 4), (56, 11, 5), (57, 12, 6),
(58, 12, 7), (59, 13, 8), (60, 13, 9), (61, 14, 10), (62, 14, 11), (63, 15, 12), (64, 15, 13), (65, 16, 14),
(66, 16, 15), (67, 17, 16), (68, 17, 17), (69, 1, 1), (70, 1, 2), (71, 2, 3), (72, 2, 4), (73, 3, 5),
(74, 3, 6), (75, 4, 7), (76, 4, 8), (77, 5, 9), (78, 5, 10), (79, 6, 11), (80, 6, 12), (81, 7, 13),
(82, 7, 14), (83, 8, 15), (84, 8, 16), (85, 9, 17), (86, 9, 1), (87, 10, 2), (88, 10, 3), (89, 11, 4),
(90, 11, 5);
---------------------------------------------------------------------------------------
--->INSERT INTO Answer_Written
use db_aa988f_examinationsystem
select * from exammanagement.Answer_Written
select * from Student_Answer_Details
select * from WrittenQuestion


INSERT INTO Answer_Written (Id, Student_Answer_DetailsId, WrittenId)
VALUES
(1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9),
(10, 10, 10), (11, 11, 11), (12, 12, 12), (13, 13, 13), (14, 14, 1), (15, 15, 2), (16, 16, 3), (17, 17, 4),
(18, 18, 5), (19, 19, 6), (20, 20, 7), (21, 21, 8), (22, 22, 9), (23, 23, 10), (24, 24, 11), (25, 25, 12),
(26, 26, 13), (27, 27, 1), (28, 28, 2), (29, 29, 3), (30, 30, 4), (31, 31, 5), (32, 32, 6), (33, 33, 7),
(34, 34, 8), (35, 35, 9), (36, 36, 10), (37, 37, 11), (38, 38, 12), (39, 39, 13), (40, 40, 1), (41, 41, 2),
(42, 42, 3), (43, 43, 4), (44, 44, 5), (45, 45, 6), (46, 46, 7), (47, 47, 8), (48, 48, 9), (49, 49, 10),
(50, 50, 11), (51, 51, 12), (52, 52, 13), (53, 53, 1), (54, 54, 2), (55, 55, 3), (56, 56, 4), (57, 57, 5),
(58, 58, 6), (59, 59, 7), (60, 60, 8), (61, 61, 9), (62, 62, 10), (63, 63, 11), (64, 64, 12), (65, 65, 13),
(66, 66, 1), (67, 67, 2), (68, 68, 3), (69, 69, 4), (70, 70, 5), (71, 71, 6), (72, 72, 7), (73, 73, 8),
(74, 74, 9), (75, 75, 10), (76, 76, 11), (77, 77, 12), (78, 78, 13), (79, 79, 1), (80, 80, 2), (81, 81, 3),
(82, 82, 4), (83, 83, 5), (84, 84, 6), (85, 85, 7), (86, 86, 8), (87, 87, 9), (88, 88, 10), (89, 89, 11),
(90, 90, 12);
---------------------------------------------------------------------------------------
----->INSERT INTO Branch_Track_Intake
select * from Branch
select * from Track
select * from Intake

select * FROM Branch_Track_Intake



INSERT INTO Branch_Track_Intake
VALUES
    -- BranchId 1
    (1, 1, 1), (1, 1, 2), (1, 1, 3), (1, 1, 4), (1, 1, 5),
    (1, 1, 6), (1, 1, 7), (1, 1, 8), (1, 1, 9), (1, 1, 10),
    (1, 1, 11), (1, 1, 12), (1, 1, 13), (1, 1, 14), (1, 1, 15),
    (1, 1, 16), (1, 1, 17), (1, 1, 18), (1, 1, 19), (1, 1, 20),
    (1, 1, 21), (1, 1, 22), (1, 1, 23), (1, 1, 24), (1, 1, 25),
    (1, 1, 26), (1, 1, 27), (1, 1, 28), (1, 1, 29), (1, 1, 30),
    (1, 1, 31), (1, 1, 32), (1, 1, 33), (1, 1, 34), (1, 1, 35),
    (1, 1, 36), (1, 1, 37), (1, 1, 38), (1, 1, 39), (1, 1, 40),
    (1, 1, 41), (1, 1, 42), (1, 1, 43), (1, 1, 44), (1, 1, 45),
    (1, 1, 46), (1, 1, 47), (1, 1, 48), (1, 1, 49), (1, 1, 50),
    -- BranchId 2
    (2, 1, 1), (2, 1, 2), (2, 1, 3), (2, 1, 4), (2, 1, 5),
    (2, 1, 6), (2, 1, 7), (2, 1, 8), (2, 1, 9), (2, 1, 10),
    -- Add more combinations for BranchId 2 to BranchId 15 and TrackId 1 to 10
    (2, 10, 50),
    (3, 1, 1), (3, 1, 2), (3, 1, 3),(3, 10, 50), -- BranchId 3
    (4, 1, 1), (4, 1, 2), (4, 1, 3),(4, 10, 50), -- BranchId 4
    
    (15, 10, 50); 
	
	
	
	
	
	INSERT INTO Branch_Track_Intake
VALUES
    -- BranchId 1
    (2, 1, 1), (2, 1, 2), (2, 1, 3), (2, 1, 4), (2, 1, 5),
    (2, 1, 6), (2, 1, 7), (2, 1, 8), (2, 1, 9), (2, 1, 10),
    (2, 1, 11), (2, 1, 12), (2, 1, 13), (2, 1, 14), (2, 1, 15),
    (2, 1, 16), (2, 1, 17), (2, 1, 18), (2, 1, 19), (2, 1, 20),
    (2, 1, 21), (2, 1, 22), (2, 1, 23), (2, 1, 24), (2, 1, 25),
    (2, 1, 26), (2, 1, 27), (2, 1, 28), (2, 1, 29), (2, 1, 30)





	-- BranchId 2
INSERT INTO Branch_Track_Intake 
VALUES
    (2, 1, 1), (2, 1, 2), (2, 1, 3),(2, 10, 50); -- BranchId 2, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 3
INSERT INTO Branch_Track_Intake 
VALUES
    (3, 1, 1), (3, 1, 2), (3, 1, 3),(3, 10, 50); -- BranchId 3, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 4
INSERT INTO Branch_Track_Intake
VALUES
    (4, 1, 1), (4, 1, 2), (4, 1, 3),(4, 10, 50); -- BranchId 4, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 5
INSERT INTO Branch_Track_Intake
VALUES
    (5, 1, 1), (5, 1, 2), (5, 1, 3),(5, 10, 50); -- BranchId 5, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 6
INSERT INTO Branch_Track_Intake
VALUES
    (6, 1, 1), (6, 1, 2), (6, 1, 3), (6, 10, 50); -- BranchId 6, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 7
INSERT INTO Branch_Track_Intake
VALUES
    (7, 1, 1), (7, 1, 2), (7, 1, 3),(7, 10, 50); -- BranchId 7, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 8
INSERT INTO Branch_Track_Intake
VALUES
    (8, 1, 1), (8, 1, 2), (8, 1, 3),(8, 10, 50); -- BranchId 8, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 9
INSERT INTO Branch_Track_Intake
VALUES
    (9, 1, 1), (9, 1, 2), (9, 1, 3),(9, 10, 50); -- BranchId 9, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 10
INSERT INTO Branch_Track_Intake
VALUES
    (10, 1, 1), (10, 1, 2), (10, 1, 3),(10, 10, 50); -- BranchId 10, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 11
INSERT INTO Branch_Track_Intake
VALUES
    (11, 1, 1), (11, 1, 2), (11, 1, 3),(11, 10, 50); -- BranchId 11, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 12
INSERT INTO Branch_Track_Intake
VALUES
    (12, 1, 1), (12, 1, 2), (12, 1, 3),(12, 10, 50); -- BranchId 12, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 13
INSERT INTO Branch_Track_Intake
VALUES
    (13, 1, 1), (13, 1, 2), (13, 1, 3),(13, 10, 50); -- BranchId 13, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 14
INSERT INTO Branch_Track_Intake
VALUES
    (14, 1, 1), (14, 1, 2), (14, 1, 3),(14, 10, 50); -- BranchId 14, TrackId 1 to 10, IntakeId 1 to 50

-- BranchId 15
INSERT INTO Branch_Track_Intake
VALUES
    (15, 1, 1), (15, 1, 2), (15, 1, 3),(15, 10, 50); -- BranchId 15, TrackId 1 to 10, IntakeId 1 to 50
------------------------------------------------------------------------------------------------
------>INSERT INTO Course
select * from AcademicRecords.Course
select * from exammanagement.Question where courseid =6

ALTER TABLE Course
ADD CONSTRAINT FK_Course_Instructor
FOREIGN KEY (InstructorId) REFERENCES Instructor(Id);

alter table Course
add InstructorId int

delete from Course
DBCC CHECKIDENT ('Course', RESEED, 0);

select * from Instructor
select * from Question

ALTER TABLE Course
ALTER COLUMN Description VARCHAR(500);


-- .Net Development Track Courses
INSERT INTO Course
VALUES 
    ('C# Programming', 'Learn the fundamentals of C# programming including object-oriented principles and .NET applications.', 100, 50, 80, 1),
    ('SQL Fundamentals', 'Learn the basics of SQL, relational databases, and writing efficient queries.', 90, 45, 60, 2),
    ('Object-Oriented Programming (OOP)', 'Master the concepts of OOP with C# and apply them to real-world software development.', 95, 50, 70, 1),
    ('Web Development with ASP.NET', 'Learn to build dynamic web applications using ASP.NET, C#, and MVC architecture.', 90, 45, 120, 3),
    ('Database Management Systems (DBMS)', 'Understand database management, normalization, indexing, and transactions in SQL.', 100, 50, 100, 2),
    ('Advanced C# Concepts', 'Dive deep into advanced C# features like LINQ, Delegates, Lambda Expressions, and async programming.', 95, 50, 100, 8),
    ('Data Structures and Algorithms', 'Learn about data structures and algorithms using C#, including sorting, searching, and complexity analysis.', 90, 45, 90, 4),
    ('Introduction to MVC', 'Learn the Model-View-Controller architecture and how to implement it in web applications using ASP.NET MVC.', 85, 40, 80, 3);



	-- Frontend Development Track Courses
INSERT INTO Course
VALUES 
    ('HTML & CSS', 'Learn the fundamentals of web design with HTML5 and CSS3.', 90, 45, 50,5),
    ('JavaScript Basics', 'Get hands-on experience with JavaScript, a core language for web development.', 90, 45, 80,7),
    ('React Fundamentals', 'Learn how to build modern user interfaces using React.js.', 95, 50, 100,3);

-- Data Science Track Courses
INSERT INTO Course 
VALUES 
    ('Python for Data Science', 'Learn how to use Python for data analysis, manipulation, and visualization.', 98, 50, 120,4),
    ('Machine Learning with Python', 'Understand and build machine learning models using Python libraries like scikit-learn.', 100, 55, 140,9);
------------------------------------------------------------------------------------------------
--->INSERT INTO Exam
select * from Exam

delete from Exam
DBCC CHECKIDENT ('Exam', RESEED, 0);

-- Example with 'Midterm' Type and calculating duration in minutes using DATEDIFF
INSERT INTO Exam (Name, StartTime, EndTime, Type, TotalGradesOfExam, CourseId, InsId)
VALUES
    ('C# Programming Midterm', '2025-02-10 09:00:00', '2025-02-10 12:00:00', 'Midterm', 100, 1, 1),
    ('SQL Fundamentals Final Exam', '2025-02-11 10:00:00', '2025-02-11 13:00:00', 'Final', 100, 2, 2),
    ('Object-Oriented Programming Exam', '2025-02-12 14:00:00', '2025-02-12 17:00:00', 'Midterm', 100, 3, 3),
    ('Database Management Systems Exam', '2025-02-13 08:00:00', '2025-02-13 11:00:00','Final', 100, 5, 4)
    -- Add more rows as needed with different course IDs and instructor IDs
----------------------------------------------------------------------------------------------------
---->INSERT INTO Question 
select * from Question

select * from WrittenQuestion


-- Inserting questions related to courses with True/False (T/F) questions

ALTER TABLE Question
ALTER COLUMN Body NVARCHAR(500); 


delete from Question
DBCC CHECKIDENT ('Question', RESEED, 0);


-- Multiple Choice Questions
INSERT INTO Question (Body, Degree, QuestionType, CourseId)
VALUES
    ('What is the main purpose of C# programming?', 10, 'Multiple Choice', 1),
    ('Which of the following is NOT an OOP concept in C#?', 15, 'Multiple Choice', 1),
    ('Explain the difference between a clustered and non-clustered index in SQL.', 20, 'Multiple Choice', 5),
    ('Which of the following SQL commands is used to remove data from a table?', 15, 'Multiple Choice', 2),
    ('What is the purpose of JavaScript in web development?', 20, 'Multiple Choice', 10),
    ('What is the role of a controller in the MVC pattern?', 20, 'Multiple Choice', 4);

-- True/False Questions
INSERT INTO Question (Body, Degree, QuestionType, CourseId)
VALUES
    ('C# supports multiple inheritance.', 10, 'True/False', 1),
    ('SQL is a procedural programming language.', 10, 'True/False', 2),
    ('The SELECT statement in SQL is used to delete records.', 10, 'True/False', 2),
    ('Inheritance is an OOP concept used to define classes in C#.', 10, 'True/False', 3),
    ('The Model-View-Controller pattern only applies to database applications.', 10, 'True/False', 4),
    ('Normalization helps to eliminate data redundancy.', 10, 'True/False', 5),
    ('C# supports dynamic typing.', 10, 'True/False', 6),
    ('In C#, a delegate is a type-safe function pointer.', 10, 'True/False', 6),
    ('Big O notation helps to analyze the performance of algorithms.', 10, 'True/False', 7),
    ('A stack operates on a LIFO (Last In, First Out) principle.', 10, 'True/False', 8),
    ('A controller in MVC is responsible for managing user inputs and interacting with models.', 10, 'True/False', 9),
    ('HTML is used for styling web pages, while CSS is used for structure.', 10, 'True/False', 9),
    ('JavaScript allows developers to build interactive and dynamic web pages.', 10, 'True/False', 10),
    ('React is a JavaScript library for building user interfaces.', 10, 'True/False', 11),
    ('Python is mainly used for statistical analysis and machine learning in data science.', 10, 'True/False', 12),
    ('Supervised learning requires labeled data, whereas unsupervised learning does not.', 10, 'True/False', 13),
    ('Overfitting occurs when a model learns the details and noise of the training data to an extent that it negatively impacts the model’s performance on new data.', 10, 'True/False', 13);

-- Open-Ended Questions
INSERT INTO Question (Body, Degree, QuestionType, CourseId)
VALUES
    ('How would you implement inheritance in C#?', 25, 'Open-Ended', 3),
    ('How does the Model-View-Controller pattern work in ASP.NET?', 20, 'Open-Ended', 4),
    ('How would you create a responsive layout in CSS?', 15, 'Open-Ended', 9),
    ('What is the difference between asynchronous and synchronous programming in C#?', 20, 'Open-Ended', 6),
    ('Explain the concept of recursion with an example in C#.', 25, 'Open-Ended', 7),
    ('How does data structures and algorithms impact the performance of an application?', 30, 'Open-Ended', 8),
    ('Explain the differences between a stack and a queue in data structures.', 20, 'Open-Ended', 7),
    ('Explain how merge sort works and its time complexity.', 25, 'Open-Ended', 7),
    ('What is the significance of middleware in an ASP.NET Core application?', 20, 'Open-Ended', 8),
    ('How does React use a virtual DOM?', 20, 'Open-Ended', 10),
    ('What is the difference between supervised and unsupervised learning in machine learning?', 25, 'Open-Ended', 13),
    ('What is the purpose of pandas in Python?', 20, 'Open-Ended', 12),
    ('How does gradient descent work in machine learning?', 30, 'Open-Ended', 13);


	select * from Question
	where QuestionType ='True/False'
----------------------------------------------------------------------------------------------------
------>INSERT INTO Student
select * from student 

select * from Branch
select * from course
select * from Student_Exam

delete from Student
DBCC CHECKIDENT ('Student', RESEED, 0);


INSERT INTO Student (Fname, Lname, City, ZibCode, Phone, Gender, BirthDate, AccountId, Brn_Track_IntakeId)
VALUES
    ('Qassem', 'Al-Atibi', 'Riyadh', '12345', '0551234567', 'M', '1995-01-15', 1, 1),
    ('Omar', 'Al-Shamsi', 'Dammam', '23456', '0552345678', 'F', '1996-02-25', 2, 2),
    ('Ramez', 'Al-Fahd', 'Jeddah', '34567', '0553456789', 'M', '1994-03-30', 3, 3),
    ('Mustafa', 'Al-Hashimi', 'Makkah', '45678', '0554567890', 'F', '1997-04-10', 4, 4),
    ('Ali', 'Al-Zahrani', 'Riyadh', '56789', '0555678901', 'M', '1993-05-20', 5, 5),
    ('Noura', 'Al-Shammari', 'Dammam', '67890', '0556789012', 'F', '1998-06-14', 6, 6),
    ('Hassan', 'Al-Jaber', 'Medina', '78901', '0557890123', 'M', '1995-07-22', 7, 7),
    ('Hana', 'Al-Abidi', 'Taif', '89012', '0558901234', 'F', '1996-08-03', 8, 8),
    ('Khalid', 'Al-Mutairi', 'Jeddah', '90123', '0559012345', 'M', '1994-09-17', 9, 9),
    ('Somaya', 'Al-Harbi', 'Riyadh', '01234', '0550123456', 'F', '1997-10-12', 10, 10),
    ('Mahmoud', 'Al-Tamimi', 'Dammam', '12345', '0551234567', 'M', '1993-11-25', 11, 11),
    ('Fatima', 'Al-Husseini', 'Makkah', '23456', '0552345678', 'F', '1995-12-17', 12, 12),
    ('Ahmed', 'Al-Jubair', 'Medina', '34567', '0553456789', 'M', '1994-01-07', 13, 13),
    ('Jamila', 'Al-Hammad', 'Riyadh', '45678', '0554567890', 'F', '1996-02-21', 14, 14),
    ('Tariq', 'Al-Suwaidi', 'Jeddah', '56789', '0555678901', 'M', '1997-03-30', 15, 15),
    ('Randa', 'Al-Ghamdi', 'Taif', '67890', '0556789012', 'F', '1994-06-23', 16, 16),
    ('Saad', 'Al-Qusaibi', 'Dammam', '78901', '0557890123', 'M', '1993-05-12', 17, 17),
    ('Dalaa', 'Al-Farsi', 'Medina', '89012', '0558901234', 'F', '1994-06-23', 18, 18),
    ('Nasser', 'Al-Shaya', 'Makkah', '90123', '0559012345', 'M', '1996-07-07', 19, 19),
    ('Shayma', 'Al-Mini', 'Jeddah', '01234', '0550123456', 'F', '1997-08-02', 20, 20),
    ('Abdullah', 'Al-Suwailim', 'Riyadh', '12345', '0551234567', 'M', '1994-09-11', 21, 21),
    ('Shimaa', 'Al-Muni', 'Dammam', '23456', '0552345678', 'F', '1995-10-05', 22, 22),
    ('Abdulrahman', 'Al-Ghanem', 'Taif', '34567', '0553456789', 'M', '1993-11-19', 23, 23),
    ('Reem', 'Al-Rubai', 'Makkah', '45678', '0554567890', 'F', '1996-12-28', 24, 24),
    ('Mahmoud', 'Al-Malham', 'Jeddah', '56789', '0555678901', 'M', '1997-01-30', 25, 25),
    ('Najla', 'Al-Rabai', 'Dammam', '67890', '0556789012', 'F', '1994-02-12', 26, 26),
    ('Zaid', 'Al-Qatani', 'Riyadh', '78901', '0557890123', 'M', '1996-03-18', 27, 27),
    ('Maha', 'Al-Najjar', 'Medina', '89012', '0558901234', 'F', '1995-04-08', 28, 28),
    ('Fahd', 'Al-Rashidi', 'Jeddah', '90123', '0559012345', 'M', '1994-05-10', 29, 29),
    ('Ghada', 'Al-Saleh', 'Taif', '01234', '0550123456', 'F', '1997-06-24', 30, 30),
    ('Sulaiman', 'Al-Zaid', 'Dammam', '12345', '0551234567', 'M', '1993-07-17', 31, 31),
    ('Yasmin', 'Al-Mukhtar', 'Makkah', '23456', '0552345678', 'F', '1996-08-22', 32, 32),
    ('Faisal', 'Al-Anzi', 'Riyadh', '34567', '0553456789', 'M', '1995-09-13', 33, 33),
    ('Mona', 'Al-Khatabi', 'Medina', '45678', '0554567890', 'F', '1994-10-26', 34, 34);
----------------------------------------------------------------------------------------------------
---->insert into Track 
select * from Track

insert into Track 
values('Full Stack .Net',' uses . NET technologies to create both the frontend and backend of web applications.')


INSERT INTO Track 
VALUES 
    ('Full Stack .Net', 'Uses .NET technologies to create both the frontend and backend of web applications.'),
    ('Frontend Development', 'Focuses on the client-side aspect of web development, working with HTML, CSS, JavaScript, and various frameworks like React or Angular.'),
    ('Backend Development', 'Involves server-side programming with technologies like Node.js, Python, Java, or .NET to handle database interactions, authentication, and more.'),
    ('Data Science', 'Combines statistical analysis, machine learning, and programming to analyze and interpret complex data sets for decision-making.'),
    ('Mobile Development', 'Specializes in creating applications for mobile devices, including iOS and Android, using tools like Swift, Kotlin, or Flutter.'),
    ('Cloud Computing', 'Involves using remote servers hosted on the internet to store, manage, and process data, with platforms like AWS, Azure, and Google Cloud.'),
    ('DevOps', 'Focuses on combining software development and IT operations to shorten development cycles and improve software quality, using tools like Docker, Kubernetes, and CI/CD pipelines.'),
    ('Cybersecurity', 'Specializes in protecting systems, networks, and data from cyber threats and ensuring the confidentiality, integrity, and availability of information.'),
    ('Game Development', 'Creates interactive and immersive experiences through video games, using engines like Unity and Unreal, along with programming languages like C# and C++.'),
    ('AI/ML', 'Involves developing algorithms and models that allow machines to learn from data and make decisions without human intervention, focusing on artificial intelligence and machine learning.');
----------------------------------------------------------------------------------------------------
---->INSERT INTO exammanagement.True_False
select * from exammanagement.True_False
select * from exammanagement.Question



alter table True_False
alter column Answer varchar(5) not null

alter table True_False
alter column  QuestionId int not null


INSERT INTO True_False (Answer, QuestionId)
VALUES
    ('False', 1),  -- C# does not support multiple inheritance
    ('False', 2),  -- SQL is not a procedural programming language
    ('False', 3),  -- The SELECT statement in SQL is not used to delete records (DELETE statement is used)
    ('True', 4),   -- Inheritance is an OOP concept used to define classes in C#
    ('False', 5),  -- The Model-View-Controller pattern does not only apply to database applications
    ('True', 6),   -- Normalization helps to eliminate data redundancy
    ('False', 7),  -- C# does not support dynamic typing (it's statically typed)
    ('True', 8),   -- In C#, a delegate is a type-safe function pointer
    ('True', 9),   -- Big O notation helps to analyze the performance of algorithms
    ('True', 10),  -- A stack operates on a LIFO (Last In, First Out) principle
    ('True', 11),  -- A controller in MVC is responsible for managing user inputs and interacting with models
    ('False', 12), -- HTML is not used for styling (CSS is used for styling)
    ('True', 13),  -- JavaScript allows developers to build interactive and dynamic web pages
    ('True', 14),  -- React is a JavaScript library for building user interfaces
    ('True', 15),  -- Python is mainly used for statistical analysis and machine learning in data science
    ('True', 16),  -- Supervised learning requires labeled data, whereas unsupervised learning does not
    ('True', 17);  -- Overfitting occurs when a model learns the details and noise of the training data too well

select * from exammanagement.question where questiontype = 'true/false'

	INSERT INTO exammanagement.True_False (Answer, QuestionId)
VALUES
('True', 52),
('False', 53),
('False', 54),
('False', 55),
('False', 56),
('True', 57),
('False', 58),
('True', 59),
('True', 60),
('True', 61),
('True', 62),
('False', 63),
('True', 64),
('False', 65),
('False', 66);




INSERT INTO exammanagement.True_False (Answer, QuestionId)
VALUES
('True', 52),
('False', 53),
('False', 54),
('False', 55),
('False', 56),
('True', 57),
('False', 58),
('True', 59),
('True', 60),
('True', 61),
('True', 62),
('False', 63),
('True', 64),
('False', 65),
('False', 66);
--------------------------------------------------------------------------------------------------
use db_aa988f_examinationsystem;
--->insert into Account
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
insert into Account
values 
('qassem', '123456'),
('omar', '456123'),
('Hagag', '123456'),
('mustafa', '123456'),
('ramez', '123456'),
('ali', '123456'),
('saad', '123456'),
('khaled', '789123'),
('mohamed', '741852'),
('ahmed', '963852'),
('youssef', '123789'),
('hassan', '321654'),
('tareq', '159357'),
('adel', '753951'),
('walid', '852963'),
('nasser', '456789'),
('fahd', '789654'),
('samir', '258147'),
('karem', '369258'),
('mamdouh', '147852'),
('abdelrahman', '951753'),
('ziad', '852147'),
('sami', '456321'),
('bassel', '123654'),
('mostafa', '789321'),
('hamza', '654987'),
('maged', '741963'),
('tamer', '321987'),
('hussein', '147369'),
('emad', '852741'),
('salah', '369741'),
('galal', '987456'),
('ayman', '258369'),
('hatem', '753456'),
('mohsen', '951852'),
('shady', '159753'),
('wael', '654123'),
('nabil', '987321'),
('ramy', '321852'),
('sherif', '741258'),
('hazem', '852369'),
('yasin', '456987'),
('belal', '321456'),
('rafik', '789654'),
('jamal', '963741'),
('mahmoud', '147258'),
('islam', '159468'),
('bahaa', '951357'),
('karim', '258963');



----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
--->INSERT INTO Intake
INSERT INTO Intake (name, IntakeYear)
VALUES 
('Intake 41', 2021),
('Intake 42', 2021),
('Intake 43', 2022),
('Intake 44', 2022),
('Intake 45', 2023),
('Intake 46', 2023),
('Intake 47', 2024),
('Intake 48', 2024),
('Intake 49', 2025),
('Intake 50', 2025),
('Intake 51', 2026),
('Intake 52', 2026),
('Intake 53', 2027),
('Intake 54', 2027),
('Intake 55', 2028),
('Intake 56', 2028),
('Intake 57', 2029),
('Intake 58', 2029),
('Intake 59', 2030),
('Intake 60', 2030),
('Intake 61', 2031),
('Intake 62', 2031),
('Intake 63', 2032),
('Intake 64', 2032),
('Intake 65', 2033),
('Intake 66', 2033),
('Intake 67', 2034),
('Intake 68', 2034),
('Intake 69', 2035),
('Intake 70', 2035),
('Intake 71', 2036),
('Intake 72', 2036),
('Intake 73', 2037),
('Intake 74', 2037),
('Intake 75', 2038),
('Intake 76', 2038),
('Intake 77', 2039),
('Intake 78', 2039),
('Intake 79', 2040),
('Intake 80', 2040),
('Intake 81', 2041),
('Intake 82', 2041),
('Intake 83', 2042),
('Intake 84', 2042),
('Intake 85', 2043),
('Intake 86', 2043),
('Intake 87', 2044),
('Intake 88', 2044),
('Intake 89', 2045),
('Intake 90', 2045);



----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
--->INSERT INTO TrainingManager
INSERT INTO TrainingManager (Fname, Lname, AccountId)
VALUES
('Ahmed', 'Mahmoud', 45),
('Omar', 'Hassan', 46),
('Hassan', 'Ali', 47),
('Mostafa', 'Saeed', 48),
('Youssef', 'Nader', 49);


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----->INSERT INTO Branch 
INSERT INTO Branch (Name, Location, TrainingMng)
VALUES 
('Cairo Branch', 'Cairo', 1),
('Giza Branch', 'Giza', 2),
('Alexandria Branch', 'Alexandria', 3),
('Mansoura Branch', 'Mansoura', 4),
('Tanta Branch', 'Tanta', 5),
('Asyut Branch', 'Asyut', 1),
('Suez Branch', 'Suez', 2),
('Zagazig Branch', 'Zagazig', 3),
('Ismailia Branch', 'Ismailia', 4),
('Fayoum Branch', 'Fayoum', 5),
('Beni Suef Branch', 'Beni Suef', 1),
('Sohag Branch', 'Sohag', 2),
('Qena Branch', 'Qena', 3),
('Luxor Branch', 'Luxor', 4),
('Aswan Branch', 'Aswan', 5);


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
---INSERT INTO Instructor
INSERT INTO Instructor (Fname, Lname, City, ZibCode, Phone, Gender, BirthDate, Salary, AccountId)
VALUES
('Mohamed', 'Ibrahim', 'Cairo', '11511', '01012345678', 'M', '1985-03-12', 15000, 35),
('Sara', 'Ahmed', 'Giza', '12555', '01098765432', 'F', '1990-07-22', 14000, 36),
('Khaled', 'Hassan', 'Alexandria', '21532', '01112345678', 'M', '1982-11-05', 16000, 37),
('Nour', 'Mohsen', 'Mansoura', '35511', '01234567890', 'F', '1995-06-30', 13000, 38),
('Tarek', 'Samir', 'Tanta', '31722', '01598765432', 'M', '1988-09-17', 14500, 39),
('Layla', 'Hassan', 'Asyut', '71111', '01011223344', 'F', '1993-04-08', 13500, 40),
('Omar', 'Nabil', 'Suez', '43512', '01229876543', 'M', '1980-12-25', 17000, 41),
('Dina', 'Saeed', 'Zagazig', '44511', '01155443322', 'F', '1997-02-14', 12500, 42),
('Hesham', 'Reda', 'Ismailia', '41555', '01522334455', 'M', '1986-08-10', 15500, 43),
('Marwa', 'Gamal', 'Fayoum', '63544', '01033445566', 'F', '1992-05-18', 13800, 44);


DBCC CHECKIDENT ('Instructor', RESEED, 0);


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----->INSERT INTO Class
INSERT INTO Class (Name, Year, Semester, CrsId)
VALUES
('Spring 2024 - A', 2024, 'Spring', 1),
('Spring 2024 - B', 2024, 'Spring', 2),
('Spring 2024 - C', 2024, 'Spring', 3),
('Spring 2024 - D', 2024, 'Spring', 4),
('Spring 2024 - E', 2024, 'Spring', 5),
('Fall 2024 - A', 2024, 'Fall', 6),
('Fall 2024 - B', 2024, 'Fall', 7),
('Fall 2024 - C', 2024, 'Fall', 8),
('Fall 2024 - D', 2024, 'Fall', 9),
('Fall 2024 - E', 2024, 'Fall', 10),
('Winter 2024 - A', 2024, 'Winter', 11),
('Winter 2024 - B', 2024, 'Winter', 12),
('Winter 2024 - C', 2024, 'Winter', 13),
('Winter 2024 - D', 2024, 'Winter', 1),
('Winter 2024 - E', 2024, 'Winter', 2),
('Summer 2024 - A', 2024, 'Summer', 3),
('Summer 2024 - B', 2024, 'Summer', 4),
('Summer 2024 - C', 2024, 'Summer', 5),
('Summer 2024 - D', 2024, 'Summer', 6),
('Summer 2024 - E', 2024, 'Summer', 7);


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
------>INSERT INTO Instructor_Course_History
INSERT INTO Instructor_Course_History (InsId, ClassId, CrsId, StartDate, EndDate) 
VALUES
(1, 1, 1, '2024-01-01', '2024-06-01'),
(2, 2, 2, '2024-01-10', '2024-06-10'),
(3, 3, 3, '2024-01-15', '2024-06-15'),
(4, 4, 4, '2024-01-20', '2024-06-20'),
(5, 5, 5, '2024-01-25', '2024-06-25'),
(6, 6, 6, '2024-02-01', '2024-07-01'),
(7, 7, 7, '2024-02-10', '2024-07-10'),
(8, 8, 8, '2024-02-15', '2024-07-15'),
(9, 9, 9, '2024-02-20', '2024-07-20'),
(10, 10, 10, '2024-02-25', '2024-07-25'),
(1, 11, 11, '2024-03-01', '2024-08-01'),
(2, 12, 12, '2024-03-10', '2024-08-10'),
(3, 13, 13, '2024-03-15', '2024-08-15'),
(4, 14, 1, '2024-03-20', '2024-08-20'),
(5, 15, 2, '2024-03-25', '2024-08-25'),
(6, 16, 3, '2024-04-01', '2024-09-01'),
(7, 17, 4, '2024-04-10', '2024-09-10'),
(8, 18, 5, '2024-04-15', '2024-09-15'),
(9, 19, 6, '2024-04-20', '2024-09-20'),
(10, 20, 7, '2024-04-25', '2024-09-25'),
(1, 1, 8, '2024-05-01', '2024-10-01'),
(2, 2, 9, '2024-05-10', '2024-10-10'),
(3, 3, 10, '2024-05-15', '2024-10-15'),
(4, 4, 11, '2024-05-20', '2024-10-20'),
(5, 5, 12, '2024-05-25', '2024-10-25'),
(6, 6, 13, '2024-06-01', '2024-11-01'),
(7, 7, 1, '2024-06-10', '2024-11-10'),
(8, 8, 2, '2024-06-15', '2024-11-15'),
(9, 9, 3, '2024-06-20', '2024-11-20'),
(10, 10, 4, '2024-06-25', '2024-11-25'),
(1, 11, 5, '2024-07-01', '2024-12-01'),
(2, 12, 6, '2024-07-10', '2024-12-10'),
(3, 13, 7, '2024-07-15', '2024-12-15'),
(4, 14, 8, '2024-07-20', '2024-12-20'),
(5, 15, 9, '2024-07-25', '2024-12-25'),
(6, 16, 10, '2024-08-01', '2025-01-01'),
(7, 17, 11, '2024-08-10', '2025-01-10'),
(8, 18, 12, '2024-08-15', '2025-01-15'),
(9, 19, 13, '2024-08-20', '2025-01-20'),
(10, 20, 1, '2024-08-25', '2025-01-25');



----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
--->INSERT INTO Instructor_Course_Student
INSERT INTO Instructor_Course_Student (StdId, ClassId, CrsId, InsId, EnrollmentDate, Evaluation) 
VALUES
(1, 1, 1, 1, '2024-06-01', 80),
(2, 2, 2, 2, '2024-05-15', 85),
(3, 3, 3, 3, '2024-04-10', 78),
(4, 4, 4, 4, '2024-03-20', 92),
(5, 5, 5, 5, '2024-02-25', 88),
(6, 6, 6, 6, '2024-01-30', 75),
(7, 7, 7, 7, '2023-12-15', 95),
(8, 8, 8, 8, '2023-11-10', 82),
(9, 9, 9, 9, '2023-10-05', 79),
(10, 10, 10, 10, '2023-09-01', 91),
(11, 11, 11, 1, '2023-08-20', 85),
(12, 12, 12, 2, '2023-07-15', 73),
(13, 13, 13, 3, '2023-06-10', 89),
(14, 14, 1, 4, '2023-05-01', 90),
(15, 15, 2, 5, '2023-04-15', 77);



----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----->INSERT INTO ExamManagement.Question
INSERT INTO ExamManagement.Question (Body, Degree, QuestionType, CourseId) 
VALUES 
-- Multiple Choice Questions 
('What is the primary key in SQL?', 2, 'Multiple Choice', 6),
('Which SQL clause is used to filter records?', 2, 'Multiple Choice', 6),
('Which of the following is not a SQL aggregate function?', 2, 'Multiple Choice', 6),
('What does the SQL JOIN clause do?', 2, 'Multiple Choice', 6),
('Which statement is used to insert data into a table?', 2, 'Multiple Choice', 6),
('Which SQL command is used to remove a table completely?', 2, 'Multiple Choice', 6),
('Which SQL clause is used to sort query results?', 2, 'Multiple Choice', 6),
('Which of the following is a valid SQL data type?', 2, 'Multiple Choice', 6),
('What is the purpose of the `HAVING` clause in SQL?', 2, 'Multiple Choice', 6),
('Which SQL keyword is used to retrieve unique values?', 2, 'Multiple Choice', 6),
('What is the purpose of the SQL `CASE` statement?', 2, 'Multiple Choice', 6),
('Which SQL command is used to update existing records?', 2, 'Multiple Choice', 6),
('Which of the following is not a SQL constraint?', 2, 'Multiple Choice', 6),
('Which SQL function is used to count the number of rows?', 2, 'Multiple Choice', 6),
('What does the SQL `ALTER` command do?', 2, 'Multiple Choice', 6),

-- True/False Questions 
('SQL supports transactions. True or False?', 3, 'True/False', 6),
('The SQL WHERE clause is used to group records. True or False?', 3, 'True/False', 6),
('A primary key can have duplicate values. True or False?', 3, 'True/False', 6),
('The SQL SELECT statement is used to modify data. True or False?', 3, 'True/False', 6),
('SQL is case-sensitive. True or False?', 3, 'True/False', 6),
('SQL allows the use of subqueries. True or False?', 3, 'True/False', 6),
('The `ORDER BY` clause is used to filter records. True or False?', 3, 'True/False', 6),
('SQL supports the `HAVING` clause only with aggregate functions. True or False?', 3, 'True/False', 6),
('The `GROUP BY` clause can be used without aggregate functions. True or False?', 3, 'True/False', 6),
('The `INNER JOIN` returns only matching records between tables. True or False?', 3, 'True/False', 6),
('SQL databases use schemas to organize tables. True or False?', 3, 'True/False', 6),
('A `LEFT JOIN` returns all records from the right table. True or False?', 3, 'True/False', 6),
('The `DISTINCT` keyword removes duplicate rows. True or False?', 3, 'True/False', 6),
('SQL constraints help enforce data integrity. True or False?', 3, 'True/False', 6),
('The `LIMIT` clause is used to delete records. True or False?', 3, 'True/False', 6),

-- Open-Ended Questions 
('What is the difference between SQL and NoSQL databases?', 3, 'Open-Ended', 6),
('Explain the purpose of SQL indexes.', 3, 'Open-Ended', 6),
('How does the SQL `JOIN` clause work?', 3, 'Open-Ended', 6),
('What are SQL constraints and why are they important?', 3, 'Open-Ended', 6),
('Describe the ACID properties in SQL.', 3, 'Open-Ended', 6),
('Explain the differences between `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`.', 3, 'Open-Ended', 6),
('How does SQL handle NULL values?', 3, 'Open-Ended', 6),
('What is normalization in SQL and why is it used?', 3, 'Open-Ended', 6),
('Explain the difference between `DELETE`, `TRUNCATE`, and `DROP`.', 3, 'Open-Ended', 6),
('What is a stored procedure in SQL and how is it used?', 3, 'Open-Ended', 6),
('How can you optimize SQL queries for better performance?', 3, 'Open-Ended', 6),
('What are common SQL injection attacks and how can they be prevented?', 3, 'Open-Ended', 6),
('What is a foreign key and how does it enforce referential integrity?', 3, 'Open-Ended', 6),
('Explain the purpose of the `CASE` statement in SQL.', 3, 'Open-Ended', 6),
('How does SQL handle transactions and rollbacks?', 3, 'Open-Ended', 6);



select * from ExamManagement.MCQ
select * from AcademicRecords.Course


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
--->insert into ExamManagement.MCQ
insert into ExamManagement.MCQ (QuestionId)
select Id from ExamManagement.Question
where QuestionType =  'Multiple Choice';



select * from Question
where QuestionType =  'Multiple Choice';


delete from ExamManagement.Answer_Choice
delete from ExamManagement.Choices
delete from ExamManagement.MCQ
delete from ExamManagement.Answer_MCQ
delete from ExamManagement.Answer_True_False
delete from ExamManagement.Answer_Written
DBCC CHECKIDENT ('ExamManagement.MCQ', RESEED, 0);


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
------->INSERT INTO ExamManagement.Choices
select * from Question
where QuestionType = 'Multiple Choice'

select * from Choices
INSERT INTO ExamManagement.Choices (Choice, IsTrue, McqId) VALUES 
    ('To develop software applications', 1, 1),
    ('To design web pages', 0, 1),
    ('To analyze data', 0, 1),
    ('To manage databases', 0, 1),

    ('Encapsulation', 0, 2),
    ('Abstraction', 0, 2),
    ('Polymorphism', 0, 2),
    ('Recursion', 1, 2),

    ('A clustered index sorts data physically in a table', 1, 3),
    ('A non-clustered index is faster than a clustered index', 0, 3),
    ('Clustered indexes store data in separate tables', 0, 3),
    ('Indexes are only used in NoSQL databases', 0, 3),

    ('DELETE', 1, 4),
    ('REMOVE', 0, 4),
    ('DROP', 0, 4),
    ('ERASE', 0, 4),

    ('To create dynamic and interactive web pages', 1, 5),
    ('To style web pages', 0, 5),
    ('To manage backend databases', 0, 5),
    ('To handle HTTP requests', 0, 5),

    ('It manages user inputs and interacts with models', 1, 6),
    ('It is responsible for styling the application', 0, 6),
    ('It stores data persistently', 0, 6),
    ('It only handles database queries', 0, 6),

    ('A unique identifier for a record in a table', 1, 7),
    ('A column that allows duplicate values', 0, 7),
    ('A key used for sorting data', 0, 7),
    ('A foreign key in another table', 0, 7),

    ('WHERE', 1, 8),
    ('ORDER BY', 0, 8),
    ('GROUP BY', 0, 8),
    ('HAVING', 0, 8),

    ('COUNT()', 0, 9),
    ('AVG()', 0, 9),
    ('SUM()', 0, 9),
    ('ORDER BY', 1, 9),

    ('Combines rows from multiple tables based on a related column', 1, 10),
    ('Deletes data from a table', 0, 10),
    ('Sorts query results', 0, 10),
    ('Filters data', 0, 10),

    ('INSERT INTO', 1, 11),
    ('UPDATE', 0, 11),
    ('SELECT', 0, 11),
    ('DELETE', 0, 11),

    ('DROP TABLE', 1, 12),
    ('DELETE TABLE', 0, 12),
    ('TRUNCATE TABLE', 0, 12),
    ('REMOVE TABLE', 0, 12),

    ('ORDER BY', 1, 13),
    ('GROUP BY', 0, 13),
    ('HAVING', 0, 13),
    ('WHERE', 0, 13),

    ('VARCHAR', 1, 14),
    ('STRING', 0, 14),
    ('TEXT()', 0, 14),
    ('BOOLEAN()', 0, 14),

    ('Filters grouped records after aggregation', 1, 15),
    ('Filters individual records before aggregation', 0, 15),
    ('Sorts grouped records', 0, 15),
    ('Creates new columns in a table', 0, 15),

    ('DISTINCT', 1, 16),
    ('UNIQUE', 0, 16),
    ('FILTER', 0, 16),
    ('SEPARATE', 0, 16),

    ('Performs conditional logic in a query', 1, 17),
    ('Joins multiple tables', 0, 17),
    ('Deletes specific rows', 0, 17),
    ('Sorts query results', 0, 17),

    ('UPDATE', 1, 18),
    ('MODIFY', 0, 18),
    ('CHANGE', 0, 18),
    ('ALTER', 0, 18),

    ('PRIMARY KEY', 0, 19),
    ('FOREIGN KEY', 0, 19),
    ('INDEX', 1, 19),
    ('UNIQUE', 0, 19),

    ('COUNT()', 1, 20),
    ('SUM()', 0, 20),
    ('TOTAL()', 0, 20),
    ('NUMBER()', 0, 20),

    ('Modifies an existing table structure', 1, 21),
    ('Deletes records from a table', 0, 21),
    ('Filters data in a table', 0, 21),
    ('Creates a new table', 0, 21);


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
---->INSERT INTO WrittenQuestion
INSERT INTO WrittenQuestion (BestAnswer, Keywords, QuestionId) 
VALUES 
    -- Question 24: How would you implement inheritance in C#?
    ('Inheritance in C# is implemented using the ":" symbol. A derived class inherits properties and methods from a base class. Example: class Child : Parent {}', 'inheritance, base class, derived class, override, polymorphism', 24),

    -- Question 25: How does the Model-View-Controller pattern work in ASP.NET?
    ('The MVC pattern separates an application into three components: Model (data layer), View (UI), and Controller (handles requests). The controller updates the model, and the view reflects changes.', 'MVC, model, view, controller, ASP.NET, separation of concerns', 25),

    -- Question 26: How would you create a responsive layout in CSS?
    ('A responsive layout in CSS is achieved using media queries, flexbox, and grid. Example: @media (max-width: 768px) { .container { flex-direction: column; } }', 'CSS, responsive, media queries, flexbox, grid, mobile-first', 26),

    -- Question 27: What is the difference between asynchronous and synchronous programming in C#?
    ('Synchronous programming executes tasks sequentially, while asynchronous programming allows tasks to run concurrently using async and await, improving performance.', 'async, await, Task, synchronous, asynchronous, concurrency', 27),

    -- Question 28: Explain the concept of recursion with an example in C#.
    ('Recursion is a function calling itself to solve a problem in smaller steps. Example: int Factorial(int n) { return (n == 0) ? 1 : n * Factorial(n - 1); }', 'recursion, base case, function call, stack overflow, factorial', 28),

    -- Question 29: How does data structures and algorithms impact the performance of an application?
    ('Efficient data structures and algorithms reduce time and space complexity, improving performance. Choosing the right algorithm impacts scalability.', 'data structures, algorithms, time complexity, space complexity, performance, efficiency', 29),

    -- Question 30: Explain the differences between a stack and a queue in data structures.
    ('A stack follows LIFO (Last In, First Out), while a queue follows FIFO (First In, First Out). Example: Stack<int> stack = new Stack<int>(); Queue<int> queue = new Queue<int>();', 'stack, queue, LIFO, FIFO, push, pop, enqueue, dequeue', 30),

    -- Question 31: Explain how merge sort works and its time complexity.
    ('Merge sort is a divide-and-conquer algorithm that recursively divides an array into halves, sorts them, and merges the results. Time complexity: O(n log n).', 'merge sort, divide and conquer, recursion, merge step, O(n log n)', 31),

    -- Question 32: What is the significance of middleware in an ASP.NET Core application?
    ('Middleware in ASP.NET Core is software that handles requests and responses in a pipeline. Example: app.UseMiddleware<LoggingMiddleware>();', 'ASP.NET Core, middleware, request pipeline, UseMiddleware, dependency injection', 32),

    -- Question 33: How does React use a virtual DOM?
    ('React creates a virtual DOM to optimize updates. It compares changes (diffing) and updates only modified elements using reconciliation.', 'React, virtual DOM, diffing, reconciliation, performance', 33),

    -- Question 34: What is the difference between supervised and unsupervised learning in machine learning?
    ('Supervised learning uses labeled data for training (e.g., classification), while unsupervised learning finds patterns in unlabeled data (e.g., clustering).', 'machine learning, supervised, unsupervised, classification, clustering', 34),

    -- Question 35: What is the purpose of pandas in Python?
    ('Pandas is a data analysis library in Python that provides data structures like DataFrame and Series for manipulating structured data.', 'Python, pandas, DataFrame, Series, data analysis', 35),

    -- Question 36: How does gradient descent work in machine learning?
    ('Gradient descent optimizes a model by iteratively updating weights in the direction of the negative gradient to minimize loss.', 'gradient descent, machine learning, optimization, loss function, learning rate', 36);



	INSERT INTO ExamManagement.WrittenQuestion (BestAnswer, Keywords, QuestionId) 
VALUES 
    ('SQL databases use structured tables with fixed schemas, while NoSQL databases allow flexible schema designs for unstructured data.', 'SQL, NoSQL, schema, structured, unstructured', 67),

    ('SQL indexes improve query performance by allowing faster data retrieval, reducing the need for full table scans.', 'SQL index, performance, query optimization, full table scan', 68),

    ('The SQL JOIN clause combines rows from two or more tables based on a related column, such as a foreign key.', 'JOIN, INNER JOIN, LEFT JOIN, RIGHT JOIN, foreign key', 69),

    ('SQL constraints enforce rules on table columns, ensuring data integrity and accuracy, such as PRIMARY KEY, UNIQUE, and CHECK.', 'SQL constraints, data integrity, PRIMARY KEY, UNIQUE, CHECK', 70),

    ('ACID stands for Atomicity, Consistency, Isolation, and Durability, ensuring reliable database transactions.', 'ACID, transactions, Atomicity, Consistency, Isolation, Durability', 71),

    ('INNER JOIN returns matching rows from both tables, LEFT JOIN returns all rows from the left table and matching rows from the right, RIGHT JOIN does the opposite.', 'INNER JOIN, LEFT JOIN, RIGHT JOIN, matching rows, SQL', 72),

    ('SQL represents NULL as an unknown or missing value, requiring special handling using IS NULL or COALESCE.', 'NULL values, IS NULL, COALESCE, SQL', 73),

    ('Normalization organizes database tables to minimize redundancy and dependency, ensuring data integrity.', 'Normalization, redundancy, dependency, data integrity, database design', 74),

    ('DELETE removes specific rows, TRUNCATE removes all rows but keeps the table structure, DROP removes the entire table.', 'DELETE, TRUNCATE, DROP, SQL, database management', 75),

    ('A stored procedure is a precompiled SQL script that performs operations like inserting, updating, or retrieving data efficiently.', 'Stored procedure, SQL, precompiled, performance, database operations', 76),

    ('SQL query optimization can be achieved using indexes, proper indexing strategies, avoiding SELECT *, and using JOINs efficiently.', 'SQL optimization, indexes, SELECT *, JOIN efficiency', 77),

    ('SQL injection is a malicious attack that manipulates SQL queries. It can be prevented using parameterized queries and ORM frameworks.', 'SQL injection, security, parameterized queries, ORM, cyber attack', 78),

    ('A foreign key links tables and enforces referential integrity, ensuring valid relationships between records.', 'Foreign key, referential integrity, SQL relationships, database', 79),

    ('The CASE statement in SQL is used for conditional logic within queries, acting like an if-else structure.', 'CASE statement, SQL, conditional logic, if-else', 80),

    ('SQL transactions group multiple operations into a single unit, using COMMIT to save changes and ROLLBACK to undo them.', 'Transactions, COMMIT, ROLLBACK, SQL, data integrity', 81);


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
--------->INSERT INTO Exam_Question
select * from Question
where QuestionType =  'Open-Ended';

select * from Question
where QuestionType =  'Multiple Choice';


select * from Exam_Question;
select * from Instructor_Course_Student;


INSERT INTO Exam_Question(Mark, ExamId, QuestionId) 
VALUES 
    -- Exam 1 (15 questions)
    (10, 1, 1), (10, 1, 2), (10, 1, 3), (10, 1, 4), (10, 1, 5),
    (10, 1, 6), (10, 1, 7), (10, 1, 8), (10, 1, 9), (10, 1, 10),
    (10, 1, 11), (10, 1, 12), (10, 1, 13), (10, 1, 14), (10, 1, 15),

    -- Exam 2 (20 questions)
    (10, 2, 16), (10, 2, 17), (10, 2, 18), (10, 2, 19), (10, 2, 20),
    (10, 2, 21), (10, 2, 22), (10, 2, 23), (10, 2, 24), (10, 2, 25),
    (10, 2, 26), (10, 2, 27), (10, 2, 28), (10, 2, 29), (10, 2, 30),
    (10, 2, 31), (10, 2, 32), (10, 2, 33), (10, 2, 34), (10, 2, 35),

    -- Exam 3 (30 questions)
    (10, 3, 1), (10, 3, 2), (10, 3, 3), (10, 3, 4), (10, 3, 5),
    (10, 3, 6), (10, 3, 7), (10, 3, 8), (10, 3, 9), (10, 3, 10),
    (10, 3, 11), (10, 3, 12), (10, 3, 13), (10, 3, 14), (10, 3, 15),
    (10, 3, 16), (10, 3, 17), (10, 3, 18), (10, 3, 19), (10, 3, 20),
    (10, 3, 21), (10, 3, 22), (10, 3, 23), (10, 3, 24), (10, 3, 25),
    (10, 3, 26), (10, 3, 27), (10, 3, 28), (10, 3, 29), (10, 3, 30),

    -- Exam 4 (15 questions)
    (10, 4, 31), (10, 4, 32), (10, 4, 33), (10, 4, 34), (10, 4, 35),
    (10, 4, 36), (10, 4, 1), (10, 4, 2), (10, 4, 3), (10, 4, 4),
    (10, 4, 5), (10, 4, 6), (10, 4, 7), (10, 4, 8), (10, 4, 9);




----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
---->INSERT INTO Student_Answer_Details
select * from Student;
select * from Exam_Question;


INSERT INTO Student_Answer_Details (ManualScore, StudentId, Exam_QuestionId) 
VALUES
    (10, 1, 1), (20, 2, 2), (30, 3, 3), (40, 4, 4), (50, 5, 5),
    (60, 6, 6), (70, 7, 7), (80, 8, 8), (90, 9, 9), (100, 10, 10),
    (10, 11, 11), (20, 12, 12), (30, 13, 13), (40, 14, 14), (50, 15, 15),
    (60, 16, 16), (70, 17, 17), (80, 18, 18), (90, 19, 19), (100, 20, 20),
    (10, 21, 21), (20, 22, 22), (30, 23, 23), (40, 24, 24), (50, 25, 25),
    (60, 26, 26), (70, 27, 27), (80, 28, 28), (90, 29, 29), (100, 30, 30),
    (10, 31, 31), (20, 32, 32), (30, 33, 33), (40, 34, 34), (50, 1, 35),
    (60, 2, 36), (70, 3, 37), (80, 4, 38), (90, 5, 39), (100, 6, 40),
    (10, 7, 41), (20, 8, 42), (30, 9, 43), (40, 10, 44), (50, 11, 45),
    (60, 12, 46), (70, 13, 47), (80, 14, 48), (90, 15, 49), (100, 16, 50),
    (10, 17, 51), (20, 18, 52), (30, 19, 53), (40, 20, 54), (50, 21, 55),
    (60, 22, 56), (70, 23, 57), (80, 24, 58), (90, 25, 59), (100, 26, 60),
    (10, 27, 61), (20, 28, 62), (30, 29, 63), (40, 30, 64), (50, 31, 65),
    (60, 32, 66), (70, 33, 67), (80, 34, 68), (90, 1, 69), (100, 2, 70),
    (10, 3, 71), (20, 4, 72), (30, 5, 73), (40, 6, 74), (50, 7, 75),
    (60, 8, 76), (70, 9, 77), (80, 10, 78), (90, 11, 79), (100, 12, 80),
    (10, 13, 1), (20, 14, 2), (30, 15, 3), (40, 16, 4), (50, 17, 5),
    (60, 18, 6), (70, 19, 7), (80, 20, 8), (90, 21, 9), (100, 22, 10);



----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
-----INSERT INTO Student_Exam
INSERT INTO Student_Exam(Score, StudentId, ExamId) 
VALUES
    -- Exam 1 (25 students)
    (10, 1, 1), (20, 2, 1), (30, 3, 1), (40, 4, 1), (50, 5, 1),
    (60, 6, 1), (70, 7, 1), (80, 8, 1), (90, 9, 1), (100, 10, 1),
    (15, 11, 1), (25, 12, 1), (35, 13, 1), (45, 14, 1), (55, 15, 1),
    (65, 16, 1), (75, 17, 1), (85, 18, 1), (95, 19, 1), (5, 20, 1),
    (12, 21, 1), (22, 22, 1), (32, 23, 1), (42, 24, 1), (52, 25, 1),

    -- Exam 2 (25 students)
    (62, 26, 2), (72, 27, 2), (82, 28, 2), (92, 29, 2), (8, 30, 2),
    (18, 31, 2), (28, 32, 2), (38, 33, 2), (48, 34, 2), (58, 1, 2),
    (68, 2, 2), (78, 3, 2), (88, 4, 2), (98, 5, 2), (7, 6, 2),
    (17, 7, 2), (27, 8, 2), (37, 9, 2), (47, 10, 2), (57, 11, 2),
    (67, 12, 2), (77, 13, 2), (87, 14, 2), (97, 15, 2), (6, 16, 2),

    -- Exam 3 (25 students)
    (16, 17, 3), (26, 18, 3), (36, 19, 3), (46, 20, 3), (56, 21, 3),
    (66, 22, 3), (76, 23, 3), (86, 24, 3), (96, 25, 3), (4, 26, 3),
    (14, 27, 3), (24, 28, 3), (34, 29, 3), (44, 30, 3), (54, 31, 3),
    (64, 32, 3), (74, 33, 3), (84, 34, 3), (94, 1, 3), (3, 2, 3),
    (13, 3, 3), (23, 4, 3), (33, 5, 3), (43, 6, 3), (53, 7, 3),

    -- Exam 4 (25 students)
    (63, 8, 4), (73, 9, 4), (83, 10, 4), (93, 11, 4), (9, 12, 4),
    (19, 13, 4), (29, 14, 4), (39, 15, 4), (49, 16, 4), (59, 17, 4),
    (69, 18, 4), (79, 19, 4), (89, 20, 4), (99, 21, 4), (11, 22, 4),
    (21, 23, 4), (31, 24, 4), (41, 25, 4), (51, 26, 4), (61, 27, 4),
    (71, 28, 4), (81, 29, 4), (91, 30, 4), (1, 31, 4), (10, 32, 4);


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----INSERT INTO Answer_MCQ
Select * from Student_Answer_Details  
Select * from MCQ  

INSERT INTO Answer_MCQ (Student_Answer_DetailsId, McqId) 
VALUES
    (1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3),
    (7, 4), (8, 4), (9, 5), (10, 5), (11, 6), (12, 6),
    (13, 1), (14, 1), (15, 2), (16, 2), (17, 3), (18, 3),
    (19, 4), (20, 4), (21, 5), (22, 5), (23, 6), (24, 6),
    (25, 1), (26, 1), (27, 2), (28, 2), (29, 3), (30, 3),
    (31, 4), (32, 4), (33, 5), (34, 5), (35, 6), (36, 6),
    (37, 1), (38, 1), (39, 2), (40, 2), (41, 3), (42, 3),
    (43, 4), (44, 4), (45, 5), (46, 5), (47, 6), (48, 6),
    (49, 1), (50, 1), (51, 2), (52, 2), (53, 3), (54, 3),
    (55, 4), (56, 4), (57, 5), (58, 5), (59, 6), (60, 6),
    (61, 1), (62, 1), (63, 2), (64, 2), (65, 3), (66, 3),
    (67, 4), (68, 4), (69, 5), (70, 5), (71, 6), (72, 6),
    (73, 1), (74, 1), (75, 2), (76, 2), (77, 3), (78, 3),
    (79, 4), (80, 4), (81, 5), (82, 5), (83, 6), (84, 6),
    (85, 1), (86, 1), (87, 2), (88, 2), (89, 3), (90, 3);



INSERT INTO Student_Answer_Details (ManualScore, StudentId, Exam_QuestionId) 
VALUES
    (10, 1, 1),
INSERT INTO Student_Exam(Score, StudentId, ExamId) 
VALUES
    -- Exam 1 (25 students)
    (10, 1, 1),
INSERT INTO Answer_MCQ (Student_Answer_DetailsId, McqId) 
VALUES
    (1, 1),
INSERT INTO Answer_Choice (Answer_MCQId, ChoiceId) 
VALUES
    (1, 1),
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------

DBCC CHECKIDENT ('Answer_Choice', RESEED, 0);

select * from Answer_MCQ
INSERT INTO Answer_Choice (Answer_MCQId, ChoiceId) 
VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6),
    (7, 7), (8, 8), (9, 9), (10, 10), (11, 11), (12, 12),
    (13, 13), (14, 14), (15, 15), (16, 16), (17, 17), (18, 18),
    (19, 19), (20, 20), (21, 21), (22, 22), (23, 23), (24, 24),
    
    (25, 1), (26, 2), (27, 3), (28, 4), (29, 5), (30, 6),
    (31, 7), (32, 8), (33, 9), (34, 10), (35, 11), (36, 12),
    (37, 13), (38, 14), (39, 15), (40, 16), (41, 17), (42, 18),
    (43, 19), (44, 20), (45, 21), (46, 22), (47, 23), (48, 24),
    
    (49, 1), (50, 2), (51, 3), (52, 4), (53, 5), (54, 6),
    (55, 7), (56, 8), (57, 9), (58, 10), (59, 11), (60, 12),
    (61, 13), (62, 14), (63, 15), (64, 16), (65, 17), (66, 18),
    (67, 19), (68, 20), (69, 21), (70, 22), (71, 23), (72, 24),
    
    (73, 1), (74, 2), (75, 3), (76, 4), (77, 5), (78, 6),
    (79, 7), (80, 8), (81, 9), (82, 10), (83, 11), (84, 12),
    (85, 13), (86, 14), (87, 15), (88, 16), (89, 17), (90, 18),

    (1, 19), (2, 20), (3, 21), (4, 22), (5, 23), (6, 24),
    (7, 1), (8, 2), (9, 3), (10, 4), (11, 5), (12, 6),
    (13, 7), (14, 8), (15, 9), (16, 10), (17, 11), (18, 12),
    (19, 13), (20, 14), (21, 15), (22, 16), (23, 17), (24, 18),
    
    (25, 19), (26, 20), (27, 21), (28, 22), (29, 23), (30, 24),
    (31, 1), (32, 2), (33, 3), (34, 4), (35, 5), (36, 6),
    (37, 7), (38, 8), (39, 9), (40, 10), (41, 11), (42, 12),
    (43, 13), (44, 14), (45, 15), (46, 16), (47, 17), (48, 18),
    
    (49, 19), (50, 20), (51, 21), (52, 22), (53, 23), (54, 24),
    (55, 1), (56, 2), (57, 3), (58, 4), (59, 5), (60, 6),
    (61, 7), (62, 8), (63, 9), (64, 10), (65, 11), (66, 12),
    (67, 13), (68, 14), (69, 15), (70, 16), (71, 17), (72, 18),
    
    (73, 19), (74, 20), (75, 21), (76, 22), (77, 23), (78, 24),
    (79, 1), (80, 2), (81, 3), (82, 4), (83, 5), (84, 6),
    (85, 7), (86, 8), (87, 9), (88, 10), (89, 11), (90, 12),

    (1, 13), (2, 14), (3, 15), (4, 16), (5, 17), (6, 18),
    (7, 19), (8, 20), (9, 21), (10, 22), (11, 23), (12, 24);
-------------------------------------------------------------------------------------








