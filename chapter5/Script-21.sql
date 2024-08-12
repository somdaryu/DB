create table dept (
	dept_no int primary key comment '부서번호',
	dept_name varchar(20) comment '부서명'
);

insert into dept values
(1, '인사부'),
(2, '연구부'),
(3, '홍보부');

create table emp (
	emp_no int primary key comment '직원번호',
	emp_name varchar(20) comment '직원명',
	dept_no int comment '소속부서',
	address varchar(50) comment '주소',
	salary int comment '월급',
	hire_dt date comment '입사일',
	foreign key (dept_no) references dept(dept_no)
);

insert into emp values
(1001, '정소화', 1, '인천 연수구 송도동', 200, 20200101),
(1002, '김용욱', 2, '인천 남동구 구월동', 250, 20221201),
(1003, '고영석', 3, '인천 미추홀구 숭의동', 320, 20240201),
(1004, '김종하', 1, '인천 서구 가좌동', 300, 20200201),
(1005, '하유경', 2, '서울 관악구 은천동', 180, 20230701),
(1006, '순준우', 3, '서울 금천구 가산동', 400, 20230501),
(1007, '김미정', 1, '서울 서초구 반포동', 450, 20190101),
(1008, '이예성', 2, '부산 동구 초광동', 220, 20200301),
(1009, '김희영', 3, '부산 영도구 남항동', 370, 20220901),
(1010, '김채윤', 1, '부산 사하구 감천동', 190, 20230301);


-- ******************* 서브쿼리
-- 1. where에 서브쿼리 넣기, 평균 급여보다 높은 급여를 받는 직원 찾기

select avg(salary) from emp;

select *
from emp 
where salary > (select avg(salary) from emp);

-- 400이상 급여를 받는 사원이 있는 부서 찾기
select dept_no from emp where salary >= 400; 

select *
from dept 
where dept_no in (select dept_no from emp where salary >= 400);

-- 2. from에 서브쿼리 넣기
-- 부산에 사는 사원의 정보 조회

select t1.emp_no, t1.emp_name, t1.address
from 
	(
		select * 
		from emp 
		where address like '부산%'
	) t1;


select * 
from emp 
where address like '부산%';

-- 3. select에 서브쿼리 넣기
-- 부서별 인원 세기 // 서브쿼리를 안쓰면 조인으로 두테이블을 합쳤어야 했음
 
select
	t1.dept_no,
	t1.dept_name,
	(select count(*) from emp where dept_no = t1.dept_no) as 사원수
from dept t1;



