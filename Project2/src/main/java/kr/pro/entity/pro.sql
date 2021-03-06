select * from u_info;
select * from c_info;
select * from s_info;
select * from p_info;
select * from i_info;
select * from r_info;


drop table p_info;

alter table 'p_info' add p_kind varchar2(500);

create table u_info(
	u_id varchar2(50) not null,
	u_pw varchar2(100) not null,
	u_nick varchar2(100) not null,
	u_pnum varchar2(300),
	u_add varchar2(300),
	u_num varchar2(500),
	primary key(u_id),
	unique(u_num));
	
create table c_info(
	u_num varchar2(500) not null,
	c_name varchar2(500) not null,
	c_add varchar2(500),
	c_pnum varchar2(500),
	c_data varchar2(3000),
	primary key(u_num),
	foreign key(u_num) references u_info(u_num)
);

create table s_info(
	s_idx number not null,
	u_id varchar2(50) not null,
	p_num number(10)not null,
	s_date date default sysdate,
	s_payment number(5),
	s_amount number(10) not null,
	s_price varchar2(1000) not null,
	primary key(s_idx),
	foreign key(u_id) references u_info(u_id)
);
create sequence s_info_idx;
commit
create table p_info(
	p_num number not null,
	u_num varchar2(500) not null,
	p_name varchar2(500) not null,
	p_grade varchar2(5),
	p_price varchar2(500) not null,
	p_data varchar2(1000),
	p_option varchar2(10),
	p_kind varchar2(500),
	p_weight varchar2(500),
	p_sweet varchar2(500),
	p_pack varchar2(500),
	primary key(p_num),
	foreign key(u_num) references u_info(u_num) 
);
create sequence p_info_p_num;

create table i_info(
	i_num number not null,
	p_num number not null,
	u_num varchar2(500) not null,
	i_idx varchar2(300),
	i_raw varchar2(1000),
	i_path varchar2(3000),
	i_save varchar2(3000),
	i_extension varchar2(500),
	i_size varchar2(1000),
	i_grade varchar2(5),
	primary key(i_num),
	foreign key(p_num) references p_info(p_num),
	foreign key(u_num) references u_info(u_num)
	 );
create sequence i_info_i_num;

create table r_info(
	r_num number not null,
	p_num number,
	r_writer varchar2(500),
	r_star number(5),
	r_review varchar2(3000),
	r_grade number(5),
	r_date date default sysdate);
	
create sequence r_info_r_num;

insert into i_info(i_num,i_path)
values(i_info_i_num.nextval, '/resources/css/ListImage/4.png');

insert into i_info(s_idx,u_id,p_num,s_amount,s_price)
values(s_info_idx.nextval,gaeul,167,1,1);

update s_info set s_payment='1' where p_num=167;

select p.p_name, p.p_num, i.i_num, i.i_save
		from p_info p, i_info i
		where p.p_num = i.p_num and p.u_num='1';
		
select * from p_info p, i_info i
		where p_kind like '%'||'??????'||'%';