CREATE TABLE General_Staff (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Age INT,
    Address VARCHAR(255),
    No_of_Leaves_Taken INT,
    Joining_Date DATE,
    Gender CHAR(1),
    Mobile_No VARCHAR(15),
    Salary INT
);

CREATE TABLE Staff (
    Id INT PRIMARY KEY,
    Role VARCHAR(255),
    Shift VARCHAR(50),
    Supervisor_Id INT,
    FOREIGN KEY (Supervisor_Id) REFERENCES Staff(Id) ON DELETE SET NULL
);

CREATE TABLE Staff_Email (
    Id INT PRIMARY KEY,
    Email VARCHAR(255),
    FOREIGN KEY (Id) REFERENCES Staff(Id) ON DELETE CASCADE
);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Mobile_No VARCHAR(15),
    Age INT,
    Gender CHAR(1),
    Address VARCHAR(255),
    Batch INT,
    Program VARCHAR(255),
    Room_Mate_Name VARCHAR(255),
    Father_Name VARCHAR(255),
    Father_ContactNo VARCHAR(15),
    Mother_Name VARCHAR(255),
    Mother_ContactNo VARCHAR(15)
);

CREATE TABLE Student_Email (
    Student_Id INT PRIMARY KEY,
    Email VARCHAR(255),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Courses (
    Course_Id INT PRIMARY KEY,
    Course_Name VARCHAR(50) UNIQUE -- Ensures course names are unique
);

CREATE TABLE Faculty (
    Id INT PRIMARY KEY,
    Subjects VARCHAR(30),
    Committees VARCHAR(255),
    Course_Id INT,
    Research_Publications INT,
    Office_No INT,
    Designation VARCHAR(255),
    Joining_Date DATE,
    Years_of_Completion INT,
    University_Name VARCHAR(255),
    Lives_in_College BOOLEAN,
    FOREIGN KEY (Id) REFERENCES General_Staff(Id) ON DELETE CASCADE,
    FOREIGN KEY (Course_Id) REFERENCES Courses(Course_Id) ON DELETE SET NULL
);

CREATE TABLE Faculty_Reports (
    Faculty_Id INT PRIMARY KEY,
    Supervisor_Id INT,
    FOREIGN KEY (Faculty_Id) REFERENCES Faculty(Id) ON DELETE CASCADE,
    FOREIGN KEY (Supervisor_Id) REFERENCES Faculty(Id) ON DELETE CASCADE
);


CREATE TABLE Graduate_Students (
    Faculty_Id INT,
    Student_Id INT,
    PRIMARY KEY (Faculty_Id, Student_Id),
    FOREIGN KEY (Faculty_Id) REFERENCES Faculty(Id) ON DELETE CASCADE,
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Grades (
    Student_Id INT,
    Course_Id INT,
    Grade VARCHAR(2),
    PRIMARY KEY (Student_Id, Course_Id),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_Id) REFERENCES Courses(Course_Id) ON DELETE CASCADE
);

CREATE TABLE Disciplinary_Action (
    Student_Id INT PRIMARY KEY,
    Description VARCHAR(255),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Placement (
    Student_Id INT PRIMARY KEY,
    Company VARCHAR(255),
    Salary INT,
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Scholarships (
    Student_Id INT PRIMARY KEY,
    Agency VARCHAR(255),
    Amount INT,
    Conditions VARCHAR(255),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Membership (
    Student_Id INT,
    Club_Name VARCHAR(255),
    PRIMARY KEY (Student_Id, Club_Name),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Club_Committee (
    Club_Name VARCHAR(255) PRIMARY KEY,
    Description VARCHAR(255),
    Mentor_Id INT,
    FOREIGN KEY (Mentor_Id) REFERENCES Faculty(Id) ON DELETE SET NULL
);

CREATE TABLE Budget (
    Club_Name VARCHAR(255) PRIMARY KEY,
    Budget_Alloted INT,
    Used INT,
    Lapsed_From_Previous_Year INT,
    FOREIGN KEY (Club_Name) REFERENCES Club_Committee(Club_Name) ON DELETE CASCADE
);

CREATE TABLE Projects (
    Project_Id INT PRIMARY KEY,
    Faculty_Id INT,
    Description VARCHAR(255),
    Start_Date DATE,
    Funding_Agency VARCHAR(255),
    Funding_Amount INT,
    Expected_Completion_Date DATE,
    FOREIGN KEY (Faculty_Id) REFERENCES Faculty(Id) ON DELETE CASCADE
);

CREATE TABLE TA (
    Student_Id INT PRIMARY KEY,
    Course_Id INT,
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_Id) REFERENCES Courses(Course_Id) ON DELETE CASCADE
);


CREATE TABLE Faculty_Awards (
    Faculty_Id INT PRIMARY KEY,
    Achievement VARCHAR(255),
    Award_Won VARCHAR(255),
    Description TEXT,
    FOREIGN KEY (Faculty_Id) REFERENCES Faculty(Id) ON DELETE CASCADE
);

CREATE TABLE Student_Awards (
    Student_Id INT PRIMARY KEY,
    Achievement VARCHAR(255),
    Award_Won VARCHAR(255),
    Description VARCHAR(255),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Research_Publications (
    Faculty_Id INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Journal VARCHAR(255),
    FOREIGN KEY (Faculty_Id) REFERENCES Faculty(Id) ON DELETE CASCADE
);
