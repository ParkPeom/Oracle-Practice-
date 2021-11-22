-- 문자열 덧셈 함수 CONCAT
SELECT CONCAT('홍','길동') FROM DUAL;
-- 문자열 연산
SELECT 3 + '4' FROM DUAL;
SELECT 3 + '4A' FROM DUAL;
SELECT 3 || '4' FROM DUAL;

-- 문자열 트림 함수 빈공간을 없앤다.
SELECT LTRIM( ' HELLO ') FROM DUAL; -- 왼쪽 공백 없앰
SELECT RTRIM( ' HELLO ') FROM DUAL; -- 오른쪽 공백 없앰
SELECT TRIM( ' HELLO ') FROM DUAL; -- 양쪽 공백 없앰

-- 문자열 소문자 또는 대문자로 변경하기
SELECT LOWER('NeWIEC') FROM DUAL; -- 모두 소문자로
SELECT UPPER('newLoc') FROM DUAL; -- 모두 대문자로 

-- 회원의 아이디가 'newlec'인 회원을 조회하시오 (단 대/소문자를 가리지 않는다)

SELECT * FROM MEMBER WHERE UPPER(ID) = UPPER('newlec'); -- 대소문자를 가리지 않고 검색 한다.

SELECT * FROM MEMBER;

-- 문자열 대치 함수 REPLACE(문자열,찾는 문자열, 대치할 문자열) / TRANSLATE()
SELECT REPLACE('WHERE WE ARE','WE','YOU') FROM DUAL; -- WE가 통쨰로 바뀜
SELECT TRANSLATE('WHERE WE ARE','WE','YOU') FROM DUAL; -- W는 Y로 바꾸고 E는 O 로 U는 아무의미없음

-- 회원의 이름과 주소를 조회하시오 (단 , 주소는 빈칸 없이 출력하시오)

SELECT NAME , REPLACE(REGDATE,' ','') FROM MEMBER; 

-- 문자열 패딩 함수
SELECT LPAD('HELLO',5) FROM DUAL;
SELECT LPAD('HELLO',5,'0') FROM DUAL;
SELECT LPAD('HELLO',10,'0') FROM DUAL;
SELECT RPAD('HELLO',10,'0') FROM DUAL;

-- 반드시 3글자 맥시멈으로 고정시켜서 3글자가 안되면 오른쪽에 0을 추가 
-- 한글은 *2배의 길이를 맥시멈으로 사용한다.
SELECT RPAD(NAME,6,'0') FROM MEMBER;

-- 첫글자를 대문자로 바꾸는 함수 INITCAP(문자열)
SELECT INITCAP('the...') FROM DUAL;
SELECT INITCAP('the most important thing is ...') FROM DUAL;
SELECT INITCAP('the most im하이tant t오케이hing is ...') FROM DUAL;

-- 문자열 검색 함수 INSTR (문자열,검색문자열,위치,찾을수)
SELECT INSTR('ALL WE NEED TO IS JUST TO...','TO') FROM DUAL; -- 그문자가 존재하는 문자 위치 반환
SELECT INSTR('ALL WE NEED TO IS JUST TO...','TO',15) FROM DUAL; -- 2번째 TO 찾고싶으면 15번째부터 찾으려고함 
                                                                -- 1번째는 건너 뛴다.

SELECT INSRT('ALL WE NEED TO IS JUST TO...','TO',1,2) FROM DUAL; -- 1번째 문자 부터 뒤지는데 2번째 위치를 달라                                                    

SELECT INSTR('ALL WE NEED TO IS JUST TO...','TO') FROM DUAL; -- 첫번째 TO 13번째 
SELECT INSTR('ALL WE NEED TO IS JUST TO...','TO',15) FROM DUAL; -- 두번째 TO 24번째

-- 회원의 전화번호에서 두 번째 대시(-)문자가 존재하는 위치를 출력
SELECT INSTR(PHONE,'-',1,2) FROM MEMBER;
SELECT * FROM MEMBER;

-- 회원의 전화번호에서 첫 번째 대시(-)문자와 두 번째 대시(-) 문자가 사이의 간격은 
SELECT INSTR(PHONE,'-',1,2) - INSTR(PHONE,'-',1,1)-1 FROM MEMBER;

-- 회원의 전화번호에서 첫 번째와 두 번째 사이의 국번(뒷자리)을 출력
SELECT SUBSTR(PHONE,1,3) FROM MEMBER;

