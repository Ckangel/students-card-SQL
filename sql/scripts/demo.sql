-- 1. Setup Environment
.headers on
.mode column
.width 20 20 15 10
PRAGMA foreign_keys = ON;

-- 2. Build and Populate (Silent mode for setup)
.print '---------------------------------------------------'
.print 'INITIALIZING STUDENT CARD SYSTEM...'
.print '---------------------------------------------------'
.read /CODES/students-card-SQL/sql/scripts/schema.sql
.read /CODES/students-card-SQL/sql/data/seed.sql
.read /CODES/students-card-SQL/sql/migrations/schema.sql

-- Force a visible test
.print 'TESTING DATA PRESENCE...'
SELECT 'Students Count: ', COUNT(*) FROM students;
SELECT 'Enrollments Count: ', COUNT(*) FROM enrollments;
-- ... setup code ...

.print 'STEP 2: POPULATING SAMPLE DATA...'
.read sql/data/seed.sql

-- >>> PLACE TEST HERE <<<
.print '---------------------------------------------------'
.print 'DATA HEALTH CHECK'
SELECT 'Students Count: ' AS Label, COUNT(*) AS Total FROM students;
SELECT 'Enrollments Count: ' AS Label, COUNT(*) AS Total FROM enrollments;
.print '---------------------------------------------------'

-- ... rest of your reports ...

-- 3. Run Performance Reports
.print ''
.print 'REPORT 1: STUDENT PERFORMANCE SUMMARY (GPA)'
.print '============================================'
SELECT 
    s.first_name AS "First Name", 
    s.last_name AS "Last Name", 
    COUNT(e.course_id) AS "Courses",
    ROUND(AVG(e.grade_score), 2) AS "GPA"
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY GPA DESC;

.print ''
.print 'REPORT 2: TOP PERFORMERS (Above School Average)'
.print '============================================'
SELECT first_name, last_name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM enrollments
    GROUP BY student_id
    HAVING AVG(grade_score) > (SELECT AVG(grade_score) FROM enrollments)
);

.print ''
.print 'REPORT 3: COURSE ENROLLMENT STATS'
.print '============================================'
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

.print ''
.print '---------------------------------------------------'
.print 'DEMO COMPLETE'
.print '---------------------------------------------------'

-- ===================================================
-- ADDITIONAL REQUIREMENTS: MODIFY, DELETE, DATE FILTER
-- ===================================================

.print ''
.print 'DEMONSTRATING DATA MODIFICATION (UPDATE)'
.print '---------------------------------------------------'
-- Requirement: Modify data
UPDATE enrollments SET grade_score = 100 WHERE student_id = 1 AND course_id = 1;
.print 'Updated Student 1 Grade to 100.'

.print ''
.print 'DEMONSTRATING DATA DELETION'
.print '---------------------------------------------------'
-- Requirement: Delete data
DELETE FROM enrollments WHERE grade_score < 50; 
.print 'Removed any failing grades below 50.'

.print ''
.print 'DEMONSTRATING DATE RANGE FILTERING'
.print '---------------------------------------------------'
-- Requirement: Column with Date/Time + Range Filter
-- This finds students born between 2000 and 2005
SELECT first_name, last_name, date_of_birth
FROM students
WHERE date_of_birth BETWEEN '2000-01-01' AND '2005-12-31'
ORDER BY date_of_birth ASC;

.print ''
.print 'FINAL RE-QUERY OF UPDATED DATA'
.print '---------------------------------------------------'
SELECT s.first_name, e.grade_score
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE s.student_id = 1;