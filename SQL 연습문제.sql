#날짜 : 2022/08/29
#이름 : 하선주
#내용 : SQL 연습문제1

#실습 1-1
create database `java2_Shop`;
create user 'java2_admin1'@'%' identified by '1234';
grant all privileges on `java2_shop`.* to 'java2_admin1'@'%';
flush privileges;


drop table `Customer`;
drop table `Product`;
drop table `Order`;
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
insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '20220101');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '20220102');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도군 청산면', '20220103');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '20220104');
insert into `Customer` values ('c105', '이성계', default, default, '20220105');
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '20220106');
insert into `Customer` values ('c107', '허준', default, default, '20220107');
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '20220108');
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '20220109');
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '20220110');

insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('새우깡', '5000', '1500', '농심');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('초코파이', '2500', '2500', '오리온');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('포카칩', '3600', '1700', '오리온');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('양파링', '1250', '1800', '농심');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('죠리퐁', '2200', default, '크라운');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('마카렛트', '3500', '3500', '롯데');
insert into `Product` (`prodName`, `stock`, `price`, `company`) values ('뿌셔뿌셔', '1650', '1200', '오뚜기');

insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', '3', '2', '2022/07/01 13:15:10');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', '4', '1', '2022/07/01 14:16:11');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c108', '1', '1', '2022/07/01 17:23:18');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c109', '6', '5', '2022/07/02 10:46:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', '2', '1', '2022/07/03 09:15:37');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', '7', '3', '2022/07/03 12:35:12');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c110', '1', '2', '2022/07/03 16:55:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c104', '2', '4', '2022/07/04 14:23:23');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', '1', '3', '2022/07/04 21:54:54');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c107', '6', '1', '2022/07/05 14:21:03');

#실습 1-4
select * from `Customer`;

#실습 1-5
select `uid`, `name`, `hp` from `Customer`;

#실습 1-6
select * from `Product`;

#실습 1-7
select `company` from `Product`;

#실습 1-8
select distinct `company` from `Product`;

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

#실습 1-17 <<<<
select * from `Customer` where `hp` is null;

#실습 1-18
select * from `Customer` where `addr` is not null;

#실습 1-19
select * from `Customer` order by `rdate` desc;

#실습 1-20 <<<<
select * from `Order` where `orderCount` >= 3 order by `orderCount` desc , `orderProduct` asc;

#실습 1-21
select avg(`price`) as `AVG(price)` from product;

#실습 1-22
select sum(`stock`) as `재고량 합계` from `Product` where `company` = '농심';

#실습 1-23
select count(`uid`) as `고객수` from `Customer`;

#실습 1-24
select count(distinct`company`) as `제조업체 수` from `Product`;

#실습 1-25
select `orderProduct` as ` 주문 상품번호`, sum(`orderCount`) as `총 주문수량` from
`Order` group by `OrderProduct` order by `orderProduct` asc;

#실습 1-26
select `company` as `제조업체`, count(*) AS `제품수`, max(`price`) as `최고가` from
`Product` group by `company`;

#실습 1-27
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from
`product` group by `company` having count(`company`) >= 2;

#실습 1-28
select `orderProduct`, `orderId`, sum(`orderCount`) as `총 주문수량` from `order`
group by `orderdate` order by `orderProduct` asc;

#실습 1-29
select a.`orderId`, b.`prodName` from `Order` as a
join `Product` as b
on a.`orderProduct` = b.`prodNo` 
where `orderId` = 'c102';

#실습 1-30 (like `2022/07/03%` , substr(`orderDate`, 1, 10) = '2022/07/03')
select `orderId`, `name`, `prodName`, `orderDate` from `Order` as a
join `Customer` as b
on a.`orderId` = b.`uid`
join `product` as c
on a.`orderProduct` = c.`prodNo`
where `orderDate` between '2022/07/03' and '2022/07/04';

