select to_char(sysdate,'YYYY-MM-DD') TODAY from dual;

select * from member where id='USER01' and pass='1234';

insert into member values('admin','1234','관리자',sysdate);

insert into member values('user02','1234','동원',sysdate);

select * from (
    select t.* , rownum rn from(
    select board.*
    from board 
    order by num desc
    )t
    )
where rn between 1 and 10;

select seq_board_num.nextval, '제목', '내용', 'user02', sysdate, 0 from board;