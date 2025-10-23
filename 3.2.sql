select s.sname from sailors s, reserves r, boats b
where b.bid=r.bid and s.sid=r.sid and b.bcolor = 'red'
union
select s.sname from sailors s, reserves r, boats b
where b.bid=r.bid and s.sid=r.sid and b.bcolor = 'green';

-> Find the name of sailors who have reserved a red boat or a green boat with duplicates

select s.sname from sailors s, reserves r, boats b
where b.bid=r.bid and s.sid=r.sid and b.bcolor = 'red'
union all
select s.sname from sailors s, reserves r, boats b
where b.bid=r.bid and s.sid=r.sid and b.bcolor = 'green';


-> Find the name of sailors who have reserved a red boat and a green boat

select s.sname from sailors s, reserves r, boats b
where b.bid=r.bid and s.sid=r.sid and b.bcolor = 'red'
intersect
select s.sname from sailors s, reserves r, boats b
where b.bid=r.bid and s.sid=r.sid and b.bcolor = 'green';


-> Find the name of sailors who have reserved a red boat but not a green boat

select s.sname from sailors s, reserves r, boats b
where b.bid=r.bid and s.sid=r.sid and b.bcolor = 'red'
minus
select s.sname from sailors s, reserves r, boats b
where b.bid=r.bid and s.sid=r.sid and b.bcolor = 'green';