SELECT SUBSTR(PHONE,5,INSTR(PHONE,'-',1,2)-INSTR(PHONE,'-',1,1)-1) FROM MEMBER;

-- 문자열 길이를 얻는 함수
SELECT LENGTH('WHERE WE ARE') FROM MEMBER;

-- 모든 회원의 핸드폰 번호와 번호의 문자열 길이를 조회하시오
SELECT NAME  , PHONE , LENGTH(PHONE) AS "번호의 자열길이" FROM MEMBER;

-- 만약에 회원의 전화번호 컬럼에 포함된 문자 '-'를 없앤 전화번호의 길이를 출력하세요
SELECT LENGTH(REPLACE(PHONE,'-','')) FROM MEMBER;

-- 코드 값을 반환하는 함수
SELECT ASCII('A') FROM DUAL;

-- 코드 값으로 문자를 반환하는 함수
SELECT CHR(65) FROM DUAL;

SELECT * FROM EMP WHERE COMM IS NULL;

-- 절대값을 구하는 함수 ABS(n)
SELECT ABS(35) , ABS(-35) FROM DUAL;

-- 음수 / 양수를 알려주는 함수 SIGN(n)
-- 양수 1 음수 -1 0이면 0 
SELECT SIGN(35) , SIGN(-35) , SIGN(0) FROM DUAL;

-- 숫자의 반올림 값을 알려주는 함수 ROUND(n,i)
SELECT ROUND(34.345678), ROUND(34.56789) FROM DUAL; -- 34 , 35

SELECT ROUND(12.3456789,2) ROUND(12.3456789,3) FROM DUAL; -- 소수점 2째자리 , 소수점 3째자리 까지 

-- 숫자의 나머지 값을 반환하는 함수 MOD(n1,n2)
SELECT TRUNC(17/5) 몫, MOD(17,5) 나머지 FROM DUAL;

-- 숫자의 제곱을 구하는 함수와 제곱근을 구하는 함수 POWER(n1,n2) / SQRT(n) 
SELECT POWER(5,2), SQRT(25) FROM DUAL; -- 5 * 5 = 25 SQRT(25) FROM DUAL

-- 현재 시간을 얻는 함수 오라클 시간 
SELECT SYSDATE , CURRENT_DATE, SYSTIMESTAMP , CURRENT_TIMESTAMP FROM DUAL;

-- 세션에 시간대 설정 CURRENT_DATE
-- SYSDATE 날짜 년월일시분까지
-- CURRENT_DATE 접속자의 시간 
-- SYSTIMESTAMP 날짜 년월일시분초 MS 까지 (디테일한 시간)

COMMIT;
SELECT ROW_NUMBER() OVER (ORDER BY HIT ), ID , TITLE , WRITER_ID , REGDATE , HIT 
        -- 정렬된 상태에서 일련번호 붙이기 
        -- 등수를 붙이기 정렬된 상태에서 등수 
FROM NOTICE
--WHERE
--GROUP BY
--HAVING
-- ORDER BY HIT; 
SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT DESC), ID , TITLE , WRITER_ID , REGDATE , HIT 
        -- 정렬된 상태에서 등수로 붙이기 
        -- 등수를 붙이기 정렬된 상태에서 등수 
        -- DENSE_RANK() 계속해서 등수를 이어갈수있도록 이웃한 랭킹으로 한다. 
        -- PARTITION BY WRITER_ID 아이디 별로 그룹별로 정렬 
        -- PARTITION BY WRITER_ID ORDER BY HIT DESC) 파티션별로 DESC 내림차순 
FROM NOTICE

-- 부조회(서브쿼리)
SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 1 AND 10; -- 정렬된 결과에서 1번부터 10번까지 데이터를 가져와라

SELECT * FROM MEMBER ORDER BY REGDATE DESC;

SELECT *
FROM (NOTICE ORDER BY REGDATE DESC)
WHERE ROWNUM BETWEEN 1 AND 5;

-- 서브쿼리를 함 
-- 일단 정렬을 먼저함 정렬된 결과물을 가지고 조회를 할수있다.

SELECT * FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC)  -- FROM 절에 정렬된 결과물을 가지고 데이터 쿼리
WHERE ROWNUM BETWEEN 1 AND 10;

-- ( ) 우선 먼저 하자 ! 해서 서브쿼리를 사용함 소괄호 = 먼저 하겠다. 
SELECT *
FROM (
SELECT * FROM NOTICE ORDER BY REGDATE DESC
)
WHERE ROWNUM BETWEEN 1 AND 5;

