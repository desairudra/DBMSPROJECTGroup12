INSERT INTO General_Staff (Id, Name, Age, Address, No_of_Leaves_Taken, Joining_Date, Gender, Mobile_No, Salary)
VALUES
(1, 'Ramesh Prajapati', 42, 'Gandhinagar', 2, '2014-06-15', 'M', '9876543210', 30000),
(2, 'Chirag Nayak', 39, 'Ahmedabad', 1, '2015-03-22', 'M', '9876543211', 31000),
(3, 'Krunal Patel', 35, 'Vadodara', 0, '2016-07-01', 'M', '9876543212', 32000),
(4, 'Siddharth Swaminarayan', 45, 'Rajkot', 3, '2013-12-10', 'M', '9876543213', 33000),
(5, 'Bahadursinh M Vaghela', 50, 'Mehsana', 5, '2010-03-25', 'M', '9876543214', 30000),
(201, 'Rohit Khanna', 45, 'Gandhinagar', 2, '2010-05-01', 'M', '9876543201', 50000),
(202, 'Aditya Shah', 40, 'Ahmedabad', 1, '2012-08-15', 'F', '9876543202', 52000),
(203, 'Soham Mevada', 42, 'Surat', 3, '2014-09-20', 'F', '9876543203', 51000),
(204, 'Dilip Ghosh', 50, 'Vadodara', 4, '2008-02-25', 'M', '9876543204', 53000),
(205, 'Aviral Bhatnagar', 38, 'Rajkot', 1, '2015-12-11', 'F', '9876543205', 54000);
INSERT INTO Staff (Id, Role, Shift, Supervisor_Id)
VALUES
(1, 'Watering Plants', 'Morning', NULL),
(2, 'Cleaning Hostels', 'Afternoon', 1),
(3, 'Cleaning Classrooms and Labs', 'Morning', 1),
(4, 'Managing Lost and Found', 'Afternoon', NULL),
(5, 'Campus Cleanliness and LTs', 'Morning', 4);
INSERT INTO Staff_Email (Id, Email)
VALUES
(1, 'ramesh.prajapati@daiict.ac.in'),
(2, 'chirag.nayak@daiict.ac.in'),
(3, 'krunal.patel@daiict.ac.in'),
(4, 'siddharth.swaminarayan@daiict.ac.in'),
(5, 'bahadursinh.vaghela@daiict.ac.in');
INSERT INTO Student (Student_ID, Name, Mobile_No, Age, Gender, Address, Batch, Program, Room_Mate_Name, Father_Name, Father_ContactNo, Mother_Name, Mother_ContactNo)
VALUES
(301, 'Aayush Sharma', '9998887771', 20, 'M', 'Ahmedabad', 2021, 'B.Tech', 'Raj', 'Ravi Sharma', '9876543101', 'Anita Sharma', '9876543102'),
(302, 'Riya Mehta', '9998887772', 19, 'F', 'Surat', 2022, 'B.Tech', 'Sujal', 'Sanjay Mehta', '9876543103', 'Neeta Mehta', '9876543104'),
(303, 'Kunal Joshi', '9998887773', 21, 'M', 'Vadodara', 2021, 'B.Tech', 'Alok', 'Dilip Joshi', '9876543105', 'Lata Joshi', '9876543106'),
(304, 'Sneha Patel', '9998887774', 18, 'F', 'Rajkot', 2023, 'B.Tech', 'Ritika', 'Hitesh Patel', '9876543107', 'Rekha Patel', '9876543108'),
(305, 'Vishal Desai', '9998887775', 22, 'M', 'Gandhinagar', 2022, 'B.Tech', 'Kiran', 'Nirav Desai', '9876543109', 'Kiran Desai', '9876543110');
INSERT INTO Student_Email (Student_Id, Email)
VALUES
(301, 'aayush.sharma@daiict.ac.in'),
(302, 'riya.mehta@daiict.ac.in'),
(303, 'kunal.joshi@daiict.ac.in'),
(304, 'sneha.patel@daiict.ac.in'),
(305, 'vishal.desai@daiict.ac.in');
INSERT INTO Courses (Course_Id, Course_Name)
VALUES
(401, 'Introduction to Computer Science'),
(402, 'Data Structures'),
(403, 'Database Management Systems'),
(404, 'Operating Systems'),
(405, 'Machine Learning');

