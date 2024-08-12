-- 테이블 정규화
-- 특정 데이터만 보관하도록 테이블을 쪼개는 것
-- 장점: 중복된 데이터는 허용하지 않음으로써, DB의 용량을 줄일 수 있다
-- 단점: 데이터를 한번에 조회할 때, JOIN이 필요함

-- Q1

create table cinema (
	theater_no int comment '상영관번호',
	location varchar(100) comment '위치',
	tel varchar(50) comment '전화번호'
);

insert into cinema values
(1, '송도점', '032-111-1111'),
(2, '구월점', '032-222-2222');


-- Q2
create table movie (
	theater_no int comment '상영관번호',
	movie_name varchar(20) comment '영화명'
);

insert into movie values
(1, '슬램덩크'),
(1, '교섭'),
(2, '슬램덩크'),
(2, '아바타2'),
(2, '영웅');

-- Q3
select cinema.theater_no, cinema.location , movie.movie_name 
from cinema 
join movie 
on cinema.theater_no = movie.theater_no ;

-- Q4
select t1.theater_no , t1.movie_name , t2.user_name 
from movie t1 
join reservation t2
on t1.movie_name = t2.movie_name;

-- Q5
create table purchase (
	purchase_date date not null comment '구매일자',
	product_no int not null comment '상품번호'
);

insert into purchase values
(20240105, 1),
(20240105, 2),
(20240111, 3),
(20240120, 5),
(20240125, 5),
(20240202, 2),
(20240207, 3),
(20240211, 5),
(20240212, 6);

-- Q6
select t1.category , count(*) 
from product t1
join purchase t2
on t1.product_no = t2.product_no 
group by t1.category ;

select concat(t1.category,':', count(*)) as '제일많이 팔린 품목'
from product t1
join purchase t2
on t1.product_no = t2.product_no
group by t1.category
order by count(*) desc 
limit 1;

-- Q7
select t1.product_no , t1.product_name , group_concat(t2.purchase_date)  
from product t1
join purchase t2
on t1.product_no = t2.product_no
group by t1.product_name
order by t1.product_no;

-- Q8
create table attendance (
	emp_no int not null comment '사원번호',
	att_date date not null comment '출석 체크한 날',
	att_time time not null comment '출석 체크한 시간'
);

insert into attendance values
(1001, 20240425, '08:50'),
(1002, 20240425, '08:55'),
(1003, 20240425, '09:01'),
(1004, 20240425, '09:05'),
(1005, 20240425, '11:20'),
(1001, 20240426, '08:58'),
(1002, 20240426, '08:59'),
(1003, 20240426, '09:30'),
(1004, 20240426, '09:03'),
(1005, 20240426, '10:50');

-- Q9
select t2.att_date, group_concat(t1.emp_name) 
from emp t1
join attendance t2
on t1.emp_no = t2.emp_no
where t2.att_time >= '09:10'
group by t2.att_date;

-- select > join + on > where > group by 순서 중요!!

-- Q10
select t1.dept_no , t3.dept_name , count(*) 
from emp t1
join attendance t2
on t1.emp_no = t2.emp_no
join dept t3
on t1.dept_no = t3.dept_no 
where t2.att_time >= '09:10'and t3.dept_no = 3 and month(t2.att_date) = 4; 