SELECT * FROM NOTICE;

-- 나이가 30 이상인 회원 목록을 조회
SELECT * FROM MEMBER WHERE AGE >= 30;

-- 나이가 30이상인 평균 나이 이상인 회원
-- 평균 나이를 구하는 쿼리를 먼저 구해본다.
SELECT * FROM MEMBER WHERE AGE >= (SELECT AVG(AGE) FROM MEMBER);

SELECT * FROM MEMBER;

COMMIT;

-- 평균 이상 서브쿼리 
SELECT * FROM MEMBER WHERE AGE >= (SELECT AVG(AGE) FROM MEMBER);

-- 조인 

SELECT * FROM MEMBER

SELECT * FROM NOTICE;

SELECT *
FROM MEMBER INNER JOIN NOTICE ON MEMBER.ID = NOTICE.WRITER_ID;

-- OUTER JOIN 참조키를 기준으로 일치하지 않는 행도 포함시키는 조인 
-- 왼쪽에 있는 걸 포함하겠다 LEFT JOIN 오른쪽에 있는 걸 포함하겠다 RIGHT JOIN 
-- 양쪽 모두 포함하겠다 FULL OUTER JOIN
MEMBER LEFT OUTER JOIN NOTICE ON MEMBER."ID" = NOTICE.WRITER;

CREATE TABLE MEMBER2 (
    ID VARCHAR2(50),
    NAME VARCHAR2(50)
)

CREATE TABLE MEMBER3 (
    TITLE VARCHAR2(50),
    WRITER_ID VARCHAR2(50)
)

INSERT INTO MEMBER2 VALUES('DJKK1234','박범');
INSERT INTO MEMBER2 VALUES('DLDL','이재명');
INSERT INTO MEMBER2 VALUES('LOLO','윤석열');

UPDATE MEMBER2 SET ID = '' WHERE  = '';

SELECT * FROM MEMBER2;
SELECT * FROM MEMBER3;

INSERT INTO MEMBER3 VALUES('자바는 재밌어','박범');
INSERT INTO MEMBER3 VALUES('오라클은 재밌어','이재명');
INSERT INTO MEMBER3 VALUES('게임은 재밌어','윤석열');
INSERT INTO MEMBER3 VALUES('빅데이터는 재밌어','홍준표');

-- 관계없는 OUTER 는 사라지지만 왼쪽에 있는 OUTER 는 사라지지 않는다 
SELECT * FROM MEMBER2 M2 FULL OUTER JOIN MEMBER3 M3 ON M2.ID =  M3.WRITER_ID;

-- 게시글의 컬럼명을 식별하기 위해 테이블명을 사용한다. 
SELECT MEMBER2.ID , MEMBER3.NAME FROM 
MEMBER2
INNER JOIN MEMBER2 ON MEMBER2.NAME = MEMBER3.WRITER_ID;

SELECT M.ID , M.NAME , COUNT(N.ID) FROM -- 멤버별로 하나하나 집계한다. 
MEMBER M INNER JOIN NOTICE N
ON M.ID = N.WRITER_ID
GROUP BY M.ID , M.NAME;


-- 주인공이 있어야 한다. ★
SELECT M.ID , M.NAME , COUNT(N.ID) FROM -- 멤버별로 하나하나 집계한다. 
MEMBER M LEFT OUTER JOIN NOTICE N
ON M.ID = N.WRITER_ID
GROUP BY M.ID , M.NAME;

-- SELF JOIN 데이터가 서로 포함 관계를 가지는 경우 : 담당 , 구성 , 연락 
-- 자기와 자기가 합치는 경우 SELF JOIN

SELECT * FROM MEMBER;
DELETE FROM MEMBER WHERE ID = 'newlec';

COMMIT;
SELECT * FROM MEMBER;

-- 확장 하고자 하는 데이터 컬럼이 다른곳에 있는게 아니라 테이블에 있다 SELF JOIN
-- 사원은 다 나와야함 사원에 해당하는 보스가 있으면 보스가 포함됨
-- 보스가 없으면 NULL 로 채우면 된다. 
-- LEFT OUTER JOIN 
-- BOSS_ID 에 BOSS_NAME 컬럼 하나만 더 하는걸 원한다.
-- 자기가 자기를 참조하는 형태 
SELECT M.* , B.NAME BOSS_NAME
FROM MEMBER M LEFT OUTER JOIN MEMBER B ON B.ID = M.BOSS_ID;
WEHERE M.ID = 'newlec';

