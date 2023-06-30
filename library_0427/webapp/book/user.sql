create table userlist(
no number,
id varchar2(30),
name varchar2(30),
adminyn varchar2(1)
);
drop table userlist;
drop sequence seq_user_no;

insert into userlist values(seq_user_no.nextval, 'momo2', '하니2', 'N');
insert into userlist values(seq_user_no.nextval, 'momo1', '하니1', 'N');
insert into userlist values(seq_user_no.nextval, 'momo', '하니', 'N');
insert into userlist values(seq_user_no.nextval, 'user', '나예리', 'N');
insert into userlist values(seq_user_no.nextval, 'admin', '관리자', 'N');

create sequence seq_user_no
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
select * from userlist where id='admin';

insert into userlist values (seq_user_no.nextval, 'user', '사용자', 'N'); 

select * from (select t.*, rownum rn from(select * from userlist order by no) t) order by rn desc;