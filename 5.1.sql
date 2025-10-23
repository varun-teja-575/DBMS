CREATE TABLE StudentsF (
  StudentID INT PRIMARY KEY,
  FirstName VARCHAR2(50),
  LastName VARCHAR2(50),
  EnrollmentDate DATE
);

CREATE INDEX idx_LastName ON StudentsF(LastName);
