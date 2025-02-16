--create  Trainning Manager
	-- sp_ADDTraining_Manager (FirstName,LastName)

	exec sp_ADDTraining_Manager 'mrihan','mohammed'

-------------------------------------------------------------------------------------------
	--Create Account to this Manager
		-- sp_AddAccountToTraining_manager (UserName,Password ,Training manager ID)
	exec sp_AddAccountToTraining_manager 'Mustafa@1234567','Yasser@34',7

-------------------------------------------------------------------------------------------
	--- create branch 
	--   sp_TrMager_Add_Branch (TRM_Account_ID ,Name ,Location)
	exec sp_TrMager_Add_Branch 49,'Elwady Elgadiid','Qenaa'
	
	 --Edit branch
	 -- sp_TrMagerEditBranch (TRM_Account_ID,Branch_ID,Branch_Name=> opt,Location=>opt)
	exec sp_TrMagerEditBranch 49,16,'Halaib'

-------------------------------------------------------------------------------------------
	--create intake
	--sp_TrMagerAddIntake (TRM-Manager,Intack Name,Year)
	exec sp_TrMagerAddIntake 49,'Intack 200',2199

	--edit intack 
	-- sp_TrMager_Edit_Intake (TRM_ID,Intack_ID,Intack_Name=>opt,Year=>Opt)
	exec sp_TrMager_Edit_Intake 49,50,'Inack 99'       

-------------------------------------------------------------------------------------------
	--create track 
	-- sp_TrMager_Add_Track (TRm_ID,Track_Name,Description)
	exec  sp_TrMager_Add_Track 49,'Sd BeniSwuef','Studies sd courses'

	--edit track
	--sp_TrMager_Edit_Track(TRM_ID,Track_ID,Track__Name =>Opt,Description=>opt)
	exec sp_TrMager_Edit_Track 49,7,'Devops BeniSwuef'            

