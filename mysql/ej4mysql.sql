#1
insert into departamentos 
values ( 70, "MANTENIMIENTO", "FERROL");
insert into departamentos 
values ( 80, "REPARACIONES", "NARON");

#2
insert into departamentos values 
( 90, "RECURSOS HUMANOS", "FERROL"),
( 100, "SANIDAD", "NARON");

#3
CREATE TABLE IF NOT EXISTS mobiliario (
id_mueble BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
descripcion TEXT,
departamento SMALLINT UNSIGNED,
  PRIMARY KEY (id_mueble),
CONSTRAINT FK_mobiliario_departamento
    FOREIGN KEY (departamento)
    REFERENCES departamentos (DEP_NO)
ON UPDATE CASCADE
);

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO empleados (EMP_NO, DNI, NOMBRE, APELLIDO1, APELLIDO2, OFICIO, JEFE, FECHA_ALTA, SALARIO, COMISION, DEP_NO, TELEFONO) 
VALUES (9001, '14256821Y', 'Luís', 'Yañez', 'Rioboo', 'ADMINISTRATIVO', 9002, '2016-04-05', 150000, null, 10, 652986532);
INSERT INTO empleados (EMP_NO, DNI, NOMBRE, APELLIDO1, APELLIDO2, OFICIO, JEFE, FECHA_ALTA, SALARIO, COMISION, DEP_NO, TELEFONO) 
VALUES (9002, '45325698P', 'Ana', 'Rinlo', 'Rois', 'INGENIERA', 8904, '2016-04-05', 150000, null, 10, 547852146);
SET FOREIGN_KEY_CHECKS=1;

select *
from empleados
where jefe not in (
	select emp_no
    from empleados
    );

CREATE TEMPORARY TABLE IF NOT EXISTS empleados_antiguos
	(SELECT * 
    FROM empleados
    WHERE emp_no = 8904
);

select *
from empleados_antiguos
;


CREATE TABLE `empleados` (
  `EMP_NO` smallint unsigned NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `NOMBRE` varchar(65) NOT NULL,
  `APELLIDO1` varchar(65) NOT NULL,
  `APELLIDO2` varchar(65) DEFAULT NULL,
  `OFICIO` varchar(65) DEFAULT NULL,
  `JEFE` smallint unsigned DEFAULT NULL,
  `FECHA_ALTA` date DEFAULT NULL,
  `SALARIO` decimal(8,2) unsigned DEFAULT NULL,
  `COMISION` decimal(8,2) unsigned DEFAULT NULL,
  `DEP_NO` smallint unsigned DEFAULT NULL,
  `TELEFONO` varchar(15) DEFAULT NULL,
  `FOTO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMP_NO`),
  UNIQUE KEY `UQ_EMP_DNI` (`DNI`),
  UNIQUE KEY `UQ_EMP_FOTO` (`FOTO`),
  KEY `FK_EMP_DEP_NO` (`DEP_NO`),
  KEY `FK_EMP_JEFE` (`JEFE`),
  CONSTRAINT `FK_EMP_DEP_NO` FOREIGN KEY (`DEP_NO`) REFERENCES `departamentos` (`DEP_NO`) ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_JEFE` FOREIGN KEY (`JEFE`) REFERENCES `empleados` (`EMP_NO`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `bdempleados`.`empleados`
(`EMP_NO`,
`DNI`,
`NOMBRE`,
`APELLIDO1`,
`APELLIDO2`,
`OFICIO`,
`JEFE`,
`FECHA_ALTA`,
`SALARIO`,
`COMISION`,
`DEP_NO`,
`TELEFONO`,
`FOTO`)
VALUESa
(<{EMP_NO: }>,
<{DNI: }>,
<{NOMBRE: }>,
<{APELLIDO1: }>,
<{APELLIDO2: }>,
<{OFICIO: }>,
<{JEFE: }>,
<{FECHA_ALTA: }>,
<{SALARIO: }>,
<{COMISION: }>,
<{DEP_NO: }>,
<{TELEFONO: }>,
<{FOTO: }>);


CREATE TABLE IF NOT EXISTS empleados_antiguos_reducida
	(SELECT emp_no, apellido1, apellido2, nombre
	FROM empleados
	WHERE emp_no = 8904
	);

select *
from empleados_antiguos_reducida;


CREATE TABLE `empleados_antiguos_reducida` (
  `emp_no` smallint unsigned NOT NULL,
  `apellido1` varchar(65) NOT NULL,
  `apellido2` varchar(65) DEFAULT NULL,
  `nombre` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TEMPORARY TABLE IF NOT EXISTS pedidos_ano_2000
	(SELECT * 
    FROM pedidos
    WHERE FECHA_PEDIDO like "2000-%"
);

select *
from pedidos_ano_2000
;


SELECT * INTO OUTFILE '/var/lib/mysql-files/pedidos2000servidor.txt'
	FROM bdempleados.pedidos
	WHERE YEAR(FECHA_PEDIDO) = '2000'
;

select *
from empleados
;
































































