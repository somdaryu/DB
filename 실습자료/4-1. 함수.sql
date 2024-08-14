/* 숫자함수 */
-- 반올림, 올림, 내림
SELECT ROUND(1.4), CEIL(1.4), FLOOR(1.4); -- 1, 2, 1

-- 목록 중에서 가장 큰 값, 가장 작은 값
SELECT GREATEST(1, 2, 3), LEAST(1, 2, 3);
 
-- 절대값 
SELECT ABS(1), ABS(-1); -- 1, 1

-- 소수점자리 선택
select TRUNCATE(1.2345, 2); -- 1.23


/* 논리 함수 */
-- 컬럼이 NULL이면 ''으로 치환
SELECT NAME, IFNULL(ADDRESS, '없음') FROM CUSTOMER;

  
/* 문자열함수 */
-- 대문자로 변환
SELECT UPPER('abc'); -- ABC

-- 소문자로 변환
SELECT LOWER('ABC'); -- abc

-- 문자열 연결하기
SELECT CONCAT('ab', 'cd', 'e'); -- abcde

-- 문자열 자르기 (3번째 위치부터 끝까지, 3번째 위치부터 2글자)
SELECT SUBSTR('ABCDEFG', 3), SUBSTR('ABCDEFG', 3, 2); -- CDEFG, CD 

-- 문자열 자르기 (왼쪽부터 3글자, 오른쪽부터 3글자)
SELECT LEFT('ABCDEFG', 3), RIGHT('ABCDEFG', 3); -- ABC, EFG

-- 문자열 길이 구하기 (바이트크기, 자리수)
SELECT LENGTH('ABCDE'), CHAR_LENGTH('ABCDE'); -- 5, 5

-- 문자열 길이 구하기 (바이트크기, 자리수)
SELECT LENGTH('안녕하세요'), CHAR_LENGTH('안녕하세요'); -- 15, 5

-- 공백 제거하기
SELECT TRIM(' HELLO '); -- HELLO

-- 특정 문자로 자리 채우기
SELECT LPAD('ABC', 5, '*'), RPAD('ABC', 5, '-'); -- **ABC, ABC--

-- 문자 교체하기
SELECT REPLACE('오늘은 월요일 입니다', '월요일 ', '수요일'); -- 오늘은 수요일입니다
 

/* 날짜함수 */
-- 현재날짜, 현재시간 출력하기
SELECT CURDATE(), CURTIME();

-- 현재날짜와 시간 출력하기
SELECT NOW(), SYSDATE();

-- 1월 1일 출력하기
SELECT DATE('2023-1-1'), DATE('2023-01-01');

-- 현재 날짜의 년도, 월, 일, 요일 출력하기
SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW()), DAYNAME(NOW());

-- 현재 시간의 시, 분, 초 출력하기
SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());

    
/* 그룹함수 */
-- 최소값, 최대값, 행의 개수, 합계, 평균 
SELECT MIN(PRICE),MAX(PRICE), COUNT(*), SUM(PRICE), AVG(PRICE) 
FROM GIFT; -- 10000, 70000, 7, 280000, 40000

-- 선물테이블에서 품목을 그룹으로 묶기
SELECT TYPE FROM GIFT
GROUP BY TYPE; -- 가전제품, 생활용품, 식품

-- 품목별 선물의 개수와 가격 합계 구하기 (최저가, 최고가, 개수, 합계, 평균가)
select TYPE, MIN(PRICE), MAX(PRICE), COUNT(*), SUM(PRICE), AVG(PRICE)
FROM GIFT
GROUP BY TYPE;

-- 품목별로 선물목록 구하기
select TYPE, GROUP_CONCAT(NAME) 
FROM GIFT
GROUP BY TYPE;


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












