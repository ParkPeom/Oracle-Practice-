/*
�ǽ��ڵ�

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
SELECT * FROM DEPT; -- �μ� ���̺� 
SELECT * FROM salgrade; -- �޿���� ���̺� 

/*
SELECT [DISTINCT] {*, column [alias], . . .}
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]];
*/
--1. ��� ���̺��� ��� �����͸� ����ϼ���.
-- �������� ��ҹ��ڸ� �������� �ʾƿ�

SELECT * FROM EMP; -- �տ��� ���� ����� �ڿ� ������ �ȵ�

SELECT
*
FROM
EMP;

--2 Ư�� �÷��� ������ ����ϱ�
SELECT EMPNO , ENAME , SAL FROM EMP;

--3 �÷��� ����Ī(alias) ��Ī �ο��ϱ� "��Ī"
SELECT EMPNO ���, ENAME �̸�
FROM EMP;

-- ���������̼��� �ʿ��� ���� 
SELECT EMPNO "��  ��", ENAME "��  ��"
FROM EMP;

-- SQLǥ�� ANSI���� 
SELECT EMPNO AS "�� ��" , ENAME AS "��  ��"
FROM EMP;

-- Oracle ������ : ���ڿ� �����ʹ� ��ҹ��ڸ� �����ϰ� �����Ѵ�.
-- �빮�� A , �ҹ��� a >> �ٸ����� MSSQL�� �����ŷ� ����. 

-- WHERE ������ , ����Ŭ���� ���ڿ� ó���� '���ڿ�' �̱� �����̼� 
SELECT * FROM EMP WHERE ENAME = 'king';   
SELECT * FROM EMP WHERE ENAME = 'KING';

-- DB
/*
    ������ : ��� , ���� (����) ����
    ������ : APP ���ؼ� CRUD (insert , select , update , delete ) + ������ ���� + Ʃ�� ���� + ���� ���� (�����)
    Ʃ�� : �ϵ����
          ����(SQL)
    ���� : PM (�䱸���� �м� : ERD)      
*/
-- Oracle SQL(���Ǿ�) : ���
--������( ���տ����� ( || , ��������� +)
-- java : + ���� (�������)
-- java : + ���� (���տ���)
-- Tip ) ms-sql + �ϳ��� ���� , ���

SELECT '����� �̸��� ' || ENAME || ' �Դϴ�' as "�������"
FROM EMP;

-- �÷��� Ÿ�� : ���� , ����(��) , ��¥ ....
-- �ѱ� 1��(2����Ʈ) , ������(1����Ʈ) , Ư(1����Ʈ) , ����(1����Ʈ) 
-- ename varchar2(10) >> 10����Ʈ >> �ѱ� 5�� , ������ 10�� 
-- ename nvarchar2(10) >> n �����ڵ� >>  �ѱ� 10�� , ������ 10�� >> 10���� >> �� 20����Ʈ >> ������� ���̾� 


SELECT '����� �̸��� '|| ENAME || '�Դϴ�.' AS ������� FROM EMP; -- || �� ���ڿ��� ���� 

-- EMPNO    NOT NULL NUMBER
-- ENAME             VARCHAR2(10) 
DESC EMP; -- ���̺� ���� ����
SELECT EMPNO || ENAME FROM EMP; -- ���������� ����ȯ(���� -> ����) ���� 

-- + ������(���)
SELECT EMPNO + ENAME FROM EMP;

-- �츮 ȸ�� �������..
-- �츮 ȸ�翡 ������ ��� ����
SELECT JOB FROM EMP;
-- �ߺ������� ���� : Ű���� : DISTINCT
SELECT DISTINCT JOB FROM EMP;

-- DISTINCT ���� : GROUPING 

-- JOB���� ��� 
SELECT DISTINCT JOB , DEPTNO 
FROM EMP ORDER BY JOB;

SELECT DEISINCT DEPTNO , JOB
FROM EMP ORDER BY DEPTNO;

--Oracle ���(������)
--java ���� ����( + , -, * , / ) java : ������ % >> ����Ŭ (% ����� .... ������ ����...)
--Oracle �Լ� ���� (������ ���ϴ� �Լ� : Mod() )

-- ������̺��� ����� �޿��� 100�޷� �λ�� ����� ����ϼ���
SELECT SAL , SAL + 100 as "�λ�޿�" 
FROM EMP;

SELECT 100 + 100 FROM DUAL; -- 200 �ӽ� ���� ���̺� 
SELECT 100 || 100 FROM DUAL; -- '100100' 
SELECT '100' + 100 FROM DUAL; -- 200 
SELECT 'A100' + 100 FROM DUAL; -- ����

