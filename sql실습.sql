/*
실습코드

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );

SHOW USER;

SELECT * FROM EMP;

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

SELECT * FROM EMP;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

SELECT * FROM EMP; 
SELECT * FROM DEPT; -- 부서 테이블 
SELECT * FROM salgrade; -- 급여등급 테이블 

/*
SELECT [DISTINCT] {*, column [alias], . . .}
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]];
*/
--1. 사원 테이블에서 모든 데이터를 출력하세요.
-- 쿼리문은 대소문자를 구분하지 않아요

SELECT * FROM EMP; -- 앞에께 문제 생기면 뒤에 실행이 안됨

SELECT
*
FROM
EMP;

--2 특정 컬럼의 데이터 출력하기
SELECT EMPNO , ENAME , SAL FROM EMP;

--3 컬럼명에 가명칭(alias) 명칭 부여하기 "별칭"
SELECT EMPNO 사번, ENAME 이름
FROM EMP;

-- 더블컨테이션이 필요한 이유 
SELECT EMPNO "사  번", ENAME "이  름"
FROM EMP;

-- SQL표준 ANSI문법 
SELECT EMPNO AS "사 번" , ENAME AS "이  름"
FROM EMP;

-- Oracle 데이터 : 문자열 데이터는 대소문자를 엄격하게 구분한다.
-- 대문자 A , 소문자 a >> 다른문자 MSSQL은 같은거로 본다. 

-- WHERE 조건절 , 오라클에서 문자열 처리는 '문자열' 싱글 컨테이션 
SELECT * FROM EMP WHERE ENAME = 'king';   
SELECT * FROM EMP WHERE ENAME = 'KING';

-- DB
/*
    관리자 : 백업 , 복구 (관리) 계정
    개발자 : APP 통해서 CRUD (insert , select , update , delete ) + 관리자 조금 + 튜닝 조금 + 설계 조금 (취업반)
    튜너 : 하드웨어
          문장(SQL)
    설계 : PM (요구사항 분석 : ERD)      
*/
-- Oracle SQL(질의어) : 언어
--연산자( 결합연산자 ( || , 산술연산자 +)
-- java : + 숫자 (산술연산)
-- java : + 결합 (결합연산)
-- Tip ) ms-sql + 하나가 결합 , 산술

SELECT '사원의 이름은 ' || ENAME || ' 입니다' as "사원정보"
FROM EMP;

-- 컬럼은 타입 : 숫자 , 문자(열) , 날짜 ....
-- 한글 1자(2바이트) , 영문자(1바이트) , 특(1바이트) , 공백(1바이트) 
-- ename varchar2(10) >> 10바이트 >> 한글 5자 , 영문자 10자 
-- ename nvarchar2(10) >> n 유니코드 >>  한글 10자 , 영문자 10자 >> 10글자 >> 총 20바이트 >> 헌업에서 많이씀 


SELECT '사원의 이름은 '|| ENAME || '입니다.' AS 사원정보 FROM EMP; -- || 은 문자열의 결합 

-- EMPNO    NOT NULL NUMBER
-- ENAME             VARCHAR2(10) 
DESC EMP; -- 테이블 정보 보기
SELECT EMPNO || ENAME FROM EMP; -- 내부적으로 형변환(숫자 -> 문자) 결합 

-- + 연산자(산술)
SELECT EMPNO + ENAME FROM EMP;

-- 우리 회사 사장님이..
-- 우리 회사에 직종이 몇개나 있지
SELECT JOB FROM EMP;
-- 중복데이터 제거 : 키워드 : DISTINCT
SELECT DISTINCT JOB FROM EMP;

-- DISTINCT 원리 : GROUPING 

-- JOB으로 묶어서 
SELECT DISTINCT JOB , DEPTNO 
FROM EMP ORDER BY JOB;

SELECT DEISINCT DEPTNO , JOB
FROM EMP ORDER BY DEPTNO;

--Oracle 언어(연산자)
--java 거의 동일( + , -, * , / ) java : 나머지 % >> 오라클 (% 예약어 .... 나머지 어찌...)
--Oracle 함수 제공 (나머지 구하는 함수 : Mod() )

-- 사원테이블에서 사원의 급여가 100달러 인상된 결과를 출력하세요
SELECT SAL , SAL + 100 as "인상급여" 
FROM EMP;

SELECT 100 + 100 FROM DUAL; -- 200 임시 가상 테이블 
SELECT 100 || 100 FROM DUAL; -- '100100' 
SELECT '100' + 100 FROM DUAL; -- 200 
SELECT 'A100' + 100 FROM DUAL; -- 오류

