show user;
--PL-SQL
--PL/SQL �� Oracle's Procedural Language extension to SQL. �� ���� �Դϴ�. 
--SQL���忡�� ��������, ����ó��(IF), �ݺ�ó��(LOOP, WHILE, FOR)���� �����ϸ�, 
--����Ŭ ��ü�� ����Ǿ� �ִ�Procedure Language�Դϴ�
--DECLARE���� �̿��Ͽ� ���ǵǸ�, ������ ����� ���� �����Դϴ�. 
--PL/SQL ���� ��� ������ �Ǿ� �ְ� PL/SQL �ڽ��� ������ ������ ������ �ֽ��ϴ�.

--Tool > ���� > DBMS ���â > + ��ư Ŭ�� > ����� ����(������)
--DBMS ���â : ��Ŭ���� console â

--pl-sql (java : System.out.println()) ��� Ȯ��
--DBMS ��� â����

--1.pl-sql �� ���� ���� �ڹٸ� �ϴ°�ó�� sql�� �� 
BEGIN
  DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
END;

--pl-sql
--�����(����) 
--�����(���� ���� �Ҵ� , �����)
--���ܺ�(Exception)

DECLARE --�����
  vno number(4);
  vname varchar2(20);
BEGIN -- ����� 
  vno := 100; -- �Ҵ� >  String s; s = "ȫ�浿"
  vname := 'kglim';
  DBMS_OUTPUT.PUT_LINE(vno); --ȭ�� ���
  DBMS_OUTPUT.PUT_LINE(vname || '�Դϴ�');
END;

--���� ���� ��� (Ÿ��)
--DECLARE
--v_job varchar2(10);
--v_count number := 10; --�ʱⰪ ����
--v_date date := sysdate + 7; --�ʱⰪ ����
--v_valid boolean not null := true
--------------------------------------------------------------------------------
DECLARE
  vno number(4);
  vname varchar2(20);
BEGIN
   select empno ,ename
      into vno , vname --pl-sql ����ϴ� ���� (into) . ������ [ ������ ��� ]
   from emp
   where empno=7788; --& �ڹ� scanner  ���� (�Է°� �ޱ�)
   
   DBMS_OUTPUT.PUT_LINE('������ : ' || vno || '/' || vname);
END;
 
--�ǽ� ���̺� �����
create table pl_test(
no number ,
name varchar2(20) ,
addr varchar2(50)
);

DECLARE
  v_no number := 1; -- �ʱ�ȭ : ���� ���ʷ� �Ҵ�
  v_name varchar2(20) := 'ȫ�浿';
  v_addr varchar2(50) := '����� ������';
BEGIN
  insert into pl_test(no,name,addr)
  values(v_no , v_name , v_addr);
  commit;
END;

desc emp;

select * from pl_test;  
--���� �����ϱ�(Ÿ��)
--1.1 Ÿ�� : v_empno number(10)
--1.2 Ÿ�� : v_empno emp.empno%TYPE  (emp ���̺� �ִ� empno �÷��� Ÿ�� ��� , v_empno�� number Ÿ���� �ȴ�. )
--1.3 Ÿ�� : v_row emp%ROWTYPE (v_row ������ emp ���̺� ��� �÷� Ÿ�� ����)
--            v_row.empno , v_row.ename , v_row_job , v_row.sal

--QUIZ
--�ΰ��� ������ �Է¹޾Ƽ� �� ����   ������ ��Ƽ� ���



DECLARE -- �����
  v_no1 number := 10;
  v_no2 number := 20;
  result number;
BEGIN -- ����� 
    result := v_no1 + v_no2;
    DBMS_OUTPUT.PUT_LINE('result : ' || result);
END;

--------------------------------------------------------------------------------
DECLARE
  v_emprow emp%ROWTYPE; 
BEGIN
  select *
    into v_emprow -- empno , ename , ,..... deptno
  from emp
  where empno=7788;
  
  DBMS_OUTPUT.PUT_LINE(v_emprow.empno || '-' || v_emprow.ename || '-' || v_emprow.sal); -- 7788 - SCOTT - 3000
END;

--------------------------------------------------------------------------------
create sequence empno_seq
increment by 1
start with 8000
maxvalue 9999
nocycle -- 9999���� ���� �� �ݺ� ���� 
nocache; -- �̸� ��ȣ ������ �ʰ� �׶��׶� ���� 

DECLARE
  v_empno emp.empno%TYPE;
BEGIN
  select empno_seq.nextval
    into v_empno
  from dual;
  
  insert into empdml(empno ,ename)
  values(v_empno,'ȫ�浿');
  commit;
END;

select * from empdml;


create table empdml
as
    select * from emp where 1=2;

--������� ���� ���� , Ÿ�� , �� �Ҵ�
--------------------------------------------------------------------------------
--pl-sql ���
DECLARE
  vempno emp.empno%TYPE;
  vename emp.ename%TYPE;
  vdeptno emp.deptno%TYPE;
  vname varchar2(20) := null;
BEGIN
    select empno , ename , deptno
        into vempno , vename , vdeptno --������ ����ִ´� 
    from emp
    where empno=7788;
    --��� if(���ǹ�){���๮}
    IF(vdeptno = 10) THEN vname := 'ACC'; -- java >> if(vdeptno==10) { vname = "ACC"}
        ELSIF(vdeptno=20) THEN vname := 'IT'; -- elseif
        ELSIF(vdeptno=30) THEN vname := 'SALES';
    END IF;
    DBMS_OUTPUT.PUT_LINE('����� ������ : ' || vname);
