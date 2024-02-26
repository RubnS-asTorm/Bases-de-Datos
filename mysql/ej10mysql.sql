#######SUBCONSULTAS#######

#1
Select *
from empleados
where OFICIO = 
	(Select OFICIO
	from empleados
	where APELLIDO1 = "ALONSO")
;

#2
Select *
from empleados
where salario > 
	(Select MAX(SALARIO)
	from empleados
	where DEP_NO = 30)
;

#3
Select count(DEP_NO)
from empleados
where OFICIO = "VENDEDOR" and dep_no =
	(Select DEP_NO
	from departamentos
	where DNOMBRE = "VENTAS")
;

Select count(*)
from empleados
natural join departamentos
where DNOMBRE = "VENTAS" and OFICIO = "VENDEDOR"
;

#4
Select oficio, sum(ifnull(salario,0))
from empleados
where DEP_NO = (
	Select dep_no
	from departamentos
	where dnombre = "VENTAS"
    )
group by oficio
;

#5
Select *
from empleados
natural join departamentos
where localidad not in ("MADRID","BARCELONA")
;

Select *
from empleados
natural join departamentos
where localidad <> "MADRID" and localidad <> "BARCELONA"
;

#6
Select dnombre
from departamentos
where DEP_NO in
	(Select dep_no
	from empleados
	where FECHA_ALTA < "1982-01-01")
;

#7
Select *
from departamentos
where DEP_NO in
	(Select DEP_NO
	from empleados
    group by DEP_NO
    having count(*) > 2)
;

#8
Select LOCALIDAD
from departamentos
where DEP_NO IN (
	Select DEP_NO
    from empleados
    where ifnull(comision,0) > 0.10 * ifnull(salario,0)
	)
;

#9
Select *
from empleados
natural join departamentos
where DEP_NO in (
	Select DEP_NO
    from empleados
    where DEP_NO is not null
    )
;

#10
Select *
from empleados natural join departamentos
where dep_no > ANY (
	Select dep_no
    from empleados
    )
;