-------------------------------------------------------------------------------------------
	-- createcourse
	-- sp_CreateCourseByTRM(TRm_Account_Id,Course_Name,Description,Max Degree,Min Degree , Duration Hours
	 exec sp_CreateCourseByTRM 49,'Interview skills','How to sell with others',100,65,30

-------------------------------------------------------------------------------------------
	 --create instructor
	 -- Sp_AddInstructor(F_Name , L_Name ,City,Zip_Code,Phone,Gender,DOB , Salary)
	 exec Sp_AddInstructor 'ramezz','Noshy','cairo',2056,26654839,'M','2000-02-11',20000 
			
-------------------------------------------------------------------------------------------
	 --Add Account to Instructor
	 --    sp_AddAccountToinstructor (UserName,Password,Ins_Id)
	 exec  sp_AddAccountToinstructor 'Sarah_Salah',1234,12

-------------------------------------------------------------------------------------------
	 --managers create studens
	 -- SP_AddNewStudent (F_Name,L_Name,City,Zip_Code,Phone,Gender,DOB,TRM_Account_ID)
	 exec SP_AddNewStudent 'Yasser','Said Ali','cairo',23656,26654839,'F','2000-02-11',49
	

-------------------------------------------------------------------------------------------
	-- manager add student to intak branch-track
	-- sp_TrMager_Set_studentinTrackandintackandbranch (St_Id,Track_Id,Branch_ID,Intack_ID)
	exec sp_TrMager_Set_studentinTrackandintackandbranch 36,10,15,50 
		
-------------------------------------------------------------------------------------------
	-- sp_AddCoursetoInstructor (inst_ID,Course_ID)
	exec sp_AddCoursetoInstructor 1,14

-------------------------------------------------------------------------------------------
	-- sp_ValidateUserLogin(userName,Password , Isvalid =>Out)
	declare @istrue bit ;  
	exec sp_ValidateUserLogin 'Ahmedweal','mustafa!123',@istrue out
	select @istrue

	declare @istrue2 bit ;  
	exec sp_ValidateUserLogin 'user','Pass',@istrue2 out
	select @istrue2
		
 

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-------- Show Questions In Specific Course ------------------------
go
EXEC ExamManagement.ShowQuestionsInSpecificCourse @CourseId = 2;
go
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--------Instructor Add Exam Manual ------------------------------------------
DECLARE @SelectedQuestions QuestionTableType;

INSERT INTO @SelectedQuestions (QuestionId, Mark)
VALUES (4, 1), (9, 1), (43, 1), (80, 2);

EXEC CreateExam_Manual
    @Name = 'Final_Exam T-SQL Server',
    @StartTime = '2024-02-16 10:00:00',
    @EndTime = '2024-02-17 12:00:00',
    @Type = 'practice',
    @TotalGradeOfExam = 5,
    @CourseId = 2,
    @UserName = 'sarah22',
    @Password = '159753',
    @Questions = @SelectedQuestions;


select * from ExamManagement.Exam 

--------------------------------------------------------------------------
-------Get Exam Questions With Choices------------------------------------
go
EXEC ExamManagement.GetExamQuestionsWithChoices @ExamId = 8;
go

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--------Instructor Add Exam with Random Questions ---------------------------
go
EXEC CreateExam 
    @Name = 'sql-Final-Project',
    @StartTime = '2025-02-11 10:00:00',
    @EndTime = '2025-02-20 12:00:00',
    @Type = 'test3',
    @TotalGradeOfExam = 13,
    @CourseId = 2,
    @MCQCount = 2,
    @TrueFalseCount = 1,
    @WrittenCount = 1,
    @MCQMark = 3,
    @TrueFalseMark = 2,
    @WrittenMark = 5,
    @UserName = 'sarah22',
    @Password = '159753';
go


select * from ExamManagement.Exam


------------------------------------------------------------------
------Add Students To Exam------------------------------------------
go
EXEC AddStudentsToExam @ExamId = 3, @StudentId = 1;
go
EXEC AddStudentsToExam @ExamId = 3, @StudentId = 2;
go


--------------------------------------------------------------------------
-------Get Exam Questions With Choices------------------------------------
go
EXEC ExamManagement.GetExamQuestionsWithChoices @ExamId = 3;
go


----------- Insert Exam Answers from Student ----------------------------------------
go
EXEC InsertStudentAnswers 
    @ExamId = 3, 
    @Exam_QuestionId = 13, 
	@McqId = 16, 
    @ChoiceId = 53, 
    @UserName = 'Hagag', 
    @Password = '123456';
	
go


-------Quetion 1----------------------------------------------------------
go
EXEC InsertStudentAnswers 
    @ExamId = 3, 
    @Exam_QuestionId = 16, 
	@McqId = 14, 
    @ChoiceId = 53, 
    @UserName = 'qassem', 
    @Password = '123456';
go
go
EXEC InsertStudentAnswers 
    @ExamId = 3, 
    @Exam_QuestionId = 16, 
	@McqId = 14, 
    @ChoiceId = 53, 
    @UserName = 'omar', 
    @Password = '456123';

-------Quetion 2----------------------------------------------------------
go
EXEC InsertStudentAnswers 
    @ExamId = 3, 
    @Exam_QuestionId = 17, 
	@McqId = 20, 
    @ChoiceId = 77, 
    @UserName = 'qassem', 
    @Password = '123456';
go
go
EXEC InsertStudentAnswers 
    @ExamId = 3, 
    @Exam_QuestionId = 17, 
	@McqId = 20, 
    @ChoiceId = 77, 
    @UserName = 'omar', 
    @Password = '456123';
go
-------Quetion 3 ----------------------------------------------------------
EXEC InsertStudentAnswers 
    @ExamId = 3, 
    @Exam_QuestionId = 18, 
    @StudentAnswerTrueFalse = 'True',
    @UserName = 'omar', 
    @Password = '456123';
go
go
EXEC InsertStudentAnswers 
    @ExamId = 3, 
    @Exam_QuestionId = 18, 
    @StudentAnswerTrueFalse = 'False',
    @UserName = 'qassem', 
    @Password = '123456';
go
-------Quetion 4 ----------------------------------------------------------

EXEC InsertStudentAnswers 
    @ExamId = 3, 
    @Exam_QuestionId = 19, 
    @StudentAnswerOpenEnded = 'Normalization organizes database tables to minimize redundancy and dependency, ensuring data integrity and database design.',
    @UserName = 'qassem', 
    @Password = '123456';
go

EXEC InsertStudentAnswers 
    @ExamId = 3, 
    @Exam_QuestionId = 19, 
    @StudentAnswerOpenEnded = 'GROUP BY without aggregate functions, but it is generally not recommended as it may lead to unpredictable.',
    @UserName = 'omar', 
    @Password = '456123';
go



--------------------------------------------------------------------
-----Calc Grade Of Exam For Student -----------------------------------------------
go
EXEC CalcGradeOfExamForStudent
    @ExamId = 3,
    @StudentId = 3,
    @UserName = 'sarah22',
    @Password = '159753';
go
-----------exepected  22
go
EXEC CalcGradeOfExamForStudent
    @ExamId = 3,
    @StudentId = 1,
    @UserName = 'sarah22',
    @Password = '159753';
go
-----------exepected  16
EXEC CalcGradeOfExamForStudent
    @ExamId = 3,
    @StudentId = 2,
    @UserName = 'sarah22',
    @Password = '159753';
go

---------- Student Exam Results With Ranking ----------------------------------
SELECT * FROM StudentExamResultsWithRanking WHERE ExamId = 3;




----------------------------------------------------------------------------
----------------------------------------------------------------------------
---Function to Get Student Exam Score
---------------------------------------------
--@StudentID INT, @ExamID INT 

SELECT dbo.Get_StudentExamScoreFunc(1, 3) AS StudentScore;
SELECT dbo.Get_StudentExamScoreFunc(2, 3) AS StudentScore;



---Function to Count Total Students in a Course(@courseId)
SELECT dbo.CountStudentsInCourse(2) AS TotalStudents;


--Function to Get Exam Average Score(examId)
select dbo.GetExamAverageScore(3) as AvgScore



go
-- Function to Get Instructor's Course Count
select dbo.GetInstructorCourseCount(1) as CourseCount


-- Function to Get Total Exams for a Course
select dbo.GetTotalExamsForCourse(2) as ExamCount




----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
/*1)View Name: StudentExamResults
Description: 
    This view retrieves student exam results for each course.
    It calculates the total score of a student across all exams
    within a specific course and determines whether the student
    has passed or failed based on the course's minimum passing score*/
Select * from StudentExamResultsINCourses
---------------------------------------------
/*2)
View Name: CourseExams
Description: 
    This view retrieves all exams associated with their respective courses.
    It ensures that the course name appears only once for each group of exams
    related to it, providing a structured and readable format.
*/
SELECT * FROM CourseExams
------------------------------------------------
/*3)
View Name: CourseExamStudents
Description: 
    This view retrieves the list of students who are scheduled to take each exam.
    It includes the course name, exam name, and student full names.
    If no students are assigned to an exam, it displays "No students assigned in this exam".
*/
select  * from CourseExamStudents
------------------------------------------------
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
SELECT * FROM FullQuestionDetails;
--------------------------------------------------------------------------------------------------
/*6)
View Name: BranchDetails
Description: 
    This view retrieves all columns from the ACREBR table, 
    which contains information about branches.
    It provides a structured way to access branch data 
    without directly querying the base table.

Usage:
    SELECT * FROM BranchDetails;*/
select * from BranchDetails
--------------------------------------------------------------------------------------------------
/*7)
View Name: BranchTrackIntakeDetails

Description:
    This view provides a detailed mapping of branches, tracks, and intakes. 
    It allows users to retrieve:
    - Branch names
    - Track names
    - Intake names

Usage:
    - Retrieve all branch-track-intake mappings:
      
        SELECT * FROM BranchTrackIntakeDetails;
    
    - Retrieve details for a specific branch:
 
        SELECT * FROM BranchTrackIntakeDetails WHERE [Brach Name] = 'Cairo Branch';

    - Retrieve all tracks for a specific intake:
        
        SELECT * FROM BranchTrackIntakeDetails WHERE [Intake Name] = 'Intake 45';*/

SELECT * FROM BranchTrackIntakeDetails
SELECT * FROM BranchTrackIntakeDetails WHERE [Brach Name] = 'Cairo Branch';
SELECT * FROM BranchTrackIntakeDetails WHERE [Intake Name] = 'Intake 45'
--------------------------------------------------------------------------------------------------
/*8)
View Name: ClassDetails
Description: 
    This view retrieves class-related information from the ACRECL table.
    It includes details about the class name, academic year, semester, and class identifier.

Usage:
    SELECT * FROM ClassDetails;*/
select * from ClassDetails
--------------------------------------------------------------------------------------------------

/*9)
View Name: IntakeDetails
Description: 
    This view retrieves all intake-related information from the ACREIn table.
    It provides a structured way to access intake numbers and their respective years.

Usage:
    SELECT * FROM IntakeDetails;*/
Select * from IntakeDetails
--------------------------------------------------------------------------------------------------
/*10)
View Name: TrackDetails
Description: 
    This view retrieves all track-related information from the ACRETR table.
    It provides a structured way to access track names and their descriptions.*/


SELECT * FROM TrackDetails
--------------------------------------------------------------------------------------------------
/*11)
View Name: UserAccounts
Description: 
    This view retrieves all user accounts from the USERMACC table.
    It displays user IDs and usernames but does not expose passwords for security reasons.*/
SELECT * FROM UserAccounts
--------------------------------------------------------------------------------------------------
/*12)
View Name: ShowAllCourse_V

Description:
    This view retrieves all columns from the `AcademicRecords.Course` table.
    It provides an easy way to access all available course details without directly querying the base table.

Usage:
    - Retrieve all courses by executing:
     
        SELECT * FROM ShowAllCourse_V;
     
    - This view can be used in reports, dashboards, and application queries.*/
 SELECT * FROM ShowAllCourse_V;
 --------------------------------------------------------------------------------------------------
 /*13)
View Name: ShowCoursesName_V

Description:
    This view retrieves only the course names from the `AcademicRecords.Course` table.
    It provides a simple way to list all available courses without exposing full course details.

Usage:
    - Retrieve all course names by executing:
      
        SELECT * FROM ShowCoursesName_V;*/
Select * from ShowCoursesName_V
--------------------------------------------------------------------------------------------------
/*14)
View Name: CourseWithPassingRate

Description:
    This view retrieves course details from `AcademicRecords.Course` 
    and calculates the passing rate as a percentage.
    The passing rate is computed as:
        (MinDegree / MaxDegree) * 100

Usage:
    - Retrieve all course details along with the calculated passing rate:
   
        SELECT * FROM CourseWithPassingRate;
--view courses with calculated pass rate:*/
select * from CourseWithPassingRate
--------------------------------------------------------------------------------------------------
/*15)
View Name: LongCourses

Description:
    This view retrieves courses from `AcademicRecords.Course` where the duration 
    exceeds 30 hours. It is useful for identifying long-duration courses.

Usage:
    - Retrieve all long courses:
        ```sql
        SELECT * FROM LongCourses;
--View to view long courses only (more than 30 hours)*/
select * from LongCourses
--------------------------------------------------------------------------------------------------
/*16)
View Name: CourseMinMaxDuration

Description:
    This view retrieves the shortest and longest courses based on DurationHours.
    It helps in identifying courses with minimal and maximal time commitments.

Usage:
    - Retrieve the shortest and longest courses:
        ```sql
        SELECT * FROM CourseMinMaxDuration;
--View to view the shortest and longest courses*/
select * from CourseMinMaxDuration
--------------------------------------------------------------------------------------------------
/*17)
View Name: AvgCourseDuration

Description:
    This view calculates the average duration (in hours) of all courses.
    It helps in understanding the general time commitment required for courses.

Usage:
    - Retrieve the average course duration:
        ```sql
        SELECT * FROM AvgCourseDuration;
--View to display the average duration of the courses*/
select * from AvgCourseDuration
--------------------------------------------------------------------------------------------------
/*18)
View Name: CoursesNeedingReview

Description:
    This view identifies courses where the minimum passing degree is set 
    too high (greater than 50% of the maximum possible degree). These 
    courses may need review to ensure a fair grading policy.

Usage:
    - Retrieve courses that may require modification:
        ```sql
        SELECT * FROM CoursesNeedingReview;
View to display the courses that need to be modified
(if the minimum is greater than 50% of the maximum)*/
select * from CoursesNeedingReview;
--------------------------------------------------------------------------------------------------
/*19)
View Name: CoursesWithoutDescription

Description:
    This view retrieves all courses that do not have a description (NULL values).
    These courses might need additional information to provide a better understanding 
    for students and instructors.

Usage:
    - Retrieve courses missing descriptions:
        ```sql
        SELECT * FROM CoursesWithoutDescription;
--View to display courses that do not contain a description (NULL)*/

select * from CoursesWithoutDescription
--------------------------------------------------------------------------------------------------
/*20)
View Name: CoursesWithStudents

Description:
    This view retrieves the list of students enrolled in each course.
    It joins the `Course` table with `Instructor_Course_Student` to get
    course details and associated student IDs.

Usage:
    - Retrieve all students enrolled in courses:
        ```sql
        SELECT * FROM CoursesWithStudents;
--View to view the students enrolled in each course*/
select * from CoursesWithStudents
--------------------------------------------------------------------------------------------------
/*21)
View Name: CourseDetails

Description:
    This view retrieves detailed information about courses, including:
    - Course details (name, description, max/min degree, duration)
    - Instructor details (name, city, phone)
    - Class details (name, year, semester)
    - Course teaching history (start date, end date, duration)

Usage:
    - Retrieve all course details:
        
        SELECT * FROM CourseDetails;
        
    - Retrieve courses taught in a specific year and semester:
  
        SELECT * FROM CourseDetails 
        WHERE ClassYear = 2024 AND ClassSemester = 'Spring';
View It displays details of the courses,
with information about the teachers who taught them, and the classes in which they were taught.*/
select * from CourseDetails where ClassYear = 2024 and ClassSemester = 'Spring';
--------------------------------------------------------------------------------------------------
/*16)
View Name: StudentCoursesDetails

Description:
    This view provides detailed information about students enrolled in training courses, including:
    - Student details (name, city, phone)
    - Course details (name, description)
    - Instructor details (name, teaching period)
    - Class details (name, ID)

Usage:
    - Retrieve all student-course-instructor-class details:
    
        SELECT * FROM StudentCoursesDetails;
        
    - Retrieve courses attended by a specific student:
       
        SELECT * FROM StudentCoursesDetails WHERE StudentID = [Student_ID];
 
    - Retrieve all students enrolled in a specific course:
   
        SELECT * FROM StudentCoursesDetails WHERE CourseID = [Course_ID];
      
This view displays data for students registered in training courses,
along with course information and the instructor responsible for teaching.*/
select  * from StudentCoursesDetails
--------------------------------------------------------------------------------------------------
