--문제1
SELECT empno,ename,sal FROM EMP WHERE deptno = 10;
--문제2
SELECT empno, ename, sal FROM EMP WHERE empno = 7369;
--문제3
SELECT * FROM EMP WHERE ename = 'ALLEN';
--문제4
SELECT empno, ename, sal FROM EMP WHERE hiredate = '81/02/20';
--문제5
SELECT * FROM EMP WHERE job != 'MANAGER';
--문제6
SELECT * FROM EMP WHERE hiredate > '81/04/02';
--문제7
SELECT ename, sal, deptno FROM EMP WHERE sal >= 800;
--문제8
SELECT * FROM EMP WHERE deptno >= 20;
--문제9
SELECT * FROM EMP WHERE ename > 'L';
--문제10
SELECT * FROM EMP WHERE hiredate < '81/12/09';
--문제11
SELECT empno, ename FROM emp WHERE empno <= 7698;
--문제12
SELECT ename, sal, deptno FROM emp WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';
--문제13
SELECT ename, job, sal FROM emp WHERE sal > 1600 AND sal < 3000;
--문제14
SELECT * FROM emp WHERE empno NOT BETWEEN 7654 AND 7782;
--문제15
SELECT * FROM emp WHERE ename BETWEEN 'B' AND 'J';
--문제16
SELECT * FROM emp WHERE TO_CHAR(hiredate, 'YY') != '81';
--문제17
SELECT * FROM emp WHERE job IN ('MANAGER', 'SALESMAN');
--문제18
SELECT ename, empno, deptno FROM emp WHERE deptno NOT IN (20, 30);
--문제19
SELECT empno, ename, hiredate, deptno FROM emp WHERE ename LIKE 'S%';
--문제20
SELECT * FROM emp WHERE TO_CHAR(hiredate, 'YY') = '81';
--문제21
SELECT * FROM emp WHERE ename LIKE '%S%';
--문제22
SELECT * FROM emp WHERE ename LIKE 'M____N';
--문제23
SELECT * FROM emp WHERE ename LIKE '_A%';
--문제24
SELECT * FROM emp WHERE COMM IS NULL;
--문제25
SELECT * FROM emp WHERE COMM IS NOT NULL;
--문제26
SELECT ename, deptno, sal FROM emp WHERE deptno = 30 AND sal >= 1500;
--문제27
SELECT empno, ename, deptno FROM emp WHERE ename LIKE 'K%' OR deptno = 30;
--문제28
SELECT * FROM emp WHERE (deptno = 30 AND sal >= 1500) AND job='MANAGER';
--문제29
SELECT * FROM emp WHERE deptno = 30 ORDER BY empno;
--문제30
SELECT * FROM emp ORDER BY sal DESC;
--문제31
SELECT * FROM emp ORDER BY deptno, sal DESC;
--문제32
SELECT deptno, ename, sal FROM emp ORDER BY deptno DESC, ename, sal DESC;
--문제33
SELECT ename, sal, sal*0.13 bonus, sal FROM emp WHERE deptno = 10;
--문제34
SELECT ename, sal, NVL(comm, 0) 커미션, sal+NVL(comm, 0) total FROM emp;
--문제35
SELECT ename, sal, TO_CHAR(ROUND(sal*0.15,1), '$999,999.9') 회비
FROM emp 
WHERE sal BETWEEN 1500 AND 3000;
--문제36
SELECT d.dname, COUNT(e.empno) 사원수
FROM dept d
JOIN emp e ON d.deptno = e.deptno
GROUP BY dname
HAVING COUNT(e.empno) > 5;
--문제37
SELECT job, SUM(sal) 급여합계
FROM emp WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal) > 5000;
--문제38 비동등 JOIN
SELECT empno, ename, sal, grade
FROM emp
JOIN salgrade
ON sal BETWEEN losal AND hisal;
--문제39
SELECT deptno, COUNT(empno), COUNT(comm)
FROM emp
GROUP BY deptno;
--문제40 decode 사용
SELECT ename, deptno,
    DECODE(deptno, 10, '총무부',
                   20, '개발부',
                   30, '영업부') 부서명
FROM emp;
--문제40 case 사용
SELECT ename, deptno,
    CASE deptno WHEN 10 THEN '총무부'
                WHEN 20 THEN '개발부'
                WHEN 30 THEN '영업부'
    END 부서명
FROM emp;