END;

--IF() THEN ���๮
--ELSIF() THEN ���๮
--ELSIF() THEN ���๮
--ELSE ���๮ (����)

--����� 7788���� ����� ��� , �̸� , �޿��� ������ ���
--������ ��� �޿��� 2000 �̻��̸� '����� �޿��� BIG' ����ϰ�
--�׷��� ������(ELSE) '����� �޿��� SMALL' �̶�� ����ϼ���

DECLARE
  vempno emp.empno%TYPE;
  vename emp.ename%TYPE;
  vsal   emp.sal%TYPE;
BEGIN
  select empno , ename , sal
      into vempno , vename , vsal
  from emp
  where empno=7788;
  --��� if(���ǹ�){���๮}
    IF(vsal >=  2000) THEN 
         DBMS_OUTPUT.PUT_LINE('����� �޿��� BIG ' || vsal);
    ELSE
         DBMS_OUTPUT.PUT_LINE('����� �޿��� SMALL ' || vsal);
    END IF;
 END;
 
 -------------------------------------------------------------------------------
 --CASE 
DECLARE
  vempno emp.empno%TYPE;
  vename emp.ename%TYPE;
  vdeptno emp.deptno%TYPE;
  v_name varchar2(20);
BEGIN
     select empno, ename , deptno
        into vempno, vename , vdeptno
     from emp
     where empno=7788;
     
--    v_name := CASE vdeptno
          --                WHEN 10  THEN 'AA'
          --                WHEN 20  THEN 'BB'
          --                WHEN 30  THEN 'CC'
          --                WHEN 40  THEN 'DD'
      --              END;

    v_name := CASE 
                              WHEN vdeptno=10  THEN 'AA'
                              WHEN vdeptno in(20,30)  THEN 'BB'
                              WHEN vdeptno=40  THEN 'CC'
                              ELSE 'NOT'
                      END;
    DBMS_OUTPUT.PUT_LINE('����� �μ���:' || v_name);            
END;
--------------------------------------------------------------------------------
--pl-sql (�ݺ���)
--Basic loop
/*
LOOP
  ����;
  EXIT WHEN (���ǽ�)
END LOOP
*/
DECLARE
  n number :=0;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('n value : ' || n);
    n := n + 1; -- 5���Ǹ�
    EXIT WHEN n > 5;  -- 6 > 5 true ���� �ɶ� Ż�� 
  END LOOP;
END;

/*
WHILE(n < 6)
LOOP
   ���๮;
END LOOP
*/
DECLARE
  num number := 0;
BEGIN
  WHILE(num < 6)
    LOOP
      DBMS_OUTPUT.PUT_LINE('num �� : ' || num);
      num := num +1;
    END LOOP;
END;

--for
--java for(int i = 0 ; i <= 10 ; i++) {}
BEGIN
  FOR i IN 0..10 LOOP -- 0 ���� 10 ���� ��� 
    DBMS_OUTPUT.PUT_LINE(i);
  END LOOP;
END;

--�� FOR ���� ����ؼ� (1~100���� ��) ���ϼ���
DECLARE
total number :=0;
BEGIN
  FOR i IN 1..100 LOOP
    total := total + i;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('1~100 ���� : ' || total);
END;

--11g ���� (continue (x))
--11g (continue �߰�)
DECLARE
  total number := 0;
BEGIN
  FOR i IN 1..100 LOOP
    DBMS_OUTPUT.PUT_LINE('���� : ' || i);
    CONTINUE WHEN i > 5; --skip  i�� 5���� ũ�� ������ �ȴ��� ,  1~5������ ������ 
    total := total + i; -- 1 , 2 , 3 , 4, 5
  END LOOP;
    DBMS_OUTPUT.PUT_LINE('�հ� : ' || total);
END;
--------------------------------------------------------------------------------
--Ȱ��
DECLARE
    v_empno emp.empno%TYPE;
    v_name  emp.ename%TYPE := UPPER('smith');
    v_sal   emp.sal%TYPE;
    v_job   emp.job%TYPE;
    v_deptno emp.deptno%TYPE;
BEGIN
  select empno , job ,sal , deptno
    into v_empno, v_job , v_sal , v_deptno
  from emp
  where ename = v_name;
  
  IF v_job IN('MANAGER','ANALYST') THEN
     v_sal := v_sal * 1.5;
  ELSE
     v_sal := v_sal * 1.2;
  END IF;
  
  update emp
  set sal = v_sal
  where deptno=v_deptno;
  
  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || '���� ���� ���� �Ǿ����ϴ�');
  
  --����ó��
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE(v_name || '�� �ڷᰡ �����ϴ�');
    WHEN TOO_MANY_ROWS THEN
       DBMS_OUTPUT.PUT_LINE(v_name || '�� ���� �����Դϴ�');
    WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('��Ÿ ������ �߻��߽��ϴ�');
END;

SELECT * FROM EMP;
rollback;
/*
���Ǵ� �ϳ��� �ุ RETURN �ؾ� �մϴ�. PL/SQL ��� ���� SELECT ������ ���� ��Ģ��
�����ϴ� Embedded SQL �� ANSI ���ֿ� ���մϴ�. ������ ����� �ϳ��� �ุ�� RETURN ��
��  �ϰ�  �ϳ���  ��  �̻�  �Ǵ�  ����  ����  ����  ������  �����մϴ�.  PL/SQL ��
NO_DATA_FOUND �� TOO_MANY_ROWS �� ���ܷ� ����� ���� ���ǿ��� ������ �� �ִ� ǥ�� ��
�ܸ� �����Ͽ� ó�� �մϴ�.
*/
select * from emp where ename='SMITH';
rollback;

