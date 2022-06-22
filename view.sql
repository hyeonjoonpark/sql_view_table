--내장함수
select abs(-15) from dual; --절댓값
select ceil(15.4) from dual; --반올림or올림
select power(3,2) from dual; --(a,b) 일때 a의 b제곱
select round(15.4) from dual; --반올림
select concat('happy', 'birthday') from dual; --문자열 합치기
select lpad('page 1', 7, '*.') from dual; --lpad의 l은 left를 의미, 왼쪽부터 숫자만큼 채움
select ltrim('page 1', '') from dual; --왼쪽부터 입력단어에 입력문자열
select replace('jack', 'j', 'bl') from dual; --(a,b,c) 일때 b자리에 c대입
select rpad('page 1', 15, '*.') from dual; --rpad의 r은 right를 의미, 오른쪽부터 숫자만큼 채움
select rtrim('page 1', 'ge 1') from dual; --오른쪽 부터 입력단어 삭제
select substr('abcdefg', 3, 4) from dual; --입력숫자 중 , 앞에 숫자부터 , 뒤에 숫자 갯수만큼 출력
select ascii('A') from dual; --입력 문자 아스키코드 변환
select instr('corporate floor', 'or', 3, 2) from dual; --('문자열', a, b) 일때 a번째 이후 '문자열'이 b번째 나오는 시점 숫자
select sysdate from dual; --현재 날짜 출력
select nullif(123,345) from dual;  --123과 345가 같으면 null 출력 아니면 원래값 출력
select nvl(null, 123) from dual; --null을 대신하는 값

--view table
--보기 전용 테이블(가상의 테이블)
--특징 :  1. 수정불가(마치 기존테이블이 한글파일이라면 뷰테이블은 PDF)
        --2. 보완성이 우수하다
        --형식 create view 뷰이름
        
select *
from customer;
        
create view sc_book
as select *
    from book
    where bookname like'%축구%';

select *
from sc_book;

--문제 2. 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오
create view add_customer
as select *
    from customers
    where address like '%대한민국%';

insert into customer values(6, '이이경', '대한민국 부산', null);

--문제 3.
create view vw_customer
as select custid, concat(substr(name,1,1), concat('*', substr(name,3, 1))) as name, address, phone
    from customer;
    
select *
from vw_customer;
drop view vw_customer;