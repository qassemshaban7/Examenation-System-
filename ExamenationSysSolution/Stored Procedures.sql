-------------------------------------------------------------------------------
------------------------  Proc To Create Exam ---------------------------------
go
CREATE OR ALTER PROCEDURE CreateExam
    @Name VARCHAR(50),
    @StartTime DATETIME,
    @EndTime DATETIME,
    @Type VARCHAR(50),
    @TotalGradeOfExam INT,
    @CourseId INT,
    @MCQCount INT,
    @TrueFalseCount INT,
    @WrittenCount INT,
    @MCQMark INT,
    @TrueFalseMark INT,
    @WrittenMark INT,
    @UserName VARCHAR(50),
    @Password VARCHAR(40)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @AccId INT, @InsID INT, @ExamId INT;
    DECLARE @AvailableMCQ INT, @AvailableTrueFalse INT, @AvailableWritten INT;


    SELECT @AccId = Id FROM UserManagement.Account WHERE UserName = @UserName AND Password = @Password;
    IF (@AccId IS NULL)
    BEGIN
        PRINT 'User or password is not valid';
        RETURN;
    END;

    SELECT @InsID = Id FROM UserManagement.Instructor WHERE AccountId = @AccId;
    IF (@InsID IS NULL)
    BEGIN
        PRINT 'You are not an instructor';
        RETURN;
    END;

    IF NOT EXISTS (SELECT 1 FROM AcademicRecords.Course WHERE Id = @CourseId AND InstructorId = @InsID)
    BEGIN
        PRINT 'You are not the instructor of this course';
        RETURN;
    END;
	

	IF NOT EXISTS (
		SELECT 1 
		FROM AcademicRecords.Course 
		WHERE Id = @CourseId 
		  AND InstructorId = @InsID 
		  AND MaxDegree >= @TotalGradeOfExam
	)
	BEGIN
		PRINT 'Course MaxGrade must be greater than or equal to @TotalGradeOfExam';
		RETURN;  
	END;


    IF (@TotalGradeOfExam != (@MCQCount * @MCQMark + @TrueFalseCount * @TrueFalseMark + @WrittenCount * @WrittenMark))
    BEGIN
        PRINT 'TotalGradeOfExam must equal the sum of question marks';
        RETURN;
    END;

    SELECT 
        @AvailableMCQ = COUNT(*) FROM ExamManagement.Question WHERE QuestionType = 'Multiple Choice' AND CourseId = @CourseId;
    
    SELECT 
        @AvailableTrueFalse = COUNT(*) FROM ExamManagement.Question WHERE QuestionType = 'True/False' AND CourseId = @CourseId;
    
    SELECT 
        @AvailableWritten = COUNT(*) FROM ExamManagement.Question WHERE QuestionType = 'Open-Ended' AND CourseId = @CourseId;

    IF (@MCQCount > @AvailableMCQ)
    BEGIN
        PRINT 'Not enough Multiple Choice questions available';
        RETURN;
    END;

    IF (@TrueFalseCount > @AvailableTrueFalse)
    BEGIN
        PRINT 'Not enough True/False questions available';
        RETURN;
    END;

    IF (@WrittenCount > @AvailableWritten)
    BEGIN
        PRINT 'Not enough Written questions available';
        RETURN;
    END;

    INSERT INTO ExamManagement.Exam (Name, StartTime, EndTime, Type, TotalGradesOfExam, CourseId, InsId)
    VALUES (@Name, @StartTime, @EndTime, @Type, @TotalGradeOfExam, @CourseId, @InsID);

    SET @ExamId = SCOPE_IDENTITY();

    INSERT INTO ExamManagement.Exam_Question(ExamId, QuestionId, Mark)
    SELECT TOP (@MCQCount) @ExamId, Id, @MCQMark
    FROM ExamManagement.Question
    WHERE QuestionType = 'Multiple Choice' AND CourseId = @CourseId
    ORDER BY NEWID();

    INSERT INTO ExamManagement.Exam_Question(ExamId, QuestionId, Mark)
    SELECT TOP (@TrueFalseCount) @ExamId, Id, @TrueFalseMark
    FROM ExamManagement.Question
    WHERE QuestionType = 'True/False' AND CourseId = @CourseId
    ORDER BY NEWID();

    INSERT INTO ExamManagement.Exam_Question(ExamId, QuestionId, Mark)
    SELECT TOP (@WrittenCount) @ExamId, Id, @WrittenMark
    FROM ExamManagement.Question
    WHERE QuestionType = 'Open-Ended' AND CourseId = @CourseId
    ORDER BY NEWID();

    PRINT 'Exam and questions added successfully';