-- ���� Ÿ�� ��� �� 
-- pl-sql �⺻ ����  END
--------------------------------------------------------------------------------
-- cursor , procedure , function , Trigger ����ڿ� (��� �ڿ� : )
-- Ʈ��Ŀ �߸�����ϸ� �������� �ٿ�� ���ذ� Ŀ��  

--[ Ŀ�� ]
--���ݱ��� ���� ������ ������ ó�� (��ü row�� �������) - ������� ó���Ѵ� 

--[CURSOR]
--1.  [�����]�� �����͸� ó���ϴ� ����� ����
--2.  �������� �����͸� ó���ϴ� ó���ϴ� ����� ���� (�� ���̻���  row������ ���)
 
--����޿����̺�(�Ǽ�ȸ��)
--������ , �Ͽ��� ,�ð��� 

--���̺� ����
--��� , �̸� , ������ , ���� , �ð� , �ð��� , �Ĵ�
-- 10   ȫ�浿  ������   120    null   null     null
-- 11   ������  �ð���   null   10      100     null
-- 12   �̼���  �Ͽ���   null   null    120     10


--���޿� : if(
-- ������ �ο츶�� �ٸ� ������ �־�� �Ѵ�... ��ü������ sum �ϴ°� �ƴ϶�
-- Ŀ���� ���پ� �ٸ� ������ �������ִ�.


/* ���մ��� ó���� �ѹ��� ���ؼ� �̷� ���� ���྿ �����ؼ� �ؾ��� >> Ŀ�� 
���� ��� (�Ǵ��� ������ : ���� ���� .. row ����)
��� , �̸� , �̹��� �޿��Ѿ�
10    ȫ�浿    (���� :  120 )
11    ������    (�ð�*�ð��� : 10 *100)
12    �̼���    (�ð��� +�Ĵ� : 120+10)
*/


--������
--����
--
--�Ͽ���
--�ð� * �ð���
--
--�ð���
--�ð��� + �Ĵ�


--�� ��ľ� �����ؼ� ������ �������� �����

--if ������  > ���� (�ѱ޿�)
--elsif �ð��� > �ð� * �ð��� (�ѱ޿�)
--elsif �Ͽ��� > �ð��� + �Ĵ� (�ѱ޿�)
 
  
--SQL CURSOR �� �Ӽ��� ����Ͽ� SQL ������ ����� �׽�Ʈ�� �� �ִ�.
--[�� �� �� ��]
  --SQL%ROWCOUNT ���� �ֱ��� SQL ���忡 ���� ������ ���� ���� ��
  --SQL%FOUND ���� �ֱ��� SQL ������ �ϳ� �Ǵ� �� �̻��� �࿡ ������ ��ģ�ٸ� TRUE �� ���Ѵ�.
  --SQL%NOTFOUND ���� �ֱ��� SQL ������ � �࿡�� ������ ��ġ�� �ʾҴٸ� TRUE ��  ���Ѵ�.
  --SQL%ISOPEN PL/SQL �� ����� �Ŀ� ��� �Ͻ��� Ŀ���� �ݱ� ������ �׻� FALSE �� �򰡵ȴ�.
  
/*
   DECLARE
          CURSOR Ŀ���̸� IS ����(Ŀ���� ������ ����)
   BEGIN
         OPEN Ŀ���̸� (Ŀ���� ������ �ִ� ������ ����)
             
         FETCH Ŀ���̸� INTO �������... ������ ���忡 ���� �ϴ� �� 
          --Ŀ���� ���� �����͸� �о ���ϴ� ������ ����
         CLOSE Ŀ���̸� (Ŀ���ݱ�) 
   END


*/
DECLARE -- ���� 
  vempno emp.empno%TYPE;
  vename emp.ename%TYPE;
  vsal   emp.sal%TYPE;
  CURSOR c1  IS select empno,ename,sal from emp where deptno=30; -- cl Ŀ���� �����ϸ� IS select ������ ����ȴ�. 
BEGIN
    OPEN c1; --Ŀ���� ������ �ִ� ���� ���� -- IS select empno,ename,sal from emp where deptno=30; �޸� �����Ͱ� �ö󰣴�  
    LOOP  --������ row �Ǽ� ��ŭ �ݺ�
      --Memory
      /*
        7499 ALLEN 1600
        7521 WARD 1250
        7654 MARTIN 1250
        7698 BLAKE 2850
        7844 TURNER 1500
        7900 JAMES 950
      */
      FETCH c1 INTO vempno , vename, vsal; -- Ŀ���� �����̸鼭 ������ ������� ������ �ϳ��� ������ 7499 ALLEN 1600 �ִ´�. 
      EXIT WHEN c1%NOTFOUND; --���̻� row �� ������ NOTFOUND ������ Ż�� 
        DBMS_OUTPUT.PUT_LINE(vempno || '-' || vename || '-'|| vsal);
    END LOOP;
    CLOSE c1;
END;
-------------------------------------------------------
--�� ǥ���� �� �� �����ϰ�
--java (for(emp e : emplist){}
DECLARE
  CURSOR emp_curr IS  select empno ,ename from emp;
BEGIN
    FOR emp_record IN emp_curr  --row ������ emp_record���� �Ҵ� , IN emp_curr �� �� �ο� ��ü�� ������. 
    LOOP
      EXIT WHEN  emp_curr%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(emp_record.empno || '-' || emp_record.ename);
    END LOOP;
    CLOSE emp_curr;
END;

--------------------------------------------------------------------------------
--java (for(emp e : emplist){}

DECLARE
  vemp emp%ROWTYPE; --Type ����
  CURSOR emp_curr IS  select empno ,ename from emp;
BEGIN
  FOR vemp IN emp_curr  --row ������ emp_record���� �Ҵ�
    LOOP
      EXIT WHEN  emp_curr%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(vemp.empno || '-' || vemp.ename);
    END LOOP;
    CLOSE emp_curr;
END;
-------------------------------------------------
DECLARE
  v_sal_total NUMBER(10,2) := 0; -- ���� 10�ڸ� �Ҽ� 2�ڸ� ���� 
  CURSOR emp_cursor
  IS SELECT empno,ename,sal FROM emp
      WHERE deptno = 20 AND job = 'CLERK'
     ORDER BY empno;
BEGIN
  DBMS_OUTPUT.PUT_LINE('��� �� �� �� ��');
  DBMS_OUTPUT.PUT_LINE('---- ---------- ----------------');
  FOR emp_record IN emp_cursor 
  LOOP
      v_sal_total := v_sal_total + emp_record.sal; -- �޿��� �� 
      
      
      DBMS_OUTPUT.PUT_LINE(RPAD(emp_record.empno,6) || RPAD(emp_record.ename,12) || -- ��� �̸� �޿� ��� 
                           LPAD(TO_CHAR(emp_record.sal,'$99,999,990.00'),16));
  END LOOP;
      
      DBMS_OUTPUT.PUT_LINE('----------------------------------');
      DBMS_OUTPUT.PUT_LINE(RPAD(TO_CHAR(20),2) || '�� �μ��� �� ' || -- ��ü �μ��� �� 
      LPAD(TO_CHAR(v_sal_total,'$99,999,990.00'),16));
END;

--------------------------------------------------------------------------------
select * from emp where deptno=20 and job='CLERK';


create table cursor_table
as
  select * from emp where 1=2;

select* from cursor_table;  

alter table cursor_table
add totalsum number;

--����
--emp ���̺���  �������  ��� , �̸� , �޿��� ������
--�ͼ� cursor_table insert �� �ϴµ� totalsum �� �޿� + comm ���ؼ�
--�μ���ȣ�� 10�� ����� totalsum�� �޿� ������ ��������
--������ ó��
--
insert into CURSOR_TABLE(empno,ename,sal,totalsum)
select empno , ename , sal , sal+nvl(comm,0)
from emp where deptno=20;

select *  from CURSOR_TABLE;
commit;

delete from cursor_table;
commit;

select * from cursor_table;

DECLARE
    result number := 0;
    CURSOR emp_curr IS select empno, ename, sal,deptno,comm from emp;
  BEGIN
    FOR vemp IN emp_curr   --row ������ emp_record ������ �Ҵ�
    LOOP
        EXIT WHEN emp_curr%NOTFOUND;
        IF(vemp.deptno = 20) THEN 
              result := vemp.sal+nvl(vemp.comm,0);
              insert into cursor_table(empno, ename, sal,deptno,comm,totalsum) 
              values (vemp.empno,vemp.ename, vemp.sal,vemp.deptno,vemp.comm,result);
        ELSIF(vemp.deptno = 10) THEN 
              result := vemp.sal;
              insert into cursor_table(empno, ename, sal,deptno,comm,totalsum) 
              values (vemp.empno,vemp.ename, vemp.sal,vemp.deptno,vemp.comm,result);
        ELSE
            DBMS_OUTPUT.PUT_LINE('ETC');
        END IF;
     END LOOP;   
  END;

rollback;
commit;


select * from cursor_table order by deptno;


--PL-SQL Ʈ����� �� ���� ó���ϱ�
 DECLARE
    v_ename emp.ename%TYPE := 'SMITH';
    v_err_code NUMBER;
    v_err_msg VARCHAR2(255);
    BEGIN
          DELETE emp WHERE ename = v_ename; -- ���� �Է¹����� ����� 
          
          IF SQL%NOTFOUND THEN -- ���� �������� �����͸� �߰����� �ʴ´ٸ� 
                 RAISE_APPLICATION_ERROR(-20002,'my no data found'); --����ڰ� ���� ����� (���� ���� ������)
          END IF;
       EXCEPTION -- ���ܰ� �߻��ϸ� 
        WHEN OTHERS THEN
            ROLLBACK;
              v_err_code := SQLCODE;
              v_err_msg := SQLERRM;
              DBMS_OUTPUT.PUT_LINE('���� ��ȣ : ' || TO_CHAR(v_err_code));
              DBMS_OUTPUT.PUT_LINE('���� ���� : ' || v_err_msg);
      END;
        
rollback;        
select* from emp where ename ='SMITH';        
        
select * from c_dept;
select *from SYS.USER_CONSTRAINTS where TABLE_NAME ='C_DEPT';

select * from c_emp;
select *from SYS.USER_CONSTRAINTS where TABLE_NAME ='C_EMP';        
select * from emp where ename ='KING';

delete from c_dept where deptno=300;


delete from emp where ename='SMITH';
--------------------------------------------------------------------------------
--���ݱ��� ������� �۾��� ���������� ���� ���� �ʾҴ� 
--crerate table , create view 
--���� ������ ���� [Ŀ��]�� ���������� ���� (��ü)
--��ü ���·� ���� �س����� �� �������� �ڵ����� �ʰ� [�ҷ� ���]

--Oracle : subprogram(procedure)
--Ms-sql : procedure

--���� ���Ǵ� ������ ���ȭ ���Ѽ� ��ü�� �����ϰ� 
--�ʿ��� ������ �ҷ�(ȣ��) �ؼ� ����ϰڴ� <- ���ν��� ����Ʈ 

--sp
--usp

create or replace procedure usp_emplist   --create or replace (���� ���� , ���� ����)
is
  BEGIN
    update emp
    set job = 'TTT'
    where deptno=30;
  END;

--������
execute usp_emplist;

select * from emp where deptno=30;
rollback;

--procedure  ����
--���� : APP(emp.java > select .... ����)    ->��Ʈ��ũ > DB���� > selet... > DB��
--���� : APP(emp.java > usp_emplist ����)    ->��Ʈ��ũ > DB���� > usp_emplist > DB��

--1.���� : ��Ʈ��ũ Ʈ���� ����(�ð� ����)
--2.���� : ���� (��Ʈ��ũ �󿡼� ...���� ���)�ذ�


--procedure 
--parameter  ��밡��
--���� : INPUT  , OUTPUT
create or replace procedure usp_update_emp -- replace ���������ϰ� 
(vempno emp.empno%TYPE) -- ���� Ÿ���� ���� 
is
  BEGIN
    update emp
    set sal = 0
    where empno = vempno;
    
  END;
--������
exec usp_update_emp(7788); --> ��Ʈ��ũ > DB ���� > usp_update_emp > DB�� 

select * from emp where empno = 7788;
rollback;

--------------------------------------------------------------------------------
create or replace procedure usp_getemplist
(vempno emp.empno%TYPE)
is
  --���ο��� ����ϴ� ����
  vname emp.ename%TYPE;
  vsal  emp.sal%TYPE;
  BEGIN
      select ename, sal
        into vname , vsal
      from emp
      where empno=vempno;
      
      DBMS_OUTPUT.put_line('�̸��� : ' || vname);
      DBMS_OUTPUT.put_line('�޿��� : ' || vsal);
  END;

exec usp_getemplist(7902);
exec usp_getemplist(7788);
--------------------------------------------------------------------------------
-- procedure  �� parameter  ���� 2����   (JDBC procedure call) 
--1. input paramter : ���� �ݵ��  �Է�          (IN : �����ϴ� default)
--2. output parmater : ���� �Է°��� ���� �ʾƿ� (OUT)
create or replace procedure app_get_emplist
(
  vempno IN emp.empno%TYPE, -- in ����� ���ν��� �����Ҷ� �ݵ�� ���� �־��ּ���.
  vename OUT emp.ename%TYPE, -- out ����� ���ν��� �����ϸ� ���� ��ſ��� �������� �����ش�.  
  vsal   OUT emp.sal%TYPE
)
is
  BEGIN
    select ename, sal
      into vename , vsal
    from emp
    where empno=vempno;
  END;

--����Ŭ ���� �׽�Ʈ 
DECLARE
  out_ename emp.ename%TYPE;
  out_sal   emp.sal%TYPE;
BEGIN
   app_get_emplist(7902,out_ename,out_sal);
   DBMS_OUTPUT.put_line('��°� : ' || out_ename || '-' || out_sal);
END;

CREATE OR REPLACE PROCEDURE usp_EmpList
(
  p_sal IN number,
  p_cursor OUT SYS_REFCURSOR --APP ����ϱ� ���� Ÿ�� (�Ѱ��̻��� ������ select ���������� cursor ��� , �������� �����͸� �޴� Ÿ�� 
)
IS
 BEGIN
     OPEN p_cursor -- ��ȸ �ϴ� ���ν��� 
     FOR  SELECT empno, ename, sal FROM EMP WHERE sal > p_sal;
  END;

create table usp_emp
as
    select * from emp;

alter table usp_emp
add constraint pk_usp_emp_empno primary key(empno);

select * from SYS.USER_CONSTRAINTS where table_name='USP_EMP';

CREATE OR REPLACE PROCEDURE usp_insert_emp
(
 vempno IN emp.empno%TYPE,
 vename IN emp.ename%TYPE,
 vjob   IN emp.job%TYPE,
 p_outmsg OUT VARCHAR2
 )
 IS
   BEGIN
      INSERT INTO USP_EMP(empno , ename, job) VALUES(vempno ,vename , vjob);
      COMMIT;
        p_outmsg := 'success';
        EXCEPTION WHEN OTHERS THEN
        p_outmsg := SQLERRM;
        ROLLBACK;
    END;

DECLARE
  out_msg varchar2(200);
BEGIN
   usp_insert_emp(7902,'ȫ�浿','IT',out_msg);
   DBMS_OUTPUT.put_line('��°� : ' || out_msg);
END;

select * from USP_EMP;

---------------------�⺻ procedure END-----------------------------------------
--[����� ���� �Լ�]
--to_char() , sum() ����Ŭ���� ����
--����ڰ� ���� �ʿ��� �Լ��� ����� ��밡��
--������� �ٸ� �Լ������� ����
--����� ���� �Լ� paramter  ���� , return ��

-- public int f_max_sal(int deptno) { return 10;}

create or replace function f_max_sal
(s_deptno emp.deptno%TYPE) -- int deptno ���� Ÿ�� 
return number   --  int ���ϵǴ� ��   public int f_max_sal(int deptno) {  return 10}
is
  max_sal emp.sal%TYPE;
BEGIN
      select max(sal)
          into max_sal
      from emp
      where deptno = s_deptno;
      return max_sal;
END;

---
select * from emp where sal = f_max_sal(10);

select max(sal) , f_max_sal(30) from emp;
--
create or replace function f_callname
(vempno emp.empno%TYPE)
return varchar2 -- public String f_callname() {  String  v_name; return "ȫ�浿"}
is
  v_name emp.ename%TYPE;
BEGIN
    select ename || '��'
      into v_name
    from emp
    where empno=vempno;
    return v_name;
END;

select f_callname(7788) from dual;

select empno, ename , f_callname(7788) , sal
from emp
where empno=7788;

select empno, ename , f_callname(empno) , sal
from emp
where empno=7788;

--�Լ� 
--parmater  ����� �Է¹޾Ƽ� ����� �ش�Ǵ� �μ��̸��� �����ϴ� �Լ�
create or replace function f_get_dname
(vempno emp.empno%TYPE)
return varchar2
is
    v_dname dept.dname%TYPE;
  BEGIN
    select dname
      into v_dname
    from dept
    where deptno = (select deptno from emp where empno=vempno);
    return v_dname;
  END;

select empno , ename ,deptno, f_get_dname(empno)
from emp 
where empno=7788;
--------------------------function END------------------------------------------

--[Ʈ���� : Trigger] - JDBC���� ����Ҽ��ִ�.Ŀ���� Ʈ���Ŵ� ���ø����̼� �ڹ� ������� ���δ�.  ���ν����� �ڹٸ� �̿� 
--Ʈ����(trigger)�� �������� �ǹ̴� ��Ƽ質 (��Ƽ踦) ���, �߻��ϴ�, - B���̺� Ʈ���Ÿ� �ɰ� ���� ��� A���̺� ������ ��ġ�� B�� ������ ��ħ
--(�����) ���߽�Ű�ٶ�� �ǹ̰� �ִ�.
 
--[�԰�]    [���]     [���]
 
--�԰� INSERT (���������� [Ʈ�����]�� ���� - ) ���μ��� ������ �����ڿ��� �ϳ��� ���μ����� ���ʴ�� ����Ҽ��ֵ��� LOCK�� �Ǵ� -> ������ ���̰� ������ ����
--��� INSERT
--����δ� : lock 

-- Ʈ������� ���⼭���� �ű���� �۾�������  �ѻ���� ���� �� ���ٰ� ���;� �ٸ������ ���� �����ִ�. - ���� �ɸ��� �ڱ��� ���� �ɷ��� ������.
-- Ʈ���Ű� ���������� Ʈ������� �־ �ٸ�������� ��� �Ѵ�. 
 
-- �԰� ������ ����ʿ� �� 
 
--PL/SQL������ Ʈ���� ���� ��Ƽ谡 ������� �ڵ����� �Ѿ��� �߻�ǵ���
--��� �̺�Ʈ�� �߻��ϸ� �׿� ���� �ٸ� �۾��� �ڵ����� ó���Ǵ� ���� �ǹ��Ѵ�.
/*
Ʈ���Ŷ� Ư�� ���̺��� �����Ϳ� ������ �������� �� �ڵ����� ����Ǵ�
[���� ���ν���]��� �� �� �ִ�.
�ռ� ��� ���� ���ν����� �ʿ��� ������ ����ڰ� ����
 EXECUTE ��ɾ�� ȣ���ؾ� �ߴ�.
������ Ʈ���Ŵ� �̿� �޸� ���̺���
�����Ͱ� INSERT, UPDATE, DELETE ���� ���� ����Ǿ��� ��
[ �ڵ����� ����ǹǷ� �� ����� �̿��ϸ� ���� ���� �۾� ] �� �� �� �ִ�.
�̷� ������ Ʈ���Ÿ� ����ڰ� ���� �����ų ���� ����.
 
 --�ڵ�(insert, update ,delete)�̺�Ʈ�� �߻��ϸ�  �ڵ�����  ����Ǵ� procedure ...
 
 
 
--BEFORE : ���̺��� DML ����Ǳ� ���� Ʈ���Ű� ���� - insert, update ,delete �����ϱ� ����  (�����Ͱ� ���� ���� �����ϴ� Ʈ����)
--AFTER :  ���̺��� DML �����Ŀ� Ʈ���� ���� - ���� insert �� �ǰ��� ����  ( �����Ͱ� ���� �����ϴ� Ʈ����)
 
Syntax
CREATE [OR REPLACE] TRIGGER trigger_name
{BEFORE | AFTER} triggering_event [OF column1, . . .] ON table_name
[FOR EACH ROW [WHEN trigger_condition] -- ����࿡ �ݿ��Ұ��ΰ� �ѹ��� �ݿ��� ���ΰ�. 
trigger_body;
 
trigger_name TRIGGER �� �ĺ���
  BEFORE | AFTER DML ������ ����Ǳ� ���� TRIGGER �� ������ ������ �����
  �Ŀ� TRIGGER �� ������ �������� ����
triggering_event 
TRIGGER �� �����ϴ� DML(INSERT,UPDATE,DELETE)���� ����Ѵ�.
 
OF column TRIGGER �� ����Ǵ� ���̺��� COLUMN ���� ����Ѵ�.
 
table_name TRIGGER �� ����Ǵ� ���̺� �̸�
 
FOR EACH ROW �� �ɼ��� ����ϸ� 
�� ���� Ʈ���Ű� �Ǿ� triggering ����
�� ���� ������� �࿡ ���� ���� �ѹ��� �����ϰ� �������
������ ���� ���� Ʈ���Ű� �Ǿ� DML ���� �� �ѹ��� ����ȴ�.
 
 
  TRIGGER ���� OLD �� NEW
    �� ���� TRIGGER ������ ����� �� �ִ� ������ Ʈ���� ������ ���� ó���ǰ� �ִ� ��
    �� �׼����� �� �ִ�. �� �ΰ��� �ǻ� ���ڵ带 ���Ͽ� �� �۾��� ������ �� �ִ�. :OLD
    �� INSERT ���� ���� ���ǵ��� �ʰ� :NEW �� DELETE �� ���� ���ǵ��� �ʴ´�. �׷���
    UPDATE �� :OLD �� :NEW �� ��� �����Ѵ�. �Ʒ��� ǥ�� OLD �� NEW ���� ������ ǥ�̴�. 
    ���� :OLD :NEW
    INSERT ��� �ʵ�� NULL �� ���� ������ ������ �� ���Ե� ���ο� ��
    UPDATE �����ϱ� ���� ���� �� ������ ������ �� ���ŵ� ���ο� ��
    DELETE ���� �����Ǳ� ���� ���� �� ��� �ʵ�� NULL �̴�.
 
DROP TRIGGER ��ɾ�� Ʈ���Ÿ� ������ �� �ְ� TRIGGER �� ��� disable �� �� �ִ�.
DROP TRIGGER trigger_name;
ALTER TRIGGER trigger_name {DISABLE | ENABLE};
TRIGGER �� DATA DICTIONARY
TRIGGER �� ������ �� �ҽ� �ڵ�� ������ ���� VIEW �� user_triggers �� ����ȴ�. ��
VIEW �� TRIGGER_BODY, WHERE ��, Ʈ���Ÿ� ���̺�, TRIGGER Ÿ���� ���� �Ѵ�.
 
*/
create table tri_emp
as
  select empno , ename from emp where 1=2;


select * from tri_emp;

create or replace trigger tri_01 -- INSRT ���� �����ϴ� Ʈ���� 
after insert on tri_emp -- INSERT ���� �����ϴ� Ʈ���� 
BEGIN -- �ڵ� ������ ����
    DBMS_OUTPUT.PUT_LINE('���Ի�� �Ի�'); -- �������� �����ϴ� Ʈ���� 
END;

insert into tri_emp(empno,ename) values(100,'ȫ�浿'); -- INSERT -> Ʈ���� '���Ի�� �Ի�' ��� 
select * from tri_emp;

create or replace trigger tri_02
after update on tri_emp -- tri_02�� update ������ 
BEGIN
  DBMS_OUTPUT.PUT_LINE('���Ի�� ����'); -- �ڵ����� ����� 
END;


--���̺� trigger ����
select * from user_triggers where table_name='TRI_EMP';

insert into tri_emp values(100,'������');

update tri_emp
set ename='����'
where empno=100;


--delete Ʈ���� : tri_emp
--������̺� ���� (ȭ�� ���)
create or replace trigger tri_03
after delete on tri_emp
BEGIN
  DBMS_OUTPUT.PUT_LINE('���Ի�� ����');
END;

insert into tri_emp values(200,'ȫ�浿');
update tri_emp set ename='����' where empno= 200;
delete from tri_emp where empno=200;
-----------------------------------------------------------------------------
--����1) ���̺� INSERT, UPDATE, DELETE �� �� �� user, ����(I,U,D), sysdate �� ����ϴ� 
--���̺�(emp_audit)�� ������ �����Ѵ�.
--FOR EACH ROW �� �ɼ��� ����ϸ� -  ���� �����͸� ���������� �Ѱ��� �������� Ʈ���� �ѹ� ����
                            -- FOR EACH ROW �� 10���� ���� �ϸ� 10���� Ʈ���� �߻� 
--�� ���� Ʈ���Ű� �Ǿ� triggering ����
--�� ���� ������� �࿡ ���� ���� �ѹ��� �����ϰ� �������
--������ ���� ���� Ʈ���Ű� �Ǿ� DML ���� �� �ѹ��� ����ȴ�.


drop sequence emp_audit_tr;
drop table emp_audit;


-- �����丮 ���̺�  0 �α� ���� - ���� ���� �Է� ���� �ߴ��� 
create sequence emp_audit_tr
 increment by 1
 start with 1
 maxvalue 999999
 minvalue 1
 nocycle
 nocache;

create table emp_audit(
 e_id number(6) constraint emp_audit_pk primary key,
 e_name varchar2(30),
 e_gubun varchar2(10),
 e_date date);


drop table emp2;
create table emp2
as
    select * from emp;

create or replace trigger emp_audit_tr
 after insert or update or delete on emp2 -- emp2���̺�  insert �Ǵ� update �Ǵ� delete �Ҷ�
 for each row -- Ʈ���� �Ǵ� Ƚ����ŭ 10���� ���� �ϸ� 10���� Ʈ���� �߻� 


begin
 if inserting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'inserting', sysdate);
 elsif updating then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'updating', sysdate);
 elsif deleting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'deleting', sysdate);
 end if;
