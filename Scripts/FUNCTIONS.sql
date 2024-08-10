/*Functions*/
USE vynil; 


DELIMITER //
CREATE FUNCTION f_aleatoio (min INT, max INT)
	RETURNS INT
    DETERMINISTIC
    BEGIN
		DECLARE aleatorio INT;
        SET aleatorio = (SELECT FLOOR(RAND() * (max - min)) + min );
        
        RETURN aleatorio ;
    END //
    
DELIMITER ;

DELIMITER $$
CREATE FUNCTION f_iva(precio DECIMAL(7,2)) 
RETURNS decimal(7,2)
DETERMINISTIC
BEGIN
	DECLARE iva DECIMAL(3,2);
    DECLARE precio_con_iva DECIMAL(7,2);
    SET iva = 1.21;
    SET precio_con_iva = precio * iva;
RETURN precio_con_iva ;
END$$

/*
Se crea una funcion que recibe un DECIMAL como parametro y se lo multiplica
por el porcentaje del IVA de argentina, es el 21%.
*/
DELIMITER ;

DELIMITER $$

CREATE FUNCTION f_nombreCompleto(nombre VARCHAR(50), apellido VARCHAR(50)) 
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN

	DECLARE nombre_completo VARCHAR(200);
    SET nombre_completo = CONCAT(nombre, ',', apellido);

RETURN nombre_completo;
END$$
/*
Se crea una funcion que concatena 2 string, el nombre y apellido de un cliente.
*/
DELIMITER ;

DELIMITER $$
CREATE FUNCTION precio_X_mayor(precio DECIMAL(7,2)) 
RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE mayor DECIMAL(3,2);
    DECLARE precio_por_mayor DECIMAL(7,2);
    SET mayor = 1.16 ;
    SET precio_por_mayor = precio * mayor;

RETURN precio_por_mayor;
END$$
/*
Se crea una funcion  que recibe un parametro y lo multiplica por
un porcentaje adecuado para la venta de productos por mayor.
*/
DELIMITER ;

DELIMITER $$

CREATE FUNCTION precio_X_menor(precio DECIMAL(7,2)) 
RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE menor DECIMAL(3,2);
    DECLARE precio_por_menor DECIMAL(7,2);
    SET menor = 1.31 ;
    SET precio_por_menor = precio * menor;

RETURN precio_por_menor;
END$$
/*
Se crea una funcion que recibe un parametro y lo multiplica por
un porcentaje adecuado para la venta de productos por menor.
*/
DELIMITER ;

DELIMITER $$
CREATE FUNCTION f_total_compra(in_producto_id INT, cantidad_producto INT)
RETURNS DECIMAL(7,2)
READS SQL DATA
BEGIN
	DECLARE precio_producto DECIMAL(7,2);
    DECLARE total DECIMAL(7,2);
    SET precio_producto = (SELECT p.precio_producto FROM producto AS p WHERE p.producto_id = in_producto_id);
    SET total = precio_producto * cantidad_producto;
   
	RETURN total ;
END $$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION f_total_delivery(in_empresa_entrega_id INT, kilometros DECIMAL)
RETURNS DECIMAL(7,2)
READS SQL DATA
BEGIN
	DECLARE precio_km DECIMAL(7,2);
    DECLARE total DECIMAL(7,2);
    SET precio_km = (
		SELECT emp.precio_km 
		FROM empresa_entrega AS emp 
		WHERE emp.empresa_entrega_id = in_empresa_entrega_id
    );
    SET total = kilometros * precio_km;
   
	RETURN total ;
END $$

DELIMITER ;