-- ===================================================
-- STUDENT CARD SQL SYSTEM: FINAL DEMO SCRIPT
-- Purpose: Automated rebuild and reporting
-- ===================================================

-- 1. Setup Formatting & Environment
.headers on
.mode column
PRAGMA foreign_keys = ON;

-- 2. Database Initialization
.print '---------------------------------------------------'
.print 'STEP 1: INITIALIZING DATABASE SCHEMA...'
.print '---------------------------------------------------'
-- Loads table definitions
.read sql/migrations/schema.sql

.print ''
.print 'STEP 2: POPULATING SAMPLE DATA...'
.print '---------------------------------------------------'
-- Loads students, courses, and grades
.read sql/data/seed.sql

-- 3. Advanced Reporting (Phase 3 & 4)
.print ''
.print '---------------------------------------------------'
.print 'REPORT 1: INDIVIDUAL STUDENT CARDS (GPA SUMMARY)'
.print '---------------------------------------------------'
SELECT 
    s.first_name AS "First Name", 
    s.last_name AS "Last Name", 
    COUNT(e.course_id) AS "Total Courses",
    ROUND(AVG(e.grade_score), 2) AS "GPA Average"
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY "GPA Average" DESC;

.print ''
.print '---------------------------------------------------'
.print 'REPORT 2: ACADEMIC EXCELLENCE (Above School Average)'
.print '---------------------------------------------------'
-- Uses a subquery to compare individual AVG against global AVG
SELECT first_name, last_name, email
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM enrollments
    GROUP BY student_id
    HAVING AVG(grade_score) > (SELECT AVG(grade_score) FROM enrollments)
);

.print ''
.print '---------------------------------------------------'
.print 'REPORT 3: COURSE POPULARITY & DEMOGRAPHICS'
.print '---------------------------------------------------'
SELECT c.course_code, c.course_name, COUNT(e.student_id) AS "Enrolled Students"
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

.print ''
.print '---------------------------------------------------'
.print 'DEMO EXECUTION COMPLETE'
.print '---------------------------------------------------'
