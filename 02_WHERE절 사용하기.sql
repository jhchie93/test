--WHERE절

SELECT *
FROM employees
WHERE salary > 14000;

SELECT *
FROM employees
WHERE last_name = 'King';

SELECT *
FROM employees
WHERE hire_date < '02/06/10'; -- 날짜를 비교, 고용일이 2002년 6월 10일 이전

--예제1
SELECT *
FROM employees
WHERE employee_id = 100;

--예제2

SELECT *
FROM employees
WHERE first_name = 'David';

--예제3

SELECT *
FROM employees
WHERE employee_id <= 105;

--예제4

SELECT *
FROM job_history
WHERE start_date > '06/03/03';

--예제5
SELECT *
FROM departments
WHERE location_id != 1700;

-- 논리 연산자 AND OR NOT

SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60 OR (department_id = 80 AND salary > 10000);

SELECT *
FROM employees
WHERE NOT ( hire_date > '04/01/01' or salary > 5000);

--예제1
SELECT *
FROM employees
WHERE salary > 4000 AND job_id = 'IT_PROG';

SELECT *
FROM employees
WHERE salary > 4000 AND (job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT');

--IN 연산자 ()안의 값과 같을 때 OR 
SELECT *
FROM employees
WHERE salary IN (4000, 3000, 2700);

--예제1
SELECT *
FROM employees
WHERE salary IN (10000, 17000, 24000);

SELECT *
FROM employees
WHERE department_id NOT IN (30, 50, 80, 100, 110);

--BETWEEN

SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

--예제1

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--예제2
SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';

--예제3
SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

--LIKE 연산자

SELECT * FROM employees WHERE last_name LIKE 'B%'; --대문자 B로 시작, 뒤는 상관없음.
SELECT * FROM employees WHERE last_name LIKE '%b%'; --문자열 중간에 b가 있으면 전부 출력
SELECT * FROM employees WHERE last_name LIKE '____y'; --언더바는 정확한 자리수를 표현

--예제1
SELECT * FROM employees WHERE job_id LIKE '%AD%';
--예제2
SELECT * FROM employees WHERE job_id Like '%AD___';
--예제3
SELECT * FROM employees WHERE phone_number LIKE '%1234';
--예제4
SELECT * FROM employees WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';
--예제5
SELECT * FROM employees WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';


--IS NULL 연산자
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

--ORDER BY 명령

SELECT * FROM employees ORDER BY employee_id DESC;
SELECT * FROM employees ORDER BY employee_id ASC; --ASC는 생략 가능/기본값

--정렬 열이 2개 이상일때 첫번째 열로 정렬후 두번째 열 정렬
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id;

--별칭으로 정렬
SELECT department_id, last_name, salary*12 연봉
FROM employees ORDER BY  연봉 DESC;

--예제1
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

--예제2
SELECT employee_id, job_id, first_name, last_name, salary
FROM employees
WHERE job_id Like '%CLERK%'
ORDER BY salary DESC;

--예제3
SELECT department_id 부서번호, employee_id 직원번호, first_name || ' ' || last_name 직원이름, salary
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY 부서번호 DESC, salary DESC;