SELECT N.* , M.NAME WRITER_NAME
FROM NOTICE N JOIN MEMBER M ON M.ID = N.WRITER_ID;

SELECT * FROM MEMBER;
SELECT * FROM NOTICE;

INSERT INTO NOTICE VALUES('82','JDBC란 무엇인가?','dragon','fss',SYSDATE,93,' ',9);

SELECT N.* , M.NAME WRITER_NAME
FROM NOTICE N JOIN MEMBER M ON M.ID = N.WRITER_ID;

SELECT N.* , M.NAME WRITER_NAME
FROM NOTICE N LEFT OUTER JOIN MEMBER M  -- 그외 바깥 
ON M.ID = N.WRITER_ID;

SELECT N.* , M.NAME WRITER_NAME
FROM NOTICE N, MEMBER M
WHERE N.WRITER_ID = M.ID(+)

-- CROSS JOIN 관계 상관없이  곱하기로 테이블 결과를 나타냄 
SELECT N.* , M.NAME WRITER_NAME
FROM MEMBER2 M CROSS JOIN MEMBER3 N;

-- UNION 두개의 테이블을 합치는데 JOIN은 컬럼을 합쳤다 (둘중에 하나가 주인공)
-- UNION은 컬럼이 늘어나는게 아니라 레코드를 합치는 작업
-- 게시판 3종류 별도의 테이블 만들면 그 테이블 합쳐서 통합검색 하고 싶을때 
-- A조건 B조건 C조건을 유니온으로 만들수도 있다.

-- 7개와 28개 
SELECT ID , NAME FROM MEMBER; 

    UNION  

SELECT WRITER_ID,TITLE FROM NOTICE; -- 28개 

-- UNION  36개가 된다.

-- UNION - 같은 데이터인 경우 하나로 줄인다 
-- UNION ALL - 모든 개수가 더해짐


-- INTERSECT 연산자 - 공통부분만 남긴다 

SELECT * FROM MEMBER3;

SELECT ID , NAME FROM MEMBER2;
    UNION 
SELECT WRITER_ID, TITLE FROM MEMBER3;

SELECT ID , NAME FROM MEMBER2;
    UNION ALL
SELECT WRITER_ID, TITLE FROM MEMBER3;

SELECT ID , NAME FROM MEMBER2;
    MINUS
SELECT WRITER_ID, TITLE FROM MEMBER3;


SELECT * FROM MEMBER2;

-- 공통 분모만 남김 
SELECT ID , NAME FROM MEMBER2;
    INTERSECT
SELECT WRITER_ID, TITLE FROM MEMBER3;

DESC MEMBER2;
SELECT * FROM MEMBER2;

SELECT * FROM MEMBER2 WHERE ID LIKE '%L%'
    UNION ALL;
SELECT * FROM MEMBER2 WHERE ID LIKE '%K%';

-- 뷰 
CREATE VIEW NOTICEVIEW 
AS
SELECT N.ID, N.TITLE, N.WRITER_ID, M.NAME WRITER_NAME, COUNT(C.ID) COMMENT_CNT
FROM MEMBER M RIGHT OUTER JOIN NOTICE N ON M.ID = N.WRITER_ID
LEFT OUTER JOIN "COMMENT" C ON N.ID = C.NOTICE_ID
GROUP BY N.ID, N.TITLE, N.WRITER_ID, M.NAME;

SELECT * FROM NOTICE;
SELECT * FROM MEMBER;
COMMIT;

-- 데이터 딕셔너리 사용자 정보 , 권한 ,테이블 / 뷰 , 제약 조건 , 함수 / 프로시저 
SELECT * FROM MEMBER;

SELECT * FROM DICT;

SELECT * FROM USER_TABLES; -- 유저들 테이블

SELECT * FROM USER_TAB_COLUMNS; -- 유저 테이블 컬럼만 

SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'MEMBER';

SHOW USER;

-- 요즘 콘솔 기반도 아니고 클릭하면 잘나오는데 굳이 딕셔너리 눌러서 조회하는 일은 거의 하지않는다

-- 제약조건 : 데이터를 입력할때 제약을 건다 . 무결성을 유지할수 있도록

-- 도메인 : 컬럼에 값을 입력하는데 유효한값의 범위가 있다.

-- 속성에 도메인이 아닌 값이 올 수 없도록 하는 제약조건

-- NOT NULL : 반드시 값을 입력

