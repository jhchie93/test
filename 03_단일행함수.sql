--단일행 함수

--문자 함수
--대소문자 변환
SELECT UPPER('SQL Cource'), LOWER('SQL Course'), INITCAP('SQLCOURE') FROM DUAL;

--문자 조작 함수
SELECT SUBSTR('ABCDEFG', 3, 4), LENGTH('ABCDEFG'), INSTR('ABCDEFG', 'D') FROM DUAL;
SELECT TRIM('   헬로우   ') FROM DUAL; --문자열 제거/기본값은 공백

--예제
SELECT department_id, last_name
FROM employees
WHERE LOWER(last_name) = 'higgins';

SELECT last_name, CONCAT('직업명이 ', job_id) AS 직업명
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP';

SELECT last_name, SUBSTR(last_name, -1, 1) --문자열 가장 끝(-1)
FROM employees;

--문자 치환 함수
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

--예제1
SELECT last_name, UPPER(last_name) 대문자, LOWER(last_name) 소문자, INITCAP(email)
FROM employees;
--예제2
SELECT job_id, SUBSTR(job_id, 1,2) FROM employees;


--숫자형 함수
--반올림 함수 ROUND(숫자, 자릿수), 자릿수 없으면 정수로 반올림.
SELECT ROUND(15.193), ROUND(15.193, 0), ROUND(15.193, 1), ROUND(15.193, 2) From DUAL;

SELECT employee_id 짝수번째, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0
ORDER BY employee_id;


--날씨형 함수

SELECT SYSDATE 현재날짜, ROUND (sysdate, 'DD') 일, ROUND (sysdate, 'MM') 월, Round(sysdate, 'YYYY') 년
, ROUND (MONTHS_BETWEEN('21/10/5', '21/06/10'), 1) 월차이
FROM DUAL;

SELECT hire_date FROM employees;

--날짜에 더하기 빼기를 하면 => 실제 날짜가 더하거나 빼진다.

SELECT sysdate 오늘, sysdate+1 내일, sysdate -1 어제
FROM dual;

--예제1
SELECT sysdate 오늘, hire_date 고용일, MONTHS_BETWEEN(sysdate, hire_date) 고용기간
FROM employees
WHERE department_id = 100;

--예제2
SELECT hire_date, ADD_MONTHS(hire_date, 3 )  , ADD_MONTHS(hire_date, -3) 
FROM employees
WHERE employee_id BETWEEN 100 AND 106;
