
-- Create Function to Get Student Exam Score
CREATE FUNCTION GetStudentExamScore(@StudentID INT, @ExamID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Score INT;
    SELECT @Score = Score FROM AcademicRecords.Student_Exam WHERE StudentID = @StudentID AND ExamID = @ExamID;
    RETURN ISNULL(@Score, 0);
END;
GO


SELECT dbo.GetStudentExamScore(1, 1) AS StudentScore;



-- Create Function to Count Total Students in a Course
CREATE FUNCTION CountStudentsInCourse(@CourseID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalStudents INT;
    SELECT @TotalStudents = COUNT(StdId) FROM AcademicRecords.Instructor_Course_Student WHERE CrsId = @CourseID;
    RETURN @TotalStudents;
END;
GO

SELECT dbo.CountStudentsInCourse(1) AS TotalStudents;

-- Create Function to Get Exam Average Score
CREATE or alter FUNCTION GetExamAverageScore(@ExamID INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @AvgScore FLOAT;
    SELECT @AvgScore = AVG(Score) FROM AcademicRecords.Student_Exam WHERE ExamID = @ExamID;
    RETURN ISNULL(@AvgScore, 0);
END;
GO


select dbo.GetExamAverageScore(2) as AvgScore



go
-- Create Function to Get Instructor's Course Count
CREATE or alter FUNCTION GetInstructorCourseCount(@InstructorID INT)
RETURNS INT
AS
BEGIN
    DECLARE @CourseCount INT;
    SELECT @CourseCount = COUNT(*) FROM AcademicRecords.Course WHERE InstructorID = @InstructorID;
    RETURN @CourseCount;
END;
GO


select dbo.GetInstructorCourseCount(1) as CourseCount



go
-- Create Function to Get Total Exams for a Course
CREATE FUNCTION GetTotalExamsForCourse(@CourseID INT)
RETURNS INT
AS
BEGIN
    DECLARE @ExamCount INT;
    SELECT @ExamCount = COUNT(*) FROM ExamManagement.Exam WHERE CourseID = @CourseID;
    RETURN @ExamCount;
END;
GO


select dbo.GetTotalExamsForCourse(1) as ExamCount
