/* 기본키 */

-- 기본키 추가하기1
CREATE TABLE PERSON (
  LAST_NAME VARCHAR(5) PRIMARY KEY,
  FIRST_NAME VARCHAR(5),
  NICKNAME VARCHAR(10)
);

-- 기본키 추가하기2
CREATE TABLE PERSON (
  LAST_NAME VARCHAR(5),
  FIRST_NAME VARCHAR(5),
  NICKNAME VARCHAR(10),
  PRIMARY KEY (LAST_NAME)
);

-- 기본키 삭제하기
ALTER TABLE PERSON DROP PRIMARY KEY;

-- 다시 기본키 추가하기
ALTER TABLE PERSON ADD PRIMARY KEY (LAST_NAME);

-- 기본키의 제약사항 확인
INSERT INTO PERSON
values
(NULL, '짱구', '아들'); -- NULL을 입력할 수 없음

INSERT INTO PERSON
values
('신', '짱구', '아들'),
('신', '짱아', '딸'); -- 중복된 성을 입력할 수 없음

-- 이렇게 되면 두명이 같은 성을 사용할 수 없다. 
-- 이런 경우에는 이름과 성 두개의 컬럼으로 조합하여 복합키를 만들면, 같은 성을 가지더라도 유니크한 값을 가질 수 있다

-- 복합키 추가하기
CREATE TABLE PERSON (
  LAST_NAME VARCHAR(5),
  FIRST_NAME VARCHAR(5),
  NICKNAME VARCHAR(10),
  PRIMARY KEY (LAST_NAME,FIRST_NAME)
);

INSERT INTO PERSON values
('신', '짱구', '아들'),
('신', '짱아', '딸'); -- 같은 성을 가지더라도, 조합이 다르기 때문에 중복이 안됨



/* 외래키 */

-- 외래키 만들기
CREATE TABLE DEPT (
    DEPT_NO      INT PRIMARY KEY COMMENT '부서번호',
    DEPT_NAME    VARCHAR(20) COMMENT '부서명'
);
CREATE TABLE EMP (
    EMP_NO      INT PRIMARY KEY COMMENT '직원번호',
    EMP_NAME    VARCHAR(20) COMMENT '직원명',
    DEPT_NO     INT COMMENT '소속부서',
    FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPT_NO) -- 외래키 추가. 부서테이블의 부서번호를 참조
);

-- 외래키 삭제하기
ALTER TABLE EMP DROP FOREIGN KEY emp_ibfk_1;

-- 이미 테이블이 생성되었으면, 별도로 외래키 추가
ALTER TABLE emp 
ADD FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPT_NO);

-- 부서테이블 데이터 추가
INSERT INTO DEPT VALUES 
(1, '인사부'),
(2, '연구부'),
(3, '홍보부');

-- 사원테이블 데이터 추가
INSERT INTO EMP VALUES 
(1001, '정소화', 1),
(1002, '김용욱', 2),
(1003, '고명석', 3);
INSERT INTO EMP VALUES (1004, '김연아', 4); -- 부모테이블에 없는 4번은 사용할 수 없음

delete from DEPT
where DEPT_NO = 1; -- 자식이 참조하는 값이므로 삭제할 수 없음

-- 부서번호가 1번인 사원을 먼저 삭제해야함
delete from EMP
where DEPT_NO = 1;

-- 잘못된 순서로 테이블 삭제하기
DROP TABLE DEPT; -- 자식이 바라보고 있기때문에 삭제할 수 없음

-- 테이블을 삭제할 때는 자식, 부모 순서로 삭제해야 한다.
DROP TABLE emp;
DROP TABLE DEPT;

-- 반대로 테이블을 생성할 때는 부모, 자식 순서로 생성한다.

-- Q1. 회원 테이블 만들기
CREATE TABLE USER (
    ID      	VARCHAR(20) PRIMARY KEY COMMENT '아이디',
    PASSWORD    VARCHAR(200) COMMENT '패스워드',
    NAME		VARCHAR(20) COMMENT '이름'
);
INSERT INTO USER
VALUES
('USER1', '1234', '둘리'),
('USER2', '1234', '도우너');

