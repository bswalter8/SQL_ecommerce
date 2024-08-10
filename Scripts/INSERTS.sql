USE vynil;

INSERT INTO cliente (nombre, apellido, tipo_documento, numero_docuento, email, calle_nombre, numero, piso, dpto, ciudad, codigo_postal) 
VALUES
	('Michelangelo', 'Caravaggio', 'DNI', 12345678, 'cara@mail.com', 'Colon', 1221, 'A', '3', 'Cordoba', '5000'),
	('El', 'Greco', 'DNI', 32348628, 'el.greco@mail.com', 'Belgrano', 153, NULL, NULL, 'Santiago del Estero', '5000'),
	('Vincent', 'Van Goth', 'DNI', 11385978, 'vincent@mail.com', 'General Paz', 121, 'E', '1', ' Buenos Aires', '5000'),
	('Eugene', 'Delacroix', 'DNI', 10445578, 'eugene@mail.com', 'Santa Rosa', 21, NULL, NULL, 'Cordoba', '5000'),
	('Jackson', 'Pollock', 'DNI', 14395677, 'jackson.pollock@mail.com', 'Humberto Primero', 214, 'C', '8', 'Salta', '5000'),
	('Mark', 'Rothko', 'DNI', 13568749, 'rothko@mail.com', 'Colon', 2536, NULL, NULL, 'Jujuy', '5000'),
	('Gustave', 'Courbet', 'DNI', 11284658, 'courbet@mail.com', 'Entre Rios', 11, 'D', '5', 'Jujuy', '5000'),
    ('Gerardo', 'Gomez', 'DNI', 12345878, 'ggomez@mail.com', 'Colon', 1221, 'A', '3', 'Cordoba', '5000'),
	('Edouard', 'Manet', 'DNI', 32358628, 'manet@mail.com', 'Belgrano', 153, NULL, NULL, 'Santiago del Estero', '5000'),
	('Claude', 'Monet', 'DNI', 10385978, 'konet@mail.com', 'General Paz', 121, 'E', '1', ' Buenos Aires', '5000'),
	('Leonardo', 'Da Vinci', 'DNI', 09445578, 'frias@mail.com', 'Santa Rosa', 21, NULL, NULL, 'Cordoba', '5000'),
	('Gutav', 'Klint', 'DNI', 30395677, 'klint@mail.com', 'Humberto Primero', 214, 'C', '8', 'Salta', '5000'),
	('Pablo', 'Picasso', 'DNI', 03568749, 'ppicasso@mail.com', 'Colon', 2536, NULL, NULL, 'Jujuy', '5000'),
	('Henry', 'Matisse', 'DNI', 27284658, 'matisse@mail.com', 'Entre Rios', 11, 'D', '5', 'Jujuy', '5000') 
;

INSERT INTO compra (cliente_id, total)
	VALUES
    (1, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 1)),
    (5, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 2)),
    (2, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 3)),
    (3, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 4)),
    (1, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 5)),
    (7, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 6)),
    (3, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 7)),
    (4, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 8)),
    (6, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 9)),
    (10, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 10))
;

INSERT INTO producto (nombre_producto, stock, stock_minimo, descripcion, precio_producto)
VALUES
	('Miles Davis Kind of Blue', 4, 2, '', 1688.25),
	('Bill Evans at the Villaga Vanguard', 2, 5, '', 1879.65),
	('Giant Step John Coltrane', 4, 2, '', 1778.75),
	('Charlie Parker Standards', 4, 2,'', 1898.01),
	('Headhunters Herbie Hancock',6, 2, '', 1956.00),
	('Largo Brad Melhdau', 5, 2, '',	1680.25)
;

INSERT INTO lista_compra (compra_id, producto_id, cantidad_producto, sub_total)
	VALUES
    (1, 2, 5, f_total_compra(2,5)),
    (1, 4, 3, f_total_compra(4,3)),
    (1, 1, 2, f_total_compra(1,2)),
    (5, 4, 3, f_total_compra(4,3)),
    (2, 6, 3, f_total_compra(6,3)),
    (3, 6, 8, f_total_compra(6,8)),
    (5, 4, 5, f_total_compra(4,5)),
    (4, 2, 3, f_total_compra(2,3)),
    (4, 1, 2, f_total_compra(1,2)),
    (6, 1, 2, f_total_compra(1,2)),
    (7, 1, 2, f_total_compra(1,2)),
    (8, 1, 2, f_total_compra(1,2)),
    (9, 1, 2, f_total_compra(1,2)),
    (10, 6, 4, f_total_compra(6,4))
;

INSERT INTO empresa_entrega (nombre_empresa, precio_km)
	VALUES
    ('Transporte El Loco', 20),
    ('Entregas Siempre Tarde SA', 22)
;

INSERT INTO envio (compra_id, empresa_entrega_id, kilometros, total_envio)
	VALUES
    (1, 1, 35, f_total_delivery(1,35)),
    (2, 1, 18, f_total_delivery(1,18)),
    (3, 2, 7, f_total_delivery(2,7)),
    (4, 1, 9, f_total_delivery(1,9)),
    (5, 1, 3, f_total_delivery(1,3)),
    (6, 2, 4, f_total_delivery(2,4)),
    (7, 1, 6, f_total_delivery(1,6))
;

INSERT INTO proveedor (nombre_proveedor, direccion, email, ciudad, provincia)
	VALUES
    ('Sorny International', 'Calle falsa 123', 'Sorny@mail.com', 'NYC','NY'),
    ('Universal','Calle falsa 356','uniuni@gmail.com', 'L.A', 'California')
;

INSERT INTO producto_x_proveedor (proveedor_id, producto_id, cantidad_producto, sub_total)
	VALUES
    (1, 3, 25, 14650),
    (1, 1, 25, 11568),
    (2, 4, 25, 16200),
    (1, 2, 25, 13846),
    (2, 6, 25, 17258),
    (1, 5, 25, 13664)
;