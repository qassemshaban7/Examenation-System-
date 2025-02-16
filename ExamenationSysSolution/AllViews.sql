
                                  /*Views*/
-------------------------------------------------------------------------------

/*1)
View Name: StudentExamResults
Description: 
    This view retrieves student exam results for each course.
    It calculates the total score of a student across all exams
    within a specific course and determines whether the student
    has passed or failed based on the course's minimum passing score*/
Go
CREATE or alter VIEW StudentExamResultsINCourses
AS
SELECT 
    S.Fname + ' ' + S.Lname AS [Student Name],
    C.Crs_Name AS [Course Name],
    I.Fname + ' ' + I.Lname AS [Instructor Name],
	C.MaxDegree as [Course Degree],
    SUM(SE.Score) AS [Total Score],
    CASE 
        WHEN SUM(SE.Score) >= C.[MinDegree] THEN 'Passed' 
        ELSE 'Failed' 
    END AS [Result]
FROM AcademicRecords.Course C
INNER JOIN ExamManagement.Exam E 
    ON C.Id = E.CourseId
INNER JOIN UserManagement.Instructor I 
    ON C.InstructorId = I.Id 
    AND E.InsId = I.Id 
INNER JOIN AcademicRecords.Student_Exam SE 
    ON E.Id = SE.ExamId  
INNER JOIN AcademicRecords.Student S 
    ON S.Id = SE.StudentId  
GROUP BY S.Fname, S.Lname, C.Crs_Name, C.MaxDegree, I.Fname, I.Lname, C.[MinDegree];
GO
------------------------------------------------------------------------------
/*2)
View Name: CourseExams
Description: 
    This view retrieves all exams associated with their respective courses.
    It ensures that the course name appears only once for each group of exams
    related to it, providing a structured and readable format.
*/
Select * from StudentExamResultsINCourses

GO
CREATE OR ALTER VIEW CourseExams AS
SELECT TOP 100 PERCENT 
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY C.Crs_Name ORDER BY E.StartTime) = 1 
        THEN C.Crs_Name 
        ELSE '' 
    END AS [Course Name],  
    E.Name AS [Exam Name],  
    E.StartTime,  
    E.EndTime,  
    E.Type AS [Exam Type],  
    E.TotalGradesOfExam AS [Total Grade]  
FROM AcademicRecords.Course C  
INNER JOIN ExamManagement.Exam E  
    ON C.Id = E.CourseId  
ORDER BY C.Crs_Name, E.StartTime;
GO
SELECT * FROM CourseExams
----------------------------------------------------------------------------------------------------
/*3)
View Name: CourseExamStudents
Description: 
    This view retrieves the list of students who are scheduled to take each exam.
    It includes the course name, exam name, and student full names.
    If no students are assigned to an exam, it displays "No students assigned in this exam".
*/
GO
CREATE OR ALTER VIEW CourseExamStudents AS
SELECT 
    C.Crs_Name AS [Course Name],  
    E.Name AS [Exam Name],        
    COALESCE(S.Fname + ' ' + S.Lname, 'No students assigned in this exam') AS [Student Name]  
   
FROM AcademicRecords.Course C
INNER JOIN ExamManagement.Exam E 
    ON C.Id = E.CourseId
LEFT JOIN ExamManagement.StudentListExam SLE  
    ON E.Id = SLE.ExamId  
LEFT JOIN AcademicRecords.Student S  
    ON SLE.StudentId = S.Id;
GO
select  * from CourseExamStudents
-----------------------------------------------------------


-------------------------------------------

Go


--
SELECT * FROM ExamManagement.Exam_Question;
SELECT * FROM ExamManagement.MCQ;
SELECT * FROM ExamManagement.True_False;
SELECT * FROM ExamManagement.WrittenQuestion;

--
SELECT EQ.QuestionId 
FROM ExamManagement.Exam_Question EQ
LEFT JOIN ExamManagement.MCQ Q ON EQ.QuestionId = Q.Id
WHERE Q.Id IS NULL;  -- ???? ?? ??????? ??? ???????? ?? MCQ

SELECT EQ.QuestionId 
FROM ExamManagement.Exam_Question EQ
LEFT JOIN ExamManagement.True_False Q ON EQ.QuestionId = Q.Id
WHERE Q.Id IS NULL;

