-- 03_queries_basics.sql

-- 1. List all students
SELECT
    student_id,
    first_name,
    last_name,
    date_of_birth,
    gender,
    major
FROM Students
ORDER BY last_name, first_name;

-- 2. List all courses
SELECT
    course_id,
    course_code,
    course_name,
    credits
FROM Courses
ORDER BY course_code;

-- 3. List enrollments with student and course info
SELECT
    e.enrollment_id,
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_code,
    c.course_name,
    e.semester,
    e.year
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c  ON e.course_id  = c.course_id
ORDER BY e.year, e.semester, c.course_code;

-- 4. Filter: students in Computer Science
SELECT
    student_id,
    first_name,
    last_name,
    major
FROM Students
WHERE major = 'Computer Science'
ORDER BY last_name, first_name;

-- 5. Filter: courses with more than 3 credits
SELECT
    course_code,
    course_name,
    credits
FROM Courses
WHERE credits > 3
ORDER BY course_code;
