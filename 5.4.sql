DELETE FROM StudentsF WHERE StudentID = 103;      -- Primary index delete
DELETE FROM StudentsF WHERE LastName = 'Smith';   -- Secondary index delete

DESC idx_LastName;
DROP INDEX idx_LastName;
