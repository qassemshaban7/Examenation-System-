							/*Synonyms*/
--1) AcademicRecords.Branch ===>ACREBR
create synonym ACREBR
for AcademicRecords.Branch

select* from AcademicRecords.Branch
select* from ACREBR

----------------------------------------------
--2) AcademicRecords.Branch_Track_Intake ===>ACREBRTRIN
create synonym ACREBRTRIN
for AcademicRecords.Branch_Track_Intake

select* from AcademicRecords.Branch_Track_Intake
select* from ACREBRTRIN
----------------------------------------------
--3) AcademicRecords.Class ===>ACRECL
create synonym ACRECL
for AcademicRecords.Class

select* from AcademicRecords.Class
select* from ACRECL
----------------------------------------------
--4) AcademicRecords.Course ===>ACRECO
create synonym ACRECO
for AcademicRecords.Course
drop synonym ACRECo

select* from AcademicRecords.Course
select* from ACRECO
----------------------------------------------
--5) AcademicRecords.Instructor_Course_History ===>ACREINCOHI
create synonym ACREINCOHI
for AcademicRecords.Instructor_Course_History

select* from AcademicRecords.Instructor_Course_History
select* from ACREINCOHI
----------------------------------------------
--6) AcademicRecords.Student ===>ACREINCOST
create synonym ACREINCOST
for AcademicRecords.Student

select* from AcademicRecords.Student
select* from ACREINCOST
----------------------------------------------
--7) AcademicRecords.Intake ===>ACREIN
create synonym ACREIN
for AcademicRecords.Intake

select* from AcademicRecords.Intake
select* from ACREIN
----------------------------------------------
--8) AcademicRecords.Student ===>ACREST
create synonym ACREST
for AcademicRecords.Student

select* from AcademicRecords.Student
select* from ACREST
----------------------------------------------
--9) AcademicRecords.Student_Exam ===>ACRESTEXAM
create synonym ACRESTEXAM
for AcademicRecords.Student_Exam

select* from AcademicRecords.Student_Exam
select* from ACRESTEXAM
----------------------------------------------
--10) AcademicRecords.Track ===>ACRETR
create synonym ACRETR
for AcademicRecords.Track

select* from AcademicRecords.Track
select* from ACRETR
----------------------------------------------
--11) ExamManagement.Answer_Choice ===>EXMGANCH
create synonym EXMGANCH
for ExamManagement.Answer_Choice

select* from ExamManagement.Answer_Choice
select* from EXMGANCH
----------------------------------------------
--12) ExamManagement.Answer_MCQ ===>EXMGANMCQ
create synonym EXMGANMCQ
for ExamManagement.Answer_MCQ

select* from ExamManagement.Answer_MCQ
select* from EXMGANMCQ
----------------------------------------------
--13) ExamManagement.Answer_True_False ===>EXMGANTF
create synonym EXMGANTF
for ExamManagement.Answer_True_False

select* from ExamManagement.Answer_True_False
select* from EXMGANTF
----------------------------------------------
--14) ExamManagement.Answer_Written ===>EXMGANWRITTEN
create synonym EXMGANWRITTEN
for ExamManagement.Answer_Written

select* from ExamManagement.Answer_Written
select* from EXMGANWRITTEN
----------------------------------------------
--15) ExamManagement.Choices ===>EXMGCHOICES
create synonym EXMGCHOICES
for ExamManagement.Choices

select* from ExamManagement.Choices
select* from EXMGCHOICES
----------------------------------------------
--16) ExamManagement.Exam ===>EXMGEXAM
create synonym EXMGEXAM
for ExamManagement.Exam

select* from ExamManagement.Exam
select* from EXMGEXAM
----------------------------------------------
--17) ExamManagement.Exam_Question ===>EXMGEXAMQUE
create synonym EXMGEXAMQUE
for ExamManagement.Exam_Question

select* from ExamManagement.Exam_Question
select* from EXMGEXAMQUE
----------------------------------------------
--18) ExamManagement.MCQ ===>EXMGMCQ
create synonym EXMGMCQ
for ExamManagement.MCQ

select* from ExamManagement.MCQ
select* from EXMGMCQ
----------------------------------------------
--19) ExamManagement.Question ===>EXMGQUE
create synonym EXMGQUE
for ExamManagement.Question

select* from ExamManagement.Question
select* from EXMGQUE
----------------------------------------------
--20) ExamManagement.Student_Answer_Details ===>EXMGSTANDETAILS
create synonym EXMGSTANDETAILS
for ExamManagement.Student_Answer_Details

select* from ExamManagement.Student_Answer_Details
select* from EXMGSTANDETAILS
----------------------------------------------
--21) ExamManagement.StudentListExam ===>EXMGSTLIEXAM
create synonym EXMGSTLIEXAM
for ExamManagement.StudentListExam

select* from ExamManagement.StudentListExam
select* from EXMGSTLIEXAM
----------------------------------------------
--22) ExamManagement.True_False ===>EXMGTF
create synonym EXMGTF
for ExamManagement.True_False

select* from ExamManagement.True_False
select* from EXMGTF
----------------------------------------------
--23) ExamManagement.WrittenQuestion ===>EXMGWRQUE
create synonym EXMGWRQUE
for ExamManagement.WrittenQuestion

select* from ExamManagement.WrittenQuestion
select* from EXMGWRQUE
----------------------------------------------
--24) UserManagement.Account ===>USERMACC
create synonym USERMACC
for UserManagement.Account

select* from UserManagement.Account
select* from USERMACC
----------------------------------------------
--25) UserManagement.Instructor ===>USERMAINS
create synonym USERMAINS
for UserManagement.Instructor

select* from UserManagement.Instructor
select* from USERMAINS
----------------------------------------------
--26) UserManagement.TrainingManager ===>USERMATRMANGER
create synonym USERMATRMANGER
for UserManagement.TrainingManager

select* from UserManagement.TrainingManager
select* from USERMATRMANGER
-----------------------------------------------










