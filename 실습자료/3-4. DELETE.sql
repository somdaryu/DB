/* DELETE문으로 테이블에서 데이터 삭제하기 */

-- 제주도에 사는 회원정보 삭제
DELETE FROM CUSTOMER 
WHERE ADDRESS = '제주도';

-- 모든 회원정보 삭제
DELETE FROM CUSTOMER;

-- 회원테이블에 새로운 회원을 추가하면 회원번호가 6번부터 시작됨
INSERT INTO CUSTOMER(NAME, ADDRESS) 
VALUES('둘리', '서울');

/* TRUNCATE문으로 테이블 초기화하기 */

-- 회원 테이블의 모든 데이터 삭제하고 회원번호 리셋하기
TRUNCATE CUSTOMER;

INSERT INTO CUSTOMER(NAME, ADDRESS) 
VALUES('둘리', '서울'); -- 회원번호가 초기화되어 다시 1번부터 시작됨


-- Q1. BOOK 도서 테이블에서 출판일이 1월1일 또는 2월1일인 책을 삭제하세요.
SELECT * FROM BOOK WHERE PUB_DATE = '2023-01-01' OR PUB_DATE = '2023-02-01';
SELECT * FROM BOOK WHERE PUB_DATE IN ('2023-01-01','2023-02-01');

DELETE FROM BOOK
WHERE PUB_DATE IN ('2023-01-01','2023-02-01');

-- Q2. CONTACTS 연락처 테이블에서 네이버이메일을 사용하면서 연락처가 없는 사람을 삭제하세요.
SELECT * FROM CONTACTS WHERE EMAIL LIKE '%@naver.com' AND PHONE IS NULL;

DELETE FROM CONTACTS WHERE EMAIL LIKE '%@naver.com' AND PHONE IS NULL; 

-- Q3. GIFT 선물 테이블에서 이름이 세트로 끝나면서 20000원이하인 선물을 삭제하세요.
select * from GIFT WHERE NAME LIKE '%세트' AND PRICE <=20000;

DELETE FROM GIFT 
WHERE NAME LIKE '%세트' AND PRICE <=20000;

-- Q4. CLASS 수업 테이블에서 10시 이후에 수업을 하는 과목을 삭제하세요.
select * from CLASS WHERE CLASS_TIME >= '10:00';

DELETE FROM CLASS WHERE CLASS_TIME >= '10:00';

-- Q5. RESERVATION 영화예매 테이블에서 A열에서 아바타를 봤던 예매정보를 삭제하세요.
SELECT * FROM RESERVATION WHERE MOVIE_NAME='아바타' AND SEAT_NO LIKE 'A%';

DELETE FROM RESERVATION WHERE MOVIE_NAME='아바타' AND SEAT_NO LIKE 'A%';

-- Q6. PRODUCT 상품 테이블에서 상품번호가 2,5,6 인 상품을 삭제하세요.
SELECT * FROM PRODUCT WHERE PRODUCT_NO IN (2,4,6);

DELETE FROM PRODUCT WHERE PRODUCT_NO IN (2,4,6);

