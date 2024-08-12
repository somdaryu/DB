create table board (
	board_no int primary key auto_increment,
	title varchar(200) not null,
	content varchar(200)
);

select count(*) from board ;


-- pk인 게시물번호로 검색
select * from board where board_no  = 1;

-- 제목으로 검색
select * from board where title = 'Bus Stop';


-- 제목으로 인덱스 생성
create index index_title on board(title);

-- 테이블에 걸려있는 인덱스 확인
show index from board ;


-- 쿼리가 어떤 인덱스를 쓰는지 확인
explain
select * from board where title = 'Bus Stop';

-- 인덱스의 장점 : 조회속도가 빨라짐
-- 인덱스의 단점 : 추가, 수정 속도가 느려짐

-- 조회가 자주일어나는 테이블에 사용할 것
-- 반대로, 추가가 자주 일어나는 테이블에는 사용하지 말 것

-- 인덱스 삭제
drop index index_title on board;