END;


EXEC CreateExam 
    @Name = 'C#_Quiz-Exam',
    @StartTime = '2025-02-11 10:00:00',
    @EndTime = '2025-02-20 12:00:00',
    @Type = 'test2',
    @TotalGradeOfExam = 10,
    @CourseId = 1,
    @MCQCount = 1,
    @TrueFalseCount = 0,
    @WrittenCount = 0,
    @MCQMark = 10,
    @TrueFalseMark = 1,
    @WrittenMark = 3,
    @UserName = 'mohsen',
    @Password = '951852';



---------------------------------------------------------------------------------------------
--------Create view to show question in course-----------------------------------------------
go
CREATE OR ALTER PROCEDURE ExamManagement.ShowQuestionsInSpecificCourse
    @CourseId INT
AS
begin
    SET NOCOUNT ON;

    SELECT 
        C.Crs_Name ,
		Q.Id As CourseID,
        Q.Body AS QuestionText,
        Q.Degree AS QuestionExepectedMark,
        Q.QuestionType,
        mcq.Id AS MCQID, 
        STRING_AGG(CONCAT(CH.Id, ' - ', CH.Choice), ' | ') AS Choices
    FROM AcademicRecords.Course C
    INNER JOIN ExamManagement.Question Q ON Q.CourseId = C.Id
    LEFT JOIN ExamManagement.MCQ mcq ON mcq.QuestionId = Q.Id
    LEFT JOIN ExamManagement.Choices CH ON CH.McqId = mcq.Id
    WHERE C.Id = @CourseId
    GROUP BY C.Crs_Name, Q.Id, Q.Body, Q.Degree, Q.QuestionType, mcq.Id;
END;
GO


EXEC ExamManagement.ShowQuestionsInSpecificCourse @CourseId = 2;



----------------------------------------------------------------------------------------------
---------------- Create exam manual ----------------------------------------------------------
CREATE TYPE QuestionTableType AS TABLE
(
    QuestionId INT,
    Mark INT
);
GO


GO
CREATE OR ALTER PROCEDURE CreateExam_Manual
    @Name VARCHAR(50),
    @StartTime DATETIME,
    @EndTime DATETIME,
    @Type VARCHAR(50),
    @TotalGradeOfExam INT,
    @CourseId INT,
    @UserName VARCHAR(50),
    @Password VARCHAR(40),
    @Questions QuestionTableType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @AccId INT, @InsID INT, @ExamId INT;
    DECLARE @TotalMarks INT;

    SELECT @AccId = Id FROM UserManagement.Account WHERE UserName = @UserName AND Password = @Password;
    IF (@AccId IS NULL)
    BEGIN
        PRINT 'User or password is not valid';
        RETURN;
    END;

    SELECT @InsID = Id FROM UserManagement.Instructor WHERE AccountId = @AccId;
    IF (@InsID IS NULL)
    BEGIN
        PRINT 'You are not an instructor';
        RETURN;
    END;

    IF NOT EXISTS (SELECT 1 FROM AcademicRecords.Course WHERE Id = @CourseId AND InstructorId = @InsID)
    BEGIN
        PRINT 'You are not the instructor of this course';
        RETURN;
    END;

    IF NOT EXISTS (
        SELECT 1 FROM AcademicRecords.Course 
        WHERE Id = @CourseId 
          AND InstructorId = @InsID 
          AND MaxDegree >= @TotalGradeOfExam
    )
    BEGIN
        PRINT 'Course MaxGrade must be greater than or equal to @TotalGradeOfExam';
        RETURN;  
    END;

    SELECT @TotalMarks = SUM(Mark) FROM @Questions;
    IF (@TotalMarks != @TotalGradeOfExam)
    BEGIN
        PRINT 'Total marks of selected questions must equal @TotalGradeOfExam';
        RETURN;
    END;

    IF EXISTS (
        SELECT 1 FROM @Questions Q
        JOIN ExamManagement.Question EQ ON Q.QuestionId = EQ.Id
        WHERE EQ.CourseId <> @CourseId
    )
    BEGIN
        PRINT 'Some selected questions do not belong to this course';
        RETURN;
    END;

    INSERT INTO ExamManagement.Exam (Name, StartTime, EndTime, Type, TotalGradesOfExam, CourseId, InsId)
    VALUES (@Name, @StartTime, @EndTime, @Type, @TotalGradeOfExam, @CourseId, @InsID);

    SET @ExamId = SCOPE_IDENTITY();

    INSERT INTO ExamManagement.Exam_Question (ExamId, QuestionId, Mark)
    SELECT @ExamId, QuestionId, Mark FROM @Questions;

    PRINT 'Exam created successfully with manually selected questions';
