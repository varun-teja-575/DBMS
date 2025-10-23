CREATE TABLE students (
  rollno VARCHAR2(30),
  name VARCHAR2(30)
);

INSERT INTO students VALUES('24B11CS234', 'Bala');
INSERT INTO students VALUES('24B11CS381', 'Kiran');

SELECT * FROM students;
SELECT name FROM students;
SELECT * FROM students WHERE rollno='24B11CS234';

DELETE FROM students WHERE rollno='24B11CS381';
UPDATE students SET name='Bala Raju' WHERE rollno='24B11CS381';
