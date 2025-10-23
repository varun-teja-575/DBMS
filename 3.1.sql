create table tb1 (
rno integer,
name varchar2(30),
marks integer);

insert into tb1 values(501,'Abhi',50);
insert into tb1 values(502,'Ravi',60);
insert into tb1 values(503,'Suma',40);
insert into tb1 values(504,'Raju',70);
insert into tb1 values(505,'Ramu',45);
update tb1
set marks=50
where rno=501;


select * from tb1; 




create table tb2 (
rno integer,
fee integer);

insert into tb2 values(501,15000);
insert into tb2 values(502,5000);
insert into tb2 values(503,10000);
insert into tb2 values(504,25000);
select * from tb2;
CROSS JOIN
select * from tb1,tb2;
EQUI-JOIN
select * from tb1,tb2 where tb1.rno=tb2.rno;
INNER JOIN
select * from tb1 inner join tb2 on tb1.rno=tb2.rno;
NATURAL JOIN
select * from tb1 natural join tb2;
LEFT OUTER JOIN
select * from tb1 left outer join tb2 on tb1.rno=tb2.rno;
RIGHT OUTER JOIN
select * from tb2 right outer join tb1 on tb1.rno=tb2.rno;

SELF JOIN
select t1.rno,t2.name from tb1 t1, tb1 t2 where t1.rno=t2.rno; 


10/09/2025

Find the name of the sailors who reserved the boat no. 103

-> Cross product
     select * from sailors, reserves;
-> condition:
     select * from sailors s, reserves r where s.sid=r.sid and r.bid=103;

-> Remove unwanted colums
     select s.sname from sailors s, reserves r where s.sid=r.sid and r.bid=103;


Find the colour of the boat reserved by lubber
  
-> Cross product
     select * from sailors, reserves, boats;

->Final
    select b.bcolor from boats b, sailors s, reserves r
    where s.sid=r.sid and r.bid=b.bid and s.sname = 'Lubber';