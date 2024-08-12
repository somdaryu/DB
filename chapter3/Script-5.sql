-- AUTO-INCREMENT 자동으로 숫자를 만들어주고 중복 X
-- CREATE table customer (
-- 	CUSTOMER_NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '회원번호',
-- 	NAME VARCHAR(20) NOT NULL COMMENT '이름',
-- 	ADDRESS VARCHAR(100) COMMENT '주소'
-- );
-- 

-- 회원테이블에 회원정보 추가

-- 1.입력할 컬럼을 표기
-- insert INTO CUSTOMER (NAME, ADDRESS) values ('둘리', '서울');

-- 2. 컬럼 생략
-- INSERT INTO CUSTOMER VALUES(2, '또치', '인천');

-- 회원 테이블에 불완전한 회원정보 추가
-- INSERT INTO CUSTOMER (NAME, ADDRESS) values ('도우너', NULL); -- 주소에 빈 값 입력

-- 여러 회원 정보 한번에 추가 (,)로 연결하면 됨
-- INSERT INTO CUSTOMER (NAME, ADDRESS) values ('고길동', '부산'),('마이콜', '부산');

-- PK가 중복되어 에러남
-- INSERT INTO CUSTOMER values (4, '고길동', '부산');

-- not null 제약사항을 어겨서 에러남
-- INSERT INTO CUSTOMER values (6, NULL, NULL);
