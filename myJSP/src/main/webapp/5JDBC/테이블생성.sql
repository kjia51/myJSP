select to_char(sysdate,'YYYY-MM-DD') TODAY from dual;

select * from member where id='USER01' and pass='1234';

insert into member values('admin','1234','관리자',sysdate);

insert into member values('user02','1234','동원',sysdate);