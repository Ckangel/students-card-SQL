PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    student_id    INTEGER PRIMARY KEY,
    first_name    TEXT NOT NULL,
    last_name     TEXT NOT NULL,
    date_of_birth TEXT NOT NULL, -- ISO 'YYYY-MM-DD'
    gender        TEXT,
    major         TEXT
);

CREATE TABLE Courses (
    course_id   INTEGER PRIMARY KEY,
    course_code TEXT NOT NULL,
    course_name TEXT NOT NULL,
    credits     INTEGER NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id    INTEGER NOT NULL,
    course_id     INTEGER NOT NULL,
    semester      TEXT NOT NULL,
    year          INTEGER NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id)  REFERENCES Courses(course_id)
);

CREATE TABLE Grades (
    grade_id      INTEGER PRIMARY KEY,
    enrollment_id INTEGER NOT NULL,
    letter_grade  TEXT NOT NULL,
    numeric_score REAL,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);
