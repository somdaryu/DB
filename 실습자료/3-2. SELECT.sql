/* SELECT문으로 테이블에서 데이터 조회하기 */

-- 회원테이블에서 모든 데이터를 가져오기
SELECT * FROM CUSTOMER; -- *는 테이블의 모든 컬럼을 의미

-- 회원테이블에서 회원번호와 이름 가져오기
SELECT CUSTOMER_NO, NAME FROM CUSTOMER;


/* 특정조건을 만족하는 데이터만 조회하기 */
-- 비교 연산자
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO=1; -- where문 뒤에 조건식을 작성 

SELECT * FROM CUSTOMER WHERE CUSTOMER_NO!=1;

SELECT * FROM CUSTOMER WHERE CUSTOMER_NO<3;

SELECT * FROM CUSTOMER WHERE CUSTOMER_NO<=3;

-- 논리 연산자
-- 서울에 사는 둘리 회원 데이터 가져오기
SELECT * FROM CUSTOMER WHERE NAME='둘리' AND ADDRESS='서울';
-- 인천 또는 서울에 사는 회원데이터 가져오기
SELECT * FROM CUSTOMER WHERE  ADDRESS='인천' OR ADDRESS='서울';
-- 주소가 서울이 아닌 회원데이터를 가져오기
SELECT * FROM CUSTOMER WHERE NOT ADDRESS='서울' ;

-- Q1. BOOK 테이블에서 아래 조건으로 책를 검색하세요.
-- 가격이 20000원인 책
SELECT * FROM BOOK WHERE PRICE = 20000;
-- 가격이 10000이상 30000이하인 사이인 책
SELECT * FROM BOOK WHERE PRICE >=10000 AND PRICE <= 30000;
-- 제목이 역사1이거나 역사2인 책
SELECT * FROM BOOK WHERE TITLE ='역사1' OR TITLE = '역사2';
-- 1월 30일 이전에 출판되었고 가격이 10000원인 책
SELECT * FROM BOOK WHERE PUB_DATE < '2023-01-30' AND PRICE = 10000;

-- Q2. CONTACTS 연락처 테이블에서 아래 조건으로 사람을 검색하세요.
-- 이씨성을 가진 사람
SELECT * FROM CONTACTS WHERE LAST_NAME = '이';
-- 김씨성이 아닌 사람
SELECT * FROM CONTACTS WHERE LAST_NAME != '김';
-- 이름이 윤서거나 수아인 사람
SELECT * FROM CONTACTS WHERE FIRST_NAME = '윤서' OR FIRST_NAME = '수아';

-- Q3. CLASS 수업 테이블에서 10시 이후에 수업을 하는 과목을 찾으세요.

-- 수업번호가 1번인 과목
SELECT * FROM CLASS WHERE CLASS_NO = 1;

-- 10시 이후에 수업을 하는 과목
SELECT * FROM CLASS WHERE CLASS_TIME >= '10:00';

-- 9시 또는 11시에 수업을 하는 과목의 이름
SELECT CLASS_NAME FROM CLASS WHERE CLASS_TIME = '9:00' OR CLASS_TIME = '11:00';


-- Q4. RESERVATION 영화 테이블에서 아래 조건으로 예약을 검색하세요.

-- 4월 21일에 예약된 영화의 이름과 자리 번호
SELECT MOVIE_NAME, SEAT_NO FROM RESERVATION WHERE DATE = '2024-04-21';

-- 아바타를 제외한 영화 목록
SELECT MOVIE_NAME FROM RESERVATION WHERE MOVIE_NAME != '아바타';

-- 4월 20일에 A2자리를 예약한 고객의 이름
SELECT USER_NAME FROM RESERVATION WHERE DATE = '2024-04-20' AND SEAT_NO = 'A2';

-- Q5. PRODUCT 상품 테이블에서 아래 조건으로 상품을 검색하세요.
-- 2000원으로 구매할 수 있는 상품
SELECT * FROM PRODUCT WHERE PRICE <= 2000;

-- 과자 또는 음료
SELECT CATEGORY, PRODUCT_NAME FROM PRODUCT WHERE CATEGORY = '과자' OR CATEGORY = '음료';

-- 4000원 이상인 음료
SELECT PRODUCT_NAME, PRICE FROM PRODUCT WHERE CATEGORY = '음료' AND PRICE >= 4000;


-- 범위 연산자
-- 회원번호가 2와 4 사이인 회원 가져오기
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO BETWEEN 2 AND 4; -- 시작값, 마지막값 
-- 회원번호가 1, 4인 회원 가져오기
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO IN(1,4);
-- 회원번호가 1, 4인 회원 빼고 가져오기
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO NOT IN(1,4); -- 제외


-- Q1. BOOK 도서 테이블에서 아래 조건으로 책을 검색하세요.
-- 가격이 만원 이상이고 3만원 이하인 책
SELECT * FROM BOOK WHERE PRICE >= 10000 AND PRICE <= 30000;
SELECT * FROM BOOK WHERE PRICE BETWEEN 10000 AND 30000; 

-- 상상마당 또는 한빛미디어에서 출간한 책
SELECT * FROM BOOK WHERE PUBLISHER = '상상마당' OR PUBLISHER = '한빛미디어';
SELECT * FROM BOOK WHERE PUBLISHER IN ('상상마당', '한빛미디어');


-- Q2. GIFT 선물 테이블에서 아래 조건으로 제품을 검색하세요.
-- 가격이 3만원 이상이고 6만원 이하인 제품
SELECT * FROM GIFT 
WHERE PRICE BETWEEN 30000 AND 60000;

-- 식품이나 생활용품
SELECT * FROM GIFT 
WHERE TYPE IN ('식품','생활용품');

