#날짜 : 2022/08/29
#이름 : 하선주
#내용 : SQL 연습문제1

#실습 1-1
create database `java2_Shop`;
create user 'java2_admin1'@'%' identified by '1234';
grant all privileges on `java2_shop`.* to 'java2_admin1'@'%';
flush privileges;

#실습 1-2
create table `Customer` (
	`uid`		varchar(10) primary key,
	`name`		varchar(10) not null,
	`hp`		varchar(13) default null unique,
	`addr`		varchar(100) default null,
	`rdate` 	date not null
);


create table `Product` (
	`prodNo`		int auto_increment primary key,
	`prodName`		varchar(10) not null,
	`stock`			int default 0,
	`price`			int default null,
	`company`		varchar(20) not null
);

create table `Order` (
	`orderNo`		int auto_increment primary key,
	`orderId`		varchar(10) not null,
	`orderProduct`	int not null,
	`orderCount`	int default 1,
	`orderDate`		datetime not null
);

#실습 1-3
insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', now());
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', now());
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도군 청산면', now());
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', now());
insert into `Customer` values ('c105', '이성계', default, default, now());
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', now());
insert into `Customer` values ('c107', '허준', default, default, now());
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', now());
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', now());
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', now());

insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('새우깡', '5000', '1500', '농심');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('초코파이', '2500', '2500', '오리온');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('포카칩', '3600', '1700', '오리온');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('양파링', '1250', '1800', '농심');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('죠리퐁', '2200', default, '크라운');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('마카렛트', '3500', '3500', '롯데');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('뿌셔뿌셔', '1650', '1200', '오뚜기');

insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', '3', '2', now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', '4', '1', now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c108', '1', '1', now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c109', '6', '5', now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', '2', '1', now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', '7', '3', now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c110', '1', '2', now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c104', '2', '4', now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', '1', '3', now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c107', '6', '1', now());

#실습 1-4
select * from `Customer`;

#실습 1-5
select `uid`, `name`, `hp` from `Customer`;

#실습 1-6
select * from `Product`;

#실습 1-7
select `company` from `Product`;

#실습 1-8
select `company` from `Product`;

#실습 1-9
select `prodName`, `price` from `Product`;

#실습 1-10
select `prodName`, `price` + 500 as `조정단가` from `Product`; 

#실습 1-11
select `prodName`, `stock`, `price` from `Product` where `company` = '오리온';

#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102';

#실습 1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102'
and `orderCount` >= 2;

#실습 1-14
select * from `Product` where `price` between 1000 and 2000;

#실습 1-15
select `uid`, `name`, `hp`, `addr` from `Customer` where `name` like '김%';

#실습 1-16
select `uid`, `name`, `hp`, `addr` from `Customer` where `name` like '__';

#실습 1-17
select * from `Customer` where `hp` = '+default()' ;

#실습 1-18
select * from `Customer` where `addr` != 'default()';

#실습 1-19
#실습 1-20
#실습 1-21
#실습 1-22
#실습 1-23
#실습 1-24
#실습 1-25
#실습 1-26
#실습 1-27
#실습 1-28
#실습 1-29
#실습 1-30