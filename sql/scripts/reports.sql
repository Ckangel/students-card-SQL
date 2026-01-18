-- Calculate the average grade (GPA) for every student
SELECT 
    s.first_name, 
    s.last_name, 
    COUNT(e.course_id) AS courses_taken,
    ROUND(AVG(e.grade_score), 2) AS gpa
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
HAVING courses_taken > 0
ORDER BY gpa DESC;

-- Find students performing above the school-wide average
SELECT first_name, last_name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM enrollments
    GROUP BY student_id
    HAVING AVG(grade_score) > (SELECT AVG(grade_score) FROM enrollments)
);

-- Find the course with the highest enrollment
SELECT course_name, enrollment_count
FROM (
    SELECT c.course_name, COUNT(e.student_id) AS enrollment_count
    FROM courses c
    JOIN enrollments e ON c.course_id = e.course_id
    GROUP BY c.course_id
) AS course_stats
ORDER BY enrollment_count DESC
LIMIT 1;