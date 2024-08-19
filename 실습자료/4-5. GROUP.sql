-- 선물테이블에서 품목을 그룹으로 묶기
SELECT TYPE FROM GIFT
GROUP BY TYPE; -- 가전제품, 생활용품, 식품

/* 그룹함수 */
-- 최소값, 최대값, 행의 개수, 합계, 평균 
SELECT MIN(PRICE),MAX(PRICE), COUNT(*), SUM(PRICE), AVG(PRICE) 
FROM GIFT; -- 10000, 70000, 7, 280000, 40000

-- 품목별 선물의 개수와 가격 합계 구하기 (최저가, 최고가, 개수, 합계, 평균가)
select TYPE, MIN(PRICE), MAX(PRICE), COUNT(*), SUM(PRICE), AVG(PRICE)
FROM GIFT
GROUP BY TYPE;

-- 품목별로 선물목록 구하기
select TYPE, GROUP_CONCAT(NAME) 
FROM GIFT
GROUP BY TYPE;

/* HAVING */
-- WHERE는 그룹화 전 전체 데이터 사용, HAVING은 그룹화 후 집계데이터에 사용

-- 선물번호가 3보다 큰 선물을 대상으로, 품목별로 선물의 개수를 센다
-- 그리고 선물의 개수가 3보다 큰 품목의 데이터를 조회한다
SELECT TYPE, COUNT(*)
FROM GIFT
WHERE NO > 3
GROUP BY TYPE
HAVING COUNT(*) > 3;

-- 2023년1월20일 이후에 출판된 책을 대상으로, 출판사별로 책 가격의 합계를 계산한다
-- 그리고 합계가 5만원에서 9만원 사이인 출판사의 데이터를 조회한다
SELECT PUBLISHER, SUM(PRICE) AS SUM 
FROM BOOK
WHERE PUB_DATE > '2023-01-20'
GROUP BY PUBLISHER
HAVING SUM BETWEEN 50000 AND 90000;

-- Q1. 회원 테이블에서 같은 지역에 사는 회원의 수를 구하세요. 
select ADDRESS as '지역', COUNT(*) as '회원의 수'
FROM CUSTOMER
GROUP BY ADDRESS; -- COUNT함수에 *을 인자로 사용하면, NULL도 셈

select ADDRESS as '지역', COUNT(ADDRESS) as '회원의 수'
FROM CUSTOMER
GROUP BY ADDRESS; -- COUNT함수에 ADDRESS을 인자로 사용하면, NULL은 안셈

-- Q2. 회원테이블에서 지역별로 회원 목록 구하세요.
select IFNULL(ADDRESS,'--') AS 지역, GROUP_CONCAT(NAME) AS 회원목록
FROM CUSTOMER
GROUP BY ADDRESS;

-- Q3. 도서테이블에서 출판사를 기준으로 책의 개수와 가격의 합계를 구하세요
select IFNULL(PUBLISHER,'--') as '출판사', COUNT(*) as '개수', IFNULL(SUM(PRICE),0) as '합계'
FROM BOOK
GROUP BY PUBLISHER;

-- Q4. 도서테이블에서 월별로 출판된 책의 개수를 구하세요
-- 출판일에서 월만 구하기
SELECT MONTH(PUB_DATE) FROM BOOK;

SELECT CONCAT(MONTH(PUB_DATE),'월') AS '월', COUNT(*) AS '출판된 책의 개수' FROM BOOK
GROUP BY MONTH(PUB_DATE);

-- Q5. 연락처 테이블에서 성과 이름을 합쳐 풀 네임을 만드세요.
SELECT LAST_NAME, FIRST_NAME, CONCAT(LAST_NAME, FIRST_NAME) AS FULL_NAME 
FROM CONTACTS;

-- Q6. 연락처 테이블에서 같은 성을 가진 사람의 수를 구하세요.
select LAST_NAME as '성', COUNT(*) as '사람의 수'
FROM CONTACTS
GROUP BY LAST_NAME;

-- Q7. 영화예매 테이블에서 날짜별로 영화를 예매한 건수를 구하세요.
SELECT DATE AS 날짜, MOVIE_NAME AS 영화명, COUNT(*) AS 예매건수
FROM RESERVATION GROUP BY DATE, MOVIE_NAME;

-- Q8. 영화예매 테이블에서 A열에 앉은 사람과 B열에 앉은 사람을 구하세요.
SELECT CONCAT(LEFT(SEAT_NO,1),'열') AS 자리, GROUP_CONCAT(USER_NAME) AS 명단
FROM RESERVATION
GROUP BY LEFT(SEAT_NO,1);

-- Q9. 상품 테이블에서 카테고리별로 최고가를 구하고, 최고가 순으로 정렬하세요 
SELECT * FROM PRODUCT;

SELECT CATEGORY AS 카테고리, MAX(PRICE) AS 최고가 FROM PRODUCT
GROUP BY CATEGORY
ORDER BY MAX(PRICE) DESC;

-- Q10. 상품 테이블에서 카테고리별로 상품리스트와 합계를 구하세요
SELECT CATEGORY AS 카테고리, GROUP_CONCAT(PRODUCT_NAME) AS 제품리스트, SUM(PRICE) AS 합계
FROM PRODUCT
GROUP BY CATEGORY;

-- Q11. 출판사별로 책 가격의 평균을 계산하세요
-- 그리고 책의 평균 가격이 35000원 이하이면서 최소 가격이 20000원 이상인 출판사의 데이터를 찾으세요
SELECT 
PUBLISHER, ROUND(AVG(PRICE)) AS AVG_PRICE, MIN(PRICE) AS MIN_PRICE
FROM BOOK
GROUP BY PUBLISHER
HAVING AVG(PRICE) <= 35000 AND MIN(PRICE) >= 20000;

-- Q12. 출판사별로 책의 수량과 책 가격의 합을 계산하세요
-- 그리고 책의 수량이 3권 이상이고 책 가격의 합이 70000원 이상인 출판사의 데이터를 찾으세요.
SELECT 
PUBLISHER, COUNT(*) AS BOOK_COUNT, SUM(PRICE) AS TOTAL_PRICE
FROM BOOK
GROUP BY PUBLISHER
HAVING COUNT(*) >= 3 AND SUM(PRICE) >= 70000;

-- Q13. 출판 날짜가 2023년 2월 1일 이후이거나 출판 날짜가 없는 데이터를 대상으로, 출판사별로 가장 비싼 책의 가격을 구하세요
-- 그리고 그 중에서 최고 가격이 50000원 이상인 출판사의 데이터를 찾으세요.
SELECT PUBLISHER, MAX(PRICE) AS MAX_PRICE
FROM BOOK
WHERE PUB_DATE > '2023-02-01' OR PUB_DATE IS NULL
GROUP BY PUBLISHER
HAVING MAX(PRICE) >= 50000;

-- Q14. 지메일을 사용하고 연락처가 있는 사람을 대상으로, 사람의 수를 세어주세요
-- 그리고 그 중에서 사람이 2명 이상인 그룹의 데이터를 찾으세요
SELECT LAST_NAME, COUNT(*) AS COUNT
FROM CONTACTS
WHERE EMAIL LIKE '%gmail.com' AND PHONE IS NOT NULL
GROUP BY LAST_NAME
HAVING COUNT(*) >= 2;
