select colname from tablename
where colname IN/NOT IN (select colname from tablename where condition);


--> Find the name of sailors who have reserved a boat number 103

select s.sname from sailors s
where s.sid IN( select r.sid from reserves r where r.bid=103 );



--> Find the name of sailors who have not reserved a boat number 103

select s.sname from sailors s
where s.sid NOT IN( select r.sid from reserves r where r.bid=103 );



-----ALL/ANY-----

SYNTAX:
select colname from tablename
where colname operator 



---> Find the sailors id with the highest rating
select s.sid from sailors s where s.rating>=all(select s.rating from sailors s);

--> Find the sailors id whose rating is better than some sailor called andy 
select s.sid from sailors s where s.rating>=any(select s.rating from sailors s where s.same='andy);


Multiple Nested Queries:

---> Find the names of sailors who have reserved a red boat

select s.sname from sailors s
where s.sid IN(select r.sid from reserves r where r.bid IN( select b.bid from boats b where b.bcolor='red' ));


---> Find the names of sailors who have not reserved a red boat

select s.sname from sailors s
where s.sid NOT IN(select r.sid from reserves r where r.bid IN( select b.bid from boats b where b.bcolor='red' ));



CO-RELATED sub queries:
-EXISTS
-NOT EXISTS

SYNTAX:
select colname from tablename where EXISTS/NOT EXISTS (select * from tablename where condition)


-->Find the names of sailors who have reserved bot no 103

General:

select s.sname from sailors s , reserves r
where s.sid=r.sid and r.bid=103; 


Nested:

select s.sname from sailors s , reserves r
where s.sid IN(select r.sid from reservesr where r.bid=103); 


Co-Related sub query:

select s.sname from sailors s
where EXISTS ( select * from reserves r where s.sid=r.sid and r.bid=103);

1) Find the name and age of the youngest sailor

SELECT s.sid, s.sname
FROM sailors s
WHERE s.age <= ALL (SELECT s2.age FROM sailors s2);

OR

SELECT  s.sname,s.age
FROM sailors s
WHERE s.age <= ALL (SELECT sage FROM sailors);


2) Find the sailor id's who have a rating of 10 or reserved boat no 104

SELECT s.sid FROM sailors s
WHERE s.rating = 10
   OR EXISTS (
       SELECT r.sid FROM reserves r
       WHERE r.sid = s.sid AND r.bid = 104 );