end;

-- for each row ���� ������ �� (��ɾ� �� ���� ���Ͽ� �� ������ ��ϵȴ�.)
select * from emp2;
rollback;


update emp2 
set deptno = 1111
where deptno = 10;

select * from emp_audit;

delete from emp2 where deptno = 20; 

select * from emp_audit;

rollback;

-- for each row ���� ���� ��(��ɾ� �� ���� ����� �ุŭ ��ϵȴ�.)
create or replace trigger emp_audit_tr
 after insert or update or delete on emp2
 for each row
begin
 if inserting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'inserting', sysdate);
 elsif updating then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'updating', sysdate);
 elsif deleting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'deleting', sysdate);
 end if;
end;

select * from emp2;
update emp2 set deptno = 20 where deptno = 10;

select * from emp_audit;


--------------------------------------------------------------------
--INSERT, UPDATE, DELETE�� ����Ǵ� ���뿡 ���Ͽ� ��/�� �����͸� ����Ѵ�.
drop table emp_audit;

create table emp_audit (
 id number(6) constraint emp_audit_pk primary key,
 name varchar2(30),
 gubun varchar2(10),
 wdate date,
 etc1 varchar2(20),  -- old
 etc2 varchar2(20)   -- new
);

-- old , new �������̺� 
 -- insert , update �������ִ� �����͸� ����� ���γִ�.. , delete
   -- �������� �����͵� ���� ���Ӱ� ���� �����͵� ����
  -- �׷��� old , new �� ���� 