SELECT EQ.QuestionId 
FROM ExamManagement.Exam_Question EQ
LEFT JOIN ExamManagement.WrittenQuestion Q ON EQ.QuestionId = Q.Id
WHERE Q.Id IS NULL;

SELECT EQ.QuestionId
FROM ExamManagement.Exam_Question EQ
LEFT JOIN ExamManagement.MCQ MCQ ON EQ.QuestionId = MCQ.QuestionId
LEFT JOIN ExamManagement.True_False TF ON EQ.QuestionId = TF.QuestionId
LEFT JOIN ExamManagement.WrittenQuestion WQ ON EQ.QuestionId = WQ.QuestionId
WHERE MCQ.QuestionId IS NULL 
  AND TF.QuestionId IS NULL 
  AND WQ.QuestionId IS NULL;

GO
-------------------------------------------------------
/*4)
View Name: CourseExamQuestions  
Description: 
    This view retrieves all courses, their exams, and the questions included in each exam.
    It lists:
      - Course Name
      - Exam Name
      - Question Type (Multiple Choice, True/False, Open-Ended)
      - Question Text (Body)

    The view consolidates questions from three different tables:
      - MCQ (Multiple Choice Questions)
      - True/False Questions
      - Written (Open-Ended) Questions
*/

GO
CREATE OR ALTER VIEW CourseExamQuestions AS
SELECT 
    C.Crs_Name AS [Course Name],   
    E.Name AS [Exam Name],         
    'Multiple Choice' AS [Question Type],  
    Q.Body AS [Question Text]  
FROM AcademicRecords.Course C
INNER JOIN ExamManagement.Exam E 
    ON C.Id = E.CourseId
INNER JOIN ExamManagement.Exam_Question EQ  
    ON E.Id = EQ.ExamId  
INNER JOIN ExamManagement.MCQ MCQ  
    ON EQ.QuestionId = MCQ.QuestionId
INNER JOIN ExamManagement.Question Q  -- ??? ?? ??????
    ON EQ.QuestionId = Q.Id 

UNION ALL

SELECT 
    C.Crs_Name,  
    E.Name,  
    'True/False',  
    Q.Body  
FROM AcademicRecords.Course C
INNER JOIN ExamManagement.Exam E 
    ON C.Id = E.CourseId
INNER JOIN ExamManagement.Exam_Question EQ  
    ON E.Id = EQ.ExamId  
INNER JOIN ExamManagement.True_False TF  
    ON EQ.QuestionId = TF.QuestionId
INNER JOIN ExamManagement.Question Q  
    ON EQ.QuestionId = Q.Id 

UNION ALL

SELECT 
    C.Crs_Name,  
    E.Name,  
    'Open-Ended',  
    Q.Body  
FROM AcademicRecords.Course C
INNER JOIN ExamManagement.Exam E 
    ON C.Id = E.CourseId
INNER JOIN ExamManagement.Exam_Question EQ  
    ON E.Id = EQ.ExamId  
INNER JOIN ExamManagement.WrittenQuestion WQ  
    ON EQ.QuestionId = WQ.QuestionId
INNER JOIN ExamManagement.Question Q  
    ON EQ.QuestionId = Q.Id;
GO

select *from CourseExamQuestions
-----------------------------------------------------------------------------------------------------
/*5)
View Name: FullQuestionDetails

Description:
    This view retrieves all questions from the database, considering the following:
    1. Displays all question types (MCQ, True/False, Open-Ended).
    2. Non-MCQ questions will appear without choices, with the message "No Choices Available".
    3. MCQ questions will display all their associated choices in a single row, separated by " | ".
    4. Each choice is prefixed with its corresponding ID (ID: Choice).*/
GO
CREATE OR ALTER VIEW FullQuestionDetails AS
-- ??????? ??? MCQ ???? ??????
SELECT 
    Q.Body AS [Question Text],   
    Q.QuestionType AS [Question Type],  
    'No Choices Available' AS [Answer Choices]  -- ??? ????? ????? ?? NULL
FROM ExamManagement.Question Q
WHERE Q.QuestionType <> 'MCQ'  

UNION ALL

