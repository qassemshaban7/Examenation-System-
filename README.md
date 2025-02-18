# Examination System

## Overview
The Examination System is a comprehensive solution designed to streamline exam management in an academic environment. It allows instructors to create and manage exams, manually or randomly select questions, and automatically grade student submissions. Students can register for exams, submit answers for multiple types of questions, and receive feedback on their performance.

## Features
- **Exam Creation:**  
  - Instructors can create exams by manually selecting questions or using random selection.
  - The system validates exam parameters (e.g., total grade, question counts) and ensures that the instructor is authorized for the course.

- **Student Registration:**  
  - Students are registered to specific exams.
  - Only registered students can submit answers.

- **Answer Submission:**  
  - Supports multiple question types:
    - **Multiple Choice (MCQ)**
    - **True/False**
    - **Open-Ended** (with keyword-based grading)
  - Students submit answers using a dedicated stored procedure.

- **Automated Grading:**  
  - The system automatically calculates the exam score by evaluating:
    - MCQs: Full credit for correct answers.
    - True/False: Full credit if the answer matches the correct answer.
    - Open-Ended: Partial credit is awarded based on keyword matching.
  - The total score is updated in the student exam record.

- **User Management & Permissions:**  
  - Role-based access control for instructors and students.
  - Fine-grained permissions for database objects (stored procedures, views, tables, etc.).

## Database Structure
The system's database includes several key modules:
- **User Management:**  
  - Contains `Account`, `Instructor`, and `Student` tables for handling authentication and authorization.
  
- **Academic Records:**  
  - Manages student information, course enrollment, and exam scores.
  
- **Exam Management:**  
  - Contains tables for `Exam`, `Exam_Question`, and various answer tables (e.g., `Answer_MCQ`, `Answer_Choice`, `Answer_True_False`, `Answer_Written`).
  
- **Supporting Objects:**  
  - Views, stored procedures, synonyms, and user-defined table types facilitate exam management and reporting.

## Key Stored Procedures
- **CreateExam:**  
  Creates an exam with randomly selected questions based on predefined counts and marks.
  
- **CreateExam_Manual:**  
  Allows instructors to manually select questions for an exam. The procedure validates that the sum of the selected question marks equals the total exam grade and that the questions belong to the appropriate course.

- **InsertStudentAnswers:**  
  Enables students to submit their answers for exam questions. It supports MCQ, True/False, and Open-Ended questions and prevents duplicate submissions.

- **CalcGradeOfExamForStudent:**  
  Automatically calculates a student's exam score by evaluating answers for MCQ, True/False, and Open-Ended questions (using keyword matching for open-ended questions) and updates the student exam record.

- **AddStudentsToExam:**  
  Registers a student for a specific exam after validating that the exam and student exist and that the student is not already registered.

## Setup Instructions
1. **Database Installation:**
   - Restore or attach the provided database to your SQL Server instance.
   - Execute the provided SQL scripts to create all tables, stored procedures, views, and user-defined table types.

2. **User Permissions:**
   - Configure user permissions for instructors and students using SQL Server Management Studio (SSMS) via T-SQL or the GUI.

3. **Scheduling Backups:**
   - Optionally, set up daily backups using SQL Server Agent or Windows Task Scheduler.

## Usage Examples

### Creating an Exam (Manual Selection)
```sql
DECLARE @SelectedQuestions AS QuestionTableType;
INSERT INTO @SelectedQuestions (QuestionId, Mark)
VALUES (101, 10), (102, 15), (103, 5);

EXEC CreateExam_Manual
    @Name = 'Final Exam',
    @StartTime = '2025-02-10 10:00:00',
    @EndTime = '2025-02-10 12:00:00',
    @Type = 'Written',
    @TotalGradeOfExam = 30,
    @CourseId = 1,
    @UserName = 'teacher123',
    @Password = 'pass123',
    @Questions = @SelectedQuestions;
```

### Submitting Answers
```sql
-- Multiple Choice
EXEC InsertStudentAnswers
    @ExamId = 4,
    @Exam_QuestionId = 19,
    @McqId = 13,
    @ChoiceId = 51,
    @UserName = 'student1',
    @Password = 'studpass';

-- True/False
EXEC InsertStudentAnswers
    @ExamId = 4,
    @Exam_QuestionId = 21,
    @StudentAnswerTrueFalse = 'False',
    @UserName = 'student1',
    @Password = 'studpass';

-- Open-Ended
EXEC InsertStudentAnswers
    @ExamId = 4,
    @Exam_QuestionId = 23,
    @StudentAnswerOpenEnded = 'Photosynthesis converts light energy into chemical energy in plants.',
    @UserName = 'student1',
    @Password = 'studpass';
```

### Grading an Exam
```sql
EXEC CalcGradeOfExamForStudent
    @ExamId = 2,
    @StudentId = 1,
    @UserName = 'sarah22',
    @Password = '159753';
```

## Entity Relationship Diagram (ERD)
![ERD Image](path/to/erd-image.png)



