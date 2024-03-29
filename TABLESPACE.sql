CREATE TABLESPACE TS_P1
DATAFILE 'C:\BD\TS_P1.dbf' SIZE 1M 
AUTOEXTEND ON;

--SEM prefixo C## (Apenas para versões maiores que Oracle Express 11)
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

CREATE USER USER_TS_P1
IDENTIFIED BY aluno
DEFAULT TABLESPACE TS_P1
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON TS_P1;

GRANT DBA TO USER_TS_P1 WITH ADMIN OPTION;