-- ????? MCQ ?? ???? ???????? ?? ?? ???? (ID + Choice)
SELECT 
    Q.Body AS [Question Text],  
    Q.QuestionType AS [Question Type],  
    COALESCE(STRING_AGG(CONCAT(C.Id, ': ', C.Choice), ' | '), 'No Choices Available') AS [Answer Choices]  
FROM ExamManagement.Question Q
LEFT JOIN ExamManagement.MCQ MCQ  
    ON Q.Id = MCQ.QuestionId
LEFT JOIN ExamManagement.Choices C  
    ON MCQ.QuestionId = C.MCQID  
GROUP BY Q.Body, Q.QuestionType;  
GO

SELECT * FROM FullQuestionDetails;
------------------------------------------------------------------------------------
/*6)
View Name: BranchDetails
Description: 
    This view retrieves all columns from the ACREBR table, 
    which contains information about branches.
    It provides a structured way to access branch data 
    without directly querying the base table.

Usage:
    SELECT * FROM BranchDetails;*/
GO
CREATE OR ALTER VIEW BranchDetails AS
select * from ACREBR
Go
select * from BranchDetails
 select * from [AcademicRecords].[Branch_Track_Intake]
--------------------------------------------------------------------------
/*7)
View Name: BranchDetails
Description: 
    This view retrieves all columns from the ACREBR table, 
    which contains information about branches.
    It provides a structured way to access branch data 
    without directly querying the base table.

Usage:
    SELECT * FROM BranchDetails;*/
GO
CREATE OR ALTER VIEW BranchTrackIntakeDetails AS
SELECT 
    BTI.Id AS RecordID,
    B.[Name]as[Brach Name],
    T.[Name]as[Track Name],
    I.[Name]as[Intake Name]
FROM AcademicRecords.Branch_Track_Intake BTI
LEFT JOIN AcademicRecords.Branch B ON BTI.BranchId = B.Id
LEFT JOIN AcademicRecords.Track T ON BTI.TrackId = T.Id
LEFT JOIN AcademicRecords.Intake I ON BTI.IntakeId = I.Id;
GO
select * from BranchTrackIntakeDetails
----------------------------------------------------------------------------------
/*8)
View Name: ClassDetails
Description: 
    This view retrieves class-related information from the ACRECL table.
    It includes details about the class name, academic year, semester, and class identifier.

Usage:
    SELECT * FROM ClassDetails;*/
GO
CREATE OR ALTER VIEW ClassDetails AS
select * from ACRECL
GO
select * from ClassDetails
-------------------------------------------------------------------------------------
/*9)
View Name: IntakeDetails
Description: 
    This view retrieves all intake-related information from the ACREIn table.
    It provides a structured way to access intake numbers and their respective years.

Usage:
    SELECT * FROM IntakeDetails;*/
GO
Create or alter View IntakeDetails As 
select * from ACREIn
GO
Select * from IntakeDetails
----------------------------------------------------------------------------------
/*10)
View Name: TrackDetails
Description: 
    This view retrieves all track-related information from the ACRETR table.
    It provides a structured way to access track names and their descriptions.

Usage:
    SELECT * FROM TrackDetails;*/
GO
Create Or Alter View TrackDetails as
select * from ACRETR
GO
select * from TrackDetails
-------------------------------------------------------------------------------
/*
View Name: UserAccounts
Description: 
    This view retrieves all user accounts from the USERMACC table.
    It displays user IDs and usernames but does not expose passwords for security reasons.

Usage:
    SELECT * FROM UserAccounts;*/
GO
Create Or Alter View UserAccounts as
select * from USERMACC
GO
Select * from UserAccounts
----------------------------------------------------------------------------------
-- Select questions based on the provided CourseId
Go
CREATE or alter PROCEDURE GetQuestionsByCourseId
    @CourseId INT
AS
BEGIN
    SELECT q.id, q.Body, q.QuestionType
    FROM EXMGQUE q
    INNER JOIN ACRECO c ON q.CourseId = c.Id
    WHERE c.Id = @CourseId;
END
Go

EXEC GetQuestionsByCourseId 2
select id,Crs_Name
from ACRECO

select * from EXMGQUE
select * from ACRECO
----------------------------------------------------------