create or replace trigger emp_audit_tr -- replae �������  Ʈ���� ���� 
 after insert or update or delete on emp2
 for each row
begin
 if inserting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'inserting', sysdate, :old.deptno, :new.deptno); 
 elsif updating then
    insert into emp_audit
    values(emp_audit_tr.nextval, user, 'updating', sysdate, :old.deptno, :new.deptno);

 elsif deleting then
    insert into emp_audit
    values(emp_audit_tr.nextval, user, 'deleting', sysdate, :old.deptno, :new.deptno);
 end if;
end;


select* from emp2;

--insert
insert into emp2(empno,ename,deptno) values (9999,'ȫ�浿',100);
select * from emp_audit;

--update
update emp2 set deptno=200
where empno=9999;
select * from emp_audit;

--delete
delete from emp2 where empno=9999;
select * from emp_audit;

--------------------------------------------------------------------------------
--Ʈ������ Ȱ��
create table tri_order
(
  no number,
  ord_code varchar2(10),
  ord_date date
);

--before Ʈ����(����Ʈ����) �� ���۽����� ���� tri_order ���̺� insert �Ǳ� ����
--Ʈ���� ���� ���� �� ���� insert �۾�
-- �����Ͱ� ���°� ���Ƴ����ִ�. 
create or replace trigger trigger_order
before insert on tri_order
BEGIN
  IF(to_char(sysdate,'HH24:MM') not between '11:00' and '18:00') THEN
     RAISE_APPLICATION_ERROR(-20002, '���ð� ���� ������');
  END IF;
