create table gift (
	no int primary key,
	name varchar(30),
	type varchar(30),
	price int
);

insert into gift values 
(1, '참치세트', '식품', 10000),
(2, '햄세트', '식품', 20000),
(3, '샴푸세트', '생활용품', 30000),
(4, '세차세트', '생활용품', 40000),
(5, '주방세트', '생활용품', 50000),
(6, '노트북', '가전제품', 60000),
(7, '벽걸이TV', '가전제품', 70000),
(8, '커피머신', '가전제품', 80000),
(9, '홍삼세트', '식품', 15000),
(10, '청소기', '가전제품', 90000);

create table contacts (
	last_name varchar(10),
	first_name varchar(30),
	email varchar(50),
	phone varchar(50)
);

insert into contacts values
('이', '서연', 'stone@naver.com', '010-2341-0000'),
('이', '시우', 'leaver@naver.com', null),
('김', '지호', 'shyla@gmail.com', '010-3171-4126'),
('김', '윤서', 'jeni@gmail.com', '010-8121-2341'),
('최', '수아', 'fern@gmail.com', null),
('이', '하린', 'harin@daum.com', '010-2234-5678'),
('김', '도윤', 'doyoon@gmail.com', '010-3345-6789'),
('최', '지우', 'jiwoo@daum.com', '010-3356-7890'),
('이', '서준', 'seojun@naver.com', '010-4567-8901'),
('김', '민서', 'minseo@daum.com', '010-5678-9012');

create table book (
	book_no int primary key,
	title varchar(50),
	publisher varchar(30),
	pub_date date,
	price int
);

insert into book values
(1, '역사1', '상상마당', '2023-01-01', 10000),
(2, '역사2', '상상마당', '2023-01-05', 20000),
(3, '스프링웹프로젝트', '한빛미디어', '2023-02-10', 40000),
(4, '자바프로그래밍', null, null, null),
(5, '데이터베이스 개론', '한빛미디어', '2023-01-15', 30000),
(6, '파이썬 프로그래밍', '길벗', '2023-01-25', 35000),
(7, '자바의 정석', '상상마당', '2023-02-10', 45000),
(8, '웹 개발자 길라잡이', '한빛미디어', '2023-02-20', 28000),
(9, '알고리즘 문제 해결 전략', '길벗', '2023-03-05', 50000),
(10, '머신러닝 입문', '상상마당', '2023-03-15', 55000);

select `type` , count(*) from gift
where no > 3
group by type
having count(*) > 3;

select publisher, sum(price) from book 
where pub_date > '2023-01-20'
group by publisher
having sum(price) between 50000 and 90000;

select publisher, round(avg(price)), min(price) from book 
group by publisher 
having avg(price) <= 35000 and min(price) >= 20000;

select publisher, count(*), sum(price) from book
group by publisher
having count(*) >= 3 and sum(price) >= 70000 ;

select publisher, max(price) from book
where pub_date >= '2023-02-01' or pub_date = null 
group by publisher 
having max(price) >= 50000;

select last_name, count(*) from contacts 
where email like '%gmail%' and phone is not null 
having count(*)  > 2;




