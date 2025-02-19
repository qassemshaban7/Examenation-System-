# Examination System

## Overview
The **Examination System** is a comprehensive solution for managing exams in an academic environment. It allows instructors to create exams, students to take them, and the system to evaluate answers automatically.

## Features
### Exam Management
- Create exams manually by selecting questions from a question bank.
- Automatically generate exams with random questions.
- Define total exam marks, start and end times, and exam type.

### Question Bank
- Supports **Multiple Choice Questions (MCQ), True/False, and Open-Ended questions**.
- Stores correct answers for automated grading.

### Student Interaction
- Students can register for exams.
- Answers are stored and automatically graded for MCQ and True/False.
- Open-ended answers are reviewed by instructors.

### Grading System
- Automated grading for MCQs and True/False questions.
- Keyword-based evaluation for open-ended answers.
- Instructors can review and override grades.

### Security & Permissions
- Role-based access control for **Admin, Training Manager, Instructor, and Student**.
- Restricted access to exam records.
- Enforced constraints to maintain data integrity.

## Database Structure
The system consists of multiple key modules:

### Tables
- **User Management**: Stores user accounts and roles.
- **Courses**: Contains course details, instructor assignments, and student enrollments.
- **Exams**: Stores exam metadata (title, type, start time, end time, etc.).
- **Questions**: Maintains a pool of questions for each course.
- **Student Answers**: Tracks student responses to exams.

### Stored Procedures
- **CreateExam_Manual**: Allows manual selection of questions.
- **CreateExam_Auto**: Generates exams randomly based on predefined parameters.
- **InsertStudentAnswers**: Handles student answer submissions.
- **CalcGradeOfExamForStudent**: Computes student grades automatically.
- **AddStudentsToExam**: Enrolls students in exams.

## ERD Diagram
![ERD Diagram](https://github.com/qassemshaban7/Examenation-System-/blob/main/ERD.jpg)

## Setup Instructions
1. **Database Installation**
   - Restore the provided SQL database file.
   - Run the provided SQL scripts to create all objects.
2. **User Management**
   - Assign roles and permissions as needed.
3. **Backup & Maintenance**
   - Configure SQL Server Agent for automatic backups.

## Definitions & Documentation
For detailed descriptions of **tables, stored procedures, functions, triggers, and views**, refer to the **definitions.txt** file included in the project.

## Accounts & Roles
| Role              | Permissions |
|------------------|-------------|
| Admin           | Full Access |
| Training Manager | Manage Branches, Tracks, and Students |
| Instructor      | Manage Courses, Create Exams |
| Student        | Take Exams, View Results |

## Testing & Validation
- Sample data is included in the database.
- Test queries and validation reports are provided in the **TestCases.txt** file.

## Backup Strategy
- **Daily automated backups** configured using SQL Server Agent.
- Manual backup scripts are provided for on-demand use.

## Additional Documentation
- [📄 Complete System Documentation](https://github.com/qassemshaban7/Examenation-System-/blob/main/Examination%20System%20DocumentationPDF.pdf)
- [📜 Database Definitions](https://github.com/qassemshaban7/Examenation-System-/blob/main/Definitions%20and%20Abbreviations.pdf)


---
This document serves as a guide for setting up, using, and maintaining the Examination System. For any additional information, refer to the provided documentation files.

