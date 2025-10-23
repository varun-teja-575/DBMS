-- Create view
CREATE VIEW myview AS SELECT rollno, name FROM st1;

-- Display all views/tables
SELECT * FROM tab;

-- Insert into view
INSERT INTO myview VALUES (506, 'prathisha');

-- Display view
SELECT * FROM myview;

-- Display base table
SELECT * FROM st1;

-- Delete from view
DELETE FROM myview WHERE rollno=506;

-- Replace existing view
CREATE OR REPLACE VIEW myview AS SELECT * FROM st1;

-- Create view when base table doesn’t exist
CREATE OR REPLACE FORCE VIEW abc AS SELECT * FROM dummy_table;

-- Read-only view
CREATE VIEW myview1 AS SELECT * FROM st1 WITH READ ONLY;

-- Insert/update in read-only view (will fail)
INSERT INTO myview1 VALUES (503, 'prathisha', 80);
UPDATE myview1 SET name='suma' WHERE rollno=505;

-- View with check option
CREATE VIEW myview2 AS SELECT * FROM st1 WHERE marks < 101 WITH CHECK OPTION;

-- Insert violating check condition
INSERT INTO myview2 VALUES (504, 'siri', 101);

-- Drop a view
DROP VIEW myview1;
