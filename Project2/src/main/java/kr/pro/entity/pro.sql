drop table board;

create table board(
	idx number not null,
	memId varchar2(50) not null,
	title varchar2(100) not null,
	content varchar(2000) not null,
	writer varchar2(30) not null,
	indate date default sysdate,
	count number default 0,
	primary key(idx));
	
drop sequence board_idx;
create sequence board_idx;

insert into board(idx, title, content, writer)
values(board_idx.nextval, '스프링게시판','스프링게시판','관리자');

insert into board(idx, title, content, writer)
values(board_idx.nextval, '스프링게시판','스프링게시판','이혜민');

select * from board;

drop table mem_tb1;

create table mem_tbl(
	memId varchar2(50) not null,
	memPwd varchar2(50) not null,
	memName varchar2(50) not null,
	primary key(memId)
);

insert into mem_tbl values('smhrd01','smhrd01','관리자');
insert into mem_tbl values('smhrd02','smhrd02','이혜민');
insert into mem_tbl values('smhrd03','smhrd03','가을노을');

select * from mem_tbl;

select * from u_info;