--�񱳿�����
--<  >  <= 
--���� ���� 
--java ����(==) �Ҵ�(=)
--Oracle ����(=)  �����ʴ� (!=)
-- TIP) javascript (���� (==) (===)

-- �� ������ 
-- AND , OR , NOT

/*          AND     OR
    0 0     0       0
    0 1     0       1
    1 0     0       1
    1 1     1       1
    
    
*/
-- ������
-- SELECT 3
-- FROM   1
-- WHERE  2

SELECT EMPNO , ENAME , SAL , HIREDATE
FROM EMP
WHERE SAL >= 3000;
 
 
 -- ����� 7788���� ����� ��� , �̸� , ���� , �Ի����� ����ϼ���
 
 SELECT EMPNO , ENAME , JOB , HIREDATE 
 FROM EMP
 WHERE EMPNO = 7788;

SELECT EMPNO || '��' || ENAME || '�Դϴ�.'  FROM EMP;

-- ����2�� (2���� ������ ��)
-- and , or
-- �޿��� 2000�޷� �̻��̸鼭 ������ manager �� ����� ��� ������ ����ϼ��� 
SELECT * FROM EMP WHERE JOB = 'MANAGER' AND SAL >= 2000;

-------------------------------------------------------
-- ����Ŭ ���� ��¥(DB����)
-- ����Ŭ sysdate 
SELECT sysdate from dual; -- ����Ŭ�� ��ġ�� pc�ð� 

select * from nls_session_parameters; -- ������ ����ڰ� ���� ȯ�漼�� ���� 
-- NLS_DATE_FORMAT RR/MM/DD
-- NLS_TIME_FORMAT HH24:MI:SSXFF

-- 2021�� 11�� 22�� 
ALTER SESSION SET nls_date_format='YYYY-MM-DD HH24:MI:SS'; -- ���� ���� ����� 
-- �������� ��Ʈ�� �ٽ� Ű�� ��¥�� ��ȸ�ϸ� ... �ٽ� .. NLS_DATE_FORMAT RR/MM/DD ���ϲ����� 

SELECT HIREDATE FROM EMP;

SELECT * FROM EMP WHERE HIREDATE = '1980-12-17'; -- ���� �����ϴ� 

SELECT * FROM EMP WHERE HIREDATE = '1980/12/17';

SELECT * FROM EMP WHERE HIREDATE = '1980.12.17';

SELECT * FROM EMP WHERE HIREDATE = '80-12-17'; -- YYYY-MM-DD (���Ŀ� ���߾)

-- ����� �޿��� 2000 �޷� �̻��̰� 4000 �޷� ������ ��� ����� ������ ����ϼ��� 
SELECT * 
FROM EMP 
WHERE SAL >= 2000 AND SAL <= 4000;

-- ������ : �÷��� BETWEEN A AND B(=)
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 4000; -- BETWEEN A AND B 

-- -- ����� �޿��� 2000 �޷� �ʰ� 4000 �޷� �̸� ��� ����� ������ ����ϼ��� 
SELECT *
FROM EMP
WHERE SAL > 2000 AND SAL < 4000;

-- JOB �ߺ� �����ϰ�  ���� 
SELECT COUNT(DISTINCT JOB) FROM EMP; 

-- �μ���ȣ�� 10�� �Ǵ� 20�� �Ǵ� 30�� ����� ��� , �̸� , �޿� , �μ���ȣ �� ����ϼ���  
SELECT EMPNO , ENAME , SAL , DEPTNO 
FROM EMP
WHERE DEPTNO 
IN (10,20,30);

-- ������( IN ������) Ǯ��� (���� OR ���� OR ���� ....)
-- �μ���ȣ�� 10�� �Ǵ� 20�� �Ǵ� 30���� �ƴ� ����� ���, �̸� , �޿� ,�μ���ȣ�� ����ϼ���
SELECT EMPNO , ENAME , SAL , DEPTNO 
FROM EMP
WHERE DEPTNO 
NOT IN (10,20,30);

SELECT EMPNO , ENAME , SAL , DEPTNO
FROM EMP
WHERE DEPTNO != 10 AND DEPTNO != 20;

-- POINT : oracle ���� ���� ���� (������ ����) >> null ����
-- null �ʿ�� 

-- ȸ������
-- class Member (private int empno;...)

CREATE TABLE MEMBER (
    userid NVARCHAR2(50) NOT NULL, -- �ʼ� �Է� 
    name NVARCHAR2(50) NOT NULL , -- �ʼ� �Է�
    hobby NVARCHAR2(30) -- ���������� default null (���� �Է����� ������ �ڵ����� null�� ������)  
);
DESC MEMBER;

INSERT INTO MEMBER(userid,hobby) values ('hong','��'); -- ORA-01400: NULL�� ("BITUSER"."MEMBER"."NAME") �ȿ� ������ �� �����ϴ�

INSERT INTO MEMBER(userid,name) values ('kim','�浿��'); -- �ڵ����� null ���ڰ� ���� ������ ����� ǥ��

SELECT * FROM MEMBER;

INSERT INTO MEMBER(userid,name,hobby) values('park','�ƹ���','���ڱ�');

SELECT * FROM MEMBER;

-- ����(COMM)�� ���� �ʴ� ��� ����� ������ ����ϼ���
--(0�� ���� �ʴ� ���ε� �ǽ�.. 0�� COMM �޴� ������ ����)
SELECT * FROM EMP WHERE COMM IS NULL;

-- POINT : NULL �� �񱳴� IS NULL , IS NOT NULL 

-- ����(COMM)�� �޴� ��� ����� ������ ����ϼ���
SELECT * FROM EMP WHERE COMM IS NOT NULL;

-- POINT
-- NULL �̶� �༮
-- 1. NULL ���� ��� ������ ����� : NULL 
-- 2. �ذ��� : �Լ� >> nvl 
-- TIP ) ms-sal > null > convert() 
-- TIP ) mysql > null > ifnull()

