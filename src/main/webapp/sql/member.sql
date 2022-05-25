-- member.sql

drop table member;

CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨.
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 12345
address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- 가입일    
    PRIMARY KEY (id)
);

-- 회원등급
A1: 관리자
B1: 중간 관리자
C1: 우수 사용자
D1: 일반 사용자 (기본)
E1: 비회원
F1: 탈퇴한 회원

commit;

-- 행추가
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('webmaster', '12341234', '웹마스터', '123-4567', 'web@sol.com'
     , '12345', '서울시 종로구 관철동', '별빌딩8층', 'A02', 'A1', sysdate );
     
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('solnamu', '12341234', '웹마스터', '123-4567', 'sol@sol.com'
     , '12345', '서울시 종로구 관철동', '별빌딩8층', 'A02', 'D1', sysdate );
     
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('user1', '12341234', '웹마스터', '123-4567', 'user1@soldesk.com'
     , '12345', '서울시 종로구 관철동', '별빌딩8층', 'A02', 'F1', sysdate );
     
     
-- 로그인
-- 아이디와 비번이 일치하면 회원등급 가져오기 (단, 비회원(E1)과 탈퇴회원(F1)은 제외
select mlevel
from member
where id='' and passwd='' and mlevel in ('A1', 'B1', 'C1', 'D1');
     
     
-- 아이디 중복 확인
select count(id)
from member
where id=?;


-- 회원가입
insert into member(id, passwd, mname, tel, eamil, zipcode, address1, address2, job, mlevel, mdate)
values(?,?,?,?,?,?,?,?,?, 'D1', sysdate)

-- 회원수정
update member
set passwd=?, mname=?, tel=?, email=?, zipcode=?, address1=?, address2=?, job=?
where id=?	(id는 현재 로그인 되어 있는 세션변수 s_id);

-- 회원탈퇴
update member
set mlevel='F1'
where id=? and passwd=?
(id:세션변수 s_id, passwd:입력받는 값)
     
     
-- 아이디/비번 찾기
1) 이름과 이메일 일치하면
select id
from member
where mname=? and email=?

2) 임시 비밀번호를 발급해서 테이블 수정하고, 아이디와 임시비밀번호를 메일로 전송하기
update member
set passwd=?
where mname=? and email=?

-- 아이디/비번찾기 연습용 데이터 행추가 (확인 가능한 이메일 주소 정확히 적어주세요)
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('namumu', '12341234', '나무', '123-4567', 'younghy96@daum.net'
     , '12345', '서울시 종로구 관철동', '별빌딩8층', 'A02', 'A1', sysdate );
     
     
-- 회원 정보 수정
-- 1) 수정하고자 하는 행을 가져오기 -> read()함수
select mname,tel, email, zipcode, address1, address2, job
from member
where id=?
     
-- 2) 새로 입력한 값으로 행 수정하기 -> modifyProc() 함수
update member
set passwd=?, mname=?, tel=?, email=?, zipcode=?, address1=?, address2=?, job=?
where id=?
     
     
     
