#   4.1

create table Students
(
StudentID integer primary key,
StudentName varchar2(30),
Major varchar2(30));

drop table students;

create table Courses
(
CourseID integer primary key,
CourseName varchar2(30),
Credits integer);

create table Enrollments
(
StudentID integer ,
CourseID integer,
EnrollmentDate Date,
primary key(StudentID,CourseID),
foreign key(StudentID) references Students(StudentID),
foreign key(CourseID) references Courses(CourseID)
);

drop table Enrollments;


create table Instructors
(
InstructorID integer primary key,
InstructorName varchar2(30),
phone integer
);

create table Course_Instructors
(
CourseID integer,
InstructorID integer ,
primary key(CourseID,InstructorID),
foreign key(CourseID) references Courses(CourseID),
foreign key(InstructorID) references Instructors(InstructorID)
);



insert into Students values(1,'Alice Smith','Computer Science');
insert into Students values(2,'Bob Johnson','Mathematics');
insert into Students values(3,'Charlie Brown','Physics');


insert into Courses values(101,'Introduction to Programming',3);
insert into Courses values(102,'Calculus I',4);
insert into Courses values(103,'Classical Mechanics',3);


insert into Enrollments values(1,101,'01-sep-24');
insert into Enrollments values(1,102,'01-sep-24');
insert into Enrollments values(2,102,'01-sep-24');
insert into Enrollments values(3,103,'01-sep-24');



insert into Instructors values(1001,'Dr. Emily White',7225148456);
insert into Instructors values(1002,'Prof. David Green',9822663346);

insert into Course_Instructors values(101,1001);
insert into Course_Instructors values(102,1002);
insert into Course_Instructors values(103,1002);



select * from courses;
select * from students;
select * from enrollments;
select * from instructors;
select * from course_instructors;

1) Retrieve all students and their majors

select * from students;

2) List all courses along with the number of credits

select * from courses;

3) Find all students enrolled in a specific course (e.g , 'Introduction to Programming')

select s.studentid,s.studentname,c.coursename from students s,enrollments e,courses c 
where coursename ='Introduction to Programming' 
and s.studentid=e.studentid and c.courseid=e.courseid;

4) Get the list of instructors teaching a specific course(e.g, 'Introduction to programming')

select i.instructorid,i.instructorname,c.coursename from courses c,instructors i,course_instructors ci
where c.coursename ='Introduction to Programming' and 
i.instructorid=ci.instructorid and c.courseid=ci.courseid;

5) Count the number of students enrolled in each course

select c.coursename,count(*) from courses c, students s, enrollments e
where c.courseid=e.courseid and s.studentid=e.studentid
group by coursename;

6)List courses along with their instructor names

select c.coursename,i.instructorname from courses c, instructors i, course_instructors ci
where c.courseid=ci.courseid and i.instructorid=ci.instructorid;

7) Get the number of courses taught by each instructor

select i.instructorname,count(*) from instructors i, courses c, course_instructors ci
where c.courseid=ci.courseid and i.instructorid=ci.instructorid
group by instructorname;

8)Find students enrolled after a certain data (e.g..,'2024-01-01')

select s.studentid,s.studentname from students s, enrollments e
where enrollmentdate >  TO_DATE('2024-08-01', 'YYYY-MM-DD') and s.studentid=e.studentid;

9) show each student with the total number of credits they are taking

select s.studentname,sum(c.credits) from courses c, students s, enrollments e
where c.courseid=e.courseid and s.studentid=e.studentid
group by s.studentname;

10)Show courses that have more than 3 credits

select coursename from courses where credits>3;