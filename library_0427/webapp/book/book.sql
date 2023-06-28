alter table book add ofile varchar2(200);
alter table book add sfile varchar2(200);
alter table book add rentno varchar2(10);

select 'R' || LPAD(seq_대여.nextval,5,0) from dual;

SELECT * FROM BOOK WHERE NO = 3 AND (RENTNO IS NULL OR RENTNO='');

update book
set rentno='R00022'
where NO = 3 AND (RENTNO IS NULL OR RENTNO='');

update book
set rentno='R00022'
where NO = 3 AND (RENTNO IS NULL OR RENTNO='');

select * from 대여;
insert into 대여 values('R00022','아이디',3,'N',sysdate, NULL, SYSDATE+14, NULL);