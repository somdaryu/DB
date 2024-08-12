-- 회원번호를 기준으로 순정렬
SELECT * FROM CUSTOMER C
order by CUSTOMER_NO ;

-- 회원번호를 기준으로 역정렬
SELECT * FROM CUSTOMER C
order by CUSTOMER_NO desc;

-- 주소를 기준으로 정렬
SELECT * FROM  CUSTOMER C 
order by ADDRESS  ASC ; -- 숫자, 문자, 날짜 ok

-- 주소와 이름으로 정렬
SELECT * FROM  CUSTOMER C 
order by ADDRESS  ASC , NAME DESC ;

-- 테이블에서 특정개수만큼만 조회하기
SELECT * FROM CUSTOMER C limit 2;

-- 컬럼에 별명 붙이기
select CUSTOMER_NO as code FROM CUSTOMER C ;

-- 한글도 ok
select CUSTOMER_NO as '회원의 번호' FROM CUSTOMER C ;

-- 별명은 자바프로그램에서 클래스 이름과 매칭시키는 경우
-- 또는 엑셀로 출력하는 경우에 사용한다



