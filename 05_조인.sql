--조인(JOIN)

--ON을 사용한 기본 조인
SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
    ON e.department_id = d.department_id;
    
--WHERE 절을 이용한 예전방법
SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 3개 테이블 직원 부서 로케이션 테이블 조인하기

SELECT e.employee_id, d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON l.location_id = d.location_id;

--예제
SELECT d.department_name 부서명, l.city 도시, c.country_name 국가
FROM departments d
JOIN locations l ON l.location_id = d.location_id
JOIN countries c ON c.country_id = l.country_id
WHERE l.city IN ('Seattle', 'London') AND c.country_name LIKE 'United%';


--비동등 조인


--자체 조인
SELECT e.last_name 직원, m.last_name 매니저
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id;