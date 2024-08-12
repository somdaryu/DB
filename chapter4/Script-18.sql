-- 식별자 성립 조건 : unique, not null

-- 기본키 추가하기
create table person (
	last_name varchar(5),
	first_name varchar(5),
	nickname varchar(10),
	primary key(last_name)
);

-- 기본키 삭제하기
alter table person drop primary key;

-- 기본키 추가하기
alter table person add primary key(last_name);


-- 기본키의 제약사항 
-- 1. NULL을 입력할 수 없음, 2. 중복된 값을 입력할 수 없음

create table person (
	last_name varchar(5),
	first_name varchar(5),
	nickname varchar(10),
	primary key(last_name, first_name)
);

insert into person values
('신', '짱구', '아들'),
('신', '짱아', '딸');


drop table dept ;
drop table emp;

-- 테이블 생성 순서 : 부모 > 자식
create table dept (
	dept_no int primary key comment '부서번호',
	dept_name varchar(20) comment '부서명'
);

create table emp (
	emp_no int primary key comment '직원번호',
	emp_name varchar(20) comment '직원명',
	dept_no int comment '소속부서',
	foreign key(dept_no) references dept(dept_no)
);

-- 외래키 삭제하기
alter table emp drop foreign key emp_ibfk_1;

-- 외래키 추가하기
alter table emp
add foreign key (dept_no) references dept (dept_no);

-- 부서테이블 데이터 추가
insert into dept values
(1, '인사부'),
(2, '연구부'),
(3, '홍보부');

insert into emp values
(1001, '정소화', 1),
(1002, '김용욱', 2),
(1003, '고명석', 3);

-- 부모테이블에 없는 4번은 사용할수 없음
-- insert into emp values (1004, '김연아', 4);

-- 부서번호가 1번인 사원을 먼저 삭제해야함
delete from emp where dept_no = 1;

delete from dept where dept_no = 1;

-- 데이터 삭제 순서 : 자식 > 부모

drop table emp;

drop table dept;

-- 테이블 삭제 : 자식 > 부모