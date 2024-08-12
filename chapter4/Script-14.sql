-- ************숫자함수

-- 반올림, 올림, 내림
SELECT ROUND(1.4), CEIL(1.4), FLOOR(1.4); -- 1, 2, 1

-- 목록 중에서 가장 큰 값, 가장 작은 값
SELECT GREATEST(1, 2, 3), LEAST(1, 2, 3);

-- 절대값
SELECT ABS(1), ABS(-1); -- 1, 1

-- 소수점자리 선택
SELECT TRUNCATE(1.2345, 2); -- 1.23 


-- ************논리함수

-- 컬럼이 null이면 ''으로 치환
SELECT NAME, IFNULL(ADDRESS, '없음') FROM CUSTOMER;

-- ************문자열함수

-- 대문자로 변환
SELECT UPPER('abc'); -- ABC

-- 소문자로 변환
select LOWER('ABC'); -- abc

-- 문자열 연결하기
SELECT CONCAT('ab', 'cd', 'e'); -- abcde

-- 문자열 자르기 (세번째 위치부터 끝까지, 3번째 위치부터 2글자)
SELECT SUBSTR('ABCDEFG', 3), SUBSTR('ABCDEFG', 3, 2); -- CDEFG, CD

-- 문자열 자르기 (왼쪽부터 3글자, 오른쪽부터 3글자)
select left ('ABCDEFG', 3), RIGHT('ABCDEFG', 3); -- ABC, EFG

-- 문자열 길이 구하기(바이트크기, 자리수)
select LENGTH('ABCDE'), CHAR_LENGTH('ABCDE'); -- 5, 5 

-- 문자열 길이 구하기(바이트크기, 자리수)
select LENGTH('안녕하세요'), CHAR_LENGTH('안녕하세요'); -- 15, 5 

-- 공백 제거하기
SELECT TRIM(' HELLO '); -- HELLO 

-- 특정 문자로 자리 채우기
SELECT LPAD('ABC', 5, '*'), RPAD('ABC', 5, '-'); -- **ABC, ABC--

-- 문자 교체하기
SELECT REPLACE ('오늘은 월요일 입니다', '월요일', '수요일'); -- 오늘은 수요일입니다.



-- ************그룹함수

SELECT TYPE from GIFT
group by `type` ; -- 가전제품, 생활용품, 식품

-- 최소값, 최대값, 행의개수, 합계, 평균

select 
	`type` ,
	MIN(PRICE), 
	MAX(PRICE), 
	COUNT(*),
	SUM(PRICE),
	AVG(PRICE) 
FROM GIFT
group by TYPE ; -- 품목별로 가격 계산하기
-- 10000, 70000, 7, 280000, 40000

SELECT TYPE , GROUP_CONCAT(NAME)
from GIFT group by TYPE ;


-- 연습문제

-- Q1
select
	ADDRESS as '지역',
	COUNT(*)
from
	CUSTOMER
group by
	ADDRESS ;

-- Q2
SELECT 
	ADDRESS,
	GROUP_CONCAT(NAME) 
FROM 
	CUSTOMER
group by
	ADDRESS ;


-- Q3
select
	IFNULL(PUBLISHER, '--') ,
	COUNT(*),
	IFNULL( SUM(PRICE), 0) 
FROM 
	BOOK
group by
	PUBLISHER ;

-- Q4
SELECT 
	CONCAT(SUBSTRING(PUB_DATE, 6, 2), '월'),
	COUNT(*) 
from
	BOOK
group by
	SUBSTRING(PUB_DATE, 6, 2);


SELECT 
	CONCAT(MONTH(PUB_DATE), '월'),
	count(*)
FROM 
	BOOK
group by
	MONTH(PUB_DATE);

-- Q5
select
	LAST_NAME,
	FIRST_NAME,
	CONCAT(LAST_NAME, FIRST_NAME) 
FROM 
	CONTACTS;

-- Q6
SELECT 
	LAST_NAME,
	COUNT(*) 
FROM 
	CONTACTS
group by
	LAST_NAME;

-- Q7
select
	`date` ,
	MOVIE_NAME ,
	COUNT(*) 
FROM 
	RESERVATION R 
group by
	`date`, 
	MOVIE_NAME ;

-- Q8

select
	CONCAT(left(seat_no, 1), '열')  as '자리',
	GROUP_CONCAT(user_name) as '명단'
from
	reservation
group by
	left(seat_no,1);

-- Q9

select
	CATEGORY ,
	MAX(PRICE) 
from
	PRODUCT 
group by
	CATEGORY
order by
		MAX(PRICE) desc;
	
-- Q10
	
select
	CATEGORY,
	GROUP_CONCAT(PRODUCT_NAME) as '제품리스트',
	SUM(PRICE) as '합계'
from
	PRODUCT
group by
	CATEGORY;

