#1
select count(EMP_NO), DEP_NO
from empleados
group by DEP_NO
;

#2
select count(EMP_NO), DEP_NO
from empleados
where ifnull(salario,0) + ifnull(comision,0) > 160000
group by DEP_NO
;

select dnombre, count(*)
from empleados
inner join departamentos
on departamentos.dep_no = empleados.dep_no
where ifnull(salario,0) + ifnull(comision,0) > 160000
group by departamentos.dnombre
;

#?
select municipio, count(*)
from ciudadanos
where autonomia="Galicia"
group by municipio
having count(*) > 25000
;

#3
select dnombre, count(*)
from empleados
inner join departamentos
on departamentos.dep_no = empleados.dep_no
where ifnull(salario,0) + ifnull(comision,0) > 160000
group by departamentos.dnombre
having count(*) >=2
;

#4


#5
select count(*) as "cantidad", oficio as "oficios"
from empleados
group by oficio
;

#6
select sum(ifnull(salario,0)) as "salarios", 
sum(ifnull(comision,0)) as "comisiones", 
sum(ifnull(salario,0)) + sum(ifnull(comision,0)) as "total", dnombre
from empleados
inner join departamentos
on departamentos.dep_no = empleados.dep_no
group by dnombre
;

#7
select count(*) as "clientes", localidad
from clientes
group by localidad
;

#8
SELECT CONCAT(apellido1, " ", apellido2, " ", empleados.nombre) AS "Empleado", 
COUNT(*) AS "Número de clientes"
FROM empleados 
INNER JOIN clientes 
ON empleados.emp_no = clientes.vendedor_no
GROUP BY emp_no;

#9


#12
Select oficio, count(*) as "Numero empleados"
from empleados
group by oficio
having count(*) > 2
order by 2 DESC
;