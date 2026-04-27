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

SELECT * FROM Complaint;

INSERT INTO Student VALUES
(1,'Aman','aman@gmail.com',CURRENT_TIMESTAMP),
(2,'Riya','riya@gmail.com',CURRENT_TIMESTAMP),
(3,'Kiran','kiran@gmail.com',CURRENT_TIMESTAMP),
(4,'Neha','neha@gmail.com',CURRENT_TIMESTAMP),
(5,'Rahul','rahul@gmail.com',CURRENT_TIMESTAMP),
(6,'Sneha','sneha@gmail.com',CURRENT_TIMESTAMP),
(7,'Arjun','arjun@gmail.com',CURRENT_TIMESTAMP),
(8,'Pooja','pooja@gmail.com',CURRENT_TIMESTAMP),
(9,'Vikram','vikram@gmail.com',CURRENT_TIMESTAMP),
(10,'Anjali','anjali@gmail.com',CURRENT_TIMESTAMP);

INSERT INTO Hostel VALUES (1,'Block A');
INSERT INTO Hostel VALUES (2,'Block B');

INSERT INTO Room VALUES
(1,1,3),
(2,1,2),
(3,2,3),
(4,2,2);

INSERT INTO Complaint VALUES
(1,1,'Pending',CURRENT_TIMESTAMP),
(2,2,'Resolved',CURRENT_TIMESTAMP),
(3,3,'Pending',CURRENT_TIMESTAMP),
(4,4,'In Progress',CURRENT_TIMESTAMP),
(5,5,'Resolved',CURRENT_TIMESTAMP),
(6,6,'Pending',CURRENT_TIMESTAMP),
(7,7,'Resolved',CURRENT_TIMESTAMP),
(8,8,'In Progress',CURRENT_TIMESTAMP),
(9,9,'Pending',CURRENT_TIMESTAMP),
(10,10,'Resolved',CURRENT_TIMESTAMP);

-- 1. View all students
SELECT * FROM Student;

-- 2. Count total complaints
SELECT COUNT(*) FROM Complaint;

-- 3. Pending complaints
SELECT * FROM Complaint WHERE status='Pending';

-- 4. Complaints per student
SELECT student_id, COUNT(*) 
FROM Complaint
GROUP BY student_id;

-- 5. Students with complaints
SELECT s.name, c.status
FROM Student s
JOIN Complaint c ON s.student_id = c.student_id;

-- 6. Rooms per hostel
SELECT hostel_id, COUNT(*) 
FROM Room
GROUP BY hostel_id;

-- 7. Students with email filter
SELECT * FROM Student
WHERE email LIKE '%gmail.com';

-- 8. Complaint status count
SELECT status, COUNT(*)
FROM Complaint
GROUP BY status;
