
CREATE TABLE NOTICE (
    ID VARCHAR2(50),
    TITLE VARCHAR2(50),
    WRITER_ID VARCHAR2(50),
    CONTENT VARCHAR2(50),
    REGDATE TIMESTAMP,
    HIT NUMBER ,
    FILES VARCHAR2(50),
    PUB NUMBER(1,0)
)
DESC NOTICE;
SELECT * FROM NOTICE;
DROP TABLE NOTICE;

INSERT INTO NOTICE VALUES(ID.NEXTVAL,'JDBC�� �����ΰ�','newlec','aaa',SYSDATE,20,'',0);
INSERT INTO NOTICE VALUES(ID.NEXTVAL,'�ڹٶ� �����ΰ�','java','bbb',SYSDATE,5,'',1);
INSERT INTO NOTICE VALUES(ID.NEXTVAL,'����Ŭ�̶� �����ΰ�','lec','ccc',SYSDATE,15,'',2);
INSERT INTO NOTICE VALUES(ID.NEXTVAL,'�������̶� �����ΰ�','fo','ddd',SYSDATE,23,'',3);
INSERT INTO NOTICE VALUES(ID.NEXTVAL,'C���� �����ΰ�','BBB','eee',SYSDATE,38,'',4);
INSERT INTO NOTICE VALUES(ID.NEXTVAL,'���̽��̶� �����ΰ�','lec','fff',SYSDATE,40,'',5);
INSERT INTO NOTICE VALUES(256,'newlec','hahaha','ff',SYSDATE,0,'',5);
SELECT * FROM NOTICE ORDER BY ID DESC; -- �������� 
SELECT NOTICE_SEQ.NEXTVAL FROM DUAL; -- ���� �������� �� �˻� 
DROP SEQUENCE NOTICE_SEQ;
SELECT SEQUENCE_NAME FROM USER_SEQUENCES ;

INSERT INTO NOTICE (
    id,
    title,
    writer_id,
    content,
    regdate,
    hit,
    files,
    pub
) VALUES(
   SEQUENCE1.NEXTVAL,
   'JDBC�� �����ΰ�',
   'newlec',
   'aaa',
   SYSDATE,
   20,
   '',
   0
);
COMMIT; -- ������ Ŀ������ ! 
SELECT * FROM MEMBER;
UPDATE NOTICE
SET
    TITLE='TEST3',
    CONTENT='HAHAHA',
    FILES=''  
WHERE ID = 12;

ROLLBACK; -- �����Ƿ� �������� 

COMMIT;

SELECT * FROM NOTICE;