END;
GO


------------------------Execute -------------------
DECLARE @SelectedQuestions QuestionTableType;

INSERT INTO @SelectedQuestions (QuestionId, Mark)
VALUES (101, 10), (102, 15), (103, 5);

EXEC CreateExam_Manual
    @Name = 'Manual_Exam',
    @StartTime = '2024-02-16 10:00:00',
    @EndTime = '2024-02-17 12:00:00',
    @Type = 'Corrective-JS',
    @TotalGradeOfExam = 30,
    @CourseId = 1,
    @UserName = 'teacher123',
    @Password = 'pass123',
    @Questions = @SelectedQuestions;



	select * from AcademicRecords.Course
	select * from UserManagement.Account where id = 35
	select * from ExamManagement.Exam 

------------------------------------------------------------------------------------
---------------- Add Student To Exam List -------------------------------------------------
GO
CREATE OR ALTER PROCEDURE AddStudentsToExam
    @ExamId INT,
    @StudentId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM ExamManagement.Exam WHERE Id = @ExamId)
    BEGIN
        PRINT 'Exam does not exist';
        RETURN;
    END;

    IF NOT EXISTS (SELECT 1 FROM AcademicRecords.Student WHERE Id = @StudentId)
    BEGIN
        PRINT 'Student does not exist';
        RETURN;
    END;

    IF EXISTS (SELECT 1 FROM ExamManagement.StudentListExam WHERE ExamId = @ExamId AND StudentId = @StudentId)
    BEGIN
        PRINT 'Student is already registered for this exam';
        RETURN;
    END;

    INSERT INTO ExamManagement.StudentListExam (ExamId, StudentId)
    VALUES (@ExamId, @StudentId);

    PRINT 'Student added to the exam successfully';
END;
GO


EXEC AddStudentsToExam @ExamId = 6, @StudentId = 1;





------------------------------------------------------------------------------------
---------------- Proc To SHow Exam -------------------------------------------------
GO
CREATE OR ALTER PROCEDURE ExamManagement.GetExamQuestionsWithChoices
    @ExamId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        E.Id AS ExamId,
        EQ.Id AS Exam_QuestionId,
        Q.Body AS QuestionText,
        EQ.Mark AS QuestionMark,
        Q.QuestionType,
        mcq.Id AS MCQID, 
        STRING_AGG(CONCAT(CH.Id, ' - ', CH.Choice), ' | ') AS Choices
    FROM ExamManagement.Exam E
    INNER JOIN ExamManagement.Exam_Question EQ ON E.Id = EQ.ExamId
    INNER JOIN ExamManagement.Question Q ON Q.Id = EQ.QuestionId
    LEFT JOIN ExamManagement.MCQ mcq ON mcq.QuestionId = Q.Id
    LEFT JOIN ExamManagement.Choices CH ON CH.McqId = mcq.Id
    WHERE E.Id = @ExamId
    GROUP BY E.Id, EQ.Id, Q.Body, EQ.Mark, Q.QuestionType, mcq.Id;
END;
GO


EXEC ExamManagement.GetExamQuestionsWithChoices @ExamId = 6;





