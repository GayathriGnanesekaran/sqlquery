show character set;
show databases;
create database details;
drop database details;
drop database if exists details;
create database details;
-- there is lots of database ,so choose using use
use details;
show tables;
-- table creation
create table student(
id int,
name varchar(78),
age int
);
-- ti view the table details
describe student;
-- delete the table
drop table student;
-- create the table
create table student(
id int,
name varchar(78),
age int
);
-- add extra column
alter table student add column city varchar(56);
-- delete the column
alter table student drop column city;
-- value insert
insert into student values(1,'gayu',23);
-- to view
select *from student;
insert into student values
(2,'nila',23),
(3,'dhina',34);
insert into student(id,name) values(4,'gayuma');
select*from student;
-- to display particular column
select id,name from student;
-- create the employee table
create table employee(
empid int primary key,
ename varchar(78),
jobdesc varchar(89),
salary int
);
-- insert the values
insert into employee values
(1,'gayu','sw',5600),
(2,'nila','web',4500),
(3,'abi','web',6780),
(4,'yuuu','ai',7800);
-- condition check
select*from employee
where ename='gayu';
select empid,ename from employee
where ename<>'gayu';
select*from employee where salary<6780;
select*from employee where ename='gayu' or ename='nila';
-- better the above in
select*from employee where ename in('gayu','nila');
-- not in
select*from employee where ename not in('yuuu');
-- between
select*from employee where salary between 5000 and 9000;
select*from employee where ename like 'g%';
select*from employee where ename not like 'g%';
select*from employee where ename like 'g%u';
select*from employee where ename like '__l%a';
-- update using where
update employee
set ename='barby'
where empid=1;
delete from employee where ename='barby';
select*from employee;
-- distinct 
select distinct jobdesc from employee;
-- order by
select*from employee order by salary;-- it take asc
select*from employee order by ename desc;
-- order by is used in where clause
select*from employee where empid=2
order by ename;
-- order by prferences
select*from employee
order by(case ename
when 'nila' then 1
when 'yuuu' then 2
else 100 end

);
-- limit
select*from employee limit 2;
-- aggregate functions
select count(*) from employee;
select count(*)total from employee;-- total column name for new 
select avg(salary)total from employee;
select max(salary)total from employee;
select sum(salary)total from employee;
-- string function
select ucase(ename)name from employee;-- uppercase
select ename,char_length(ename) countt from employee;-- character length find
select concat('rs',salary)from employee;-- concatenation
select concat('rs',format(salary,0)) from employee;
-- date functions
alter table employee add column hiring date;
update employee set hiring="2024-12-5";
select*from employee;
select now();
select date(now());
select curdate();

-- format changes
select date_format(curdate(),"%y,%m,%d");
-- to find date difference
select datediff(curdate(),"2025/05/7");
select date_add(curdate(),Interval 1 week) as 'after one week';
-- group by
select jobdesc,avg(salary)
from employee
group by jobdesc;
-- having filter out by groups
select ename,count(empid)
from employee
group by ename
having count(empid)>1;
-- where,having,order by
select ename,avg(salary)
from employee
where salary>3800
group by ename
having avg(salary)>4000;
-- constraints
create table stu(
sid int primary key auto_increment,
sname varchar(67) not null,
descr varchar(89) default 'you dont assign value',
salary int,
adar int unique,
check(salary>2000)
);
-- if we want add constraint in already existe table
-- not null
alter table employee
modify empid int not null;
-- delete not null
alter table employee
modify empid int;
-- add dealut
alter table employee
alter ename set default 'unassigned';
-- drop default
alter table employee
alter ename drop default;
-- add check
alter table employee
add constraint gayu check(salary>700);
-- drop check
alter table employee
drop check gayu;
-- foreign key
create table branch(
bid int primary key,
location varchar(78),
address varchar(89)
);
create table gayu(
gid int primary key auto_increment,
gname varchar(67),
job varchar(89),
salary int,
constraint sample
foreign key (location) 
references branch(location)
on delete cascade  -- or set null                                      
);
alter table gayu drop foreign key sample;
drop table gayu;
drop table branch;
create table detailone(
id int primary key auto_increment,
name varchar(89),
salary int
);
create table detailtwo(
branchid int primary key auto_increment,
location varchar(78),
address varchar(89)
);
insert into detailone values
(1,'gayu',50000),
(2,'nila',67000),
(3,'gayuma',6500),
(4,'stanley',7800),
(5,'fancy',69000);
select*from detailone;
insert into detailtwo values
(1,'coimabtore','xxxx'),
(2,'chennai','yyy'),
(3,'bangalore','zzz');
select*from detailtwo;
-- index
show index from detailone;-- sql index
-- create index
create index sample on detailone(name);
-- delete index
alter table detailone
drop index sample;
-- add index
alter table detailone
add index(name);
-- join
select detailone.id,detailone.name,detailtwo.location
from detailone
join detailtwo;
select detailone.id,detailone.name,detailtwo.location
from detailone
inner join detailtwo;
select detailone.id,detailone.name,detailtwo.location
from detailone
cross join detailtwo;
-- union
select*from detailone
union
select*from detailtwo;
-- subquries
create or replace view items
as
select*from detailone
where name=(select name from detailone where id=2);
-- exists
create view item
as
select location from detailtwo
where exists(
select*from detailone where id=2);
select*from item;
select*from items;