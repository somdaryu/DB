/* JOIN문으로 여러 테이블을 통합하기 */

-- 부서 테이블 만들고 데이터 추가
CREATE TABLE DEPT (
	DEPT_NO INT COMMENT '부서번호',
	DEPT_NAME VARCHAR(20) COMMENT '부서명',
	LOCATION VARCHAR(5) COMMENT '위치'
);
INSERT INTO DEPT 
VALUES 
(1, '인사부', '3층'),
(2, '홍보부', '1층'),
(3, '개발부', '2층'),
(NULL, '임시부서', '2층');

-- 직원 테이블 만들고 데이터 추가
CREATE TABLE EMP (
    EMP_NO INT COMMENT '직원번호',
    EMP_NAME    VARCHAR(20) COMMENT '직원명',
    EMP_RANK VARCHAR(10) COMMENT '직급',
    DEPT_NO INT COMMENT '부서번호'
);
INSERT INTO EMP 
VALUES 
(1001, '둘리', '사원', 1),
(1002, '또치', '대리', 2),
(1003, '도우너', '대리', 3),
(1004, '고길동', '과장', 3),
(1005, '마이콜', '부장', NULL);

/* inner join문은 양쪽테이블에 모두 값이 있는 데이터만 가져온다 */
-- 사원의 모든 정보를 가져오기
SELECT *
FROM EMP 
JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO; -- 부서번호을 기준으로 두 테이블 연결

 -- 보고싶은 컬럼만 선택하여 가져옴 
SELECT EMP.EMP_NO, EMP.EMP_NAME, EMP.DEPT_NO, DEPT.DEPT_NAME
FROM EMP 
JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO;

-- ERROR
SELECT EMP_NO,DEPT_NO -- 어떤테이블의 컬럼인지 명시하지 않아서 에러남
FROM EMP 
JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO;

-- 테이블에 별칭 붙이기
SELECT T1.EMP_NO, T1.EMP_NAME, T2.DEPT_NAME
FROM EMP T1, DEPT T2
WHERE T1.DEPT_NO = T2.DEPT_NO;

-- 사원과 부서 테이블을 공통컬럼없이 그냥 조인하기
SELECT *
FROM EMP, DEPT; -- 값이 중복됨
-- 테이블1의 row * 테이블2의 row 만큼 가져온다 (4*5 = 18행)

/* outer join문은 오른쪽 테이블에 일치하는 값이 없어도 왼쪽 테이블의 모두 데이터를 가져온다 */
-- 부서가 없는 사원을 포함하여 사원정보 가져오기
SELECT * FROM EMP
LEFT JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO;

-- 부서번호가 없는 부서도 포함하여 사원정보 가져오기
SELECT * FROM emp
RIGHT JOIN dept
ON EMP.DEPT_NO = DEPT.DEPT_NO;


-- Q.1~2 예제 테이블 만들기 (상영관과 영화)
CREATE TABLE CINEMA (
    THEATER_NO INT  COMMENT '상영관번호',
    LOCATION VARCHAR(100)  COMMENT '위치',
    TEL VARCHAR(50)  COMMENT '전화번호'
);
INSERT INTO CINEMA 
VALUES
(1,'송도점','032-111-1111'),
(2,'구월점','032-222-2222');

CREATE TABLE MOIVE (
    THEATER_NO INT  COMMENT '상영관번호',
	 MOVIE_NAME VARCHAR(20)  COMMENT '영화명'
);
INSERT INTO MOIVE 
VALUES
(1,'슬램덩크'),
(1,'교섭'),
(2,'슬램덩크'),
(2,'아바타2'),
(2,'영웅');

-- 테이블 정규화
-- 중복된 데이터는 허용하지 않음으로써, DB의 용량을 줄일 수 있음
-- 특정 데이터만 보관하도록 테이블을 쪼개는 것
-- 단점은 데이터를 한번에 조회할 때, JOIN이 필요함

-- 테이블 반정규화
-- 내용이 중복되더라도 테이블을 하나로 만드는 것
-- 장점은 조회가 편리함
-- 단점은 DB의 용량이 늘어남

CREATE TABLE TEMP (
    THEATER_NO INT  COMMENT '상영관번호',
    LOCATION VARCHAR(100)  COMMENT '위치',
    TEL VARCHAR(50)  COMMENT '전화번호',
	MOVIE_NAME VARCHAR(20)  COMMENT '영화명'
);

