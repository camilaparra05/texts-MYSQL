CREATE database pizza_fiesta;
use pizza_fiesta;

-- creacio de tablas
create table Clientes(
id	int primary key,
nombre	varchar(100)not null,
telefono	varchar(100)not null,
direccion	varchar(100) not null);


create table Productos( 
producto_id	int primary key, 	
nombre	varchar(100) not null,	
tipo_producto	ENUM('Pizza', 'Bebida'),	
precio int not null );


create table ingredientes(
id	int primary key,
nombre	varchar(100)not null,
precio_adicional int not null);



create table Productos_Ingredientes(
id_producto int	,
id_ingrediente int,
foreign key (id_producto) references Productos(producto_id),
foreign key (id_ingrediente) references ingredientes(id));


CREATE table  Pedidos(
id int primary key ,
id_cliente int not null,
foreign key (id_cliente) references Clientes(id),
fecha_pedido	varchar(50)not null,
hora_recogida	varchar (50) not null,
valor	int not null,
estado	enum('pendiente', 'preparando', 'listo', 'entregado'),
metodo_pago	enum('Tarjeta', 'Efectivo', 'Transferencia'));	


CREATE table pedido_producto(
id_producto int not null, 
id_pedido int not null,
cantidad	int ,
foreign key (id_producto) references Productos(producto_id),
foreign key (id_pedido) references Pedidos(id));

CREATE  table Pedido_Ingrediente( 
	id_pedido int not null,
	id_ingrediente int not  null,
	foreign key (id_pedido) references Pedidos(id),
foreign key (id_ingrediente) references ingredientes(id));

create table pagos(
id	int primary key, 	
id_pedido int not null,	
fecha_pago	varchar (50)not null,	
valor 	int not null,
estado_pago	enum('Pendiente', 'Confirmado', 'Rechazado'),
foreign key (id_pedido) references Pedidos(id));

show tables;
-- inserciones

INSERT INTO Clientes(id,nombre,telefono,direccion)
values(1,'Maria','3222246651', 'Florian');

INSERT INTO Clientes(id,nombre,telefono,direccion)
values(2,'Laura','3252346651', 'Giron');

INSERT INTO Clientes(id,nombre,telefono,direccion)
values(3,'Marlon','32985155', 'Piedecuesta');

INSERT INTO Clientes(id,nombre,telefono,direccion)
values(4,'Gonzalo','33557413', 'Floridablanca');



INSERT INTO Productos ( producto_id,nombre,tipo_producto,precio )
values (1,'carne', 'Pizza',20000);
INSERT INTO Productos ( producto_id,nombre,tipo_producto,precio )
values (2,'coca-cola', 'Bebida',8000);
INSERT INTO Productos ( producto_id,nombre,tipo_producto,precio )
values (3,'pollo', 'Pizza',20000);
INSERT INTO Productos ( producto_id,nombre,tipo_producto,precio )
values (4,'juego de mora', 'Bebida',15000);


INSERT INTO ingredientes(id,nombre,precio_adicional)
values (1,'camarones',2000);
INSERT INTO ingredientes(id,nombre,precio_adicional)
values (2,'queso',4000);
INSERT INTO ingredientes(id,nombre,precio_adicional)
values (3,'pepinillo',1500);
INSERT INTO ingredientes(id,nombre,precio_adicional)
values (4,'tocineta',5000);


INSERT INTO Productos_Ingredientes(id_producto,id_ingrediente) 
values (1,4);

INSERT INTO Productos_Ingredientes(id_producto,id_ingrediente) 
values (3,2);

INSERT INTO Productos_Ingredientes(id_producto,id_ingrediente) 
values (1,3);

INSERT INTO Productos_Ingredientes(id_producto,id_ingrediente) 
values (3,1);



INSERT INTO  Pedidos(id,id_cliente,fecha_pedido,hora_recogida	,valor	,estado	,metodo_pago)
values (1,2,'2025-02-19','10:30',55000,'pendiente','Efectivo');
INSERT INTO  Pedidos(id,id_cliente,fecha_pedido,hora_recogida	,valor	,estado	,metodo_pago)
values (2,1,'2025-03-25','9:35',48000,'preparando','Transferencia');
INSERT INTO  Pedidos(id,id_cliente,fecha_pedido,hora_recogida	,valor	,estado	,metodo_pago)
values (3,4,'2025-02-7','10:00',96000,'listo','Efectivo');
INSERT INTO  Pedidos(id,id_cliente,fecha_pedido,hora_recogida	,valor	,estado	,metodo_pago)
values (4,3,'2025-02-14','02:55',85000,'preparando','Transferencia');
INSERT INTO  Pedidos(id,id_cliente,fecha_pedido,hora_recogida	,valor	,estado	,metodo_pago)
values (5,1,'2025-02-5','12:20',105000,'entregado','Tarjeta');
INSERT INTO  Pedidos(id,id_cliente,fecha_pedido,hora_recogida	,valor	,estado	,metodo_pago)
values (6,2,'2025-01-31','09:30',30000,'listo','Transferencia');

