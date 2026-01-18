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