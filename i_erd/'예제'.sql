create database school_db;
use school_db;

create table `students` (
	학생ID int PRIMARY KEY,
    이름 varchar(100),
    전공 varchar(100),
    입학년도 int
);

create table `professors` (
	교수ID int PRIMARY KEY,
    이름 varchar(100),
    학과 varchar(100),
    사무실위치 varchar(100)
);

create table `courses` (
	강의ID int PRIMARY KEY,
    강의명 varchar(100),
    담당교수ID int,
    학점수 int,
    foreign key (담당교수ID) references professors(교수ID)
);

create table `enrollments` (
	수강ID int PRIMARY KEY,
    학생ID int,
    강의ID int,
    수강년도 int,
    학기 int,
    foreign key (학생ID) references students(학생ID),
    foreign key (강의ID) references courses(강의ID)
);


-- Students
INSERT INTO Students VALUES (1, 'Alice', 'Computer Science', 2020);
INSERT INTO Students VALUES (2, 'Bob', 'Mathematics', 2021);
INSERT INTO Students VALUES (3, 'Charlie', 'Physics', 2022);

-- Professors
INSERT INTO Professors VALUES (1, 'Dr. Smith', 'Computer Science', 'Room 101');
INSERT INTO Professors VALUES (2, 'Dr. Johnson', 'Mathematics', 'Room 102');
INSERT INTO Professors VALUES (3, 'Dr. Williams', 'Physics', 'Room 103');

-- Courses
INSERT INTO Courses VALUES (1, 'Introduction to Programming', 1, 3);
INSERT INTO Courses VALUES (2, 'Calculus I', 2, 4);
INSERT INTO Courses VALUES (3, 'Mechanics', 3, 4);

-- Enrollments
INSERT INTO Enrollments VALUES (1, 1, 1, 2023, 1);
INSERT INTO Enrollments VALUES (2, 2, 2, 2023, 1);
INSERT INTO Enrollments VALUES (3, 3, 3, 2023, 1);


/*
	1. 전공이 컴퓨터 과학인 학생들의 이름과 입학년도를 조회하는 SQL 명령문을 작성
	2. 담당 교수 ID가 2인 강의의 강의명과 학점 수를 조회하는 SQL 명령문을 작성
	3. 2023년도 1학기에 수강하는 학생들의 목록을 조회하는 SQL 명령문을 작성 (학생 ID와 이름을 포함)
*/ 

# 1
select 이름, 입학년도
from `students`
where 
	전공 = 'Computer Science';
    
# 2 
select 강의명, 학점수
from 
	`courses`
where 
	담당교수ID = 2;
    
# 3
select
	S.학생ID, S.이름
from `students` S
	join `enrollments` E
    on S.학생ID = E.학생ID
where 
	E.수강년도 = 2023 AND E.학기 = 1;