-- Q2. 게시물 테이블 만들기
CREATE TABLE BOARD (
    NO      	INT AUTO_INCREMENT PRIMARY KEY COMMENT '글번호',
    TITLE    	VARCHAR(50) COMMENT '제목',
    CONTENT		VARCHAR(255) COMMENT '내용',
    WRITER		VARCHAR(20) COMMENT '작성자',
    REG_DATE	DATETIME COMMENT '등록일',
    UPDATE_DATE	DATETIME COMMENT '수정일',
    FOREIGN KEY (WRITER) REFERENCES USER(ID)
);

INSERT INTO BOARD
(TITLE, CONTENT, WRITER, REG_DATE, UPDATE_DATE)
values
('안녕하세요~', '안녕하세요~', 'USER1', SYSDATE(), SYSDATE()),
('안녕하세요~', '안녕하세요~', 'USER2', SYSDATE(), SYSDATE()),
('출석체크합니다~', '출석체크합니다~', 'USER1', SYSDATE(), SYSDATE()),
('출석체크합니다~', '출석체크합니다~', 'USER2', SYSDATE(), SYSDATE()),
('등업해주세요~', '등업해주세요~', 'USER2', SYSDATE(), SYSDATE());

-- Q3. 회원별로 작성한 게시물 찾기
SELECT USER.ID, USER.NAME, BOARD.TITLE 
FROM USER 
JOIN BOARD
ON USER.ID = BOARD.WRITER
order by USER.ID;

-- Q4. 회원별 작성한 게시물 건수 구하기
SELECT USER.ID AS 아이디, USER.NAME AS 이름, COUNT(*) AS 게시물건수
FROM USER 
JOIN BOARD
ON USER.ID = BOARD.WRITER
GROUP BY USER.ID;

-- Q5.수업 테이블 만들기
CREATE TABLE CLASS (
    CLASS_NO      INT PRIMARY KEY COMMENT '수업번호',
    CLASS_NAME    VARCHAR(20) COMMENT '수업명'
);
INSERT INTO CLASS 
VALUES 
(1, '수학'),
(2, '국어'),
(3, '영어');

-- Q6.학생 테이블 만들기
CREATE TABLE STUDENT (
   STUDENT_NO      INT PRIMARY KEY COMMENT '학생번호',
   STUDENT_NAME    VARCHAR(20) COMMENT '학생명'
);
INSERT INTO STUDENT 
VALUES 
(1001, '둘리'),
(1002, '또치'),
(1003, '도우너');

-- Q7. 수강 테이블 만들기
CREATE TABLE STUDENT_CLASS (
   ST_NO INT COMMENT '학생번호',
   CL_NO INT COMMENT '수강하는 수업의 번호',
   FOREIGN KEY (ST_NO) REFERENCES STUDENT(STUDENT_NO),
   FOREIGN KEY (CL_NO) REFERENCES CLASS(CLASS_NO)
);

INSERT INTO STUDENT_CLASS 
VALUES 
(1001, 1),
(1001, 2),
(1002, 2),
(1002, 3),
(1003, 1),
(1003, 2),
(1003, 3);

-- Q8. 과목별 수강생 목록 출력하기
SELECT T3.CLASS_NO AS 수업번호, T3.CLASS_NAME AS 수업명, GROUP_CONCAT(T2.STUDENT_NAME) AS 수강생목록
FROM STUDENT_CLASS T1
JOIN STUDENT T2
ON T1.ST_NO = T2.STUDENT_NO
JOIN CLASS T3
ON T1.CL_NO = T3.CLASS_NO
GROUP BY T3.CLASS_NO;

-- Q9. 제일 수강생이 많은 수업 찾기
SELECT T2.CLASS_NO AS 과목번호, T2.CLASS_NAME AS 과목명, COUNT(*) AS '수강생 수'
FROM STUDENT_CLASS T1
JOIN CLASS T2
ON T1.CL_NO = T2.CLASS_NO
GROUP BY T2.CLASS_NO
ORDER BY COUNT(*) DESC
LIMIT 1;


