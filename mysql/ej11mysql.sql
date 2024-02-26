Select NOMBRE, APELLIDO1, APELLIDO2, SALARIO, OFICIO
from empleados e1
where e1.SALARIO >= ALL (
	select max(SALARIO)
    from empleados e2
    where e2.oficio = e1.oficio
    )
    order by OFICIO
;

select DESCRIPCION, PRECIO_ACTUAL
from productos
where PRECIO_ACTUAL >= ALL (
	select MAX(PRECIO_ACTUAL)
    FROM productos
    )
;

Select NOMBRE, SALARIO, OFICIO
from empleados e1
where OFICIO <> "PRESIDENTE" and e1.SALARIO = (
	select max(SALARIO)
    from empleados e2
    where e2.oficio = e1.oficio
    )
order by OFICIO
;

Select NOMBRE, SALARIO, DEP_NO
from empleados e1
where SALARIO < (
	select avg(SALARIO)
    from empleados e2
    where e1.dep_no = e2.dep_no
	)
;

Select c1.NOMBRE, e1.NOMBRE, count(*)
from clientes c1 natural join pedidos p1, empleados e1
group by e1.EMP_NO, c1.CLIENTE_NO
having count(*) >= ALL (
	(select count(*)
    from clientes c2 natural join pedidos p2, empleados e2
    where e1.EMP_NO = e2.EMP_NO
    group by e2.EMP_NO, c2.CLIENTE_NO)
	)
;

SELECT e1.apellido1 AS 'Empleado', c1.nombre AS 'Cliente', COUNT(*) AS 'Número de Pedidos'
FROM (empleados e1 INNER JOIN clientes c1 on e1.emp_no = c1.vendedor_no) INNER JOIN pedidos p1 ON p1.cliente_no = c1.cliente_no
GROUP BY e1.emp_no, c1.cliente_no
HAVING COUNT(*) >= ALL (
    (SELECT  COUNT(*)
    FROM (empleados e2 INNER JOIN clientes c2 on e2.emp_no = c2.vendedor_no) INNER JOIN pedidos p2 ON p2.cliente_no = c2.cliente_no
    WHERE e1.emp_no = e2.emp_no
    GROUP BY e2.emp_no, c2.cliente_no)
);
