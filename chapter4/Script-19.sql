-- Q1

create table users(
	id varchar(20) primary key comment '아이디',
	password varchar(200) comment '패스워드',
	name varchar(20) comment '이름'
);

insert into users values
('USER1', 1234, '둘리'),
('USER2', 1234, '도우너');

-- Q2
create table board (
	no int primary key auto_increment comment '제목',
	title varchar(50) comment '제목',
	content varchar(255) comment '내용',
	writer varchar(20) comment '작성자',
	reg_date datetime comment '등록일',
	update_date datetime comment '수정일'
);

insert into board values
(1, '안녕하세요~','안녕하세요~', 'USER1', now(), now()),
(2, '안녕하세요~','안녕하세요~', 'USER2', now(), now()),
(3, '출석체크합니다~','출석체크합니다~', 'USER1', now(), now()),
(4, '출석체크합니다~','출석체크합니다~', 'USER2', now(), now()),
(5, '등업해주세요~','등업해주세요~', 'USER2', now(), now());

alter table board 
add foreign key(writer) references users(id);


-- Q3
select t1.id , t1.name , t2.title 
from users t1
join board t2
on t1.id  = t2.writer 
order by t1.id ;


-- Q4
select t1.id , t1.name , count(*) 
from users t1
join board t2
on t1.id  = t2.writer
group by t1.id ;


-- Q5

create table class(
	class_no int primary key comment '수업번호',
	class_name varchar(20) comment '수업명'
);

insert into class values
(1, '수학'),
(2, '국어'),
(3, '영어');


-- Q6
create table student (
	student_no int primary key comment '학생번호',
	student_name varchar(20) comment '학생명'
);

insert into student values
(1001, '둘리'),
(1002, '또치'),
(1003, '도우너');


-- Q7
create table student_class (
	st_no int comment '학생번호',
	cl_no int comment '수강하는 수업의 번호'
);

insert into student_class values
(1001, 1),
(1001, 2),
(1002, 2),
(1002, 3),
(1003, 1),
(1003, 2),
(1003, 3);

alter table student_class 
add foreign key(st_no) references student(student_no);

alter table student_class 
add foreign key(cl_no) references class(class_no);

-- Q8
select t1.cl_no, t3.class_name, group_concat(t2.student_name) 
from student_class t1
join student t2
on t1.st_no = t2.student_no 
join class t3
on t1.cl_no = t3.class_no 
group by t3.class_no;

select t1.cl_no, t2.class_name , count(*) 
from student_class t1
join class t2
on t1.cl_no = t2.class_no 
group by t2.class_no 
order by count(*) desc
limit 1;

-- 외래키의 관계차수
-- 1:1 or 1:N

-- STUDENT_CLASS의 외래키가 1:N 설정
-- 학생은 여러개의 과목을 수강할 수 있음

