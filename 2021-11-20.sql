-- ���ڿ� ���� �Լ� CONCAT
SELECT CONCAT('ȫ','�浿') FROM DUAL;
-- ���ڿ� ����
SELECT 3 + '4' FROM DUAL;
SELECT 3 + '4A' FROM DUAL;
SELECT 3 || '4' FROM DUAL;

-- ���ڿ� Ʈ�� �Լ� ������� ���ش�.
SELECT LTRIM( ' HELLO ') FROM DUAL; -- ���� ���� ����
SELECT RTRIM( ' HELLO ') FROM DUAL; -- ������ ���� ����
SELECT TRIM( ' HELLO ') FROM DUAL; -- ���� ���� ����

-- ���ڿ� �ҹ��� �Ǵ� �빮�ڷ� �����ϱ�
SELECT LOWER('NeWIEC') FROM DUAL; -- ��� �ҹ��ڷ�
SELECT UPPER('newLoc') FROM DUAL; -- ��� �빮�ڷ� 

-- ȸ���� ���̵� 'newlec'�� ȸ���� ��ȸ�Ͻÿ� (�� ��/�ҹ��ڸ� ������ �ʴ´�)

SELECT * FROM MEMBER WHERE UPPER(ID) = UPPER('newlec'); -- ��ҹ��ڸ� ������ �ʰ� �˻� �Ѵ�.

SELECT * FROM MEMBER;

-- ���ڿ� ��ġ �Լ� REPLACE(���ڿ�,ã�� ���ڿ�, ��ġ�� ���ڿ�) / TRANSLATE()
SELECT REPLACE('WHERE WE ARE','WE','YOU') FROM DUAL; -- WE�� �뤊�� �ٲ�
SELECT TRANSLATE('WHERE WE ARE','WE','YOU') FROM DUAL; -- W�� Y�� �ٲٰ� E�� O �� U�� �ƹ��ǹ̾���

-- ȸ���� �̸��� �ּҸ� ��ȸ�Ͻÿ� (�� , �ּҴ� ��ĭ ���� ����Ͻÿ�)

SELECT NAME , REPLACE(REGDATE,' ','') FROM MEMBER; 

-- ���ڿ� �е� �Լ�
SELECT LPAD('HELLO',5) FROM DUAL;
SELECT LPAD('HELLO',5,'0') FROM DUAL;
SELECT LPAD('HELLO',10,'0') FROM DUAL;
SELECT RPAD('HELLO',10,'0') FROM DUAL;

-- �ݵ�� 3���� �ƽø����� �������Ѽ� 3���ڰ� �ȵǸ� �����ʿ� 0�� �߰� 
-- �ѱ��� *2���� ���̸� �ƽø����� ����Ѵ�.
SELECT RPAD(NAME,6,'0') FROM MEMBER;

-- ù���ڸ� �빮�ڷ� �ٲٴ� �Լ� INITCAP(���ڿ�)
SELECT INITCAP('the...') FROM DUAL;
SELECT INITCAP('the most important thing is ...') FROM DUAL;
SELECT INITCAP('the most im����tant t������hing is ...') FROM DUAL;

-- ���ڿ� �˻� �Լ� INSTR (���ڿ�,�˻����ڿ�,��ġ,ã����)
SELECT INSTR('ALL WE NEED TO IS JUST TO...','TO') FROM DUAL; -- �׹��ڰ� �����ϴ� ���� ��ġ ��ȯ
SELECT INSTR('ALL WE NEED TO IS JUST TO...','TO',15) FROM DUAL; -- 2��° TO ã������� 15��°���� ã�������� 
                                                                -- 1��°�� �ǳ� �ڴ�.

SELECT INSRT('ALL WE NEED TO IS JUST TO...','TO',1,2) FROM DUAL; -- 1��° ���� ���� �����µ� 2��° ��ġ�� �޶�                                                    

SELECT INSTR('ALL WE NEED TO IS JUST TO...','TO') FROM DUAL; -- ù��° TO 13��° 
SELECT INSTR('ALL WE NEED TO IS JUST TO...','TO',15) FROM DUAL; -- �ι�° TO 24��°

-- ȸ���� ��ȭ��ȣ���� �� ��° ���(-)���ڰ� �����ϴ� ��ġ�� ���
SELECT INSTR(PHONE,'-',1,2) FROM MEMBER;
SELECT * FROM MEMBER;

-- ȸ���� ��ȭ��ȣ���� ù ��° ���(-)���ڿ� �� ��° ���(-) ���ڰ� ������ ������ 
SELECT INSTR(PHONE,'-',1,2) - INSTR(PHONE,'-',1,1)-1 FROM MEMBER;

