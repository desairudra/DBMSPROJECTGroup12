
Student Queries
-- List all students with their email IDs:
    SELECT s.Name, s.Student_ID, se.Email
    FROM Student s
    JOIN Student_Email se ON s.Student_ID = se.Student_Id;

-- Total number of students in each batch:
    SELECT Batch, COUNT(*) AS Total_Students
    FROM Student
    GROUP BY Batch;

-- Find students who got an 'A' in any course:
    SELECT s.Name, g.Grade, c.Course_Name
    FROM Grades g
    JOIN Student s ON g.Student_Id = s.Student_ID
    JOIN Courses c ON g.Course_Id = c.Course_Id
    WHERE g.Grade = 'A';

-- Update student grade
    UPDATE Grades
    SET Grade = 'A+'
    WHERE Student_Id = 305 AND Course_Id = 405;

 -- All Students Enrolled in a Course
    SELECT s.Student_ID, s.Name AS Student_Name, c.Course_Name
    FROM Grades g
    JOIN Student s ON g.Student_Id = s.Student_ID
    JOIN Courses c ON g.Course_Id = c.Course_Id
    ORDER BY c.Course_Name, s.Name;

-- Find all students who have disciplinary actions:
    SELECT s.Name, d.Description
    FROM Student s
    JOIN Disciplinary_Action d ON s.Student_ID = d.Student_Id;

-- Delete old disciplinary records
    DELETE FROM Disciplinary_Action
    WHERE Student_Id < 303;

Students & Clubs Queries
-- Students and clubs with mentor name
    SELECT st.Name AS Student_Name, m.Club_Name, gs.Name AS Mentor_Name
    FROM Membership m
    JOIN Student st ON m.Student_Id = st.Student_ID
    JOIN Club_Committee c ON m.Club_Name = c.Club_Name
    LEFT JOIN Faculty f ON c.Mentor_Id = f.Id
    LEFT JOIN General_Staff gs ON f.Id = gs.Id;

-- Number of clubs joined by each student
    SELECT s.Name, COUNT(m.Club_Name) AS No_of_Clubs
    FROM Student s
    LEFT JOIN Membership m ON s.Student_ID = m.Student_Id
    GROUP BY s.Name;

-- Students with multiple club memberships
    SELECT Student_Id, COUNT(*) AS Club_Count
    FROM Membership
    GROUP BY Student_Id
    HAVING COUNT(*) > 1;

Scholarships & Placement Queries
-- Find students who have received scholarships greater than ₹50,000
    SELECT s.Name, sc.Agency, sc.Amount
    FROM Student s
    JOIN Scholarships sc ON s.Student_ID = sc.Student_Id
    WHERE sc.Amount > 3990;

-- List all students placed with companies and their offered salary:
    SELECT s.Name, p.Company, p.Salary
    FROM Student s
    JOIN Placement p ON s.Student_ID = p.Student_Id;

-- List students who are not placed yet:
    SELECT Name
    FROM Student
    WHERE Student_ID NOT IN (SELECT Student_Id FROM Placement);

-- Students who received both a scholarship and a placement
    SELECT s.Name
    FROM Student s
    JOIN Scholarships sc ON s.Student_ID = sc.Student_Id
    JOIN Placement p ON s.Student_ID = p.Student_Id;

 -- Average salary of placed students:
    SELECT AVG(Salary) AS Average_Placement_Salary
    FROM Placement;

TA Queries
-- List the TA names along with their batch and course name
    SELECT s.Name, s.Batch, c.Course_Name
    FROM TA
    JOIN Student s ON TA.Student_Id = s.Student_ID
    JOIN Courses c ON TA.Course_Id = c.Course_Id;

-- Count the number of TAs for each course
    SELECT c.Course_Name, COUNT(TA.Student_Id) AS No_of_TAs
    FROM TA
    JOIN Courses c ON TA.Course_Id = c.Course_Id
    GROUP BY c.Course_Name;

 -- Get the names of courses where no TAs are assigned
    SELECT c.Course_Name
    FROM Courses c
    WHERE c.Course_Id NOT IN (
        SELECT Course_Id FROM TA
    );

