CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP
);

CREATE TABLE Hostel (
    hostel_id INT PRIMARY KEY,
    hostel_name VARCHAR(100)
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    hostel_id INT,
    capacity INT,
    FOREIGN KEY (hostel_id) REFERENCES Hostel(hostel_id)
);

CREATE TABLE Complaint (
    complaint_id INT PRIMARY KEY,
    student_id INT,
    status VARCHAR(50),
    created_at TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

INSERT INTO Hostel VALUES (1,'Block A');
INSERT INTO Room VALUES (1,1,3);
INSERT INTO Student VALUES (1,'A','a@gmail.com',CURRENT_TIMESTAMP);
INSERT INTO Complaint VALUES (1,1,'Pending',CURRENT_TIMESTAMP);

SELECT * FROM Student;
SELECT * FROM Complaint;