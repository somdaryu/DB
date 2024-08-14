/* union */

-- 실습을 위해 두개의 슈퍼 테이블 만들기
CREATE TABLE STORE1 (
    PRODUCT  VARCHAR(20),
    PRICE   INT
);
INSERT INTO STORE1 
VALUES 
('소주',4000),
('맥주',5000),
('와인',20000);
CREATE TABLE STORE2 (
    PRODUCT  VARCHAR(20),
    PRICE   INT
);
INSERT INTO STORE2 
VALUES 
('소주',4000),
('맥주',5000),
('위스키',50000);


-- 두 슈퍼의 제품을 모두 가져오기
SELECT * 
FROM STORE1
UNION ALL
SELECT * 
FROM STORE2;

-- 중복을 제거하고 두 슈퍼의 제품을 모두 가져오기
SELECT * 
FROM STORE1
UNION
SELECT * 
FROM STORE2;


-- Q1. BOOK(도서)과 PRODUCT(상품) 테이블을 이용하여, 책과 과자 리스트를 구하세요.

DESC BOOK;
DESC PRODUCT;

SELECT BOOK_NO AS 제품번호, CONCAT('(책)',TITLE) AS 제품명, IFNULL(PRICE,0) AS 가격 FROM BOOK
UNION ALL
SELECT PRODUCT_NO, CONCAT('(과자)',PRODUCT_NAME), PRICE FROM PRODUCT
WHERE CATEGORY = '과자';















