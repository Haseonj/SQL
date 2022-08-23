#날짜 : 2022/08/23
#이름 : 하선주
#내용 : 제2장 테이블 제약조건과 수정

#실습 2-1
create table  `User3`(
	`uid`	varchar(20) primary key,
	`name`	varchar(10),
	`hp`	char(13) Unique,
	`age`	tinyint
);

#실습 2-2
insert into `User3` values ('A101', '김유신', '010-1234-1001', '25');
insert into `Usre3` values ('A102', '김춘추', '010-1234-1002', '23');
insert into `User3` values ('A103', '장보고', '010-1234-1003', '33');
insert into `User3` values ('A104', '강감찬', '010-1234-1004', '43');
insert into `User3` values ('A105', '이순신', '010-1234-1005', '53');

#실습 2-3
create table `Useruser44` (
	`uid`	varchar(20) primary key,
	`name`	varchar(10),
	`hp` 	char(13) Unique,
	`age` 	tinyint
);

#실습 2-4
insert into `User4` values ('a101', '김유신', '010-1234-1001', '25');
insert into `User4` values ('a102', '김춘추', '010-1234-1002', '23');
insert into `User4` values ('a103', '장보고', '010-1234-1003', '33');
insert into `User4` values ('a104', '강감찬', '010-1234-1004', '43');
insert into `User4` values ('a105', '이순신', '010-1234-1005', '53');


#실습 2-5
create table `Parent` (
	`pid`	varchar(10) primary key,
	`name`	varchar(10),
	`hp`	char(13) unique


);
create table `Child` (
	`cid`	varchar(10) primary key,
	`name`	varchar(10),
	`hp`	char(13) unique,
 	`pid`	varchar(10)
    
    );



#실습 2-6
insert into `Parent` values ('p101', '이성계', '010-1234-1111');
insert into `Child` values ('c101', '이방원', '010-1234-1001', 'p101');

#실습 2-7
create table `User5` (
	`seq`		int primary key auto_increment,
    `name`		varchar(10),
	`gender`	tinyint,
	`age`		tinyint,
	`addr`		varchar(255)
);



#실습 2-8
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김유신', '1', '25', '김해시');
insert into `User5` set 
						`name` 		= '신사임당',
                        `gender` 	= '2',
                        `age` 		= '27',
                        `addr`		= '강릉시';

delete from `User5` where `name` = '김유신';

#실습 2-9 

create table `User6` (
	`name`		varchar(10) not null,
	`gender`	tinyint,
	`age`		tinyint default 1,
	`addr`		varchar(10)
);

#실습 2-10
insert into `User6` (`name`) values ('김유신');
insert into `User6` set 
						`name` = '김춘추', 
                        `addr` = '부산시';


#실습 2-11
delete from `User6`;

alter table `User6` add `hp` varchar(20); 
alter table `User6` add `birth` char(10) default '0000-00-00' after `name`;
alter table `User6` add `uid` varchar(10) primary key first;

insert into `User6` values ('a101', '김유신',  1,  25, '김해시');
insert into `User6` values ('a102', '김춘추',  1,  23, '경주시');

#실습 2-12
alter table `User6` modify `hp` char(13);
alter table `User6` modify `age` tinyint;

#실습 2-13
#실습 2-14
#실습 2-15
create table `User7` like `User6`;


#실습 2-16
insert into `User6` select * 