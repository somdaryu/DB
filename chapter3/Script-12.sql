-- 제주도에 사는 회원정보 삭제
DELETE FROM CUSTOMER 
WHERE address = '제주도';

SELECT * FROM  CUSTOMER C ;

-- 모든 회원정보 삭제
DELETE FROM CUSTOMER ;

-- 회원테이블에 다시 새로운 회원 추가
INSERT INTO CUSTOMER (NAME, ADDRESS)
values ('둘리', '서울');


-- 회원 테이블의 모든 데이터 삭제하고 회원번호 리셋하기 (삭제+초기화)
TRUNCATE CUSTOMER ; 

TRUNCATE CONTACTS;

INSERT INTO CONTACTS values
('이','지수','stone@naver.com','010-2341-0000'),
('김','지호','shyla@gmail.com','010-3171-4126'),
('김','윤서','jeni@gmail.com','010-8121-2341'),
('최','현우','fern@gmail.com','010-1234-5678');

SELECT * FROM  CONTACTS C ;

SELECT * FROM  BOOK 
WHERE book.PUB_DATE IN ('2023-01-01', '2023-02-01');

DELETE FROM BOOK WHERE book.PUB_DATE IN ('2023-01-01', '2023-02-01');

DELETE FROM GIFT 
WHERE name LIKE ('%세트') AND price <=20000;

SELECT * FROM GIFT G ;

DELETE FROM CLASS 
WHERE class_time >= '10:00';

SELECT * FROM  CLASS C ;

DELETE FROM RESERVATION 
WHERE seat_no LIKE ('A%') AND movie_name ='아바타';

SELECT * FROM RESERVATION R ;

DELETE FROM PRODUCT 
WHERE product_no IN(2,4,6); 
