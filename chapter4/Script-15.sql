create table dept(
	dept_no int comment '부서번호',
	dept_name varchar(20) comment '부서명',
	location varchar(5) comment '위치'
);

INSERT INTO DEPT values
(1, '인사부', '3층'),
(2, '홍보부', '1층'),
(3, '개발부', '2층'),
(null, '임시부서', '2층');

create table emp (
	emp_no int comment '직원번호',
	emp_name varchar(20) comment '직원명',
	emp_rank varchar(10) comment '직급',
	dept_no int comment '부서번호'
);

INSERT INTO EMP values
(1001, '둘리', '사원', 1),
(1002, '또치', '대리', 2),
(1003, '도우너', '대리', 3),
(1004, '고길동', '과장', 3),
(1005, '마이콜', '부장', null);


-- ********** INNER JOIN 
-- 공통컬럼을 찾아랏 select (1)테이블 join (2)테이블 on 공통컬럼

select *
FROM EMP
join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

select  
	emp.emp_no , emp.emp_name , emp.dept_no , 
	dept.dept_name 
from emp 
join dept 
on emp.dept_no = dept.dept_no;

select  
	t1.emp_no, t2.dept_no 
from emp t1
join dept t2
on t1.dept_no = t2.dept_no;

-- 사원과 부서 테이블을 공통컬럼없이 그냥 조인하기
select *
from emp, dept; 
-- 테이블 1의 row * 테이블2의 row만큼 가져온다
-- (4*5 = 20행)
 

-- ********** LEFT JOIN 
select *
from emp 
left join dept 
on emp.dept_no = dept.dept_no ;


-- ********** RIGHT JOIN 

select *
from emp 
right join dept 
on emp.dept_no = dept.dept_no ;