------------------------------------------------------------------------------------
--------------- Proc to Insert Student Answer --------------------------------------
GO
CREATE OR ALTER PROCEDURE InsertStudentAnswers
    @ExamId INT,
    @Exam_QuestionId INT,
    @StudentAnswerOpenEnded VARCHAR(300) = '', -- Open-Ended
    @StudentAnswerTrueFalse varchar(6) = '', --True/False
    @McqId INT = NULL, --  MCQ
    @ChoiceId INT = NULL, -- choice of MCQ
    @UserName VARCHAR(50),
    @Password VARCHAR(40)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @StudentId INT, @AccId INT, @QuestionId INT, @QuestionType VARCHAR(50), @Student_Answer_DetailsId INT;
    DECLARE @EndTime DATETIME;

    SELECT 
        @AccId = a.Id,
        @StudentId = s.Id,
        @QuestionId = eq.QuestionId,
        @QuestionType = q.QuestionType,
        @EndTime = ee.EndTime
    FROM UserManagement.Account a
    LEFT JOIN AcademicRecords.Student s ON s.AccountId = a.Id
    LEFT JOIN ExamManagement.Exam_Question eq ON eq.Id = @Exam_QuestionId
    LEFT JOIN ExamManagement.Exam ee ON ee.Id = @ExamId
    LEFT JOIN ExamManagement.Question q ON q.Id = eq.QuestionId
    WHERE a.UserName = @UserName AND a.Password = @Password;


    IF @AccId IS NULL
    BEGIN
        PRINT 'Invalid username or password';
        RETURN;
    END;

    IF @StudentId IS NULL
    BEGIN
        PRINT 'You are not a student';
        RETURN;
    END;

    IF @QuestionId IS NULL OR @QuestionType IS NULL
    BEGIN
        PRINT 'Invalid Exam Question ID or Question Type';
        RETURN;
    END;


    IF GETDATE() > @EndTime
    BEGIN
        PRINT 'The exam time has ended. You cannot submit your answer.';
        RETURN;
    END;


    IF NOT EXISTS (SELECT 1 FROM ExamManagement.StudentListExam WHERE StudentId = @StudentId AND ExamId = @ExamId)
    BEGIN
        PRINT 'You are not allowed to answer this exam';
        RETURN;
    END;


    IF NOT EXISTS (SELECT 1 FROM AcademicRecords.Student_Exam WHERE StudentId = @StudentId AND ExamId = @ExamId)
    BEGIN
        INSERT INTO AcademicRecords.Student_Exam (Score, StudentId, ExamId)
        VALUES (0, @StudentId, @ExamId);
    END;

    IF EXISTS (SELECT 1 FROM ExamManagement.Student_Answer_Details WHERE StudentId = @StudentId AND Exam_QuestionId = @Exam_QuestionId)
    BEGIN
        PRINT 'You have already answered this question';
        RETURN;
    END;


    INSERT INTO ExamManagement.Student_Answer_Details ( StudentId, Exam_QuestionId)
    VALUES ( @StudentId, @Exam_QuestionId);

    SET @Student_Answer_DetailsId = SCOPE_IDENTITY();


    IF @QuestionType = 'Multiple Choice'
    BEGIN
        INSERT INTO ExamManagement.Answer_MCQ (Student_Answer_DetailsId, McqId)
        VALUES (@Student_Answer_DetailsId, @McqId);

		declare @Answer_MCQId int;
		SET @Answer_MCQId = SCOPE_IDENTITY();

        INSERT INTO ExamManagement.Answer_Choice (Answer_MCQId, ChoiceId)
        VALUES (@Answer_MCQId, @ChoiceId);
    END
    ELSE IF @QuestionType = 'True/False'
    BEGIN
        INSERT INTO ExamManagement.Answer_True_False(Student_Answer_DetailsId, StudentanswerOfTrueFalse, True_FalseId)
        VALUES (@Student_Answer_DetailsId, @StudentAnswerTrueFalse, @Exam_QuestionId);
    END
    ELSE IF @QuestionType = 'Open-Ended'
    BEGIN
        INSERT INTO ExamManagement.Answer_Written (Student_Answer_DetailsId, StudentanswerOfWritten, WrittenId)
        VALUES (@Student_Answer_DetailsId, @StudentAnswerOpenEnded, @Exam_QuestionId);
    END;

    PRINT 'Answer inserted successfully';
