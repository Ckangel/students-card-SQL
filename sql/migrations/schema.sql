-- 1. Setup Environment
PRAGMA foreign_keys = ON;

-- 2. Cleanup (Allows for a "Blank Slate" demo)
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

-- 3. Students Table (Requirement: Column with Date/Time)
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL
);

-- 4. Courses Table
CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_code TEXT UNIQUE NOT NULL,
    course_name TEXT NOT NULL,
    credits INTEGER DEFAULT 3
);

-- 5. Enrollments Table (Requirement: Performs a Join)
CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    grade_score REAL CHECK(grade_score >= 0 AND grade_score <= 100),
    semester TEXT,
    year INTEGER NOT NULL,
    -- Requirement: Referential Integrity
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);