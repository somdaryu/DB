-- 테스트 테이블 생성
-- CREATE TABLE TEST_TBL (
--     NO INT PRIMARY KEY COMMENT '번호',
--     CONTENT VARCHAR(100) NOT NULL COMMENT '내용'
-- );
-- 
-- 오토쿼리 설정 확인
select @@autocommit;

-- 오토커밋 off
SET AUTOCOMMIT = 0;

INSERT TEST_TBL VALUES (1, '1번');
COMMIT;

-- 오토커밋 on
SET AUTOCOMMIT = 1;

-- 트랜잭션 시작
START TRANSACTION;
INSERT TEST_TBL VALUES (2, '2번'); -- 아직까지는 db에 반영안됨
SELECT * FROM TEST_TBL; -- 실제 테이블에는 추가안됨
COMMIT; -- 트랜잭션을 db에 반영
-- commit 또는 rollback 하는 순간 트랜잭션 종료

-- 트랜잭션 시작
START TRANSACTION;
INSERT TEST_TBL VALUES (3, '3번'); -- 아직까지는 db에 반영안됨
SELECT * FROM TEST_TBL;
UPDATE TEST_TBL SET CONTENT = '수정' WHERE NO = 2;
SELECT * FROM TEST_TBL;
ROLLBACK; -- 트랜잭션 취소 (TRANSACTION 전 상태로 보국)
-- commit 또는 rollback 하는 순간 트랜잭션 종료


