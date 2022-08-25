create table `TblUser`(
			`uid` 		varchar(10),
            `userName` 	varchar(10),
            `hp` 		char(13),
            `age` 		tinyint,
            `address` 	varchar(20)
);

create table `Tblproduct`  (
			`prdCode` 		int, 
            `prdName` 		varchar(10), 
            `prdPrice` 		int, 
            `prdAmount` 	int, 
            `prdCompany` 	varchar(10), 
            `prdMakeDate` 	date
);

insert into `TblUser` value ('p101', '김유신', '010-1234-1001', '25', '서울시 중구');
insert into `TblUser` value ('p102', '김춘추', '010-1234-1002', '23', '부산시 금정구');
insert into `TblUser` value ('p103', '장보고', '', '31', '경기도 광주군');
insert into `TblUser` value ('p104', '강감찬', '', '', '경남 창원시');
insert into `TblUser` value ('p105', '이순신', '010-1234-1005', '50', '');

insert into `Tblproduct` value ('1', '냉장고'	, '800', '10', 'LG', '2022-01-06');
insert into `Tblproduct` value ('2', '노트북'	, '800', '10', 'LG', '2022-01-06');
insert into `Tblproduct` value ('3', 'TV'	, '800', '10', 'LG', '2022-01-06');
insert into `Tblproduct` value ('4', '세탁기'	, '800', '10', 'LG', '2022-01-06');
insert into `Tblproduct` value ('5', '컴퓨터'	, '800', '10', 'LG', '2022-01-06');
insert into `Tblproduct` value ('6', '휴대폰'	, '800', '10', 'LG', '2022-01-06');
