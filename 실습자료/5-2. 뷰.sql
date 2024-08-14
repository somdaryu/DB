
-- 단일 테이블을 조회하는 뷰 생성
-- (직원테이블에서 부서가 “인사부”인 직원 조회)
CREATE VIEW emp_view1 as
SELECT EMP_NO, EMP_NAME, DEPT_NO
FROM EMP 
where DEPT_NO = 1;

-- 뷰 조회
SELECT * FROM emp_view1;

-- 뷰 수정하기 (부서를 '홍보부'로 변경)
ALTER VIEW emp_view1 AS
SELECT EMP_NO, EMP_NAME, DEPT_NO
FROM EMP 
where DEPT_NO = 3;

-- 진짜 테이블에 데이터를 추가하면, 뷰도 변경됨
INSERT INTO EMP VALUES 
(1011, '둘리', 3, '인천 연수구 송도동', 330, 20240801);

-- 일반 테이블처럼 데이터 수정,삭제 가능. 원본 데이터에도 영향 있음
UPDATE emp_view1 SET EMP_NAME='또치' WHERE EMP_NO = 1011;

-- 뷰 삭제
DROP VIEW emp_view1;


-- Q1. 부서와 직원테이블을 이용하여 인사부 소속의 직원을 조회하는 뷰를 생성하세요.

-- 여러 테이블을 조회하는 뷰 생성 
-- 결과 테이블만 나오면, 내용과 상관없이 뷰를 생성할 수 있음
CREATE VIEW VIEW1 AS
SELECT EMP.EMP_NO , EMP.EMP_NAME, DEPT.DEPT_NAME
FROM EMP 
JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO
where DEPT.DEPT_NO = 1; 

SELECT * FROM VIEW1;

-- Q2. 부서와 직원테이블을 이용하여 부서별 직원을 조회하는 뷰를 생성하세요.
CREATE VIEW VIEW2 AS
SELECT DEPT.DEPT_NO AS 부서번호, DEPT.DEPT_NAME AS 부서명, GROUP_CONCAT(EMP.EMP_NAME) AS 사원리스트, COUNT(*) AS 인원
FROM EMP
JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO
GROUP BY DEPT.DEPT_NO;

SELECT * FROM VIEW2;

-- Q3. 부서와 직원테이블을 이용하여 부서별 직원을 조회하는 뷰를 생성하세요.
CREATE VIEW VIEW3 
AS
SELECT 
D.DEPT_NAME AS 부서명, 
MIN(E.SALARY) AS 최소급여, 
MAX(E.SALARY) AS 최대급여, 
ROUND(AVG(E.SALARY)) AS 평균급여
FROM EMP E 
JOIN DEPT D
ON E.DEPT_NO = D.DEPT_NO
GROUP BY D.DEPT_NO;

SELECT * FROM VIEW3;

-- Q4. 급여가 많은 사람 부터 1위~3위까지 출력하세요. 
CREATE VIEW VIEW4
AS
SELECT 
EMP_NO, EMP_NAME, SALARY
FROM EMP
WHERE EMP_NAME LIKE '김%'
ORDER BY SALARY DESC
LIMIT 3;

SELECT * FROM VIEW4;

INSERT INTO EMP VALUES 
(1012, '김또치', 1, '인천 연수구 송도동', 400, 20240801);

