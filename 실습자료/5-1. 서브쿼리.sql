/* 서브쿼리 */ 

-- <준비>
-- 부서 테이블 생성
CREATE TABLE DEPT (
    DEPT_NO      INT COMMENT '부서번호',
    DEPT_NAME    VARCHAR(20) COMMENT '부서명',
    PRIMARY KEY (DEPT_NO)
);

-- 부서테이블 데이터 추가
INSERT INTO DEPT VALUES 
(1, '인사부'),
(2, '연구부'),
(3, '홍보부');

-- 직원 테이블 생성
CREATE TABLE EMP (
    EMP_NO      INT COMMENT '직원번호',
    EMP_NAME    VARCHAR(20) COMMENT '직원명',
    DEPT_NO     INT COMMENT '소속부서',
    ADDRESS		VARCHAR(50) COMMENT '주소', 
    SALARY		INT COMMENT '월급',
    HIRE_DT		DATE COMMENT '입사일',
    PRIMARY KEY (EMP_NO),
    FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPT_NO)
);

-- 직원 테이블에 데이터 추가
INSERT INTO EMP VALUES 
(1001, '정소화', 1, '인천 연수구 송도동', 200, 20200101),
(1002, '김용욱', 2, '인천 남동구 구월동', 250, 20221201),
(1003, '고명석', 3, '인천 미추홀구 숭의동 ', 320, 20240201),
(1004, '김종하', 1, '인천 서구 가좌동', 300, 20200201),
(1005, '하유경', 2, '서울 관악구 은천동', 180, 20230701),
(1006, '손준우', 3, '서울 금천구 가산동', 400, 20230501),
(1007, '김미정', 1, '서울 서초구 반포동', 450, 20190101),
(1008, '이예성', 2, '부산 동구 초량동', 220, 20200301),
(1009, '김희영', 3, '부산 영도구 남항동', 370, 20220901),
(1010, '김채윤', 1, '부산 사하구 감천동', 190, 20230301);

-- <예제>

-- 실습 테이블 생성
CREATE TABLE TBL1 (
    TITLE      VARCHAR(10),
    CONTENT    VARCHAR(20)
);

INSERT INTO TBL1 VALUES 
('1번', '내용~'),
('2번', '내용~'),
('3번', NULL);

CREATE TABLE TBL2 (
    TITLE      VARCHAR(10),
    CONTENT    VARCHAR(20)
);

-- 1. WHERE에 서브쿼리 넣기 
-- 평균 급여보다 높은 급여를 받는 직원 찾기
SELECT *
FROM EMP
WHERE SALARY > (SELECT AVG(salary) FROM EMP);

-- 400이상 급여를 받는 사원이 있는 부서 찾기
SELECT * FROM DEPT 
WHERE DEPT_NO IN (SELECT DEPT_NO FROM EMP WHERE SALARY >= 400);

-- 2. FROM에 서브쿼리 넣기
-- 부산에 사는 사원의 정보 조회
SELECT T1.EMP_NO, T1.EMP_NAME, T1.ADDERSS 
FROM (
	SELECT * FROM EMP WHERE ADDRESS LIKE '부산%'
) T1;

-- 3. SELECT에 서브쿼리 넣기
-- 부서별 인원 세기
SELECT 
	D.DEPT_NO, D.DEPT_NAME, (SELECT COUNT(*) FROM EMP WHERE DEPT_NO = D.DEPT_NO)
FROM DEPT D;

-- 4. INSERT문 서브쿼리
-- 내용이 있는 게시물만 TBL2에 옮기기
INSERT INTO TBL2 (SELECT * FROM TBL1 WHERE CONTENT IS NOT NULL);

-- 5. DELETE문 서브쿼리
-- 내용이 없는 게시물 삭제하기
DELETE FROM TBL1
WHERE TITLE = (SELECT TITLE FROM TBL1 WHERE CONTENT IS NULL);


-- <연습문제>

