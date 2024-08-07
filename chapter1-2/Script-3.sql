-- <단축키>
-- 커서가 있는 라인 실행 : CTRL + ENTER
-- 여러 문장 한번에 실행 : 블록잡고 ALT + X
-- 주석 : CTRL + /

-- 회원테이블에 성별 컬럼 추가 [옵션 컬럼추가 - ADD 컬럼이름 타입]
alter table CUSTOMER add GENDER VARCHAR(9);

-- 성별 컬럼의 크기 변경 [옵션 수정 - MODIFY 이름 자료형 나머지]
alter table CUSTOMER modify GENDER VARCHAR(100);

-- 성별 컬럼 자료형과 not null 변경
ALTER table CUSTOMER modify GENDER INT not null;

-- 성별 컬럼에 설명 추가
alter table CUSTOMER modify GENDER INT not null COMMENT '성별';

-- 컬럼의 이름은 MODIFY로 변경이 안됨..
-- 성별 컬럼의 이름 변경
-- 이름만 변경할 때 사용 RENAME COLUMN N1 TO N2
ALTER table CUSTOMER rename column GENDER to GEN;

-- 이름과 다른 옵션을 한번에 변경할 때 사용 CHANGE COLUMN N1 N2 나머지
ALTER table CUSTOMER change column GEN GENDER VARCHAR(9);

-- 이름, 주소, 성별 컬럼 삭제 DROP COLUMN 대상
ALTER table CUSTOMER drop COLUMN NAME;

alter table CUSTOMER drop column ADDRESS;

ALTER table CUSTOMER drop column GENDER;

-- 연습문제
alter table CUSTOMER add NAME varchar(20) not null;
alter table CUSTOMER add ADDRESS VARCHAR(100);
alter table CUSTOMER add GENDER VARCHAR(9);

alter table ORDERS rename column SALESMAN_ID to SALESMAN_NAME;
alter table ORDERS drop column ORDER_DATE;

alter table LOCATION modify LOCATION_ID INT COMMENT '위치번호';
alter table LOCATION modify ADDRESS VARCHAR(255) not NULL COMMENT '주소';
alter table LOCATION modify POSTAL_CODE VARCHAR(20) COMMENT '우편번호';
alter table LOCATION modify CITY VARCHAR(50) COMMENT '도시명';

alter table CURRICULLUM change column no CURRICULUM_NO INT COMMENT '과목번호';
alter table CURRICULLUM change column NAME CURRICULUM_NAME VARCHAR(30) not null COMMENT '과목명';
alter table CURRICULLUM change column POINTS CURRICULUM_POINTS INT not null COMMENT '학점';
alter table CURRICULLUM change column PROFID CURRICULUM_PROFID INT not null COMMENT '교수번호';

alter table EMP modify EMP_NO INT COMMENT '직원번호';
alter table EMP modify DEPT_NO INT COMMENT '부서번호';
alter table EMP modify EMP_NAME VARCHAR(10) COMMENT '직원이름';
alter table EMP modify HDATE DATE COMMENT '입사일';
alter table EMP add SALARY INT not null COMMENT '월급';


-- 문제1. CUSTOMER 회원 테이블에 다시 컬럼 3개를 추가하세요.
ALTER TABLE CUSTOMER ADD NAME INT NOT NULL;
ALTER TABLE CUSTOMER ADD ADDRESS VARCHAR(20);
ALTER TABLE CUSTOMER ADD GENDER VARCHAR(9);


-- 문제2. ORDERS 주문 테이블을 다음과 같이 변경하세요.
-- - 판매자아이디 컬럼의 이름을 SALESMAN_NAME으로 변경하세요.
ALTER TABLE ORDERS RENAME COLUMN SALESMAN_ID TO SALESMAN_NAME;
-- - 주문일자 컬럼을 삭제하세요.
ALTER TABLE ORDERS DROP COLUMN ORDER_DATE;


-- 문제3. LOCATION 위치 테이블을 다음과 같이 변경하세요.
-- - 모든 컬럼에 코멘트를 작성하세요. 
ALTER TABLE LOCATION MODIFY LOCATION_ID INT COMMENT '위치 번호';
ALTER TABLE LOCATION MODIFY ADDRESS VARCHAR(255) NOT NULL COMMENT '주소';
ALTER TABLE LOCATION MODIFY POSTAL_CODE VARCHAR(20) COMMENT '우편 번호';
ALTER TABLE LOCATION MODIFY CITY VARCHAR(50) COMMENT '도시명';


-- 문제4. CURRICULUM 수업 테이블을 다음과 같이 변경하세요.
-- - 모든 컬럼의 이름과 NOT NULL 여부를 변경하세요.
ALTER TABLE CURRICULUM RENAME COLUMN NO TO CURRICULUM_NO;

ALTER TABLE CURRICULUM CHANGE COLUMN NAME CURRICULUM_NAME VARCHAR(30) NOT NULL COMMENT '과목명';
ALTER TABLE CURRICULUM CHANGE COLUMN POINTS CURRICULUM_POINTS INT NOT NULL COMMENT '학점';
ALTER TABLE CURRICULUM CHANGE COLUMN PROFID CURRICULUM_PROFID INT NOT NULL COMMENT '교수 번호';


-- 문제5. EMP 직원 테이블을 다음과 같이 변경하세요.
-- - 월급 컬럼을 추가하세요.
ALTER TABLE EMP ADD SALARY INT NOT NULL COMMENT '월급';
-- - 모든 컬럼에 코멘트를 작성하세요.
ALTER TABLE EMP MODIFY EMP_NO INT COMMENT '직원 번호';
ALTER TABLE EMP MODIFY DEPT_NO INT COMMENT '부서 번호';
ALTER TABLE EMP MODIFY EMP_NAME VARCHAR(10) COMMENT '직원 이름';
ALTER TABLE EMP MODIFY HDATE DATE COMMENT '입사일';



