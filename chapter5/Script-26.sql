-- 트랜잭션 수동으로 시작
start transaction;

insert test_tbl values (2, '2번');

select * from test_tbl ; -- 실제 테이블에는 반영 안됨

commit; -- 실제 테이블에 반영

-- commit 또는 rollback 하는 순간 트랜잭션 종료

-- 트랜잭션 다시 시작
start transaction;
insert test_tbl values (3, '3번');
update test_tbl set content = '수정' where no = 2;
select * from test_tbl ;
rollback; -- 트랜잭션 취소