-- DEFAULT : 사용자가 입력하는것이 아니라 알아서 입력하는 기본 값

-- CHECK : 도메인의 범위 체크 조약 

CREATE TABLE TEST 
(
    ID VARCHAR2(50) NOT NULL,
    EMAIL VARCHAR2(200) NULL,
    PHONE CHAR(13) NOT NULL ,
    PWD VARCHAR2(200) DEFAULT '111' 
)

SELECT * FROM TEST;

INSERT INTO TEST VALUES('LOVE','ZKOKOPO@NAVER.COM','010-0392-5921');

ALTER TABLE TEST MODIFY EMAIL VARCHAR2(200) NOT NULL;

COMMIT;

DROP TABLE TEST;

INSERT INTO notice (
    id,
    title,
    writer_id
) VALUES (
    '59',
    '50번째 게시글',
    'newlec'
);

SELECT * FROM NOTICE ORDER BY REGDATE DESC;

DESC NOTICE;

-- 도메인 제약조건의 꽃 체크 제약 조건
-- 테이블을 만들때 NOT NULL 이나 DEFAULT 
-- 값이 유효한 값이 안들어왔을때 형식 

CREATE TABLE TEST (
    ID VARCHAR2(50) NULL,
    PHONE VARCHAR2(200) CHECK(PHONE LIKE '010-%-____') NOT NULL,
    EMAIL VARCHAR2(500) NULL
)

-- 테이블을 생성 한 후에 적용 방법
ALTER TABLE TEST ADD CONSTRAINT CK_TEST_PHONE CHECK(PHONE LIKE '010-%-____');

INSERT INTO MEMBER ( ID , PWD , NAME , PHONE )
VALUES ('newlec421','222','뉴렉카','010-3029-2222');

-- 정규식 패턴 문자 적용

-- 체크 제약 조건 삭제 
ALTER TABLE MEMBER 
DROP CONSTRAINT MEMBER_PHONE_CHK1;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='MEMBER';

-- 정규식을 이용한 CHECK 제약조건 추가
ALTER TABLE MEMBER
ADD CONSTRAINT MEMBER_PHONE_CHK1 CHECK(REGEXP_LIKE(PHONE,'^01[01]-\d{3,4}-\d{4}'));

SELECT * FROM MEMBER;

-- 도메인 제약조건(컬럼에 올바른 값) : CONSTRAINT , 체크 제약 
-- Entity 제약조건 : PRIMARY KEY , UNIQUE
   -- 레코드에 여러개가 들어가면 첫번재 레코드의 동일한 값이 들어가면..
   -- 동일한 데이터가 들어가면 계속해서 중복된 데이터 식별이 불가능해진다. -> 데이터 결함
   -- 레코드가 절대로 같지 않다라는 식별할수 있는 먼가가 있어야 한다.
   -- 식별할수 있는 컬럼이 준비되고 중복이 발생하지 않아야 한다.
   -- 전체 레코드들이 올바르게 식별할수있는 PRIMARY KEY(기본키) - NULL도 들어오면 안됨
            -- NULL 은 허용하나 중복이 발생하지 않는 UNIQUE(중복불허) 
-- 관계 제약 조건

-- 제약조건에 이름을 부여함  ID NUMBER CONSTRAINT NOTICE_ID_PK PRIMARY KEY , 
    
 -- 테이블을 만든후 제약조건 넣기 테이블에는 하나의 기본키만 허용한다. 
 ALTER TABLE NOTICE 
 ADD CONSTRAINT NOTICE_ID_PK PRIMARY KEY(ID);
    
    
ID NUMBER CONSTRAINT NOTICE_ID_PK PRIMARY KEY  
          CONSTRAINT NOTICE_ID_PK PRIMARY KEY(ID)   
          CONSTRAINT NOTICE_WRITER_ID_UK UNIQUE(WRITER_ID)    
 
HIT NUMBER DEFAULT 0  -- 기본값 0 

 -- 시퀀스 = 일련번호  프로그램만들다보면 일련된 번호를 뽑아내기 ex) 공지사항
 
 INSERT INTO NOTICE(ID , TITLE , WRITER_ID)
 VALUES(NOTICE_ID_SEQ.NEXTVAL , '시퀀스 예제','newlec');
 
 -- 시퀀스 실행할때마다 값이 하나씩 뽑아낸다 
SELECT NOTICE_ID_SEQ.NEXTVAL FROM DUAL;
commit;


