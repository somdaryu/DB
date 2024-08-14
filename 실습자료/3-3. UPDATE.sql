/* UPDATE문으로 테이블에서 데이터 변경하기 */


-- 모든 회원의 이름을 도우너로 변경하기 
UPDATE CUSTOMER SET NAME = '도우너'; -- 조건절 없음

-- 모든 회원의 이름을 둘리, 주소를 서울로 변경하기
UPDATE CUSTOMER SET NAME='둘리', ADDRESS = '서울';  -- 조건절 없음

-- 회원번호가 1인 회원의 주소를 제주도로 변경하기
UPDATE CUSTOMER SET ADDRESS = '제주도' 
WHERE CUSTOMER_NO = 1;

SELECT * FROM BOOK;

-- Q1. BOOK 테이블에서 가격이 10000이상 30000이하인 사이인 도서의 출판사를 '민음사'로 변경하세요.
UPDATE BOOK SET PUBLISHER = '민음사' 
WHERE PRICE BETWEEN 10000 AND 30000; 

-- Q2. BOOK 테이블에서 출판일이 없는 도서의 출판사는 ‘없음’, 가격은 ‘0원’으로 변경하세요.
UPDATE BOOK SET PUBLISHER='없음', PRICE=0
WHERE PUB_DATE IS NULL;

-- Q3. CONTACTS 테이블에서 전화번호에 2341이 포함되고 이씨성을 가진 사람의 이름을 '지수'로 변경하세요.
UPDATE CONTACTS SET FIRST_NAME = '지수'
WHERE PHONE LIKE '%2341%' AND LAST_NAME = '이';

-- Q4. CONTACTS 연락처 테이블에서 최씨 성을 가진 사람의 이름은 '현우', 전화번호는 '010-1234-5678'으로 변경하세요.
UPDATE CONTACTS SET FIRST_NAME = '현우', PHONE = '010-1234-5678'
WHERE LAST_NAME = '최';

-- Q5. CLASS 수업 테이블에서 모든 과목의 수업시간을 12시 30분으로 변경하세요.
UPDATE CLASS SET CLASS_TIME = 123000; 

-- Q6. CLASS 수업 테이블에서 수업번호가 2번인 과목의 이름을 문학으로 변경하세요.
UPDATE CLASS SET CLASS_NAME = '문학' WHERE CLASS_NO = 2;

-- Q7. PRODUCT 상품 테이블에서 상품 번호가 1,3,5인 상품의 가격을 5000원으로 변경하세요.
UPDATE PRODUCT SET PRICE = 5000 WHERE PRODUCT_NO IN (1,3,5);

-- Q8. PRODUCT 상품 테이블에서 상품 번호가 2에서 4사이인 상품의 카테고리를 기타로 변경하세요.
UPDATE PRODUCT SET CATEGORY = '기타' WHERE PRODUCT_NO BETWEEN 2 AND 4;