-- ȸ���� ��ȭ��ȣ���� ù ��°�� �� ��° ������ ����(���ڸ�)�� ���
SELECT SUBSTR(PHONE,1,3) FROM MEMBER;

SELECT SUBSTR(PHONE,5,INSTR(PHONE,'-',1,2)-INSTR(PHONE,'-',1,1)-1) FROM MEMBER;

-- ���ڿ� ���̸� ��� �Լ�
SELECT LENGTH('WHERE WE ARE') FROM MEMBER;

-- ��� ȸ���� �ڵ��� ��ȣ�� ��ȣ�� ���ڿ� ���̸� ��ȸ�Ͻÿ�
SELECT NAME  , PHONE , LENGTH(PHONE) AS "��ȣ�� �ڿ�����" FROM MEMBER;

-- ���࿡ ȸ���� ��ȭ��ȣ �÷��� ���Ե� ���� '-'�� ���� ��ȭ��ȣ�� ���̸� ����ϼ���
SELECT LENGTH(REPLACE(PHONE,'-','')) FROM MEMBER;

-- �ڵ� ���� ��ȯ�ϴ� �Լ�
SELECT ASCII('A') FROM DUAL;

-- �ڵ� ������ ���ڸ� ��ȯ�ϴ� �Լ�
SELECT CHR(65) FROM DUAL;

SELECT * FROM EMP WHERE COMM IS NULL;

-- ���밪�� ���ϴ� �Լ� ABS(n)
SELECT ABS(35) , ABS(-35) FROM DUAL;

-- ���� / ����� �˷��ִ� �Լ� SIGN(n)
-- ��� 1 ���� -1 0�̸� 0 
SELECT SIGN(35) , SIGN(-35) , SIGN(0) FROM DUAL;

-- ������ �ݿø� ���� �˷��ִ� �Լ� ROUND(n,i)
SELECT ROUND(34.345678), ROUND(34.56789) FROM DUAL; -- 34 , 35

SELECT ROUND(12.3456789,2) ROUND(12.3456789,3) FROM DUAL; -- �Ҽ��� 2°�ڸ� , �Ҽ��� 3°�ڸ� ���� 

-- ������ ������ ���� ��ȯ�ϴ� �Լ� MOD(n1,n2)
SELECT TRUNC(17/5) ��, MOD(17,5) ������ FROM DUAL;

-- ������ ������ ���ϴ� �Լ��� �������� ���ϴ� �Լ� POWER(n1,n2) / SQRT(n) 
SELECT POWER(5,2), SQRT(25) FROM DUAL; -- 5 * 5 = 25 SQRT(25) FROM DUAL

-- ���� �ð��� ��� �Լ� ����Ŭ �ð� 
SELECT SYSDATE , CURRENT_DATE, SYSTIMESTAMP , CURRENT_TIMESTAMP FROM DUAL;

-- ���ǿ� �ð��� ���� CURRENT_DATE
-- SYSDATE ��¥ ����Ͻúб���
-- CURRENT_DATE �������� �ð� 
-- SYSTIMESTAMP ��¥ ����Ͻú��� MS ���� (�������� �ð�)

COMMIT;
SELECT ROW_NUMBER() OVER (ORDER BY HIT ), ID , TITLE , WRITER_ID , REGDATE , HIT 
        -- ���ĵ� ���¿��� �Ϸù�ȣ ���̱� 
        -- ����� ���̱� ���ĵ� ���¿��� ��� 
FROM NOTICE
--WHERE
--GROUP BY
--HAVING
-- ORDER BY HIT; 
SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT DESC), ID , TITLE , WRITER_ID , REGDATE , HIT 
        -- ���ĵ� ���¿��� ����� ���̱� 
        -- ����� ���̱� ���ĵ� ���¿��� ��� 
        -- DENSE_RANK() ����ؼ� ����� �̾���ֵ��� �̿��� ��ŷ���� �Ѵ�. 
        -- PARTITION BY WRITER_ID ���̵� ���� �׷캰�� ���� 
        -- PARTITION BY WRITER_ID ORDER BY HIT DESC) ��Ƽ�Ǻ��� DESC �������� 
FROM NOTICE

-- ����ȸ(��������)
SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 1 AND 10; -- ���ĵ� ������� 1������ 10������ �����͸� �����Ͷ�

SELECT * FROM MEMBER ORDER BY REGDATE DESC;

