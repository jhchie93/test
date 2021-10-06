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

-- 변환형 함수
-- 숫자=>문자로 변환

SELECT 
    TO_CHAR(12345678, '999,999,999') 콤마형식,
    TO_CHAR(12345678.678, '999,999,999.99') 콤마소수점형식,
    TO_CHAR(12345678, '$999,999,999') 달러형식,
    TO_CHAR(12345678, 'L999,999,999') 로컬통화
FROM dual;

-- 날짜=>문자로 변환

SELECT 
    TO_CHAR(sysdate, 'YYYY/MM/DD') 날짜표시,
    TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') 시간표시
FROM dual;


--예제1
SELECT employee_id 사원번호, To_CHAR(hire_date, 'MM/YY') 입사월
FROM employees
WHERE department_id = 100;

SELECT last_name 이름 , TO_CHAR(salary, '$999,999,999.99') 월급
FROM employees
WHERE salary > 10000 ORDER BY salary DESC;


--문자열 -> 날짜 변환

SELECT TO_DATE('2021/01/01', 'YYYY/MM/DD')
FROM DUAL;

--문자열 --> 숫자 변환
SELECT TO_NUMBER('0123')+100
FROM DUAL;

--널값 관련 함수(NULL)
--NVL(값, 0) : 만약 값이 NULL이면 0으로 변환

SELECT last_name,NVL( manager_id, 0 )
FROM employees WHERE last_name = 'King';

--NVL2(값, 1, 0) ==> 만약 값이 NULL이 아니면 첫번째, 아니면 두번째
SELECT last_name,NVL2( manager_id, 1, 0 )
FROM employees WHERE last_name = 'King';

--예제1
SELECT last_name 이름, salary 월급, NVL( commission_pct, 0 ) 커미션, (salary * 12) + (salary * 12 * NVL(commission_pct, 0)) 연봉
FROM employees;

--예제2
SELECT 
    last_name 이름, salary 월급,
    NVL( commission_pct, 0 ) 커미션,
    (salary * 12) + (salary * 12 * NVL(commission_pct, 0)) 연봉,
    NVL2(commission_pct, 'SAL+COMM', 'SAL') 연봉계산방식
FROM employees;

--DECODE 함수

SELECT last_name 이름, job_id, salary,
    DECODE(job_id, 'IT_PROG', salary * 1.10,
                'ST_CLERK', salary * 1.15,
                'SA_REP', salary * 1.20,
                salary)수정월급
FROM employees;

--예제1

SELECT last_name 이름, job_id 직무, salary, 
    DECODE(TRUNC(salary/2000), 0, 0,
        1, 0.09,
        2, 0.2,
        3, 0.3,
        4, 0.4,
        5, 0.42,
        6, 0.44,
        0.45)세율
FROM employees;

--CASE 함수:DECODE가 제공하지 못하는 비교연산의 단점을 해결

SELECT last_name 이름, job_id, salary,
    CASE WHEN salary<5000 THEN 'Low'
        WHEN salary<10000 THEN 'Medium'
        WHEN salary<20000 THEN 'Good'
        ELSE 'Excellent'
    END "급여 수준"
FROM employees;

--예제

SELECT employee_id, first_name, last_name, salary,
    CASE WHEN salary >= 9000 THEN '상위급여'
         WHEN salary >= 6000 THEN '중위급여'
         ELSE '하위급여'
    END "급여 등급"
FROM employees;