-- 패턴 연산자

-- 이름이 '둘'로 시작하는 회원 가져오기
SELECT * FROM CUSTOMER C 
WHERE NAME LIKE '둘%'; -- 둘 or 둘리

-- 이름이 '길'이 포함된 회원 가져오기
 SELECT * FROM CUSTOMER C 
 WHERE NAME LIKE '%길%'; -- 고길동 or 고길 or 길동
 
-- 이름이 '치'로 끝나는 회원 가져오기
 SELECT * FROM CUSTOMER C 
 WHERE NAME LIKE '%치'; -- 또치 or 치
 
 -- 빈값 체크 연산자. 주소가 없는 회원을 조회
 SELECT * FROM  CUSTOMER C 
 WHERE ADDRESS IS NULL ;
 
 -- 주소가 있는 회원 조회
 SELECT * FROM  CUSTOMER C 
 WHERE ADDRESS IS not NULL ;
 

 SELECT * FROM BOOK B 
 WHERE TITLE = '역사1' AND PUB_DATE = '2023-01-01';
 
SELECT * FROM BOOK B 
 where PRICE >= 20000 AND PUBLISHER IS NOT NULL;
 
SELECT * FROM CONTACTS C 
WHERE PHONE LIKE ('%4126');

SELECT * FROM CONTACTS C 
WHERE PHONE LIKE ('%2341%') AND LAST_NAME = '김';

SELECT * FROM CONTACTS C 
where EMAIL LIKE ('%naver%') AND PHONE IS NULL ;

SELECT * FROM  GIFT G 
WHERE NAME LIKE ('%용품%');

SELECT * FROM  GIFT G 
WHERE NAME LIKE ('%세트') AND PRICE <= 20000;

SELECT * FROM RESERVATION R 
WHERE SEAT_NO like('A%') AND MOVIE_NAME = '아바타';

SELECT * FROM RESERVATION R 
WHERE SEAT_NO like('B%');

