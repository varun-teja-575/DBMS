CREATE TABLE std1 (
  rollno INTEGER,
  name VARCHAR2(20),
  branch VARCHAR2(20)
);

INSERT INTO std1 VALUES (201, 'ramesh', 'mech');

BEGIN SAVEPOINT A; END;

INSERT INTO std1 VALUES (202, 'geetha', 'civil');

BEGIN SAVEPOINT B; END;

UPDATE std1 SET branch = 'IT' WHERE rollno = 201;

SELECT * FROM std1;

ROLLBACK TO B;
SELECT * FROM std1;

ROLLBACK TO A;
SELECT * FROM std1;