INSERT INTO TEMP 
VALUES
(1,'송도점','032-111-1111', '슬램덩크'), -- 상영관의 정보가 중복됨
(1,'송도점','032-111-1111', '교섭'),
(2,'구월점','032-222-2222', '슬램덩크'),
(2,'구월점','032-222-2222', '아바타2'),
(2,'구월점','032-222-2222', '영웅');

        
-- Q3. 지점별로 상영영화 정보를 가져오세요.

SELECT CINEMA.THEATER_NO, CINEMA.LOCATION, moive.MOVIE_NAME
FROM CINEMA
JOIN MOIVE
ON CINEMA.THEATER_NO = MOIVE.THEATER_NO;


-- Q.4 지점별로 영화예매 정보를 가져오세요.
SELECT M.THEATER_NO, M.MOVIE_NAME, R.USER_NAME
FROM MOIVE M
JOIN RESERVATION R
ON M.MOVIE_NAME = R.MOVIE_NAME;

-- Q5. 상품구매정보를 저장할 PURCHASE 테이블을 생성하고 데이터를 추가하세요.
CREATE TABLE PURCHASE (
    PURCHASE_DATE DATE NOT NULL COMMENT '구매일자',
    PRODUCT_NO INT NOT NULL COMMENT '상품번호'
);

INSERT INTO PURCHASE 
VALUES (20240105, 1),
(20240105, 2),
(20240111, 3),
(20240120, 5),
(20240125, 5),
(20240202, 2),
(20240207, 3),
(20240211, 5),
(20240212, 6);

-- Q6. PRODUCT와 PURCHASE 테이블을 이용하여 카테고리별 판매개수를 구하세요
SELECT P.CATEGORY AS 카테고리, COUNT(*) AS 판매건수
FROM PRODUCT P
JOIN PURCHASE R
ON P.PRODUCT_NO = R.PRODUCT_NO
GROUP BY P.CATEGORY;

SELECT CONCAT(P.CATEGORY, ': ', COUNT(*)) AS '제일많이 팔린 품목'
FROM PRODUCT P
JOIN PURCHASE R
ON P.PRODUCT_NO = R.PRODUCT_NO
GROUP BY P.CATEGORY
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Q7. 상품이 판매된 날짜를 구하세요
SELECT P.PRODUCT_NO AS 상품번호, P.PRODUCT_NAME AS 상품명, GROUP_CONCAT(R.PURCHASE_DATE) AS 판매날짜
FROM PRODUCT P
JOIN PURCHASE R
ON P.PRODUCT_NO = R.PRODUCT_NO
GROUP BY P.PRODUCT_NO;

-- Q8. 사원들의 출석정보를 저장할 ATTENDANCE 테이블을 생성하고 데이터를 추가하세요.
CREATE TABLE ATTENDANCE (
	EMP_NO INT NOT NULL COMMENT '사원번호',
    ATT_DATE DATE NOT NULL COMMENT '출석 체크한 날',
    ATT_TIME TIME NOT NULL COMMENT '출석 체크한 시간'
);

INSERT INTO ATTENDANCE 
VALUES (1001, '2024-04-25', '08:50'),
(1002, '2024-04-25', '08:55'),
(1003, '2024-04-25', '09:01'),
(1004, '2024-04-25', '09:05'),
(1005, '2024-04-25', '11:20'),
(1001, '2024-04-26', '08:58'),
(1002, '2024-04-26', '08:59'),
(1003, '2024-04-26', '09:30'),
(1004, '2024-04-26', '09:03'),
(1005, '2024-04-26', '10:50');

-- Q9. EMP(사원)와 ATTENDANCE(출석) 테이블을 이용하여 날짜별 지각자명단을 구하세요 
-- (9시 10분 이후에 오면 지각..!)
SELECT A.ATT_DATE AS 날짜, GROUP_CONCAT(E.EMP_NAME) AS 지각자명단
FROM EMP E
JOIN ATTENDANCE A
ON E.EMP_NO = A.EMP_NO
WHERE A.ATT_TIME > '09:10'
GROUP BY A.ATT_DATE;

-- Q10. 여러 테이블을 이용하여 개발부서의 4월 지각건수를 구하세요.
SELECT E.DEPT_NO AS 부서번호, D.DEPT_NAME AS 부서명, COUNT(*) AS 지각건수
FROM EMP E
JOIN ATTENDANCE A
ON E.EMP_NO = A.EMP_NO
JOIN DEPT D
ON E.DEPT_NO = D.DEPT_NO
WHERE A.ATT_TIME > '09:10' AND D.DEPT_NO = 3;