SELECT *
FROM (NOTICE ORDER BY REGDATE DESC)
WHERE ROWNUM BETWEEN 1 AND 5;

-- ���������� �� 
-- �ϴ� ������ ������ ���ĵ� ������� ������ ��ȸ�� �Ҽ��ִ�.

SELECT * FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC)  -- FROM ���� ���ĵ� ������� ������ ������ ����
WHERE ROWNUM BETWEEN 1 AND 10;

-- ( ) �켱 ���� ���� ! �ؼ� ���������� ����� �Ұ�ȣ = ���� �ϰڴ�. 
SELECT *
FROM (
SELECT * FROM NOTICE ORDER BY REGDATE DESC
)
WHERE ROWNUM BETWEEN 1 AND 5;

SELECT * FROM NOTICE;

-- ���̰� 30 �̻��� ȸ�� ����� ��ȸ
SELECT * FROM MEMBER WHERE AGE >= 30;

-- ���̰� 30�̻��� ��� ���� �̻��� ȸ��
-- ��� ���̸� ���ϴ� ������ ���� ���غ���.
SELECT * FROM MEMBER WHERE AGE >= (SELECT AVG(AGE) FROM MEMBER);

SELECT * FROM MEMBER;

COMMIT;

-- ��� �̻� �������� 
SELECT * FROM MEMBER WHERE AGE >= (SELECT AVG(AGE) FROM MEMBER);

-- ���� 

SELECT * FROM MEMBER

SELECT * FROM NOTICE;

SELECT *
FROM MEMBER INNER JOIN NOTICE ON MEMBER.ID = NOTICE.WRITER_ID;

-- OUTER JOIN ����Ű�� �������� ��ġ���� �ʴ� �൵ ���Խ�Ű�� ���� 
-- ���ʿ� �ִ� �� �����ϰڴ� LEFT JOIN �����ʿ� �ִ� �� �����ϰڴ� RIGHT JOIN 
-- ���� ��� �����ϰڴ� FULL OUTER JOIN
MEMBER LEFT OUTER JOIN NOTICE ON MEMBER."ID" = NOTICE.WRITER;

CREATE TABLE MEMBER2 (
    ID VARCHAR2(50),
    NAME VARCHAR2(50)
)

CREATE TABLE MEMBER3 (
    TITLE VARCHAR2(50),
    WRITER_ID VARCHAR2(50)
)

INSERT INTO MEMBER2 VALUES('DJKK1234','�ڹ�');
INSERT INTO MEMBER2 VALUES('DLDL','�����');
INSERT INTO MEMBER2 VALUES('LOLO','������');

UPDATE MEMBER2 SET ID = '' WHERE  = '';

SELECT * FROM MEMBER2;
SELECT * FROM MEMBER3;

INSERT INTO MEMBER3 VALUES('�ڹٴ� ��վ�','�ڹ�');
INSERT INTO MEMBER3 VALUES('����Ŭ�� ��վ�','�����');
INSERT INTO MEMBER3 VALUES('������ ��վ�','������');
INSERT INTO MEMBER3 VALUES('�����ʹ� ��վ�','ȫ��ǥ');

-- ������� OUTER �� ��������� ���ʿ� �ִ� OUTER �� ������� �ʴ´� 
SELECT * FROM MEMBER2 M2 FULL OUTER JOIN MEMBER3 M3 ON M2.ID =  M3.WRITER_ID;

-- �Խñ��� �÷����� �ĺ��ϱ� ���� ���̺���� ����Ѵ�. 
SELECT MEMBER2.ID , MEMBER3.NAME FROM 
MEMBER2
INNER JOIN MEMBER2 ON MEMBER2.NAME = MEMBER3.WRITER_ID;

SELECT M.ID , M.NAME , COUNT(N.ID) FROM -- ������� �ϳ��ϳ� �����Ѵ�. 
MEMBER M INNER JOIN NOTICE N
ON M.ID = N.WRITER_ID
GROUP BY M.ID , M.NAME;


-- ���ΰ��� �־�� �Ѵ�. ��
SELECT M.ID , M.NAME , COUNT(N.ID) FROM -- ������� �ϳ��ϳ� �����Ѵ�. 
MEMBER M LEFT OUTER JOIN NOTICE N
ON M.ID = N.WRITER_ID
GROUP BY M.ID , M.NAME;

-- SELF JOIN �����Ͱ� ���� ���� ���踦 ������ ��� : ��� , ���� , ���� 
-- �ڱ�� �ڱⰡ ��ġ�� ��� SELF JOIN