INSERT INTO Faculty (Id, Subjects, Committees, Course_Id, Research_Publications, Office_No, Designation, Joining_Date, Years_of_Completion, University_Name, Lives_in_College)
VALUES
(201, 'Computer Networks', 'Research, Development', 401, 3, 101, 'Associate Professor', '2012-08-01', 2008, 'DAIICT', TRUE),
(202, 'Machine Learning', 'Machine Learning Club', 402, 5, 102, 'Assistant Professor', '2014-07-01', 2011, 'DAIICT', FALSE),
(203, 'Database Systems', 'Database Club', 403, 2, 103, 'Professor', '2010-06-15', 2005, 'DAIICT', TRUE),
(204, 'Software Engineering', 'Tech Club', 404, 1, 104, 'Lecturer', '2016-01-01', 2012, 'DAIICT', FALSE),
(205, 'Cyber Security', 'Cyber Security Club', 405, 4, 105, 'Associate Professor', '2011-09-01', 2009, 'DAIICT', TRUE);
INSERT INTO Faculty_Reports (Faculty_Id, Supervisor_Id)
VALUES
(202, 201),
(203, 201),
(204, 202),
(205, 201),
(201,NULL);
INSERT INTO Graduate_Students (Faculty_Id, Student_Id)
VALUES
(201, 301),
(202, 302),
(203, 301),
(204, 303),
(205, 304);
INSERT INTO Grades (Student_Id, Course_Id, Grade)
VALUES
(301, 401, 'A'),
(302, 402, 'B+'),
(303, 403, 'A-'),
(304, 404, 'B'),
(305, 405, 'A+');
INSERT INTO Disciplinary_Action (Student_Id, Description)
VALUES
(301, 'Late submission of assignments'),
(302, 'Violation of hostel curfew'),
(303, 'Unauthorized absence from lab'),
(304, 'Using mobile during exams'),
(305, 'Improper behavior in class');
INSERT INTO Placement (Student_Id, Company, Salary)
VALUES
(301, 'Google', 4500000),
(302, 'Microsoft', 4200000),
(303, 'TCS Digital', 900000),
(304, 'Amazon', 3500000),
(305, 'Infosys', 800000);
INSERT INTO Scholarships (Student_Id, Agency, Amount, Conditions)
VALUES
(301, 'Merit-based Scholarship', 5000, 'GPA above 8.0'),
(302, 'Need-based Scholarship', 4000, 'Family income below ₹5 Lakh'),
(303, 'Sports Scholarship', 3000, 'Exceptional performance in athletics'),
(304, 'Arts Scholarship', 3500, 'Outstanding talent in arts or music'),
(305, 'Research Scholarship', 6000, 'Active participation in research projects');
INSERT INTO Membership (Student_Id, Club_Name)
VALUES
(301, 'Coding Club'),
(302, 'Robotics Club'),
(303, 'Literature Club'),
(304, 'Music Club'),
(305, 'Sports Club');
INSERT INTO Club_Committee (Club_Name, Description, Mentor_Id)
VALUES
('Coding Club', 'A club focused on competitive programming and coding contests', 201),
('Robotics Club', 'A club for robotics enthusiasts to build and program robots', 202),
('Literature Club', 'A club for those passionate about literature and reading', 203),
('Music Club', 'A club for music lovers, focusing on performance and creation', 204),
('Sports Club', 'A club for sports enthusiasts, organizing events and activities', 205);
INSERT INTO Budget (Club_Name, Budget_Alloted, Used, Lapsed_From_Previous_Year)
VALUES
('Coding Club', 10000, 2500, 0),
('Robotics Club', 9000, 3000, 0),
('Literature Club', 7000, 1500, 0),
('Music Club', 8000, 3500, 0),
('Sports Club', 12000, 5000, 0);
INSERT INTO Projects (Project_Id, Faculty_Id, Description, Start_Date, Funding_Agency, Funding_Amount, Expected_Completion_Date)
VALUES
(301, 201, 'Developing AI-based system for smart classrooms', '2023-01-01', 'DAIICT Research Fund', 50000, '2023-12-31'),
(302, 202, 'Robotics for Disaster Relief', '2023-02-01', 'ISRO', 60000, '2024-02-01'),
(303, 203, 'Cloud-based Data Management System', '2023-03-01', 'Google Research Fund', 70000, '2024-03-01'),
(304, 204, 'AI in Healthcare', '2023-04-01', 'AI Foundation', 40000, '2024-04-01'),
(305, 205, 'Cyber Security Awareness Program', '2023-05-01', 'Cybersecurity Agency', 45000, '2024-05-01');
INSERT INTO TA (Student_Id, Course_Id)
VALUES
(301, 401),
(302, 402),
(303, 403),
(304, 404),
(305, 405);
INSERT INTO Faculty_Awards (Faculty_Id, Achievement, Award_Won, Description)
VALUES
(201, 'Best Research Paper', 'DAIICT Excellence Award', 'Best Research Paper on Networking'),
(202, 'Innovative Teaching', 'Best Teaching Award', 'Innovative approach to teaching Machine Learning'),
(203, 'Top Publication', 'Research Excellence Award', 'Published in top journals of IT'),
(204, 'Outstanding Lecturer', 'Teaching Excellence Award', 'Exemplary performance in teaching Software Engineering'),
(205, 'Best Researcher', 'Cyber Security Award', 'Contributed to major advancements in Cyber Security');
INSERT INTO Student_Awards (Student_Id, Achievement, Award_Won, Description)
VALUES
(301, 'Top Performer', 'Best Student Award', 'Outstanding academic performance in the semester'),
(302, 'Innovative Project', 'Project of the Year', 'Developed an innovative robotics project'),
(303, 'Best Debater', 'Debate Championship', 'Winner of the inter-college debate competition'),
(304, 'Top Artist', 'Art Excellence Award', 'Outstanding contribution to college art exhibitions'),
(305, 'Sports Excellence', 'Best Athlete', 'Achieved first place in state-level sports competition');
INSERT INTO Research_Publications (Faculty_Id, Title, Journal)
VALUES
(201, 'Advanced Networking Algorithms', 'International Journal of Networking'),
(202, 'Deep Learning for Image Recognition', 'IEEE Transactions on Neural Networks'),
(203, 'Cloud Computing and Big Data', 'Journal of Cloud Computing'),
(204, 'Software Engineering in Agile Teams', 'Software Engineering Journal'),
(205, 'Cyber Security Threats and Solutions', 'Cybersecurity Journal');
