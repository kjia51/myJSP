create sequence seq_board_num;
drop sequence seq_board_num;
drop table myfile;

create table myfile(
idx number primary key,
name varchar2(50) not null,
title varchar2(200) not null,
cate varchar2(30) not null,
ofile varchar2(100) not null,
sfile varchar2(30) not null,
postdate date default sysdate not null
);

comment on table myfile is '파일';
comment on column myfile.idx is '일련번호';
comment on column myfile.name is '작성자';
comment on column myfile.title is '제목';
comment on column myfile.cate is '카테고리';
comment on column myfile.ofile is '원본파일명';
comment on column myfile.sfile is '저장된파일명';
comment on column myfile.postdate is '등록한날짜';

insert into myfile values(seq_board_num,name,title,cate,ofile,sfile,postdate);
select * from myfile order by desc;
select * from myfile order by idx desc;
insert into myfile values(seq_board_num.nextval,'이름','제목1','카테고리','ofile','sfile',sysdate);
seq_board_num.nextval;

delete myfile;

select count(*) from board;