-- Find students who are TAs in multiple courses (if ever allowed)
    SELECT Student_Id, COUNT(*) AS Course_Count
    FROM TA
    GROUP BY Student_Id
    HAVING COUNT(*) > 1;

-- Insert TA entry
    INSERT INTO TA (Student_Id, Course_Id)
    VALUES (102, 3);

-- Courses with at least one TA
    SELECT DISTINCT c.Course_Name
    FROM TA
    JOIN Courses c ON TA.Course_Id = c.Course_Id;

-- TAs with no awards
    SELECT s.Name
    FROM TA
    JOIN Student s ON TA.Student_Id = s.Student_ID
    WHERE s.Student_ID NOT IN (SELECT Student_Id FROM Student_Awards);

Roommates Queries
-- List all students along with their roommates
    SELECT Name AS Student, Room_Mate_Name
    FROM Student
    WHERE Room_Mate_Name IS NOT NULL;

-- Students with same roommate
    SELECT s1.Name, s2.Name AS Roommate
    FROM Student s1
    JOIN Student s2 ON s1.Room_Mate_Name = s2.Name AND s1.Student_ID != s2.Student_ID;

-- List students who have no roommates assigned
    SELECT Name
    FROM Student
    WHERE Room_Mate_Name IS NULL OR Room_Mate_Name = '';

Faculty Queries
-- Show faculty name, designation, and their course name:
    SELECT g.Name, f.Designation, c.Course_Name
    FROM Faculty f
    JOIN General_Staff g ON f.Id = g.Id
    JOIN Courses c ON f.Course_Id = c.Course_Id;

-- Get names of faculty with more than 3 research publications:
    SELECT g.Name, f.Research_Publications
    FROM Faculty f
    JOIN General_Staff g ON f.Id = g.Id
    WHERE f.Research_Publications > 3;

-- Faculty members mentoring any club:
    SELECT g.Name, c.Club_Name
    FROM Club_Committee c
    JOIN Faculty f ON c.Mentor_Id = f.Id
    JOIN General_Staff g ON f.Id = g.Id;

-- Find the supervisor names for each faculty member (self-referential):
    SELECT f1.Id AS Faculty_ID, g1.Name AS Faculty_Name, g2.Name AS Supervisor_Name
    FROM Faculty_Reports r
    JOIN Faculty f1 ON r.Faculty_Id = f1.Id
    JOIN Faculty f2 ON r.Supervisor_Id = f2.Id
    JOIN General_Staff g1 ON f1.Id = g1.Id
    JOIN General_Staff g2 ON f2.Id = g2.Id;

-- Find faculty members who do not supervise anyone:
    SELECT g.Name
    FROM Faculty f
    LEFT JOIN Faculty_Reports r ON f.Id = r.Supervisor_Id
    JOIN General_Staff g ON f.Id = g.Id
    WHERE r.Faculty_Id IS NULL;

-- Faculty supervising graduate students
    SELECT DISTINCT g.Name
    FROM Graduate_Students gs
    JOIN Faculty f ON gs.Faculty_Id = f.Id
    JOIN General_Staff g ON f.Id = g.Id;

-- Projects with funding over 45000
    SELECT p.Description, p.Funding_Amount, g.Name AS Faculty_Name
    FROM Projects p
    JOIN Faculty f ON p.Faculty_Id = f.Id
    JOIN General_Staff g ON f.Id = g.Id
    WHERE p.Funding_Amount > 45000;

-- Faculty count per course
    SELECT c.Course_Name, COUNT(f.Id) AS Faculty_Count
    FROM Courses c
    JOIN Faculty f ON c.Course_Id = f.Course_Id
    GROUP BY c.Course_Name;

-- Faculty with most graduate students
    SELECT g.Name
    FROM General_Staff g
    JOIN Faculty f ON g.Id = f.Id
    WHERE f.Id IN (
        SELECT Faculty_Id
        FROM Graduate_Students
        GROUP BY Faculty_Id
        ORDER BY COUNT(Student_Id) DESC
        LIMIT 1
    );

-- Faculty mentors count
    SELECT COUNT(DISTINCT Mentor_Id) AS Mentor_Faculty_Count
    FROM Club_Committee
    WHERE Mentor_Id IS NOT NULL;

