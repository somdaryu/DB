-- 범위 연산자

-- 회원테이블에서 회원번호가 2와 4사이인 회원 조회
select
	*
from
	CUSTOMER C
where
	CUSTOMER_NO between 2 and 4; -- 시작값, 마지막값

	
--	customer_no = 1 or customer_no = 2 or customer_no = 4와 같다
select
	*
from
	CUSTOMER C
where
	CUSTOMER_NO in(1, 2, 4);


-- 회원번호가 1,2,4인 회원을 제외하고 가져오기
select * from CUSTOMER C where CUSTOMER_NO NOT in(1, 2, 4);
	

select
	*
from BOOK B 
WHERE 
PUBLISHER IN('상상마당', '한빛미디어') ;

select
	*
from BOOK B 
WHERE 
PRICE BETWEEN 10000 and 30000;


SELECT * FROM GIFT G 
WHERE PRICE BETWEEN 30000 AND 60000;

SELECT * FROM GIFT G 
WHERE TYPE IN ('식품', '생활용품');

SELECT * FROM GIFT G 
WHERE PRICE IN (10000, 30000, 40000);

SELECT * FROM RESERVATION R
WHERE MOVIE_NAME IN ('슬램덩크', '영웅');

SELECT * FROM RESERVATION R
where SEAT_NO IN ('A1', 'B1') AND `date` = '2024-04-20';

SELECT * FROM PRODUCT P 
WHERE PRICE BETWEEN 2000 and 3000;

SELECT * FROM PRODUCT P 
where CATEGORY  IN ('음료', '주류') and PRICE <= 3000;