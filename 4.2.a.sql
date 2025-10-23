-- Create Users
CREATE USER userA IDENTIFIED BY 'passwordA';
CREATE USER userB IDENTIFIED BY 'passwordB';

-- Grant privileges to userA
GRANT CREATE SESSION, CREATE TABLE TO userA;

-- Login as userA and create table
CREATE TABLE emp (
  emp_id NUMBER PRIMARY KEY,
  emp_name VARCHAR2(50),
  salary NUMBER
);

INSERT INTO emp VALUES (101, 'Alice', 50000);
INSERT INTO emp VALUES (102, 'Bob', 60000);
COMMIT;

-- Grant privileges to userB
GRANT SELECT ON emp TO userB;
GRANT SELECT, INSERT, UPDATE ON emp TO userB;

-- Login as userB
SELECT * FROM userA.emp;
INSERT INTO userA.emp VALUES (103, 'Charlie', 70000);

-- Revoke privileges
REVOKE SELECT, INSERT, UPDATE ON emp FROM userB;

-- Drop users
DROP USER userB;
DROP USER userA CASCADE;
