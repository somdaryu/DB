-- 게시물 테이블 만들기
CREATE TABLE BOARD (
    BOARD_NO    INT AUTO_INCREMENT PRIMARY key,
    TITLE    	VARCHAR(200) NOT NULL,
    CONTENT 	VARCHAR(200)  
);

-- 레코드 개수 세기
select COUNT(*) from BOARD;

-- 인덱스에 따른 성능 차이 확인

-- PK인 게시물번호로 검색
select * from BOARD where BOARD_NO = 1;

-- 제목으로 검색
select * from BOARD where TITLE = 'Bus Stop';

-- 제목으로 인덱스 생성
CREATE INDEX INDEX_TITLE ON BOARD(TITLE);

-- 테이블에 걸려있는 인덱스 확인
show index from BOARD;

-- 다시 제목으로 검색하여 속도 확인
select * from BOARD where TITLE = 'Bus Stop';

-- 쿼리가 어떤 인덱스를 쓰는지 확인
explain 
select * from BOARD where TITLE = 'Bus Stop';

-- 인덱스 삭제
DROP INDEX INDEX_TITLE ON BOARD;
