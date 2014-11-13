select e1.ename as "manager", e2.ename as "employee"
from emp e1, emp e2, dept d, manages m
where e1.eno = m.eno
and m.dno = d.dno
and d.dno = e2.dno
order by manager;