-- 가격이 10000원 또는 30000원 또는 40000원인 제품
SELECT * FROM GIFT 
WHERE PRICE = 10000 OR PRICE = 30000 or PRICE = 40000;

SELECT * FROM GIFT 
WHERE PRICE IN (10000,30000,40000);


-- Q3. RESERVATION 영화예매 테이블에서 아래 조건으로 예매정보를 검색하세요.
-- 슬램덩크 또는 영웅의 예매정보
SELECT DATE, MOVIE_NAME, USER_NAME FROM RESERVATION WHERE MOVIE_NAME IN ('슬램덩크', '영웅');
-- 4월 20일에 A1 또는 B1 자리를 예약한 예매정보
SELECT * FROM RESERVATION WHERE SEAT_NO IN ('A1', 'B1') AND DATE = '2024-04-20';


-- Q4. PRODUCT 상품 테이블에서 아래 조건으로 상품을 검색하세요.
-- 가격이 2천원에서 3천원 사이인 상품
SELECT CATEGORY, PRODUCT_NAME, PRICE FROM PRODUCT WHERE PRICE BETWEEN 2000 AND 3000; 

-- 음료나 주류 중에서 3천원 이하인 상품
SELECT CATEGORY, PRODUCT_NAME, PRICE FROM PRODUCT WHERE CATEGORY IN ('음료', '주류') AND PRICE < 3000;


-- 패턴 연산자
-- 이름이 '둘'로 시작하는 회원 가져오기
SELECT * FROM CUSTOMER 
WHERE NAME LIKE '둘%'; -- 둘리
-- 이름에 '길'이 포함된 회원 가져오기
SELECT * FROM CUSTOMER 
WHERE NAME LIKE '%길%'; -- 고길동 or 고길 or 길동 
-- 이름이 '치'로 끝나는 회원 가져오기
SELECT * FROM CUSTOMER 
WHERE NAME LIKE '%치'; -- 또치

-- 빈값 체크 연산자 --
-- 주소가 없는 회원 가져오기
SELECT * FROM CUSTOMER 
WHERE ADDRESS IS NULL;
SELECT * FROM CUSTOMER 
WHERE ADDRESS = NULL; -- 비교연산자로는 빈값을 찾을 수 없음

-- 주소가 있는 회원 가져오기
SELECT * FROM CUSTOMER 
WHERE ADDRESS IS NOT NULL;


-- Q1. BOOK 도서 테이블에서 아래 조건으로 책을 검색하세요.
-- 제목이 역사로 시작하면서 출판일이 1월 1일인 책
SELECT * FROM BOOK WHERE TITLE LIKE '역사%' AND PUB_DATE = '2023-01-01';

-- 출판사가 있고 가격이 2만원 이상인 책
SELECT PUBLISHER, TITLE, PRICE FROM BOOK WHERE PUBLISHER IS NOT NULL AND PRICE >=20000;


-- Q2. CONTACTS 연락처 테이블에서 아래 조건으로 사람을 검색하세요.
-- 전화번호가 4126로 끝나는 사람
SELECT LAST_NAME, FIRST_NAME, PHONE FROM CONTACTS 
WHERE PHONE LIKE '%4126';

-- 전화번호에 2341가 포함되고 김씨성을 가진 사람
SELECT LAST_NAME, FIRST_NAME, PHONE FROM CONTACTS 
WHERE PHONE LIKE '%2341%' AND LAST_NAME = '김';


-- 네이버 이메일을 사용하고 전화번호가 없는 사람
SELECT * FROM CONTACTS 
WHERE EMAIL LIKE '%@naver.com%' AND PHONE IS NULL;

-- Q3. GIFT 선물 테이블에서 아래 조건으로 상품을 검색하세요.
-- 이름에 용품이 포함된 상품
SELECT * FROM GIFT
WHERE NAME LIKE '%용품%';

-- 이름이 세트로 끝나면서 2만원이하인 상품
SELECT * FROM GIFT 
WHERE NAME LIKE '%세트' AND PRICE <=20000;


-- Q4. RESERVATION 영화예매 테이블에서 아래 조건으로 예매정보를 검색하세요.
-- A열에서 영화 아바타를 보는 예매정보
SELECT * FROM RESERVATION 
WHERE SEAT_NO LIKE 'A%' AND MOVIE_NAME = '아바타';

-- B열에서 영화를 보는 예매정보
SELECT MOVIE_NAME, USER_NAME, SEAT_NO FROM RESERVATION 
WHERE SEAT_NO LIKE 'B%';


-- 테이블 정렬하기
SELECT * FROM CUSTOMER;
ORDER BY CUSTOMER_NO; -- 회원번호를 기준으로 순정렬
-- 테이블 역정렬하기
SELECT * FROM CUSTOMER 
ORDER BY CUSTOMER_NO DESC; -- 회원번호를 기준으로 역정렬

-- 주소를 기준으로 정렬
select * from CUSTOMER
order by ADDRESS ASC;

-- 주소와 이름으로 정렬
select * from CUSTOMER
order by ADDRESS ASC, NAME DESC;


-- 테이블에서 특정개수만큼만 조회하기
SELECT * FROM CUSTOMER LIMIT 3;

-- 컬럼에 별명 붙이기
SELECT CUSTOMER_NO AS CODE 
FROM CUSTOMER; -- 결과테이블에서만 컬럼의 이름이 잠시 변경됨
SELECT CUSTOMER_NO AS '회원의 번호'
FROM CUSTOMER; -- 한글도 가능

-- 별명은 자바프로그램에서 클래스 이름과 매칭시키는 경우 또는 엑셀로 출력하는 경우에 사용한다
