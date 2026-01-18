-- 02_insert_sample_data.sql
-- Run after 01_create_schema.sql has created the tables.

BEGIN TRANSACTION;

-- Students
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender, major) VALUES
(1, 'Alice',   'Johnson', '2003-03-15', 'F', 'Computer Science'),
(2, 'Bob',     'Smith',   '2002-07-21', 'M', 'Mathematics'),
(3, 'Carla',   'Lopez',   '2001-11-02', 'F', 'Physics'),
(4, 'David',   'Ng',      '2000-01-10', 'M', 'Computer Science'),
(5, 'Eve',     'Martin',  '2003-09-05', 'F', 'Economics');

-- Courses
INSERT INTO Courses (course_id, course_code, course_name, credits) VALUES
(101, 'CS101',   'Intro to Programming', 3),
(102, 'CS201',   'Data Structures',      4),
(201, 'MATH101', 'Calculus I',           4),
(202, 'PHYS101', 'General Physics',      4);

-- Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id, semester, year) VALUES
(1, 1, 101, 'Fall',   2025),
(2, 1, 201, 'Fall',   2025),
(3, 2, 201, 'Fall',   2025),
(4, 2, 101, 'Spring', 2026),
(5, 3, 202, 'Fall',   2025),
(6, 4, 101, 'Fall',   2025),
(7, 4, 102, 'Spring', 2026),
(8, 5, 201, 'Spring', 2026);

-- Grades
INSERT INTO Grades (grade_id, enrollment_id, letter_grade, numeric_score) VALUES
(1, 1, 'A', 95.0),
(2, 2, 'B', 82.0),
(3, 3, 'C', 75.0),
(4, 4, 'A', 91.0),
(5, 5, 'B', 88.0),
(6, 6, 'A', 97.0),
(7, 7, 'B', 84.0),
(8, 8, 'A', 93.0);

COMMIT;
