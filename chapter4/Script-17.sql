-- 테이블 반정규화
-- 내용이 중복되더라도 테이블을 하나로 만드는 것
-- 장점: 조회가 편함
-- 단점: DB용량이 늘어남

create table temp (
	 theater_no int comment '상영관번호',
	 location varchar(100) comment '위치',
	 tel varchar(50) comment '전화번호',
	 movie_name varchar(20) comment '영화명'
);

insert into temp values
(1, '송도점', '032-111-1111', '슬램덩크'),
(1, '송도점', '032-111-1111', '교섭'),
(2, '구월점', '032-222-2222', '슬램덩크'),
(2, '구월점', '032-222-2222', '아바타2'),
(2, '구월점', '032-222-2222', '영웅');



create table store1 (
	product varchar(20),
	price int
);

insert into store1 values
('소주', 4000),
('맥주', 5000),
('와인', 20000);

create table store2 (
	product varchar(20),
	price int
);

insert into store2 values
('소주', 4000),
('맥주', 5000),
('위스키', 50000);

-- UNION 아래쪽으로 합침 테이블의 구조가 동일할때만 합칠 수 있다
select *
from store1
-- union all
select *
from store2 ;

-- 중복을 제거하고 두 슈퍼의 제품을 모두 가져오기
select *
from store1 
-- union
select *
from store2 ;

-- desc 테이블 명세서를 볼때 사용
desc product ;

-- Q1

select t1.BOOK_NO , concat('(책)',t1.TITLE)  , ifnull( t1.PRICE, 0)
from book t1
union all
select t2.product_no , concat('(과자)', t2.product_name) , t2.price 
from product t2
where t2.category = '과자';

