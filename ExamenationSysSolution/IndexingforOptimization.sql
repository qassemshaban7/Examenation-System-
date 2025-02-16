----------------- Indexing for Optimization ---------------

-- Index on Exam start time to speed up queries filtering or sorting by StartTime
CREATE NONCLUSTERED INDEX IDX_ExamDate 
ON ExamManagement.Exam (StartTime);



-- Index on ExamId and StudentId to optimize queries searching for students' exams
CREATE NONCLUSTERED INDEX IDX_ExamResults 
ON ExamManagement.StudentListExam (ExamId, StudentId);



-- Index on CourseId in Question table to enhance search performance for questions related to a course
CREATE NONCLUSTERED INDEX IDX_QuestionCourse 
ON ExamManagement.Question (CourseId);



-- Index on CourseId in Exam table to optimize queries retrieving exams for a specific course
CREATE NONCLUSTERED INDEX IDX_ExamCourse 
ON ExamManagement.Exam (CourseId);



-- Index on Instructor_Course_History to improve efficiency when looking up instructor-course assignments
CREATE NONCLUSTERED INDEX IDX_InstructorCourses 
ON AcademicRecords.Instructor_Course_History (InsID, CrsID);





-- Index to quickly retrieve exam results for a specific student and exam
CREATE NONCLUSTERED INDEX IDX_StudentExam 
ON AcademicRecords.Student_Exam (StudentID, ExamID) 
INCLUDE (Score);



-- Index to improve search performance for students based on name, and retrieve additional details efficiently
CREATE NONCLUSTERED INDEX IDX_StudentName 
ON AcademicRecords.Student (Fname,Lname) 
INCLUDE (phone, City, Birthdate, Brn_Track_IntakeId);




-- Index to speed up queries filtering by exam start and end time, and include CourseID for direct access
CREATE NONCLUSTERED INDEX IDX_ExamStartTime 
ON ExamManagement.Exam (StartTime, EndTime) 
INCLUDE (CourseID);



-- Index to optimize queries searching for courses by name and retrieving course details
CREATE NONCLUSTERED INDEX IDX_CourseName 
ON AcademicRecords.Course (Crs_Name) 
INCLUDE (Description, MaxDegree, MinDegree);
