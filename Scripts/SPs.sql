/* -Store Procedures- */
USE vynil;


DELIMITER $$

CREATE PROCEDURE sp_carga_stock (IN producto_id INT, IN cantidad_producto INT)
BEGIN
	UPDATE masala.producto AS p
		SET p.stock = p.stock + cantidad_producto
        WHERE p.producto_id = producto_id;	

END $$
/*
Se crea un SP para agregar al stock de un producto una cantidad pasados por parametros.
El SP se debe llamar pasando los siguientes parametros.
(producto_id , cantidad_producto (debe ser un numero entero positivo))
Ej: CALL sp_carga_stock(3, 25);
*/
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_order_by_param (IN column_param VARCHAR(50), in table_param VARCHAR(50), IN order_param BOOLEAN)
BEGIN
	SET @ascendent = 'ASC';
    SET @descendent = 'DESC';
	IF order_param = 1 THEN
		SET @order_by = CONCAT('ORDER BY ',column_param, ' ', @ascendent);
        SELECT @order_by;
	ELSE 
		SET @order_by = CONCAT('ORDER BY ', column_param, ' ', @descendent);        
	END IF;
	
    SET @consult = CONCAT('SELECT * FROM ', table_param, ' ', @order_by);
		SELECT @consult;
    
    PREPARE querySQL FROM @consult;
    EXECUTE querySQL;
    
    DEALLOCATE PREPARE querySQL;
END $$
/*
Se crea un SP para ordenar una tabla por campo en forma ascendente o descendente, se necesitan pasar por parametro
los siguientes datos.
Siempre se debe pasar como primer parametro el nombre de la columna que vamos a ordenar, segundo parametro se pasa la tabla
de la cual queremos ordenar y por ultimo en formato BOOLEAN (0, 1) 0-descendente y 1-ascendente.
(column_param limite(50)caracteres, table_param limite(50)caracteres, order_param BOOLEAN (0, 1) 0-descendente y 1-ascendente)
Ej: CALL sp_order_by_param ('nombre_producto', 'producto', 0);
*/
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_verificacion_stock (IN compra_id INT, IN in_producto_id INT, IN cantidad_producto INT)
BEGIN
	SET @stock = (SELECT p.stock FROM producto AS p WHERE producto_id = in_producto_id);
    SET @stock_minimo = (SELECT p.stock_minimo FROM producto AS p WHERE producto_id = in_producto_id);
    
    IF @stock <= @stock_minimo THEN
		INSERT INTO producto_x_proveedor (proveedor_id, producto_id, cantidad_producto, sub_total)
			VALUES (f_aleatorio(1,2), in_producto_id, 25, f_total_compra(in_producto_id, 25));		
	ELSEIF (@stock - cantidad_producto) >= 0 THEN
		
        INSERT INTO lista_compra (compra_id, producto_id, cantidad_producto, sub_total) 
        VALUE (compra_id, in_producto_id, cantidad_producto, f_total_compra(in_producto_id, cantidad_producto));
        
        UPDATE producto AS p SET p.stock = @stock_update WHERE p.producto_id = in_producto_id;
        
		IF @stock <= @stock_minimo THEN
			INSERT INTO producto_x_proveedor (proveedor_id, producto_id, cantidad_producto, sub_total)
			VALUES (f_aleatorio(1,3), in_producto_id, 25, f_total_compra(in_producto_id, 25));
		END IF;
    ELSE 
		SELECT 'ERROR: no se pudo crear la compra indicado' AS message FROM DUAL;    
    END IF;
    
END$$
/*
Se crea un SP para verificar si hay stock del producto que se desea comprar. Ademas si el stock esta o queda por debajo del stock minimo luego de la compra,
se genera una orden de compra para reponer stock del producto. Si no hay stock para la compra se muestra el mensaje -ERROR: no se pudo crear la compra indicado-.
El SP se debe llamar pasando los siguientes parametros.
(compra_id , producto_id, cantidad_producto (debe ser un numero entero positivo))
Ej: CALL sp_verificacion_stock (2, 6, 3);
*/
DELIMITER ;


