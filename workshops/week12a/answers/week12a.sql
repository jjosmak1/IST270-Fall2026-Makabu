
-- IST 270 Week 12a: Manipulating and Querying Data

-- 1. Check the starting data
SELECT * FROM Tutors ORDER BY TutorID;
SELECT * FROM Students ORDER BY StudentID;


-- 2. Insert Dorothy Vaughan
-- Dorothy was added using pgAdmin's data editor.
-- Equivalent SQL:
-- INSERT INTO Tutors (FirstName, LastName, Email)
-- VALUES ('Dorothy', 'Vaughan', 'dorothy@example.com');


-- 3. Insert Annie Easley using SQL
INSERT INTO Tutors (FirstName, LastName, Email)
VALUES ('Annie', 'Easley', 'annie@example.com');

SELECT * FROM Tutors ORDER BY TutorID;

-- The pgAdmin data editor lets me insert rows manually,
-- while INSERT allows me to add rows using SQL commands.


-- 4. Insert multiple students
INSERT INTO Students (FirstName, LastName, Major) VALUES
('Mary', 'Jackson', 'Mathematics'),
('Mae', 'Jemison', 'Engineering');

SELECT * FROM Students ORDER BY StudentID;


-- 5. Test the unique email constraint
-- This statement is intentionally commented out because
-- it fails when executed: Grace's email already exists.
-- Constraint name: tutors_email_key
-- Constraint type: UNIQUE
-- SQL State: 23505

-- INSERT INTO Tutors (FirstName, LastName, Email)
-- VALUES ('New', 'Tutor', 'grace@navy.mil');


-- 6. Update Katherine Johnson's major
SELECT *
FROM Students
WHERE FirstName = 'Katherine'
AND LastName = 'Johnson';

UPDATE Students
SET Major = 'Applied Mathematics'
WHERE StudentID = 2;

SELECT *
FROM Students
WHERE FirstName = 'Katherine'
AND LastName = 'Johnson';


-- Delete Marie Curie
SELECT *
FROM Students
WHERE FirstName = 'Marie'
AND LastName = 'Curie';

DELETE FROM Students
WHERE StudentID = 3;

SELECT * FROM Students ORDER BY StudentID;


-- 7. Workshop challenge

-- Add three subjects
INSERT INTO Subjects (SubjectName)
VALUES
('Mathematics'),
('Programming'),
('Computer Science');

SELECT * FROM Subjects ORDER BY SubjectID;


-- Link tutors to subjects
INSERT INTO TutorSubjects (TutorID, SubjectID)
VALUES
(1, (SELECT SubjectID FROM Subjects WHERE SubjectName = 'Mathematics')),
(1, (SELECT SubjectID FROM Subjects WHERE SubjectName = 'Programming')),
(2, (SELECT SubjectID FROM Subjects WHERE SubjectName = 'Programming')),
(2, (SELECT SubjectID FROM Subjects WHERE SubjectName = 'Computer Science')),
(3, (SELECT SubjectID FROM Subjects WHERE SubjectName = 'Mathematics')),
(3, (SELECT SubjectID FROM Subjects WHERE SubjectName = 'Computer Science'));

SELECT * FROM TutorSubjects ORDER BY TutorID, SubjectID;


-- Add two appointments
INSERT INTO Appointments
(AppointmentDateTime, Location, TutorID, StudentID)
VALUES
('2026-11-23 14:00-05', 'Tutoring Room 101', 1, 1),
('2026-11-24 10:00-05', 'Computer Lab', 2, 2);

SELECT * FROM Appointments ORDER BY AppointmentID;


-- Challenge Question 1:
-- Which appointments are in a location you chose?
SELECT *
FROM Appointments
WHERE Location = 'Tutoring Room 101';


-- Challenge Question 2:
-- Which SubjectIDs are linked to Grace Hopper?
SELECT SubjectID
FROM TutorSubjects
WHERE TutorID = 1;


-- Challenge Question 3:
-- Which students have Mathematics as their major?
SELECT *
FROM Students
WHERE Major = 'Mathematics';
