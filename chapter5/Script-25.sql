-- 테스트 테이블 생성
create table test_tbl (
	no int primary key comment '번호',
	content varchar(100) not null comment '내용'
);

-- 오토쿼리 설정 확인
select @@autocommit;
-- 1: true, 0: false

-- 오토커밋 off
set autocommit = 1;

insert into test_tbl values (1, '1번');
commit; -- 작업 결과를 실제로 반영

