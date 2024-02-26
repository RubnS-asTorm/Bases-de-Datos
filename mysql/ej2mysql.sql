#1 apellidos, nombre y salario de todos los empleados
SELECT apellido1, apellido2, nombre, salario
FROM empleados;

#2 
SELECT apellido1, apellido2, nombre, COMISION
FROM empleados;

#3
SELECT apellido1, apellido2, nombre
FROM empleados
WHERE oficio = "vendedor";

#4
SELECT *
FROM empleados inner join departamentos
ON empleados.DEP_NO = departamentos.dep_no
WHERE oficio = "vendedor" or dnombre = "contabilidad";

#5
SELECT *
FROM empleados
WHERE oficio = "vendedor" or oficio = "director";

##
SELECT *
FROM televisores
WHERE categoria = 'televisores' and (marca= 'lg' or marca= 'samsung') and precio >= 165 and precio <= 651 and pulgada >= 35 and pulgada <= 75 and resolucion '4k';

#6
SELECT *
FROM empleados
WHERE oficio = "vendedor" or (oficio = "director" and salario <=300000);

#7
SELECT *
FROM empleados
WHERE (oficio = "vendedor" or oficio = "director") and salario <=300000;

#8
SELECT APELLIDO1, oficio, salario, comision, ifnull(salario,0) + ifnull(comision,0) as "ganancias"
FROM empleados;

#9
SELECT apellido1, salario
FROM empleados
WHERE SALARIO >= "150000";

#10
SELECT APELLIDO1, oficio, salario, comision, ifnull(salario,0) + ifnull(comision,0) as "ganancias"
FROM empleados
WHERE salario + comision >= "150000";

#11
SELECT APELLIDO1, oficio, salario, comision
FROM empleados
WHERE salario + comision >= "100000" and salario + comision <= "150000";

#12
SELECT APELLIDO1, oficio, salario
FROM empleados
WHERE oficio = "vendedor" and salario >= "100000" and salario <= "150000";

#13
SELECT APELLIDO1, oficio, salario
FROM empleados
WHERE oficio = "vendedor" and salario < "100000" and salario > "150000";

#14
SELECT APELLIDO1, oficio, salario
FROM empleados
WHERE oficio = "vendedor" or oficio ="director" and salario < "250000";

#15
SELECT APELLIDO1, salario, localidad
FROM empleados INNER JOIN departamentos
ON empleados.dep_no = departamentos.dep_no
WHERE localidad = "BARCELONA" or localidad = "VALENCIA";

#16
SELECT oficio, localidad, salario
FROM empleados INNER JOIN departamentos
ON empleados.dep_no = departamentos.dep_no
WHERE localidad = "MADRID";

#17
SELECT APELLIDO1, localidad
FROM empleados INNER JOIN departamentos
ON empleados.dep_no = departamentos.dep_no
WHERE localidad <> "BARCELONA";

#18
SELECT APELLIDO1, localidad
FROM empleados INNER JOIN departamentos
ON empleados.dep_no = departamentos.dep_no
WHERE localidad <> "BARCELONA" AND localidad <> "MADRID";

#19
SELECT APELLIDO1, localidad, OFICIO
FROM empleados INNER JOIN departamentos
ON empleados.dep_no = departamentos.dep_no
WHERE localidad <> "VALENCIA" AND SALARIO < "200000";

#20
SELECT APELLIDO1, localidad, OFICIO
FROM empleados INNER JOIN departamentos
ON empleados.dep_no = departamentos.dep_no
WHERE (localidad = "MADRID" AND SALARIO < "200000") OR (localidad = "BARCELONA" AND SALARIO < "150000");

#21
SELECT APELLIDO1, localidad, OFICIO
FROM empleados INNER JOIN departamentos
ON empleados.dep_no = departamentos.dep_no
WHERE (localidad = "MADRID" AND SALARIO < "200000") OR localidad = "BARCELONA";

#22
SELECT NOMBRE
FROM clientes
WHERE LIMITE_CREDITO < "1000000" and LOCALIDAD = "BARCELONA";

#23
SELECT *
FROM productos
WHERE descripcion like "MESA%";

#24
SELECT *
FROM productos
WHERE descripcion like "MESA%" and precio_actual < "50000";

#25
SELECT *
FROM productos
WHERE descripcion like "%MESA%" and descripcion like "%despacho%";

#26
SELECT *
FROM productos
WHERE descripcion like "%MESA%" and descripcion like "%despacho%" and descripcion like "%gaviota%";

#27
SELECT *
FROM empleados
WHERE apellido1 like "A%";

#28
SELECT *
FROM empleados
WHERE apellido1 like "A%" and apellido1 like "%O";

#29
SELECT *
FROM empleados
WHERE apellido1 like "%Z";

#30
SELECT *
FROM empleados
WHERE apellido1 like "A%" or apellido1 like "%Z";

#31
SELECT oficio, localidad, salario
FROM empleados INNER JOIN departamentos
ON empleados.dep_no = departamentos.dep_no
WHERE localidad in ("MADRID");

#32
select fecha_pedido, pedido_no
from pedidos 
where FECHA_PEDIDO like "%2000%";
select fecha_pedido, pedido_no
from pedidos 
where FECHA_PEDIDO like "%23-01-2015%";
select fecha_pedido, pedido_no
from pedidos 
where FECHA_PEDIDO like "%23-1-2015%";
select fecha_pedido, pedido_no
from pedidos 
where FECHA_PEDIDO like "%2015-1-23%";

#33
select fecha_pedido, pedido_no
from pedidos 
where FECHA_PEDIDO like "%1999%";

#34
select fecha_pedido, pedido_no
from pedidos 
where FECHA_PEDIDO like "%1999-11-%";

#35
select fecha_pedido, pedido_no
from pedidos 
where FECHA_PEDIDO like "%1999-11-%" or FECHA_PEDIDO like "%1999-12-%";

#36
select fecha_pedido, pedido_no
from pedidos 
where FECHA_PEDIDO not like "%1999-11-%";



