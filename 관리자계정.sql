SELECT SYSDATE FROM DUAL;

--SCOTT 계정을 설치 및 비번정하기

@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql;

ALTER USER scott ACCOUNT UNLOCK
IDENTIFIED BY 1234;