END;
GO



EXEC InsertStudentAnswers 
    @ExamId = 6, 
    @Exam_QuestionId = 22, 
	@McqId = 2, 
    @ChoiceId = 5, 
    @UserName = 'qassem', 
    @Password = '123456';
	
EXEC InsertStudentAnswers 
    @ExamId = 4, 
    @Exam_QuestionId = 21, 
    @StudentAnswerTrueFalse = 'False',
    @UserName = 'qassem', 
    @Password = '123456';

EXEC InsertStudentAnswers 
    @ExamId = 4, 
    @Exam_QuestionId = 23, 
    @StudentAnswerOpenEnded = 'The process of photosynthesis occurs in plants.',
    @UserName = 'qassem', 
    @Password = '123456';





------------------------------------------------------------------------------------
--------------- Proc to Grade Of Exam --------------------------------------
GO
CREATE OR ALTER PROCEDURE CalcGradeOfExamForStudent
    @ExamId INT,
    @StudentId INT,
    @UserName VARCHAR(50),
    @Password VARCHAR(40)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @InstructorId INT, @CourseId INT, @TotalScore INT = 0, @KeywordCount INT, @MatchedKeywords INT, @QuestionMark INT;
    DECLARE @Keywords VARCHAR(MAX), @StudentAnswer VARCHAR(MAX);
    DECLARE @Keyword NVARCHAR(100);
    DECLARE @KeywordTable TABLE (Keyword NVARCHAR(100));

    SELECT @InstructorId = I.Id 
    FROM UserManagement.Instructor I
    INNER JOIN UserManagement.Account A ON I.AccountId = A.Id
    WHERE A.UserName = @UserName AND A.Password = @Password;


    IF @InstructorId IS NULL
    BEGIN
        PRINT 'Invalid instructor credentials';
        RETURN;
    END;

    SELECT @CourseId = CourseId 
    FROM ExamManagement.Exam 
    WHERE Id = @ExamId;

     IF NOT EXISTS (SELECT 1 FROM AcademicRecords.Course WHERE Id = @CourseId AND InstructorId = @InstructorId)
    BEGIN
        PRINT 'You are not the instructor of this course';
        RETURN;
    END;


    IF NOT EXISTS (SELECT 1 FROM ExamManagement.StudentListExam WHERE StudentId = @StudentId AND ExamId = @ExamId)
    BEGIN
        PRINT 'Student is not registered for this exam';
        RETURN;
    END;

    IF NOT EXISTS (SELECT 1 FROM ExamManagement.Student_Answer_Details WHERE StudentId = @StudentId)
    BEGIN
        PRINT 'No answers found for this student';
        RETURN;
    END;


	SELECT @TotalScore = @TotalScore + EQ.Mark
	FROM ExamManagement.Exam_Question EQ
	INNER JOIN ExamManagement.Question Q ON Q.Id = EQ.QuestionId
	INNER JOIN ExamManagement.Student_Answer_Details SAD ON SAD.Exam_QuestionId = EQ.Id AND SAD.StudentId = @StudentId
	INNER JOIN ExamManagement.Answer_MCQ AM ON AM.Student_Answer_DetailsId = SAD.Id
	INNER JOIN ExamManagement.Answer_Choice AC ON AC.Answer_MCQId = AM.Id 
	INNER JOIN ExamManagement.Choices C ON C.Id = AC.ChoiceId
	WHERE EQ.ExamId = @ExamId 
	AND Q.QuestionType = 'Multiple Choice' 
	AND C.IsTrue = 1; 


    SELECT @TotalScore = @TotalScore + EQ.Mark
	FROM ExamManagement.Exam_Question EQ
	INNER JOIN ExamManagement.Question Q ON Q.Id = EQ.QuestionId
	INNER JOIN ExamManagement.True_False TF ON Q.Id = TF.QuestionId
	INNER JOIN ExamManagement.Student_Answer_Details SAD ON SAD.Exam_QuestionId = EQ.Id AND SAD.StudentId = @StudentId
	INNER JOIN ExamManagement.Answer_True_False ATF ON ATF.Student_Answer_DetailsId = SAD.Id
	WHERE EQ.ExamId = @ExamId AND Q.QuestionType = 'True/False' AND ATF.StudentanswerOfTrueFalse = TF.Answer;

    DECLARE OpenEndedCursor CURSOR FOR 
    SELECT EQ.Mark, WQ.Keywords, AW.StudentanswerOfWritten
    FROM ExamManagement.Exam_Question EQ
    INNER JOIN ExamManagement.Question Q ON Q.Id = EQ.QuestionId
    INNER JOIN ExamManagement.Student_Answer_Details SAD ON SAD.Exam_QuestionId = EQ.Id AND SAD.StudentId = @StudentId
    INNER JOIN ExamManagement.Answer_Written AW ON AW.Student_Answer_DetailsId = SAD.Id
    INNER JOIN ExamManagement.WrittenQuestion WQ ON WQ.QuestionId = Q.Id
    WHERE EQ.ExamId = @ExamId AND Q.QuestionType = 'Open-Ended';

    OPEN OpenEndedCursor;
    FETCH NEXT FROM OpenEndedCursor INTO @QuestionMark, @Keywords, @StudentAnswer;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DELETE FROM @KeywordTable;
        INSERT INTO @KeywordTable (Keyword)
        SELECT value FROM STRING_SPLIT(@Keywords, ',');

        SELECT @KeywordCount = COUNT(*) FROM @KeywordTable;

        SELECT @MatchedKeywords = COUNT(*)
        FROM @KeywordTable
        WHERE @StudentAnswer LIKE '%' + Keyword + '%';

        IF @KeywordCount > 0
        BEGIN
            SET @TotalScore = @TotalScore + (@MatchedKeywords * 1.0 / @KeywordCount) * @QuestionMark;
        END

        FETCH NEXT FROM OpenEndedCursor INTO @QuestionMark, @Keywords, @StudentAnswer;
    END;

    CLOSE OpenEndedCursor;
    DEALLOCATE OpenEndedCursor;

    UPDATE AcademicRecords.Student_Exam
    SET Score = @TotalScore
    WHERE StudentId = @StudentId AND ExamId = @ExamId;

    PRINT 'Exam graded successfully. Total Score: ' + CAST(@TotalScore AS VARCHAR);
