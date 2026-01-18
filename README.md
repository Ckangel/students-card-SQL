Student Card SQL Project
Project Overview
This project manages a university-style student record system using SQLite. It tracks students, their course enrollments, and their grades. The goal is to provide a "Student Card" view that summarizes academic performance.

Database Schema
The database consists of the following four primary tables:

students: Stores personal details (Name, Email).

courses: List of available subjects and credit hours.

enrollments: A junction table linking students to courses.

grades: Records the numeric or letter scores for each enrollment.

Features
Referential Integrity: Uses Foreign Key constraints to ensure data consistency.

Aggregates: Queries to calculate GPA and average performance.

Joins: Complex queries connecting student identities to their academic results.

Reporting: A "Top Performers" script to identify students with the highest averages.

Installation & Usage
Prerequisites
You will need a SQLite client. You can use:

DB Browser for SQLite

VS Code with the SQLite extension.

The SQLite3 Command Line Interface.

How to Build the Database
Initialize the Schema: Run the schema script to create the tables.

Bash

sqlite3 students_records.db < schema.sql
Seed the Data: Populate the tables with sample student and course info.

Bash

sqlite3 students_records.db < seed.sql
Run Queries: Execute the demo script to see results.

Bash

sqlite3 students_records.db < queries.sql
Example Query: Student Average GPA
SQL

SELECT 
    s.first_name || ' ' || s.last_name AS student_name,
    AVG(e.grade) AS gpa
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id;
Project Plan & Timeline
The development of this project followed a structured timeline:

Phase 1: Schema Design & Basic Table Creation.

Phase 2: Data Insertion & Referential Integrity Testing.

Phase 3: Advanced Joins & Subqueries for Performance Reporting.

Phase 4: Documentation & Optimization.

Author
Charles Kingsley Ajeigbe

{Here is my one minute video link displaying how the software runs}

Software Demo Video

Development Environment
{Flask library, CSS and HTML with some Javascript}

{python, javascript}

Useful Websites
{Make a list of websites that you found helpful in this project}

Web Site Name
Web Site Name