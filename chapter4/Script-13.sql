CREATE table BOOK (
	BOOK_NO INT AUTO_INCREMENT primary key COMMENT '도서번호',
	TITLE VARCHAR(30) not null COMMENT '제목',
	PUBLISHER VARCHAR(100) COMMENT '출판사',
	PUB_DATE DATE COMMENT '출간일',
	PRICE INT COMMENT '가격'
);

INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PUB_DATE, PRICE) 
values
(1, '역사1', '상상마당', '2023-01-01', 10000), 
(2, '역사2', '상상마당', '2023-01-02', 20000),
(3, '스프링웹프로젝트', '한빛미디어', '2023-02-01', 40000),
(4, '자바프로그래밍', null, null, null);

CREATE table contacts (
	LAST_NAME VARCHAR(255) not null COMMENT '성',
	FIRST_NAME VARCHAR(255) not null COMMENT '이름',
	EMAIL VARCHAR(255) not null COMMENT '이메일',
	PHONE VARCHAR(20) COMMENT '연락처'
);

INSERT INTO CONTACTS 
values
('이', '서연', 'stone@naver.com', '032-2341-0000'),
('이', '시우', 'laver@naver.com', null),
('김', '지호', 'shyla@gmail.com', '010-3171-4126'),
('김', '윤서', 'jeni@gmail.com', '010-8121-2341'),
('최', '수아', 'fern@gmail.com', null);

CREATE table reservation (
	movie_name varchar(20) not null comment '영화명',
	user_name varchar(20) not null comment '예약자명',
	seat_no varchar(5) comment '자리번호',
	date date comment '예약일'
);

INSERT INTO RESERVATION 
values
('아바타', '둘리', 'A1','2024-04-20'),
('아바타', '또치', 'A2','2024-04-20'),
('아바타', '도우너', 'B1','2024-04-21'),
('슬램덩크', '짱구', 'A2','2024-04-20'),
('영웅', '고길동', 'B3','2024-04-21');


CREATE table product (
	product_no int primary key comment '제품번호',
	product_name varchar(20) comment '제품명',
	price int comment '가격',
	category varchar(10) comment '카테고리(과자, 음료, 주류)'
);

INSERT INTO PRODUCT 
values
(1,'허니버터칩',2300,'과자'),
(2,'새우깡',1100,'과자'),
(3,'코카콜라',1000,'음료'),
(4,'아침에주스',4900,'음료'),
(5,'처음처럼',3000,'주류'),
(6,'참이슬',2500,'주류');



CREATE table gift (
	name varchar(20) comment '상품명',
	type varchar(20) comment '품목',
	price int comment '가격'
);


INSERT INTO GIFT 
values
('참치세트', '식품', 10000),
('햄세트', '식품', 20000),
('샴푸세트', '생활용품', 30000),
('세차용품', '생활용품', 40000),
('주방용품', '생활용품', 50000),
('노트북', '가전제품', 60000),
('벽걸이TV', '가전제품', 70000);