-- ��� ���̺��� ��� , �̸� ,�޿� , ���� , �ѱ޿�(�޿�+����) �� ����ϼ���
SELECT EMPNO , ENAME , SAL , SAL + nvl(COMM , 0 ) AS "�ѱ޿�" FROM EMP;

SELECT 1000 + null FROM DUAL;

SELECT 1000 + nvl(null,0) FROM DUAL;

SELECT 1000 + nvl(null,1111111) FROM DUAL;

-- ����� �޿��� 1000 �̻��̰� ������ ���� �ʴ� ����� ��� , �̸� , ���� , �޿� , ������ ����ϼ��� 
SELECT EMPNO , ENAME , JOB , SAL , COMM  FROM EMP WHERE SAL >= 1000 AND COMM IS NULL ;

-- ���ڿ� �˻�
 
 -- �ּ� �˻� : �˻��� > ���� �Է� > ���ﵿ , ���￪ , ������� (LIKE �˻�)
 -- ���ڿ� ���� �˻� (Like ������)
 -- ���ϵ� ī�� ���� : l , %(����) , 2 
-- 2._(�ѹ���) ���� �����ؼ� �˻�
 -- �߰��� ����ǥ���� �˻��� ����.
 -- select ename from emp
 -- where ename like '%A%';
--  select ename from emp
--  where ename like 'A%';
--  COMMIT;

--���ڿ��˻�
 -- like ������
 -- ���ڿ� ���� �˻�
 -- ���ϵ�ī�� ����: 1.%(����), 2._(�ѹ���) ���� �����ؼ� �˻�
 -- �߰��� ����ǥ���� �˻��� ����.
 select ename from emp
 where ename like '%A%';
 
select ename from emp
where ename like 'A%';
 
select ename from emp
where ename like '%LL%';

SELECT ENAME FROM EMP
WHERE ENAME LIKE '%_A%'; -- ù���ڴ� ����� �͵� ������� �ι�° ���ڴ� �ݵ�� A ���� ....

select ename from emp
where ename like '%E';

select ename from emp
where ename like '��%';

-- REGEXP_LIKE �˻��� �Դ�
-- Ȱ�� : �Խ��� �� �˻� , �̸� �˻� , ..... ���θ� 

SELECT ENAME FROM EMP
WHERE ENAME LIKE '%A%A%';

SELECT ENAME FROM EMP
WHERE ENAME LIKE '__O%'; -- 3��° ���ڰ� O

-- ������ �����ϱ� 
-- order by �÷��� : ���� , ���� , ��¥ ������ ���� 
-- �������� : asc : ������ (default)
-- �������� : desc : ������

SELECT * FROM EMP
ORDER BY SAL; -- ASC 

-- �޿��� ���� ���� �޴� ������
SELECT * FROM EMP
ORDER BY SAL DESC;

-- �Ի����� ���� ���� ������ �����ؼ� ���, �̸� , �޿� , �Ի����� ����ϼ���
-- (���� �ֱٿ� �Ի��� ������)
SELECT EMPNO , ENAME , SAL , HIREDATE FROM EMP ORDER BY HIREDATE DESC;

SELECT EMPNO , ENAME 
FROM EMP
ORDER BY ENAME ASC;

/*
    ������� 
    SELECT�� 3
    FROM��   1
    WHERE��   2  
    ORDER BY��  4  
*/

-- �ؼ�
-- EMP���̺��� ������ MANAGER �� ������� 
-- ��� , �̸� , ���� , ���� ,�Ի����� �Ի��� �ֱ� ������ ��� 
SELECT EMPNO , ENAME , SAL ,JOB , HIREDATE 
FROM EMP
WHERE JOB ='MANAGER'
ORDER BY HIREDATE DESC;

COMMIT;