SELECT * FROM Pedidos;

INSERT INTO pedido_producto(
id_producto,id_pedido)values(1,3);
INSERT INTO pedido_producto(
id_producto,id_pedido)values(4,1);
INSERT INTO pedido_producto(
id_producto,id_pedido)values(3,2);
INSERT INTO pedido_producto(
id_producto,id_pedido)values(2,4);


INSERT INTO Productos_Ingredientes(
id_producto,id_ingrediente)values(3,2);

INSERT INTO Productos_Ingredientes(
id_producto,id_ingrediente)values(2,4);
INSERT INTO Productos_Ingredientes(
id_producto,id_ingrediente)values(1,3);
INSERT INTO Productos_Ingredientes(
id_producto,id_ingrediente)values(4,1);



INSERT INTO pagos(id,id_pedido,fecha_pago,valor,estado_pago)
values (1,2,'2025-03-05',55000,'Confirmado');
INSERT INTO pagos(id,id_pedido,fecha_pago,valor,estado_pago)
values (2,4,'2025-02-09',65000,'Pendiente');
INSERT INTO pagos(id,id_pedido,fecha_pago,valor,estado_pago)
values (3,1,'2025-04-14',105000,'Confirmado');
INSERT INTO pagos(id,id_pedido,fecha_pago,valor,estado_pago)
values (4,3,'2025-02-15',96000,'Rechazado');

-- consultas

-- Registrar un nuevo cliente:
INSERT INTO Clientes(id,nombre,telefono,direccion)
values(5,'Juddy','3143802414', 'Madelena');




-- Agregar un nuevo producto (pizza) al menú:


INSERT INTO Productos ( producto_id,nombre,tipo_producto,precio )
values (5,'champiñones', 'Pizza',25000);


-- Registrar una bebida en el menú:
INSERT INTO Productos ( producto_id,nombre,tipo_producto,precio )
values (5,'Limonada', 'Bebida',8000);



-- Agregar un ingrediente a la base de datos:

INSERT INTO ingredientes(id,nombre,precio_adicional)
values (5,'salchicha',10000);


-- Crear un pedido para un cliente:


INSERT INTO  Pedidos(id,id_cliente,fecha_pedido,hora_recogida	,valor	,estado	,metodo_pago)
values (7,3,'2025-05-01','08:00',60000,'pendiente','Efectivo');



-- Añadir productos a un pedido específico:

INSERT INTO pedido_producto(
id_producto,id_pedido)values(5,4);


-- Añadir ingredientes adicionales a una pizza en un pedido:
INSERT INTO Productos_Ingredientes(
id_producto,id_ingrediente)values(3,2);



-- Consultar el detalle de un pedido (productos y sus ingredientes):

SELECT P.id, Pi.id_ingredientes, Pi.id_pedido
FROM  Pedidos P
join Pedido_Ingrediente Pi on P.id=Pi.id_pedido
WHERE P.id=1;






-- Actualizar el precio de una pizza en el menú:

update Productos set precio= 85.00 where id = 1; 




-- Actualizar la dirección de un cliente:

update Clientes SET direccion = 'Barranca' WHERE id = 1;


-- Eliminar un producto del menú (bebida):
DELETE FROM Productos WHERE id = 2;





--  Eliminar un ingrediente de la base de datos

DELETE FROM Ingredientes WHERE id = 1;




-- Consultar todos los pedidos de un cliente:

SELECT P.id_cliente, C.nombre
FROM Pedidos  P
join Clientes C ON C.id=P.id_cliente 
where P.id_cliente= 1; 









--  Listar todos los productos disponibles en el menú (pizzas y bebidas):

SELECT * from Productos ;





-- istar todos los ingredientes disponibles para personalizar una pizza:
SELECT * from ingredientes; 










