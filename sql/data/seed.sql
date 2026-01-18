-- 1. Insert Sample Students
INSERT INTO Students (first_name, last_name, email, date_of_birth) VALUES 
('Charles', 'Ajeigbe', 'ckajeigbe1@gmail.com', '1965-12-18'),
('Amara', 'Kone', 'amara@example.com', '1995-10-06'),
('Kofi', 'Mensah', 'kofi@example.com', '2000-01-15'),
('Sarah', 'Smith', 'sarah@example.com', '1970-04-09'),
('Elena', 'Rodriguez', 'elena@example.com', '1999-03-10'),
('Kwame', 'Nkrumah', 'kwame@example.com', '1977-08-11'),
('Fatima', 'Zahra', 'fatima@example.com', '1990-06-13'),
('John', 'Doe', 'john@example.com', '1969-11-05'),
('Abena', 'Osei', 'abena@example.com', '1972-02-08'),
('Liam', 'Wilson', 'liam@example.com', '1968-01-24');

-- 2. Insert Sample Courses
INSERT INTO courses (course_id, course_code, course_name, credits) VALUES 
(1, 'CS101', 'Intro to Programming', 3),
(2, 'DB201', 'Database Systems', 4),
(3, 'WEB301', 'Advanced Web Development', 3),
(4, 'DS102', 'Data Science Basics', 4);

-- 3. Insert Sample Enrollments with varying grades
-- Let's give Charles and Amara high scores to test "Top Performer" reports
INSERT INTO enrollments (student_id, course_id, grade_score, semester, year) VALUES 
(1, 1, 95.5, 'Fall', 2025), -- Charles
(1, 2, 88.0, 'Fall', 2025),
(2, 1, 92.0, 'Fall', 2025), -- Amara
(2, 3, 98.0, 'Fall', 2025),
(3, 1, 75.0, 'Fall', 2025), -- Kofi
(3, 4, 82.0, 'Fall', 2025),
(4, 2, 65.0, 'Fall', 2025), -- Sarah
(4, 3, 70.5, 'Fall', 2025),
(5, 1, 88.5, 'Fall', 2025), -- Elena
(5, 4, 91.0, 'Fall', 2025),
(6, 2, 79.0, 'Fall', 2025), -- Kwame
(7, 3, 85.0, 'Fall', 2025), -- Fatima
(8, 1, 60.0, 'Fall', 2025), -- John
(9, 2, 94.0, 'Fall', 2025), -- Abena
(10, 4, 72.0, 'Fall', 2025); -- Liam

SELECT count(*) FROM students;