SELECT * FROM MEMBER;
DELETE FROM MEMBER WHERE ID = 'newlec';

COMMIT;
SELECT * FROM MEMBER;

-- Ȯ�� �ϰ��� �ϴ� ������ �÷��� �ٸ����� �ִ°� �ƴ϶� ���̺� �ִ� SELF JOIN
-- ����� �� ���;��� ����� �ش��ϴ� ������ ������ ������ ���Ե�
-- ������ ������ NULL �� ä��� �ȴ�. 
-- LEFT OUTER JOIN 
-- BOSS_ID �� BOSS_NAME �÷� �ϳ��� �� �ϴ°� ���Ѵ�.
-- �ڱⰡ �ڱ⸦ �����ϴ� ���� 
SELECT M.* , B.NAME BOSS_NAME
FROM MEMBER M LEFT OUTER JOIN MEMBER B ON B.ID = M.BOSS_ID;
WEHERE M.ID = 'newlec';

SELECT N.* , M.NAME WRITER_NAME
FROM NOTICE N JOIN MEMBER M ON M.ID = N.WRITER_ID;

SELECT * FROM MEMBER;
SELECT * FROM NOTICE;

INSERT INTO NOTICE VALUES('82','JDBC�� �����ΰ�?','dragon','fss',SYSDATE,93,' ',9);

SELECT N.* , M.NAME WRITER_NAME
FROM NOTICE N JOIN MEMBER M ON M.ID = N.WRITER_ID;

SELECT N.* , M.NAME WRITER_NAME
FROM NOTICE N LEFT OUTER JOIN MEMBER M  -- �׿� �ٱ� 
ON M.ID = N.WRITER_ID;

SELECT N.* , M.NAME WRITER_NAME
FROM NOTICE N, MEMBER M
WHERE N.WRITER_ID = M.ID(+)

-- CROSS JOIN ���� �������  ���ϱ�� ���̺� ����� ��Ÿ�� 
SELECT N.* , M.NAME WRITER_NAME
FROM MEMBER2 M CROSS JOIN MEMBER3 N;

-- UNION �ΰ��� ���̺��� ��ġ�µ� JOIN�� �÷��� ���ƴ� (���߿� �ϳ��� ���ΰ�)
-- UNION�� �÷��� �þ�°� �ƴ϶� ���ڵ带 ��ġ�� �۾�
-- �Խ��� 3���� ������ ���̺� ����� �� ���̺� ���ļ� ���հ˻� �ϰ� ������ 
-- A���� B���� C������ ���Ͽ����� ������� �ִ�.

-- 7���� 28�� 
SELECT ID , NAME FROM MEMBER; 

    UNION  

SELECT WRITER_ID,TITLE FROM NOTICE; -- 28�� 

-- UNION  36���� �ȴ�.

-- UNION - ���� �������� ��� �ϳ��� ���δ� 
-- UNION ALL - ��� ������ ������


-- INTERSECT ������ - ����κи� ����� 

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

-- ���� �и� ���� 
SELECT ID , NAME FROM MEMBER2;
    INTERSECT
SELECT WRITER_ID, TITLE FROM MEMBER3;

DESC MEMBER2;
SELECT * FROM MEMBER2;

SELECT * FROM MEMBER2 WHERE ID LIKE '%L%'
    UNION ALL;
SELECT * FROM MEMBER2 WHERE ID LIKE '%K%';

-- �� 
CREATE VIEW NOTICEVIEW 
AS
SELECT N.ID, N.TITLE, N.WRITER_ID, M.NAME WRITER_NAME, COUNT(C.ID) COMMENT_CNT
FROM MEMBER M RIGHT OUTER JOIN NOTICE N ON M.ID = N.WRITER_ID
LEFT OUTER JOIN "COMMENT" C ON N.ID = C.NOTICE_ID
GROUP BY N.ID, N.TITLE, N.WRITER_ID, M.NAME;

SELECT * FROM NOTICE;
SELECT * FROM MEMBER;
COMMIT;

-- ������ ��ųʸ� ����� ���� , ���� ,���̺� / �� , ���� ���� , �Լ� / ���ν��� 
SELECT * FROM MEMBER;

SELECT * FROM DICT;

SELECT * FROM USER_TABLES; -- ������ ���̺�

SELECT * FROM USER_TAB_COLUMNS; -- ���� ���̺� �÷��� 

SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'MEMBER';

SHOW USER;

-- ���� �ܼ� ��ݵ� �ƴϰ� Ŭ���ϸ� �߳����µ� ���� ��ųʸ� ������ ��ȸ�ϴ� ���� ���� �����ʴ´�

-- �������� : �����͸� �Է��Ҷ� ������ �Ǵ� . ���Ἲ�� �����Ҽ� �ֵ���

-- ������ : �÷��� ���� �Է��ϴµ� ��ȿ�Ѱ��� ������ �ִ�.

-- �Ӽ��� �������� �ƴ� ���� �� �� ������ �ϴ� ��������

-- NOT NULL : �ݵ�� ���� �Է�

-- DEFAULT : ����ڰ� �Է��ϴ°��� �ƴ϶� �˾Ƽ� �Է��ϴ� �⺻ ��

-- CHECK : �������� ���� üũ ���� 

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
    '50��° �Խñ�',
    'newlec'
);

SELECT * FROM NOTICE ORDER BY REGDATE DESC;

DESC NOTICE;

-- ������ ���������� �� üũ ���� ����
-- ���̺��� ���鶧 NOT NULL �̳� DEFAULT 
-- ���� ��ȿ�� ���� �ȵ������� ���� 

CREATE TABLE TEST (
    ID VARCHAR2(50) NULL,
    PHONE VARCHAR2(200) CHECK(PHONE LIKE '010-%-____') NOT NULL,
    EMAIL VARCHAR2(500) NULL
)

-- ���̺��� ���� �� �Ŀ� ���� ���
ALTER TABLE TEST ADD CONSTRAINT CK_TEST_PHONE CHECK(PHONE LIKE '010-%-____');

INSERT INTO MEMBER ( ID , PWD , NAME , PHONE )
VALUES ('newlec421','222','����ī','010-3029-2222');

-- ���Խ� ���� ���� ����

-- üũ ���� ���� ���� 
ALTER TABLE MEMBER 
DROP CONSTRAINT MEMBER_PHONE_CHK1;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='MEMBER';

-- ���Խ��� �̿��� CHECK �������� �߰�
ALTER TABLE MEMBER
ADD CONSTRAINT MEMBER_PHONE_CHK1 CHECK(REGEXP_LIKE(PHONE,'^01[01]-\d{3,4}-\d{4}'));

SELECT * FROM MEMBER;

-- ������ ��������(�÷��� �ùٸ� ��) : CONSTRAINT , üũ ���� 
-- Entity �������� : PRIMARY KEY , UNIQUE
   -- ���ڵ忡 �������� ���� ù���� ���ڵ��� ������ ���� ����..
   -- ������ �����Ͱ� ���� ����ؼ� �ߺ��� ������ �ĺ��� �Ұ���������. -> ������ ����
   -- ���ڵ尡 ����� ���� �ʴٶ�� �ĺ��Ҽ� �ִ� �հ��� �־�� �Ѵ�.
   -- �ĺ��Ҽ� �ִ� �÷��� �غ�ǰ� �ߺ��� �߻����� �ʾƾ� �Ѵ�.
   -- ��ü ���ڵ���� �ùٸ��� �ĺ��Ҽ��ִ� PRIMARY KEY(�⺻Ű) - NULL�� ������ �ȵ�
            -- NULL �� ����ϳ� �ߺ��� �߻����� �ʴ� UNIQUE(�ߺ�����) 
-- ���� ���� ����

-- �������ǿ� �̸��� �ο���  ID NUMBER CONSTRAINT NOTICE_ID_PK PRIMARY KEY , 
    
 -- ���̺��� ������ �������� �ֱ� ���̺��� �ϳ��� �⺻Ű�� ����Ѵ�. 
 ALTER TABLE NOTICE 
 ADD CONSTRAINT NOTICE_ID_PK PRIMARY KEY(ID);
    
    
ID NUMBER CONSTRAINT NOTICE_ID_PK PRIMARY KEY  
          CONSTRAINT NOTICE_ID_PK PRIMARY KEY(ID)   
          CONSTRAINT NOTICE_WRITER_ID_UK UNIQUE(WRITER_ID)    
 
HIT NUMBER DEFAULT 0  -- �⺻�� 0 

 -- ������ = �Ϸù�ȣ  ���α׷�����ٺ��� �Ϸõ� ��ȣ�� �̾Ƴ��� ex) ��������
 
 INSERT INTO NOTICE(ID , TITLE , WRITER_ID)
 VALUES(NOTICE_ID_SEQ.NEXTVAL , '������ ����','newlec');
 
 -- ������ �����Ҷ����� ���� �ϳ��� �̾Ƴ��� 
SELECT NOTICE_ID_SEQ.NEXTVAL FROM DUAL;
commit;