--비교연산자
--<  >  <= 
--주의 사항 
--java 같다(==) 할당(=)
--Oracle 같다(=)  같지않다 (!=)
-- TIP) javascript (같다 (==) (===)

-- 논리 연산자 
-- AND , OR , NOT

/*          AND     OR
    0 0     0       0
    0 1     0       1
    1 0     0       1
    1 1     1       1
    
    
*/
-- 조건절
-- SELECT 3
-- FROM   1
-- WHERE  2

SELECT EMPNO , ENAME , SAL , HIREDATE
FROM EMP
WHERE SAL >= 3000;
 
 
 -- 사번이 7788번인 사원의 사번 , 이름 , 직종 , 입사일을 출력하세요
 
 SELECT EMPNO , ENAME , JOB , HIREDATE 
 FROM EMP
 WHERE EMPNO = 7788;

SELECT EMPNO || '와' || ENAME || '입니다.'  FROM EMP;

-- 조건2개 (2개의 조건이 참)
-- and , or
-- 급여가 2000달러 이상이면서 직종이 manager 인 사원의 모든 정보를 출력하세요 
SELECT * FROM EMP WHERE JOB = 'MANAGER' AND SAL >= 2000;

-------------------------------------------------------
-- 오라클 서버 날짜(DB서버)
-- 오라클 sysdate 
SELECT sysdate from dual; -- 오라클이 설치된 pc시간 

select * from nls_session_parameters; -- 접속한 사용자가 보는 환경세팅 정보 
-- NLS_DATE_FORMAT RR/MM/DD
-- NLS_TIME_FORMAT HH24:MI:SSXFF

-- 2021년 11월 22일 
ALTER SESSION SET nls_date_format='YYYY-MM-DD HH24:MI:SS'; -- 현재 접속 사용자 
-- 집에가서 노트북 다시 키고 날짜를 조회하면 ... 다시 .. NLS_DATE_FORMAT RR/MM/DD 보일꺼에요 

SELECT HIREDATE FROM EMP;

SELECT * FROM EMP WHERE HIREDATE = '1980-12-17'; -- 제일 무난하다 

SELECT * FROM EMP WHERE HIREDATE = '1980/12/17';

SELECT * FROM EMP WHERE HIREDATE = '1980.12.17';

SELECT * FROM EMP WHERE HIREDATE = '80-12-17'; -- YYYY-MM-DD (형식에 맞추어서)

-- 사원의 급여가 2000 달러 이상이고 4000 달러 이하인 모든 사원의 정보를 출력하세요 
SELECT * 
FROM EMP 
WHERE SAL >= 2000 AND SAL <= 4000;

-- 연산자 : 컬럼명 BETWEEN A AND B(=)
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 4000; -- BETWEEN A AND B 

-- -- 사원의 급여가 2000 달러 초과 4000 달러 미만 모든 사원의 정보를 출력하세요 
SELECT *
FROM EMP
WHERE SAL > 2000 AND SAL < 4000;

-- JOB 중복 제거하고  개수 
SELECT COUNT(DISTINCT JOB) FROM EMP; 

-- 부서번호가 10번 또는 20번 또는 30번 사원의 사번 , 이름 , 급여 , 부서번호 를 출력하세요  
SELECT EMPNO , ENAME , SAL , DEPTNO 
FROM EMP
WHERE DEPTNO 
IN (10,20,30);

-- 연산자( IN 연산자) 풀어쓰면 (조건 OR 조건 OR 조건 ....)
-- 부서번호가 10번 또는 20번 또는 30번이 아닌 사번의 사번, 이름 , 급여 ,부서번호를 출력하세요
SELECT EMPNO , ENAME , SAL , DEPTNO 
FROM EMP
WHERE DEPTNO 
NOT IN (10,20,30);

SELECT EMPNO , ENAME , SAL , DEPTNO
FROM EMP
WHERE DEPTNO != 10 AND DEPTNO != 20;

-- POINT : oracle 에서 값이 없다 (데이터 없다) >> null 문자
-- null 필요약 

-- 회원정보
-- class Member (private int empno;...)

CREATE TABLE MEMBER (
    userid NVARCHAR2(50) NOT NULL, -- 필수 입력 
    name NVARCHAR2(50) NOT NULL , -- 필수 입력
    hobby NVARCHAR2(30) -- 내부적으로 default null (값을 입력하지 않으면 자동으로 null을 가진다)  
);
DESC MEMBER;

INSERT INTO MEMBER(userid,hobby) values ('hong','농구'); -- ORA-01400: NULL을 ("BITUSER"."MEMBER"."NAME") 안에 삽입할 수 없습니다

INSERT INTO MEMBER(userid,name) values ('kim','길동이'); -- 자동으로 null 문자가 들어가서 데이터 없어요 표현

SELECT * FROM MEMBER;

INSERT INTO MEMBER(userid,name,hobby) values('park','아무개','잠자기');

SELECT * FROM MEMBER;

-- 수당(COMM)을 받지 않는 모든 사원의 정보를 출력하세요
--(0도 받지 않는 것인데 실습.. 0도 COMM 받는 것으로 포함)
SELECT * FROM EMP WHERE COMM IS NULL;

-- POINT : NULL 의 비교는 IS NULL , IS NOT NULL 

-- 수당(COMM)을 받는 모든 사원의 정보를 출력하세요
SELECT * FROM EMP WHERE COMM IS NOT NULL;

-- POINT
-- NULL 이란 녀석
-- 1. NULL 과의 모든 연산의 결과는 : NULL 
-- 2. 해결방법 : 함수 >> nvl 
-- TIP ) ms-sal > null > convert() 
-- TIP ) mysql > null > ifnull()

