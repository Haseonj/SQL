#날짜 : 2022/08/30
#이름 : 하선주
#내용 : SQL 연습문제2

# 실습 2-1
create database `java2_Bank`;
create user 'java2_admin2'@'%' identified by '1234';
grant all privileges on `java2_Bank`.* to 'java2_admin2'@'%';
flush privileges;

drop table `bank_customer`;
drop table `bank_account`;
drop table `bank_transaction`;

# 실습 2-2
create table `bank_customer` (
	`c_no`			varchar(14) primary key not null,
	`c_name`		varchar(20) not null,
	`c_dist`		int default 0,
	`c_phone`		varchar(20) not null,
	`c_addr`		varchar(100) default null
);

create table `bank_account` (
	`a_no`			varchar(11) primary key default '000-00-0000',
	`a_item_dist`	varchar(2) not null,
	`a_item_name`	varchar(20) not null,
	`a_c_no`		varchar(14) not null,
	`a_balance`		int default 0,
	`a_open_date`	date not null
);

create table `bank_transaction` (
	`t_no`			int auto_increment primary key,
	`t_a_no`		varchar(11) not null,
	`t_dist`		int not null,
	`t_amount`		int default null,
	`t_datetime`	datetime default now()
);


# 실습 2-3
insert into `bank_customer` values ('102-22-51094', '부산의원', '2', '051-518-1010', '부산시 남구');
insert into `bank_customer` values ('220-82-52237', '(주)한국전산', '2', '02-134-1045', '서울시 강서구');
insert into `bank_customer` values ('361-22-42687', '(주)정보산업', '2', '031-563-1253', '경기도 광명시');
insert into `bank_customer` values ('730423-1000001', '김유신', '1', '010-1234-1001', '경기도 수원시');
insert into `bank_customer` values ('750210-1000002', '김춘추', '1', '010-1234-1002', '경기도 광주시');
insert into `bank_customer` values ('830513-2000003', '선덕여왕', '1', '010-1234-1003', '서울시 마포구');
insert into `bank_customer` values ('870830-1000004', '강감찬', '1', '010-1234-1004', '서울시 영등포구');
insert into `bank_customer` values ('910912-2000005', '신사임당', '1', '010-1234-1005', '강원도 강릉시');
insert into `bank_customer` values ('941127-1000006', '이순신', '1', '010-1234-1006', '부산시 영도구');

insert into `bank_account` values ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', '420000', '20050721');
insert into `bank_account` values ('101-11-1003', 'S1', '자유저축예금', '870830-1000004', '53000', '20070217');
insert into `bank_account` values ('101-11-2001', 'S1', '자유저축예금', '220-82-52237', '23000000', '20030414');
insert into `bank_account` values ('101-11-2002', 'S1', '자유저축예금', '361-22-42687', '4201000', '20081230');
insert into `bank_account` values ('101-11-2003', 'S1', '자유저축예금', '102-22-51094', '8325010', '20100607');
insert into `bank_account` values ('101-12-1002', 'S2', '정기정립예금', '830513-2000003', '1020000', '20110513');
insert into `bank_account` values ('101-13-1005', 'S3', '주택청약예금', '941127-1000006', '720800', '20121015');
insert into `bank_account` values ('101-21-1004', 'L1', '고객신용대출', '910912-2000005', '1200500', '20090825');
insert into `bank_account` values ('101-22-1006', 'L2', '예금담보대출', '730423-1000001', '25000', '20131211');
insert into `bank_account` values ('101-23-1007', 'L3', '주택담보대출', '750210-1000002', '2700000', '20200923');

insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-11-1001', '1', '50000');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-11-1003', '2', '120000');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-11-2001', '2', '300000');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-12-1002', '1', '1000000');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-11-1001', '3', '0');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-13-1005', '1', '200000');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-11-1001', '1', '450000');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-11-2002', '2', '32000');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-11-2003', '3', '0');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`) values ('101-11-1003', '1', '75000');

# 실습 2-4
select * from `bank_account`;

# 실습 2-5
select * from `bank_customer`;

# 실습 2-6
select * from `bank_transaction`;

# 실습 2-7
select `c_name`, `c_no` from `bank_customer`;

# 실습 2-8
select `a_item_dist`, `a_item_name` from `bank_account`;

# 실습 2-9
select distinct `a_item_dist`, `a_item_name` from `bank_account`;

# 실습 2-10
select * from `bank_account` where `a_item_name` like '자유저축예금' and `a_balance` >= 1000000;

# 실습 2-11
select * from `bank_customer` where `c_addr` like '경기도 %';

# 실습 2-12
select * from `bank_customer` where `c_dist`= '2';

# 실습 2-13
select * from `bank_transaction` where `t_dist` = '1';

# 실습 2-14
select * from `bank_transaction` where `t_dist` = '2' order by `t_amount` desc;

# 실습 2-15
select
	sum(`t_amount`) as `입금총합`,
	avg(`t_amount`) as `입금평균`
from `bank_transaction`
where `t_dist` = 1;

# 실습 2-16
select 
	max(`t_amount`) as `큰 금액`,
    min(`t_amount`) as `작은 금액`
from `bank_transaction`
where `t_dist` = 2;

# 실습 2-17
select * from `bank_account` where `a_item_name` like '자유저축예금' order by `a_balance` desc;

# 실습 2-18 <<<<
select * from `bank_account` where `a_item_name` like '자유저축예금'
order by `a_balance`;

# 실습 2-19
select * from `bank_transaction` where `t_amount`
order by `t_dist`, `t_amount` desc;

# 실습 2-20
select 
	count(case when `t_dist` = 1 then 1 end) as `입금 건수`,
    count(case when `t_dist` = 2 then 1 end) as `출금 건수`,
	count(case when `t_dist` = 3 then 1 end) as `조회 건수`
from `bank_transaction`;
    
# 실습 2-21
select 
	`t_dist`,
    case
		when `t_dist` = 1
        then `입금`
		when `t_dist` = 2
        then `출금`
		when `t_dist` = 3
        then `조회`
	End as `type`,
    `t_a_no`,
    `t_amount`
from `bank_transaction`;
        
        
        
        

# 실습 2-22
# 실습 2-23
# 실습 2-24
# 실습 2-25
# 실습 2-26
# 실습 2-27
# 실습 2-28
# 실습 2-29
# 실습 2-30