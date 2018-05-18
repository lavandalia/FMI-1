-- 7
INSERT INTO EMP_ACRO
VALUES (501,NULL,'XX','YY',NULL,SYSDATE,10001,NULL,NULL,NULL,300);
 
 UPDATE EMP_ACRO
 SET DEPARTMENT_ID = 300 WHERE EMPLOYEE_ID=501;
 
 -- 8
 INSERT INTO EMP_ACRO (EMPLOYEE_ID,DEPARTMENT_ID,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID)
 VALUES((SELECT MAX(EMPLOYEE_ID) FROM EMPLOYEES)+1,300,'Ana','Cristina',SYSDATE,1001); 
  
-- 9
CREATE TABLE EMP1_ACRO 
AS SELECT *
   FROM EMPLOYEES
   WHERE 1=2;
 
 DESC EMP_ACRO;
 
 select *
 from emp1_acro;
 
INSERT INTO EMP1_ACRO 
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT > 0.25;
 
-- 10
INSERT INTO EMP_ACRO(EMPLOYEE_ID,DEPARTMENT_ID,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT)
VALUES(0, NULL,'TOTAL','TOTAL', SYSDATE, 'TOTAL', (SELECT SUM(SALARY) FROM EMP_ACRO), (SELECT AVG(COMMISSION_PCT) FROM EMP_ACRO));

-- 11
ACCEPT COD;
ACCEPT NUME;
ACCEPT PRENUME;
ACCEPT SALARIU;
INSERT INTO EMP_ACRO(EMPLOYEE_ID, LAST_NAME, FIRST_NAME, SALARY, EMAIL,HIRE_DATE, JOB_ID)
VALUES (&COD, '&&NUME'  , '&&PRENUME' ,  &SALARIU, CONCAT(SUBSTR('&NUME',1,1),SUBSTR('&PRENUME',1,7)), SYSDATE, 10000);


-- 12 
CREATE TABLE EMP2_ACRO
AS SELECT * FROM EMPLOYEES
WHERE 1=2;

CREATE TABLE EMP3_ACRO
AS SELECT * FROM EMPLOYEES
WHERE 1=2;

INSERT FIRST 
WHEN SALARY < 5000 THEN INTO EMP1_ACRO
WHEN SALARY > 5000 AND SALARY < 10000 THEN INTO EMP2_ACRO
WHEN SALARY > 10000 THEN INTO EMP3_ACRO
SELECT * FROM EMPLOYEES;

 select *
 from emp1_acro;
  select *
 from emp2_acro;
  select *
 from emp3_acro;
 
TRUNCATE TABLE EMP1_ACRO;
TRUNCATE TABLE EMP2_ACRO;
TRUNCATE TABLE EMP3_ACRO;

-- 13 
CREATE TABLE EMP0_ACRO
AS SELECT * FROM EMPLOYEES 
WHERE 1=2;

CREATE TABLE EMP1_ACRO
AS SELECT * FROM EMPLOYEES 
WHERE 1=2;

CREATE TABLE EMP2_ACRO
AS SELECT * FROM EMPLOYEES 
WHERE 1=2;

CREATE TABLE EMP3_ACRO
AS SELECT * FROM EMPLOYEES 
WHERE 1=2;

INSERT FIRST 
WHEN (DEPARTMENT_ID=80) THEN INTO EMP0_ACRO
WHEN (SALARY < 5000) THEN INTO EMP1_ACRO
WHEN (SALARY>5000 AND SALARY<10000) THEN INTO EMP2_ACRO
WHEN (SALARY >10000) THEN INTO EMP3_ACRO
SELECT * FROM EMPLOYEES;


-- 14     
UPDATE EMP_ACRO
SET SALARY = SALARY + 0.05*SALARY;
ROLLBACK;

-- 15
UPDATE EMP_ACRO
SET JOB_ID = 'SA_REP'
WHERE DEPARTMENT_ID = 80 AND COMMISSION_PCT > 0;
ROLLBACK;

-- 16
UPDATE DEPT_ACRO
SET MANAGER_ID=(SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE FIRST_NAME='Douglas' AND LAST_NAME='Grant') WHERE
DEPARTMENT_ID=20;

UPDATE EMP_ACRO
SET SALARY=1000+ (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME='Douglas' AND LAST_NAME='Grant')
WHERE FIRST_NAME='Douglas' AND LAST_NAME='Grant';



SELECT * FROM EMPLOYEES;

SELECT *
FROM EMP_ACRO;
ROLLBACK;


 
 select *
 from emp_acro;