END;

insert into tri_order values(1,'notebook',sysdate);
select * from tri_order;
commit;
rollback;
--Ʈ���� ����
drop trigger trigger_order;


--POINT
--PL_SQL �ΰ��� ��������(���̺�) ����
--:OLD > Ʈ���Ű� ó���� ���ڵ��� ���� ���� ���� (ms-sql (deleted)
--:NEW > ������ ����                         (ms-sql (inserted)

-- update�� ���� �� ? ������ ����� ���� �����ϱ� delete �� insert �� ������ �� 
create or replace trigger tri_order2
before insert on tri_order
for each row
BEGIN
  IF(:NEW.ord_code) not in('desktop') THEN -- ������ ��ǰ�� desktop �̾�� �Ѵ�.
     RAISE_APPLICATION_ERROR(-20002, '��ǰ�ڵ� ����');
  END IF;
END;

select * from tri_order;

--���� (desktop)
insert into tri_order values(200,'notebook',sysdate);

insert into tri_order values(200,'desktop',sysdate);

select * from tri_order;
commit;

--------------------------------------------------------------------------------
--�԰� , ���

create table t_01 --�԰�
(
  no number,
  pname varchar2(20)
);

create table t_02 --���
(
  no number,
  pname varchar2(20)
);

--�԰� ������ ������ ���� �����͸� ��� �Է�
create or replace trigger insert_t_01
after insert on t_01
for each row
BEGIN
  insert into t_02(no, pname)
  values(:NEW.no ,:NEW.pname); -- insert �� �����Ǵ°� new �� �����ȴ�. 
END;

--�԰�
insert into t_01 values(1,'notebook');

select * from t_01;
select * from t_02;

-- �԰� ��ǰ�� ���� (��� ����)
create or replace trigger update_t_01
after update on t_01
for each row
BEGIN
  update t_02
  set pname = :NEW.pname -- ���Ӱ� ������ �����͸� new 
  where no = :OLD.no;
END;

update t_01
set pname = 'notebook2'
where no = 1;

select * from t_01;
select * from t_02;

--delete Ʈ���� ����� ������ 
--�԰� ������ delete from t_01 where no =1 ���� �Ǹ� ��� ����
create or replace trigger delete_tri_01
after delete on t_01
for each row
BEGIN
  delete from t_02
  where no=:OLD.no;
END;

delete from t_01 where no=1;

select* from t_01;
select* from t_02;

commit
--------------------------------------------------------------------------------
-- ����ߴ� ��� ��� ---------------------------------------------------------------------
