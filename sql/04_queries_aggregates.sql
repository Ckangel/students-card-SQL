-- 04_queries_aggregates.sql

-- 1. Age per student (calculated column)
SELECT
    student_id,
    first_name,
    last_name,
    (strftime('%Y','now') - strftime('%Y', date_of_birth))
      - (strftime('%m-%d','now') < strftime('%m-%d', date_of_birth)) AS age_years
FROM Students
ORDER BY age_years DESC;

-- 2. Average age of all students
SELECT
    AVG(
      (strftime('%Y','now') - strftime('%Y', date_of_birth))
      - (strftime('%m-%d','now') < strftime('%m-%d', date_of_birth))
    ) AS avg_age_years
FROM Students;

-- 3. Average age per major
SELECT
    major,
    AVG(
      (strftime('%Y','now') - strftime('%Y', date_of_birth))
      - (strftime('%m-%d','now') < strftime('%m-%d', date_of_birth))
    ) AS avg_age_years
FROM Students
GROUP BY major
ORDER BY avg_age_years DESC;

-- 4. Number of students enrolled in each course
SELECT
    c.course_code,
    c.course_name,
    COUNT(DISTINCT e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_code, c.course_name
ORDER BY student_count DESC, c.course_code;

-- 5. Average numeric score per course
SELECT
    c.course_code,
    c.course_name,
    AVG(g.numeric_score) AS avg_score
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
JOIN Grades g      ON e.enrollment_id = g.enrollment_id
GROUP BY c.course_code, c.course_name
ORDER BY avg_score DESC;

-- 6. Total credits each student is taking per semester/year
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    e.semester,
    e.year,
    SUM(c.credits) AS total_credits
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c     ON e.course_id = c.course_id
GROUP BY
    s.student_id, s.first_name, s.last_name,
    e.semester, e.year
ORDER BY e.year, e.semester, s.last_name, s.first_name;

-- 7. GPA per student (weighted by course credits)
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    SUM(
      CASE g.letter_grade
        WHEN 'A' THEN 4.0
        WHEN 'B' THEN 3.0
        WHEN 'C' THEN 2.0
        WHEN 'D' THEN 1.0
        ELSE 0.0
      END * c.credits
    ) * 1.0 / SUM(c.credits) AS gpa
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c     ON e.course_id = c.course_id
JOIN Grades g      ON e.enrollment_id = g.enrollment_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY gpa DESC;
