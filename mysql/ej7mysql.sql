use BDVentas;
insert into clientes values 
(NULL, '12345678A', 'AlexaG', '2007/02/12', '12345', 'AvTua', 'Ferrol', 'A Coruña', 'a@gmail.com', '655345434', NULL),
(NULL, '12345679A', 'MarioO', '2006/03/13', '12346', 'AvTuo', 'Ferrol', 'A Coruña', 'b@gmail.com', '655345465', NULL),
(NULL, '12345678B', 'PedroY', '2007/02/12', '12345', 'AvTpu', 'Ferrol', 'A Coruña', 'c@gmail.com', '656455434', NULL);

Select * from clientes;

update clientes
set CP = '13254'
where nombre = 'PedroY';

Select * from clientes;

