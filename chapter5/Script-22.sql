-- 실습테이블 생성
create table tbl1 (
	title varchar(10),
	content varchar(20)
);

insert into tbl1 values
('1번', '내용~'),
('2번', '내용~'),
('3번', NULL);

create table tbl2 (
	title varchar(10),
	content varchar(20)
);

-- 서브쿼리
select *
from tbl1
where content is not null;

-- 메인 쿼리
insert into tbl2
(select *
from tbl1
where content is not null)

-- 내용이 없는 게시물 삭제하기

-- 서브쿼리
select title from tbl1
where content is null;

-- 메인쿼리
delete from tbl1 
where title = (select title from tbl1
where content is null);


-- 연습문제

-- Q1 where 서브쿼리

select avg(salary)
from emp;

select emp_name, address, salary from emp where salary <= (select avg(salary)
from emp);


-- Q2 규칙성이 없을땐 IN!
select min(salary)
from emp group by dept_no;

select dept_no, emp_name, salary 
from emp 
where salary in (select min(salary) from emp group by dept_no) 
order by dept_no ;

-- Q3
select dept_no 
from emp 
group by dept_no 
order by count(*) desc 
limit 1;

select dept_no, dept_name 
from dept 
where 
dept_no = 
	(select dept_no from emp group by dept_no order by count(*) desc limit 1);

-- Q4
select group_concat(emp_name) from emp t2 where t1.salary  < t2.salary 

select emp_no, emp_name, 
(select group_concat(emp_name) from emp t2 where t1.salary  < t2.salary ) 
from emp t1;

-- Q5
select min(hire_dt) from emp group by dept_no;

select dept_no, emp_no, emp_name, hire_dt from emp where hire_dt in (select min(hire_dt) from emp group by dept_no);

-- Q6
select max(hire_dt) from emp;

SELECT t1.dept_no , t2.dept_name , t1.emp_no , t1.emp_name , t1.hire_dt 
FROM emp t1 
JOIN dept t2
ON t1.dept_no = t2.dept_no
WHERE t1.emp_no =
    (SELECT emp_no from emp where hire_dt = 
    (SELECT max(hire_dt) 
     FROM emp)
    );
     
create table test1 (
	emp_no int primary key comment '직원번호',
	emp_name varchar(20) comment '직원명',
	dept_no int comment '소속부서',
	address varchar(50) comment '주소',
	salary int comment '월급'
);

alter table test1 drop hire_dt;

select * from emp where dept_no = 1;

insert into test1 
 (select t1.emp_no, t1.emp_name, t2.dept_no, t1.address, t1.salary from emp t1 join dept t2 on t1.dept_no = t2.dept_no where dept_no = 1);
 
create table test2 (
	dept_no int primary key comment '부서번호',
	dept_name varchar(20) comment '부서명',
	dept_cnt int comment '인원수',
	salary_sum int comment '급여합계',
	salary_avg int comment '평균급여'
);

select t2.dept_no , t2.dept_name, count(*), sum(t1.salary), round(avg(t1.salary)) 
from emp t1
join dept t2
on t1.dept_no  = t2.dept_no
group by dept_no ;

insert into test2 
(select t2.dept_no , t2.dept_name, count(*), sum(t1.salary), round(avg(t1.salary)) 
from emp t1
join dept t2
on t1.dept_no  = t2.dept_no
group by dept_no);

delete from test2 

