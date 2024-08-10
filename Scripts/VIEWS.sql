/* -VIEWS- */

USE vynil;

CREATE VIEW v_lista_precios AS
    SELECT 
        producto.nombre_producto AS nombre_producto,
        f_iva(producto.precio_producto) AS precio_lista,
        precio_X_mayor(f_iva(producto.precio_producto)) AS precio_mayorista,
        precio_X_menor(f_iva(producto.precio_producto)) AS precio_minorista
    FROM
        producto        
/*
Se crea una vista donde se puede leer la lista de precios.
La misma es una vista sensilla con 3 funciones para proporcionar los precios
con IVA, Mayorista y Minorista.
*/
;

CREATE VIEW v_ofertas_vendida_cliente AS
    SELECT 
        lc.producto_id AS producto_id,
        lc.cantidad_producto AS cantidad_producto,
        p.nombre_producto AS nombre_producto,
        co.fecha_compra AS fecha_compra,
        f_nombrecompleto(cl.nombre, cl.apellido) AS Cliente
    FROM
        (((lista_compra lc
        JOIN compra AS co ON (lc.compra_id = co.compra_id))
        JOIN cliente AS cl ON (co.cliente_id = cl.cliente_id))
        JOIN producto AS p ON (lc.producto_id = p.producto_id))
    WHERE
        p.producto_id = 1
            AND lc.cantidad_producto MOD 2 = 0            
/*
Se crea vista donde se muestra la promociones vendidas de un producto, por ejemplo podria ser un 2X1 de cualquier producto.
La vista cuenta con la informacion de la tabla lista_compra y 3 tablas a traves de JOINS para agregar la informacion pertinente a
la tabla.
Tambien hay una funcion para concatenar el nombre completo del cliente.
*/
;

CREATE OR REPLACE VIEW v_producto_cliente AS
SELECT 
	prod.nombre_producto AS productos,
    lc.cantidad_producto AS cantidad,    
    co.fecha_compra AS fecha,
    f_nombreCompleto(cl.nombre, cl.apellido) AS cliente,
    lc.sub_total AS total
FROM lista_compra AS lc
JOIN compra AS co ON lc.compra_id = co.compra_id
JOIN producto AS prod ON lc.producto_id = prod.producto_id
JOIN cliente AS cl ON co.cliente_id = cl.cliente_id
WHERE co.cliente_id >= 1 
AND co.fecha_compra BETWEEN '2022-10-01' AND '2022-10-31'
/*
Se crea una vista para visualizar los productos adquiridos por un cliente particular en el mes.
La vista contempla informacion desde la tabla lista_compra y a traves de 3 JOINs
trae los datos necesarios para mostrar de otras 3 tablas.
*/
;

CREATE OR REPLACE VIEW v_producto_proveedor AS
SELECT 
	pxp.producto_id AS codigo,
	prod.nombre_producto AS productos,
    prov.nombre_proveedor AS proveedor,    
    pxp.fecha_compra AS fecha
FROM producto_x_proveedor AS pxp
JOIN proveedor AS prov ON pxp.proveedor_id = prov.proveedor_id
JOIN producto AS prod ON pxp.producto_id = prod.producto_id
WHERE pxp.producto_id >= 1
/*
Se crea una vista para visualizar los productos por proveedor.
La vista contempla informacion desde la tabla producto_x_proveedor y a traves de 2 JOINs
trae los datos necesarios para mostrar la informacion.
*/
;

CREATE VIEW v_ofertas_vendidas_mes AS
    SELECT 
        lc.producto_id AS producto_id,
        SUM(lc.cantidad_producto) AS cantidad_producto,
        p.nombre_producto AS nombre_producto,
        co.fecha_compra AS fecha_compra
    FROM lista_compra AS lc
        JOIN compra AS co ON lc.compra_id = co.compra_id
        JOIN producto AS p ON lc.producto_id = p.producto_id
    WHERE
        p.producto_id = 1
            AND co.fecha_compra BETWEEN '2022-10-01' AND '2022-10-31'
/*
Se crea vista donde podemos ver la cantidad de un producto que se vendio entre un determinado periodo
de tiempo por ejemplo un mes.
Para la vista se utilizo la tabla lista_compra con 2 JOIN para agregar informacion relevante.
*/
;