-- 사원 테이블에서 사번 , 이름 ,급여 , 수당 , 총급여(급여+수당) 을 출력하세요
SELECT EMPNO , ENAME , SAL , SAL + nvl(COMM , 0 ) AS "총급여" FROM EMP;

SELECT 1000 + null FROM DUAL;

SELECT 1000 + nvl(null,0) FROM DUAL;

SELECT 1000 + nvl(null,1111111) FROM DUAL;

-- 사원의 급여가 1000 이상이고 수당을 받지 않는 사원의 사번 , 이름 , 직종 , 급여 , 수당을 출력하세요 
SELECT EMPNO , ENAME , JOB , SAL , COMM  FROM EMP WHERE SAL >= 1000 AND COMM IS NULL ;

-- 문자열 검색
 
 -- 주소 검색 : 검색어 > 역삼 입력 > 역삼동 , 역삼역 , 역삼길길길 (LIKE 검색)
 -- 문자열 패턴 검색 (Like 연산자)
 -- 와일드 카드 문자 : l , %(모든것) , 2 
-- 2._(한문자) 같이 결합해서 검색
 -- 추가적 정규표현식 검색도 가능.
 -- select ename from emp
 -- where ename like '%A%';
--  select ename from emp
--  where ename like 'A%';
--  COMMIT;

--문자열검색
 -- like 연산자
 -- 문자열 패턴 검색
 -- 와일드카드 문자: 1.%(모든것), 2._(한문자) 같이 결합해서 검색
 -- 추가적 정규표현식 검색도 가능.
 select ename from emp
 where ename like '%A%';
 
select ename from emp
where ename like 'A%';
 
select ename from emp
where ename like '%LL%';

SELECT ENAME FROM EMP
WHERE ENAME LIKE '%_A%'; -- 첫글자는 어떤것이 와도 상관없고 두번째 글자는 반드시 A 시작 ....

select ename from emp
where ename like '%E';

select ename from emp
where ename like '김%';

-- REGEXP_LIKE 검색이 왔다
-- 활용 : 게시판 글 검색 , 이름 검색 , ..... 쇼핑몰 

SELECT ENAME FROM EMP
WHERE ENAME LIKE '%A%A%';

SELECT ENAME FROM EMP
WHERE ENAME LIKE '__O%'; -- 3번째 글자가 O

-- 데이터 정렬하기 
-- order by 컬럼명 : 문자 , 숫자 , 날짜 데이터 정렬 
-- 오름차순 : asc : 낮은순 (default)
-- 내림차순 : desc : 높은순

SELECT * FROM EMP
ORDER BY SAL; -- ASC 

-- 급여를 제일 많이 받는 순으로
SELECT * FROM EMP
ORDER BY SAL DESC;

-- 입사일이 가장 높은 순으로 정렬해서 사번, 이름 , 급여 , 입사일을 출력하세요
-- (가장 최근에 입사한 순으로)
SELECT EMPNO , ENAME , SAL , HIREDATE FROM EMP ORDER BY HIREDATE DESC;

SELECT EMPNO , ENAME 
FROM EMP
ORDER BY ENAME ASC;

/*
    실행순서 
    SELECT절 3
    FROM절   1
    WHERE절   2  
    ORDER BY절  4  
*/

-- 해석
-- EMP테이블에서 직업이 MANAGER 인 사람들의 
-- 사번 , 이름 , 연봉 , 직업 ,입사일을 입사일 최근 순으로 출력 
SELECT EMPNO , ENAME , SAL ,JOB , HIREDATE 
FROM EMP
WHERE JOB ='MANAGER'
ORDER BY HIREDATE DESC;

COMMIT;
