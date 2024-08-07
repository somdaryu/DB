-- 회원 정보를 저장할 테이블
-- CREATE TABLE CUSTOMER (
-- 	ID INT PRIMARY KEY, -- 숫자형태로 저장되는 아이디
-- 	NAME VARCHAR(20) NOT NULL, -- 문자형태로 저장되는 이름
-- 	ADDRESS VARCHAR(100) -- 문자형태로 저장되는 주소
-- );

-- 주문 정보를 저장할 테이블
-- CREATE TABLE ORDERS (
-- 	ORDER_NO INT PRIMARY KEY COMMENT '주문번호', -- 컬럼의 설명 추가
-- 	SALESMAN_ID INT COMMENT '판매자아이디',
-- 	ORDER_DATE DATE NOT NULL COMMENT '주문일자'
-- );

-- 카테고리 정보를 저장할 테이블
-- CREATE  table CATEGORIES (
-- 	MENU_ID INT primary key COMMENT '메뉴아이디',
-- 	MENU_NAME CHAR(10) not null COMMENT '메뉴명',
-- 	KILOCALORIES INT not null COMMENT '칼로리',
-- 	PRICE INT not null COMMENT '가격'
-- );

-- 위치 정보를 저장할 테이블
-- CREATE table LOCATION(
-- 	LOCATION_ID INT primary key,
-- 	ADDRESS VARCHAR(255) not null,
-- 	POSTAL_CODE VARCHAR(20),
-- 	CITY VARCHAR(50)
-- );

-- 식단 정보를 저장할 테이블
-- CREATE table MENUS (
-- 	MENU_ID INT primary KEY COMMENT '메뉴아이디',
-- 	MENU_NAME CHAR(10) not null COMMENT '메뉴명',
-- 	KILOCALORIES INT not null COMMENT '칼로리',
-- 	PRICE INT not null COMMENT '가격'
-- );
-- 
-- 수업정보를 저장할 테이블
-- CREATE TABLE CURRICULLUM (
-- 	NO INT primary key COMMENT '과목번호',
-- 	NAME VARCHAR(30) COMMENT '과목명',
-- 	POINTS INT COMMENT '학점',
-- 	PROFID INT COMMENT '교수번호'
-- );
-- 
-- 부서 정보를 저장할 테이블
-- CREATE table DEPT(
-- 	DEPT_NO INT primary key COMMENT '부서번호',
-- 	DEPT_NAME VARCHAR(20) COMMENT '부서명',
-- 	DEPT_LOC VARCHAR(20) COMMENT '부서위치'
-- );
-- 
-- CREATE table EMP (
-- 	EMP_NO INT primary key,
-- 	DEPT_NO INT,
-- 	EMP_NAME VARCHAR(10),
-- 	HDATE DATE
-- );

-- 극장 정보를 저장할 테이블
-- CREATE table CINEMA (
-- 	THEATER_NO INT primary key COMMENT '상영관번호',
-- 	LOCATION VARCHAR(100) COMMENT '위치',
-- 	TEL VARCHAR(50) COMMENT '전화번호'
-- );

-- 예약 정보를 저장할 테이블
-- CREATE table RESERVATION (
-- 	THEATER_NO INT not null,
-- 	MOVIE_NAME VARCHAR(20) not null,
-- 	USER_NAME VARCHAR(20) not null,
-- 	SEAT_NO INT,
-- 	DATE DATE,
-- 	PRICE INT
-- );