-- Q1. EMP테이블에서 급여의 평균보다 적은 사원을 찾아서 그 사원의 이름, 주소, 급여순으로 출력하세요.

-- 급여의 평균 
SELECT AVG(SALARY) FROM EMP;

-- 메인
SELECT EMP_NAME, ADDRESS, SALARY 
FROM EMP
WHERE SALARY < (SELECT AVG(SALARY) FROM EMP);

-- Q2. 부서별로 최소급여를 받는 사원의 부서번호, 이름, 급여 순으로 출력하세요.

-- 그룹별로 최소 급여
SELECT MIN(SALARY) 
FROM EMP
GROUP BY DEPT_NO;

-- 메인
SELECT DEPT_NO, EMP_NAME, SALARY
FROM EMP
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMP GROUP BY DEPT_NO)
ORDER BY DEPT_NO;

-- Q3. 가장 많은 직원 수를 가진 부서의 이름을 조회하세요.
SELECT DEPT_NO, DEPT_NAME
FROM DEPT
WHERE DEPT_NO = (
    SELECT DEPT_NO
    FROM EMP
    GROUP BY DEPT_NO
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Q4. 급여가 자기 자신보다 높은 다른 직원이 있는지 조회하세요.
-- GROUP_CONCAT: 그룹핑을 안하면 모든 레코드의 값을 연결함
SELECT
EMP_NO, 
EMP_NAME, 
(SELECT GROUP_CONCAT(E2.EMP_NAME) FROM EMP E2 WHERE E1.SALARY < E2.SALARY) AS 나보다급여가높은
FROM EMP E1;

-- Q5. 부서별로 가장 오래 근무한 직원 조회하세요.
SELECT DEPT_NO, EMP_NO, EMP_NAME, HIRE_DT 
FROM EMP 
WHERE HIRE_DT IN (
SELECT MIN(HIRE_DT) FROM EMP GROUP BY DEPT_NO
);

-- Q6. 가장 최근에 입사한 직원을 조회하세요.
SELECT D.DEPT_NO, D.DEPT_NAME, E.EMP_NO, E.EMP_NAME, E.HIRE_DT
FROM DEPT D 
JOIN EMP E
ON E.DEPT_NO = D.DEPT_NO
WHERE E.EMP_NO = (
SELECT EMP_NO FROM EMP WHERE HIRE_DT = (SELECT MAX(HIRE_DT) FROM EMP)
);

-- Q7. 아래와 같이 TEST1 테이블을 생성하세요.
CREATE TABLE TEST1 (
    EMP_NO      INT COMMENT '직원번호',
    EMP_NAME    VARCHAR(20) COMMENT '직원명',
    DEPT_NO     INT COMMENT '소속부서',
    ADDRESS		VARCHAR(50) COMMENT '주소', 
    SALARY		INT COMMENT '월급',
    PRIMARY KEY (EMP_NO)
);

-- Q8. 부서번호가 1번인 직원의 데이터를 TEST1 테이블에 저장하세요.
INSERT INTO TEST1
SELECT * FROM EMP E WHERE DEPT_NO = 1;

-- Q9. 아래와 같이 TEST2 테이블을 생성하세요.
CREATE TABLE TEST2 (
    DEPT_NO     	INT COMMENT '부서번호',
    DEPT_NAME  	 	VARCHAR(20) COMMENT '부서명',
    DEPT_CNT		INT COMMENT '인원수',
    SALARY_SUM		INT COMMENT '급여합계',
    SALARY_AVG		INT COMMENT '평균급여',
    PRIMARY KEY (DEPT_NO)
);

-- Q10. 부서별로 부서번호, 부서명, 인원수, 급여합계, 평균급여를 구해서 TEST2 테이블에 저장하세요.
INSERT INTO TEST2
SELECT D.DEPT_NO, D.DEPT_NAME, COUNT(*), SUM(E.SALARY), ROUND(AVG(E.SALARY))
FROM EMP E
JOIN DEPT D
ON E.DEPT_NO = D.DEPT_NO
GROUP BY D.DEPT_NO;








