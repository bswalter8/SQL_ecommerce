USE vynil;
START TRANSACTION;
INSERT INTO producto (nombre_producto, stock, stock_minimo, descripcion, precio_producto)
VALUES
	('Miles Davis Someday my prince will come', 4, 2, '', 1688.25),
	('Bud Powell', 2, 5, '', 1879.65),
	('John Coltrane A love supreme', 4, 2, '', 1778.75),
	('Dave Brubeck Time Out', 4, 2,'', 1898.01),
	('Keith Jarret', 5, 2, '',	1680.25);
savepoint insert_1;
INSERT INTO producto (nombre_producto, stock, stock_minimo, descripcion, precio_producto)
VALUES
	('me', 4, 2, '', 1688.25),
	('error', 2, 5, '', 1879.65),
	('Jeme', 4, 2, '', 1778.75),
	('Dave  Time Out', 4, 2,'', 1898.01),
	('error', 5, 2, '',	1680.25);
savepoint insert_2;
ROLLBACK TO insert_1;
COMMIT;