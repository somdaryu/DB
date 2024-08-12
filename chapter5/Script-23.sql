-- 직원테이블에서 부서가 '인사부'인 직원 조회

 create view emp_view1 as
 select emp_no, emp_name, dept_no
 from emp 
 where dept_no = 1;
 
 select emp_no, emp_name, dept_no
 from emp 
 where dept_no = 1;
 
-- 진짜 테이블에 데이터를 추가하면, 뷰도 변경됨
insert into emp values
(1011, '둘리', 1, '인천 연수구 송도동', 330, 20240801);

-- 가상테이블은 데이터가 반영이 되기 때문에, 조회를 다시할 필요가 없다!

-- 뷰 조회
select * from  emp_view1 ;

-- 뷰 수정하기 (부서를 '홍보부'로 변경)

alter view emp_view1 as
select emp_no, emp_name, dept_no
from emp 
where dept_no = 1;


-- 일반 테이블처럼 데이터 수정, 삭제 가능. 원본 데이터에도 영향 있음

update emp_view1 set dept_no = 3
where emp_no = 1011;

-- 뷰 삭제
drop view emp_view1 ;


-- Q1
create view emp_view1 as
select emp_no, emp_name, dept_no from emp where dept_no = 1;

select * from emp_view1;


-- Q2
select t2.dept_no, t2.dept_name, group_concat(t1.emp_name), count(*) from emp t1 join dept t2 on t1.dept_no = t2.dept_no group by t2.dept_no; 

create view emp_view2 as
select t2.dept_no, t2.dept_name, group_concat(t1.emp_name), count(*) 
from emp t1 
join dept t2 
on t1.dept_no = t2.dept_no 
group by t2.dept_no; 

-- Q3
create view emp_view3 as
select t2.dept_name, min(t1.salary), max(t1.salary), round(avg(t1.salary))
from emp t1 
join dept t2 on t1.dept_no = t2.dept_no 
group by t1.dept_no ;

select * from emp_view3 ;

-- Q4
create view emp_view4 as
select emp_no ,emp_name, salary from emp where emp_name like ('김%') order by salary desc limit 3;

insert into emp values (1012,'김또치', '1', '인천 서구 가좌동', 400, 20200103);

select * from emp_view4 