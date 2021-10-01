SELECT *
FROM departments;


-- 2. 특정 열만 조회하기
SELECT department_id, department_name
From departments;

SELECT employee_id, first_name, last_name
FROM employees;

-- 3. 별칭 붙이기(열의 이름)
SELECT department_id as 부서번호, department_name 부서이름
FROM departments;


-- 4. 산술 연산자(+,-,*,/)
SELECT first_name 이름, job_id 직책, salary 월급
FROM employees;
-- 월급에 100씩 뺀 열 만들기
SELECT first_name 이름, job_id 직책, salary 월급, salary-100 월급수정
FROM employees;
-- 월급에 10%를 뺀 열 만들기
SELECT first_name 이름, job_id 직책, salary 월급, salary-salary/10 월급수정
FROM employees;
-- 보너스를 주는데 salary에 1000을 뺀 값의 5%로 책정
SELECT first_name 이름, job_id 직책, salary 월급, (salary-1000)*0.05 보너스
FROM employees;

-- distinct : 중복 값을 제거
SELECT DIDISTINCT job_id
FRFROM employees;


--예제1
SELECT employee_id, first_name, last_name
FROM employees;

--예제2
SELECT first_name, salary, salary * 1.1 AS 뉴셀러리
FROM employees;

--예제3
SELECT employee_id AS 사원번호 , first_name 이름 , last_name 성
FROM employees;

--연결 연산자 ||
SELECT last_name || ' is a ' || job_id AS 직업정보
FROM employees;

--예제4
SELECT
    employee_id,
    first_name || ' ' || last_name 이름,
    email || '@company.com' 이메일
FROM employees;





