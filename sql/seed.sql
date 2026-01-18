-- 1. Insert Sample Students
INSERT INTO students (first_name, last_name, email) VALUES 
('Charles', 'Ajeigbe', 'charles@example.com'),
('Amara', 'Kone', 'amara@example.com'),
('Kofi', 'Mensah', 'kofi@example.com'),
('Sarah', 'Smith', 'sarah@example.com'),
('Elena', 'Rodriguez', 'elena@example.com'),
('Kwame', 'Nkrumah', 'kwame@example.com'),
('Fatima', 'Zahra', 'fatima@example.com'),
('John', 'Doe', 'john@example.com'),
('Abena', 'Osei', 'abena@example.com'),
('Liam', 'Wilson', 'liam@example.com');

-- 2. Insert Sample Courses
INSERT INTO courses (course_code, course_name, credits) VALUES 
('CS101', 'Intro to Programming', 3),
('DB201', 'Database Systems', 4),
('WEB301', 'Advanced Web Development', 3),
('DS102', 'Data Science Basics', 4);

-- 3. Insert Sample Enrollments with varying grades
-- Let's give Charles and Amara high scores to test "Top Performer" reports
INSERT INTO enrollments (student_id, course_id, grade_score, semester) VALUES 
(1, 1, 95.5, 'Fall 2025'), -- Charles
(1, 2, 88.0, 'Fall 2025'),
(2, 1, 92.0, 'Fall 2025'), -- Amara
(2, 3, 98.0, 'Fall 2025'),
(3, 1, 75.0, 'Fall 2025'), -- Kofi
(3, 4, 82.0, 'Fall 2025'),
(4, 2, 65.0, 'Fall 2025'), -- Sarah
(4, 3, 70.5, 'Fall 2025'),
(5, 1, 88.5, 'Fall 2025'), -- Elena
(5, 4, 91.0, 'Fall 2025'),
(6, 2, 79.0, 'Fall 2025'), -- Kwame
(7, 3, 85.0, 'Fall 2025'), -- Fatima
(8, 1, 60.0, 'Fall 2025'), -- John
(9, 2, 94.0, 'Fall 2025'), -- Abena
(10, 4, 72.0, 'Fall 2025'); -- Liam