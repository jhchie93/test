--그룹함수 (다중행 함수, 집계함수)

SELECT ROUND ( AVG(salary) ) 평균값, MAX(salary) 최대값, MIN(salary) 최소값,  SUM(salary) 합계, COUNT(salary) 카운트
FROM employees
WHERE job_id LIKE '%REP%';

SELECT COUNT(*)
FROM employees;

SELECT COUNT(*)
FROM employees WHERE department_id=80; -- 80번 부서의 직원 수

--그룹함수에서는 NULL값을 제외하고 계산(예외 COUNT(*))
SELECT COUNT(department_id)
FROM employees; --1명이 부서가 없음(사장)

SELECT COUNT (DISTINCT department_id)
FROM employees; --중복되지 않은 부서의 개수

SELECT AVG(commission_pct)
FROM employees; --널값을 제외한모든 직원들의 커미션 평균


--GROUP BY 절 : 특정 그룹으로 나누서 그룹함수를 사용
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id ORDER BY 부서번호;

SELECT * FROM  employees WHERE department_id IS NULL;

--예제1

SELECT department_id 부서번호,
    COUNT(*) 사원수, MAX(salary) 최고급여, MIN(salary) 최소급여, SUM(salary) 급여합계,
    ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id ORDER BY 급여합계 DESC;

--예제2
SELECT department_id 부서번호, job_id 직종, SUM(salary) 급여합계, COUNT(*) 직원수
FROM employees
GROUP BY department_id, job_id ORDER BY 부서번호;

--예제3

SELECT
    AVG(MAX(salary)) 부서별최고월급평균, AVG(MIN(salary)) 부서별최저월급평균
FROM employees
GROUP BY department_id;

--HAVING 조건

SELECT department_id 부서명, COUNT(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

--예제1
SELECT job_id 직종, SUM(salary) 월급여합계
FROM employees WHERE job_id  != 'AC_MGR'
GROUP BY job_id
HAVING AVG(salary) > 10000
ORDER BY 월급여합계 DESC;

--예제2
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary) < 7000;

--예제3
SELECT job_id 직종, SUM(salary) 급여총액
FROM employees WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000 
ORDER BY 급여총액 DESC;