END;
GO




go
EXEC CalcGradeOfExamForStudent
    @ExamId = 2,
    @StudentId = 1,
    @UserName = 'sarah22',
    @Password = '159753';



---------------------------------------------------------------------------------------
-----------------View to Show ExamResults of AllStudent ------------------------------
go
CREATE OR ALTER VIEW StudentExamResults AS
SELECT 
    se.StudentId,
    s.FName,
    e.Id AS ExamId,
    e.Name AS ExamName,
    c.Id AS CourseId,
    c.Crs_Name,
    se.Score AS ExamGrade,
    e.TotalGradesOfExam
FROM AcademicRecords.Student_Exam se
JOIN AcademicRecords.Student s ON se.StudentId = s.Id
JOIN ExamManagement.Exam e ON se.ExamId = e.Id
JOIN AcademicRecords.Course c ON c.Id = e.CourseId
LEFT JOIN AcademicRecords.Instructor_Course_Student sc ON se.StudentId = sc.StdId;


select * from StudentExamResults;


---------------------------------------------------------------------------------------
-----------------View to Show one Exam Results of AllStudent with ranking ------------------------------
GO
CREATE OR ALTER VIEW StudentExamResultsWithRanking AS
SELECT 
    se.StudentId,
    s.FName,
    e.Id AS ExamId,
    e.Name AS ExamName,
    c.Id AS CourseId,
    c.Crs_Name,
    se.Score AS ExamGrade,
    e.TotalGradesOfExam,
    RANK() OVER (PARTITION BY se.ExamId ORDER BY se.Score DESC) AS Rank
FROM AcademicRecords.Student_Exam se
JOIN AcademicRecords.Student s ON se.StudentId = s.Id
JOIN ExamManagement.Exam e ON se.ExamId = e.Id
JOIN AcademicRecords.Course c ON c.Id = e.CourseId
LEFT JOIN AcademicRecords.Instructor_Course_Student sc ON se.StudentId = sc.StdId;

select * from StudentExamResultsWithRanking;