-- Faculty awards with names and designations
    SELECT g.Name, f.Designation, a.Award_Won
    FROM Faculty_Awards a
    JOIN Faculty f ON a.Faculty_Id = f.Id
    JOIN General_Staff g ON f.Id = g.Id;

Staff Queries

-- Faculty mentors count
    SELECT COUNT(DISTINCT Mentor_Id) AS Mentor_Faculty_Count
    FROM Club_Committee
    WHERE Mentor_Id IS NOT NULL;

--Names and emails of staff members along with their roles
    SELECT g.Name, s.Role, e.Email
    FROM General_Staff g
    JOIN Staff s ON g.Id = s.Id
    LEFT JOIN Staff_Email e ON s.Id = e.Id;

--Staff Members Grouped by Role
    SELECT gs.Name, s.Role
    FROM General_Staff gs
    JOIN Staff s ON gs.Id = s.Id
    ORDER BY s.Role, gs.Name;

--Names and leaves taken by staff member
   SELECT Name, No_of_Leaves_Taken
   FROM General_Staff;

--Names of staff members who have leaves greater than threshold
    SELECT Name, No_of_Leaves_Taken
    FROM General_Staff
    WHERE No_of_Leaves_Taken > 2;

--Average number of leaves taken by general staff
    SELECT AVG(No_of_Leaves_Taken) AS Avg_Leaves_Taken
    FROM General_Staff;

--Update salary for all faculty who live in college:
    UPDATE General_Staff
    SET Salary = Salary + 2000
    WHERE Id IN (
    SELECT Id FROM Faculty WHERE Lives_in_College = TRUE
);

--Salary of all Staff
    SELECT gs.Name, gs.Salary
    FROM General_Staff gs
    JOIN Faculty f ON gs.Id = f.Id;

--Salary of Staff Living in College
    SELECT gs.Name, gs.Salary
    FROM General_Staff gs
    JOIN Faculty f ON gs.Id = f.Id
    WHERE f.Lives_in_College = TRUE;

Club Queries

--Show the budget details of each club and its mentors name:
    SELECT c.Club_Name, c.Description, g.Name AS Mentor_Name, b.Budget_Alloted, b.Used
    FROM Club_Committee c
    JOIN Budget b ON c.Club_Name = b.Club_Name
    LEFT JOIN Faculty f ON c.Mentor_Id = f.Id
    LEFT JOIN General_Staff g ON f.Id = g.Id;

--Find clubs with budget lapsed from the previous year:
    SELECT Club_Name, Lapsed_From_Previous_Year
    FROM Budget
    WHERE Lapsed_From_Previous_Year > 0;

--Total budget allotted and used by clubs
    SELECT SUM(Budget_Alloted) AS Total_Budget, SUM(Used) AS Total_Used
    FROM Budget;

--Club with highest budget usage percentage
    SELECT Club_Name, (Used * 100.0 / Budget_Alloted) AS Usage_Percent
    FROM Budget
    WHERE Budget_Alloted > 0
    ORDER BY Usage_Percent DESC
    LIMIT 1;

--Clubs with Percentage Budget Used
SELECT Club_Name, Budget_Alloted, Used,
  ROUND((Used * 100.0) / Budget_Alloted, 2) AS Percentage_Used
FROM Budget
WHERE Budget_Alloted > 0
ORDER BY Percentage_Used DESC;

--Clubs, Mentor, No_of_Members, Budget
    SELECT
    c.Club_Name,
    g.Name AS Mentor_Name,
    COUNT(m.Student_Id) AS No_of_Students,
    b.Budget_Alloted,
    b.Used
FROM Club_Committee c
JOIN Budget b ON c.Club_Name = b.Club_Name
LEFT JOIN Faculty f ON c.Mentor_Id = f.Id
LEFT JOIN General_Staff g ON f.Id = g.Id
LEFT JOIN Membership m ON c.Club_Name = m.Club_Name
GROUP BY c.Club_Name, g.Name, b.Budget_Alloted, b.Used
ORDER BY No_of_Students DESC;
