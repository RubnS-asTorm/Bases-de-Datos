SELECT * FROM clientes;
SELECT nombre, localidad FROM clientes;
SELECT * FROM productos; 
SELECT dep_no AS 'Número de Departamento' , DNOMBRE FROM departamentos;
SELECT nombre, apellido1, apellido2, oficio, telefono, salario FROM empleados;
SELECT apellido1, apellido2, dnombre, departamentos.dep_no
FROM empleados INNER JOIN departamentos
ON empleados.DEP_NO = departamentos.dep_no
;
SELECT DNI, nombre, apellido1, apellido2, oficio, jefe, FECHA_ALTA, salario, comision,telefono, foto, dnombre, departamentos.dep_no
FROM empleados INNER JOIN departamentos
ON empleados.DEP_NO = departamentos.dep_no
;
SELECT apellido1, apellido2, departamentos.dep_no, localidad
FROM empleados INNER JOIN departamentos
ON empleados.DEP_NO = departamentos.dep_no
;
SELECT pedido_no, fecha_pedido,UNIDADES, DESCRIPCION
FROM pedidos INNER JOIN productos
ON pedidos.PRODUCTO_NO = productos.PRODUCTO_NO
;
SELECT subordinado.nombre AS 'nombre de empleado', 
boss.nombre as 'nombre de jefe' 
FROM empleados AS subordinado inner join empleados as boss
ON subordinado.jefe = boss.emp_no
;
SELECT nombre ,DESCRIPCION,UNIDADES 
from (clientes inner join pedidos
on clientes.cliente_no = pedidos.cliente_no)
inner join productos
ON productos.producto_no = pedidos.producto_no
;
SELECT DISTINCT empleados.nombre AS 'Nombre del empleado', productos.descripcion AS 'Nombre del producto'
FROM ((clientes INNER JOIN pedidos
ON clientes.cliente_no = pedidos.cliente_no) INNER JOIN productos
ON pedidos.producto_no = productos.producto_no) INNER JOIN empleados 
ON clientes.vendedor_no = empleados.emp_no
;
SELECT nombre, localidad
FROM clientes
ORDER BY Nombre ASC
;
SELECT nombre, localidad
FROM clientes
ORDER BY Nombre DESC
;
SELECT NOMBRE, LOCALIDAD
FROM clientes
ORDER BY LOCALIDAD ASC, nombre ASC
;
SELECT NOMBRE, LOCALIDAD
FROM clientes
ORDER BY LOCALIDAD ASC, nombre DESC
;
SELECT NOMBRE, LOCALIDAD
FROM clientes
ORDER BY 2 ASC, 1 DESC
;
SELECT * FROM empleados; 
SELECT * , dnombre
FROM empleados INNER JOIN departamentos
ON empleados.dep_no = departamentos.dep_no
;
SELECT nombre, salario
FROM empleados
ORDER BY salario desc
LIMIT 3
;
SELECT nombre, salario
FROM empleados
ORDER BY salario asc
LIMIT 5
;
SELECT DISTINCT PRODUCTO_NO 
FROM pedidos
;
SELECT pedidos.producto_no , descripcion
FROM productos INNER JOIN pedidos
ON productos.PRODUCTO_NO = pedidos.PRODUCTO_NO
;
SELECT distinct pedidos.producto_no , descripcion
FROM productos INNER JOIN pedidos
ON productos.PRODUCTO_NO = pedidos.PRODUCTO_NO
;
SELECT dep_no as 'código del departamento', dnombre
FROM departamentos 
;
SELECT dep_no as 'código del departamento', dnombre 'nombre del departamento'
FROM departamentos 
;
SELECT subordinado.APELLIDO1 AS 'empleado', 
boss.apellido1 as 'jefe' 
FROM empleados AS subordinado inner join empleados as boss
ON subordinado.jefe = boss.emp_no
;




