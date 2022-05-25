-- bbs.sql
-- 답변 및 댓글형 게시판

-- 테이블 삭제
drop table tb_bbs;

-- 테이블 생성
create table tb_bbs(
  bbsno    number(5)       not null -- 일련번호 -99999~99999
 ,wname    varchar2(20)    not null -- 작성자
 ,subject  varchar2(100)   not null -- 글제목
 ,content  varchar2(2000)  not null -- 글내용
 ,passwd   varchar2(10)    not null -- 글비밀번호
 ,readcnt  number(5)       default 0 not null -- 글조회수
 ,regdt    date            default  sysdate   -- 글작성일
 ,grpno    number(5)       not null  -- 글 그룹번호
 ,indent   number(5)       default 0 -- 들여쓰기
 ,ansnum   number(5)       default 0 -- 글순서
 ,ip       varchar2(15)    not null  -- 글 IP
 ,primary key(bbsno)                 --bbsno 기본키 
);

-- 시퀀스 생성
create sequence bbs_seq;

-- 시퀀스 삭제
drop sequence bbs_seq;

-- 명령어 완료
commit;

/////////////////////////////////////////////////////

-- 새글쓰기
bbsno : 시퀀스를 이용한 일련번호
wname, subject, content, passwd : 사용자가 입력
readcnt, regdt, indent, ansnum : default 값
ip : 요청 PC의 IP 저장
grpno : max(bbsno)+1

-- 그룹번호(grpno) 만들기
select max(bbsno) from tb_bbs;
select max(bbsno)+1 from tb_bbs; -- null값이면 계산 안됨
select nvl(max(bbsno), 0) from tb_bbs; -- nvl()함수를 이용해서 max(bbsno)값이 비어있을때(null) 0으로 바꿈
select nvl(max(bbsno), 0)+1 from tb_bbs; -- nvl()함수를 이용해서 max(bbsno)값이 비어있을때(null) 0으로 바꾼 후 +1

-- 행추가
insert into tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno)
values(bbs_seq.nextval, ?, ?, ?, ?, ?, (select nvl(max(bbsno), 0)+1 from tb_bbs));

-- 전체목록
select bbsno, wname, subject, readcnt, regdt
from tb_bbs
order by grpno desc, ansnum asc;

-- 상세보기
select * from tb_bbs where bbsno=?

-- 조회수 증가
update tb_bbs set readcnt=readcnt+1 where bbsno=?

-- 행삭제
delete from tb_bbs where bbsno=? and passwd=?

-- 행수정
update tb_bbs set wname=?, subject=?, content=?, ip=?
where bbsno=? and passwd=?

////////////////////////////////////////////////////////////////////////

[답변쓰기 알고리즘]
- 새글 쓰기 : 최초의 부모글
- 답변 쓰기 : 자식글

- 그룹번호(group) : 부모글 그룹번호와 동일하게
- 들여쓰기(indent) : 부모글 들여쓰기 +1
- 글순서(ansnum) : 부모글 글순서 +1 한 후, 글순서 재조정

번호		제목			그룹번호 	들여쓰기 	글순서
1		제주도		1		0		0
2		서울시		2		0		0
		▶강남구		2		1		1
		▶▶논현동		2		2		2
		▶▶▶교보빌딩	2		3		3
		▶종로구		2		1		1->2->3->4
		▶▶관철동		2		2		5
		▶▶인사동		2		2		5->6
		▶마포구		2		1		2->3->4->5->6->7
3		부산시		3		0		0

- 글순서(ansnum) 재조정
update tb_bbs
set ansnum=ansnum+1
where grpno=2 and ansnum>=5

////////////////////////////////////////////////////////////

[검색]
-- 제목+내용 '별나무'가 있는지 검색
select * from tb_bbs
where subject like '%별나무%' or content like '%별나무%'

-- 제목 '별나무'가 있는지 검색
select * from tb_bbs
where subject like '%별나무%'

-- 내용 '별나무'가 있는지 검색
select * from tb_bbs
where content like '%별나무%'

-- 작성 '별나무'가 있는지 검색
select * from tb_bbs
where wname like '%별나무%'

///////////////////////////////////////////////////////////////
-- cmd에서 볼 사람 쓰기
-- 출력 줄수
set pagesize 100;

-- 한줄 출력 글자갯수
set linesize 100;

-- 칼럼길이 임시 조정
col wname for a10;

[페이징]
- rownum 줄번호 활용

1)
select wname, grpno, ansnum
from tb_bbs
order by grpno desc, ansnum asc;

2) rownum 추가 - 줄번호까지 정렬됨
select wname, grpno, ansnum
from tb_bbs
order by grpno desc, ansnum asc;

3) 1)의 SQL문을 셀프조인하고, rownum추가
select wname, grpno, ansnum, rownum
from (
	select wname, grpno, ansnum
	from tb_bbs
	order by grpno desc, ansnum asc
);

4) 줄번호 1~5조회 (1페이지)
select wname, grpno, ansnum, rownum
from (
	select wname, grpno, ansnum
	from tb_bbs
	order by grpno desc, ansnum asc
)
where rownum>=1 and rownum<=5;

5) 줄번호 6~10조회 (2페이지) -> 조회안됨. 선택된 레코드가 없습니다
select wname, grpno, ansnum, rownum
from (
	select wname, grpno, ansnum
	from tb_bbs
	order by grpno desc, ansnum asc
)
where rownum>=6 and rownum<=10;

6) 줄번호가 있는 3)의 테이블을 한번 더 셀프조인하고, rownum칼럼명을 rnum으로 바꾼다
select *
from (
	select wname, grpno, ansnum, rownum as rnum
	from (
		select wname, grpno, ansnum
		from tb_bbs
		order by grpno desc, ansnum asc
	)
)
where rnum>=6 and rnum<=10;

7) 페이징+검색
제목에서 '별나무'가 있는 행을 검색해서 2페이지(6행~10행)만 조회하시오
select *
from (
	select wname, grpno, ansnum, rownum as rnum
	from (
		select wname, grpno, ansnum
		from tb_bbs
		where subject like '%별나무%'
		order by grpno desc, ansnum asc
	)
)
where rnum>=6 and rnum<=10;













