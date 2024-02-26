#1
select pedido_no, pedidos.PRODUCTO_NO, pedidos.CLIENTE_NO, unidades, FECHA_PEDIDO, YA_PAGADO, MODO_DE_PAGO,NOMBRE,DESCRIPCION
from pedidos
inner join clientes on pedidos.cliente_no = clientes.cliente_no
inner join productos on pedidos.producto_no = productos.producto_no;

#2
select subordinado.nombre as "empleados", boss.nombre as "jefe" 
from empleados as subordinado 
inner join empleados as boss
on subordinado.jefe = boss.emp_no;

#3
select nombre , localidad 
from clientes
order by nombre ASC;

#4
select nombre , localidad 
from clientes
order by nombre DESC;

#5
select localidad, nombre
from clientes
order by localidad , nombre desc;

#6
select nombre, salario
from empleados
ORDER BY salario desc
limit 3;

#7
select nombre, salario
from empleados
ORDER BY salario asc 
limit 5;

#8
select oficio
from empleados
where dep_no=30;

#9
select distinct oficio
from empleados
where dep_no=30;

#10
select distinct producto_no
from pedidos
where ya_pagado="1";

#11
select dep_no as "codigo del departamento", dnombre
from departamentos;

#12
select *
from empleados inner join departamentos
on empleados.dep_no = departamentos.dep_no
where oficio = "vendedor" or dnombre = "contabilidad";

#13
select *
from empleados
where oficio = "vendedor" or (oficio = "director" and salario <= 300000);

#14
select apellido1, oficio, comision, (ifnull(salario,0)+ifnull(COMISION,0)) as "ganancias"
from empleados;

#15
select apellido1, salario
from empleados
where salario > 150000;

#16
select apellido1, salario, oficio
from empleados
where oficio = "vendedor" and salario between 100000 and 150000;

#17
select apellido1, salario, localidad
from empleados inner join departamentos
on empleados.dep_no = departamentos.dep_no
where localidad = "Barcelona" or localidad = "Valencia";

#18
select apellido1, localidad
from empleados inner join departamentos
on empleados.dep_no = departamentos.dep_no
where not (localidad = "Barcelona" or localidad = "Madrid");

#19
select *
from productos 
where descripcion like "%mesa%" and descripcion like "%despacho%";

#20
select *
from empleados
where apellido1 like "A%";

#21
select *
from empleados
where apellido1 like "%Z";

#22
select pedido_no, FECHA_PEDIDO
from pedidos
where fecha_pedido like "%2000%";

#23
select pedido_no, FECHA_PEDIDO
from pedidos
where fecha_pedido like "%1999-11%";

#24
select pedido_no, FECHA_PEDIDO
from pedidos
where fecha_pedido between "1999-11-01" and "1999-12-31";

#25
select count(nombre)
from clientes
;

#26
select count(*)
from empleados
where comision is null;

#27
select count(localidad)
from departamentos;

#28


#29





