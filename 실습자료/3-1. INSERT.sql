/* INSERT문으로 테이블에 데이터 추가하기 */

-- 회원정보를 저장하는 테이블 만들기
CREATE TABLE CUSTOMER (
    CUSTOMER_NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '회원번호', -- 새로운 데이터가 추가되면 PK는 자동으로 저장됨
    NAME VARCHAR(20) NOT NULL COMMENT '이름',
    ADDRESS VARCHAR(100) COMMENT '주소'
);

-- 회원테이블에 회원정보 추가
INSERT INTO CUSTOMER(NAME, ADDRESS) VALUES('둘리', '서울'); -- 입력할 컬럼과 값의 개수가 동일해야함
INSERT INTO CUSTOMER VALUES(2, '또치', '인천'); -- 모든 컬럼을 입력할때는 컬럼명 생략 가능

-- 회원테이블에 불완전한 회원정보 추가
INSERT INTO CUSTOMER(NAME, ADDRESS) VALUES('도우너', NULL); -- 주소에 빈값 입력

-- 여러 회원 정보 한번에 추가
INSERT INTO CUSTOMER (NAME, ADDRESS) 
VALUES
('고길동', '부산'),
('마이콜', '부산');

-- 데이터를 추가하다가 error가 발생하는 경우
-- pk가 중복되어 에러남
INSERT INTO CUSTOMER VALUES(4, '고길동', '부산');

-- NOT NULL 제약사항을 어겨서 에러남
INSERT INTO CUSTOMER VALUES(6, NULL, NULL); -- 이름컬럼은 not null


-- Q1. BOOK 테이블 생성 및 데이터 추가
CREATE TABLE BOOK (
    BOOK_NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '도서번호',
    TITLE VARCHAR(30) NOT NULL COMMENT '제목',
    PUBLISHER VARCHAR(100) COMMENT '출판사',
    PUB_DATE DATE COMMENT '출간일',
    PRICE INT COMMENT '가격'
);

INSERT INTO BOOK (TITLE, PUBLISHER, PUB_DATE, PRICE) 
VALUES ('역사1', '상상마당', 20230101, 10000),
('역사2', '상상마당', '2023-01-02', 20000),
('스프링웹프로젝트', '한빛미디어', '2023-02-01', 40000),
('자바프로그래밍', NULL, NULL, NULL);

-- Q2. 연락처 테이블 생성 및 데이터 추가
CREATE TABLE CONTACTS 
(
   LAST_NAME   VARCHAR( 255 ) NOT NULL COMMENT '성',
   FIRST_NAME  VARCHAR( 255 ) NOT NULL COMMENT '이름',
   EMAIL       VARCHAR( 255 ) NOT NULL COMMENT '이메일',
   PHONE       VARCHAR( 20 ) COMMENT '연락처'        
);

INSERT INTO CONTACTS VALUES 
('이','서연','stone@naver.com','010-2341-0000'),
('이','시우','lavera@naver.com',NULL),
('김','지호','shyla@gmail.com','010-3171-4126'),
('김','윤서','jeni@gmail.com','010-8121-2341'),
('최','수아','fern@gmail.com', NULL);

-- Q3. 선물세트 테이블 생성 및 데이터 추가
CREATE TABLE GIFT (
    NAME VARCHAR(20) COMMENT '상품명',
    TYPE VARCHAR(20) COMMENT '품목',
    PRICE INT COMMENT '가격'
);
INSERT INTO GIFT values
('참치세트','식품',10000),
('햄세트','식품',20000),
('샴푸세트','생활용품',30000),
('세차용품','생활용품',40000),
('주방용품','생활용품',50000),
('노트북','가전제품',60000),
('벽걸이TV','가전제품',70000);

-- Q4. 수업 테이블 생성 및 데이터 추가
CREATE TABLE CLASS(
	CLASS_NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '수업번호',
	CLASS_NAME VARCHAR(30) COMMENT '과목명',
	CLASS_TIME TIME COMMENT '수업시간'
);
INSERT INTO CLASS(CLASS_NAME, CLASS_TIME) 
VALUES('수학', '09:00:00'),
('국어', 100000),
('영어', '11:00');

-- Q5. 영화예약 테이블 생성 및 데이터 추가
CREATE TABLE RESERVATION (
    MOVIE_NAME VARCHAR(20) NOT NULL COMMENT '영화명',
    USER_NAME VARCHAR(20) NOT NULL COMMENT '예약자명',
    SEAT_NO VARCHAR(5) COMMENT '자리번호',
    DATE DATE COMMENT '예약일'
);

INSERT INTO RESERVATION
VALUES('아바타', '둘리', 'A1', '2024-04-20' ),
('아바타', '또치', 'A2', '2024-04-20' ),
('아바타', '도우너', 'B1', '2024-04-21' ),
('슬램덩크', '짱구', 'A2', '20240420' ),
('영웅', '고길동', 'B3', 20240421 );

-- Q6. 편의점의 상품 테이블 생성 및 데이터 추가
CREATE TABLE PRODUCT (
    PRODUCT_NO INT PRIMARY KEY COMMENT '제품번호',
    PRODUCT_NAME VARCHAR(20) COMMENT '제품명',
    PRICE INT COMMENT '가격',
    CATEGORY VARCHAR(10) COMMENT '카테고리(과자,음료,주류)'
);

INSERT INTO PRODUCT 
VALUES(1, '허니버터칩', 2300, '과자'),
(2, '새우깡', 1100, '과자'),
(3, '코카콜라', 1000, '음료'),
(4, '아침에주스', 4900, '음료'),
(5, '처음처럼', 3000, '주류'),
(6, '참이슬', 2500, '주류');


-- <단축키>
-- 커서가 있는 라인 실행: ctrl + enter
-- 여러 문장 한번에 실행: 블록 잡고 -> ALT + X
-- 주석: Ctrl + /
-- 정렬: 쿼리 드래그한 후에 CTRL + SHIFT + F
