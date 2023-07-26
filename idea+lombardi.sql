-- creacion de la BD de proyecto emprendimiento celulares
CREATE SCHEMA empresa;
USE empresa;

-- creacion de la tabla Clientes
CREATE TABLE Clientes(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50),
    cp INT,
    direccion VARCHAR(30),
    telefono VARCHAR(12),
    localidad VARCHAR(30)
);

-- creacion de la tabla Proveedores
CREATE TABLE Proveedores(
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nombre VARCHAR(50) NOT NULL,
     cuit VARCHAR(30),
     descricion VARCHAR(50),
     direccion VARCHAR(60) NOT NULL,
     telefono VARCHAR(20),
     localidad VARCHAR(50)
);

-- creacion de la tabla Stock
CREATE TABLE Stock(
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       nombre VARCHAR(30),
       cantidad INT,
       costo DECIMAL(12,1) NOT NULL
);
	
-- creacion de la tabla Ventas
CREATE TABLE Ventas(
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 factura VARCHAR(30) NOT NULL,
     fecha DATE NOT NULL,
     monto DECIMAL (12,1) NOT NULL,
     id_Clientes INT NOT NULL,
     FOREIGN KEY (id_Clientes) REFERENCES Clientes (id)
);

-- creacion de la tabla compras
CREATE TABLE Compras(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	  factura VARCHAR(30) NOT NULL ,
      fecha_oc DATE NOT NULL,
      monto DECIMAL(12.1),
      id_proveedor INT NOT NULL,
      FOREIGN KEY (id_proveedor) REFERENCES proveedores (id),
      FOREIGN KEY (factura) REFERENCES ventas (id)
);

-- creacion de la tabla pagos
CREATE TABLE Pagos(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        factura VARCHAR(30) NOT NULL,
        id_cliente INT NOT NULL,
        id_producto INT NOT NULL,
        fecha DATE NOT NULL,
        precio DECIMAL(10,1) NOT NULL,
        cantidad INT,
        FOREIGN KEY (factura) REFERENCES ventas (id),
        FOREIGN KEY (id_cliente) REFERENCES clientes (id),
        FOREIGN KEY (id_producto) REFERENCES stock (id)
);

-- Inserccion de datos de los clientes
INSERT INTO clientes (id, nombre, cp, direccion, telefono, localidad) VALUES
(1, 'Juan Perez', '1043', 'Av. Corrientes 1234', '011-555-1234', 'Buenos Aires'),
(2, 'Maria Gomez', '5000', 'Av. Las Heras 456', '011-555-5678', 'Córdoba'),
(3, 'Pedro Martinez', '4400', 'Av. Belgrano 789', '011-555-9012', 'Salta'),
(4, 'Ana Torres', '5500', 'Calle San Martin 456', '011-555-3456', 'Mendoza'),
(5, 'Luisa Gonzalez', '5400', 'Calle San Juan 789', '011-555-7890', 'SanJuan'),
(6, 'Carlos Rodriguez', '2000', 'Av. Santa Fe 123', '011-555-2345', 'Rosario'),
(7, 'Fernando Hernandez', '4000', 'Calle 25 de Mayo 789', '011-555-6789', 'Tucumán'),
(8, 'Sofia Ramirez', '1900', 'Av. Mitre 123', '011-555-9012', 'La Plata'),
(9, 'Jorge Castro', '7600', 'Calle Rivadavia 456', '011-555-3456', 'Mar del Plata'),
(10, 'Laura Diaz', '8000', 'Av. Rivadavia 789', '011-555-7890', 'Bahía Blanca'),
(11,  'Matias Lombardi', '2000', 'Bv Segui 879', '011-510-1022', 'Rosario');

-- inserccion de datos de los proveedores
INSERT INTO proveedores (id, nombre, cuit, direccion, telefono, localidad) VALUES
(1, 'Samsung Electronics Argentina S.A.', '30-64158053-8', 'Av. del Libertador 6301', '0800-333-SAMSUNG', 'Buenos Aires'),
(2, 'Apple South America', '30-71432342-0', 'Av. Del Libertador 4101', '0800-444-APPLE', 'Buenos Aires'),
(3, 'Motorola Solutions Argentina SRL', '30-70938823-2', 'Av. Leandro N. Alem 986', '0800-555-6686', 'Buenos Aires'),
(4, 'LG Electronics Argentina S.A.', '30-70923361-4', 'Salguero 2739', '0800-555-54-54', 'Buenos Aires'),
(5, 'Xiaomi Argentina', '30-71533691-2', 'Gorriti 5070', '+54 9 11 3050-5965', 'Buenos Aires'),
(6, 'Huawei Technologies Argentina S.A.', '30-71432504-9', 'Av. Leandro N. Alem 855', '+54 11 3984-2200', 'Buenos Aires'),
(7, 'Sony Inter-American', '30-70795249-3', 'Tucumán 1', '0800-777-7669', 'Buenos Aires'),
(8, 'OnePlus Argentina', '30-71791435-0', 'Florida 165', '+54 9 11 5667-8888', 'Buenos Aires'),
(9, 'Nokia Technologies', '30-71661829-4', 'Av. Del Libertador 101', '0800-888-6654', 'Buenos Aires'),
(10, 'Google Argentina SRL', '30-71134885-5', 'Avenida Del Libertador 498', '+54 11 5530-3000', 'Buenos Aires');

-- inserccion datos del stock
INSERT INTO stock (id, nombre, cantidad, costo) VALUES
(1, 'iPhone 12', 20, 999.00),
(2, 'Samsung Galaxy S21', 30, 899.00),
(3, 'Google Pixel 5a', 15, 449.00),
(4, 'OnePlus 9', 25, 729.00),
(5, 'Xiaomi Redmi Note 10 Pro', 40, 279.00),
(6, 'Motorola Moto G Power (2021)', 50, 249.00),
(7, 'Sony Xperia 5 II', 10, 949.00),
(8, 'LG Velvet', 20, 499.00),
(9, 'Huawei P40 Pro', 5, 1099.00),
(10, 'Nokia 8.3', 15, 699.00);

-- inserccion datos de las ventas
INSERT INTO ventas (id, factura, fecha, monto, id_clientes) VALUES
(1, 'FAC-001', '2023-05-24', 449.00, 1),
(2, 'FAC-002', '2023-05-23', 729.00, 2),
(3, 'FAC-003', '2023-05-22', 240.00, 3),
(4, 'FAC-004', '2023-05-21', 499.00, 4),
(5, 'FAC-005', '2023-05-20', 699.00, 5),
(6, 'FAC-006', '2023-05-19', 1099.00, 6),
(7, 'FAC-007', '2023-05-18', 279.00, 7),
(8, 'FAC-008', '2023-05-17', 949.00, 8),
(9, 'FAC-009', '2023-05-16', 899.00, 9),
(10, 'FAC-010', '2023-05-15', 240.00, 10);

-- inserccion datos de las compras
INSERT INTO compras (id, factura, fecha_oc, monto, id_proveedor) VALUES
(1, 'FAC-001', '2023-05-24', 700.00, 1),
(2, 'FAC-002', '2023-05-23', 600.00, 2),
(3, 'FAC-003', '2023-05-22', 250.00, 3),
(4, 'FAC-004', '2023-05-21', 500.00, 4),
(5, 'FAC-005', '2023-05-20', 100.00, 5),
(6, 'FAC-006', '2023-05-19', 80.00, 6),
(7, 'FAC-007', '2023-05-18', 740.00, 7),
(8, 'FAC-008', '2023-05-17', 320.00, 8),
(9, 'FAC-009', '2023-05-16', 800.00, 9),
(10, 'FAC-010', '2023-05-15', 450.00, 10);

-- inserccion de datos de pagos
INSERT INTO pagos (id, factura, id_cliente, id_producto, fecha, precio, cantidad) VALUES
(1, 'FAC-001', 1, 1, '2023-05-24', 449.00, 1),
(2, 'FAC-002', 2, 2, '2023-05-23', 729.00, 1),
(3, 'FAC-003', 3, 3, '2023-05-22', 240.00, 1),
(4, 'FAC-004', 4, 4, '2023-05-21', 499.00, 1),
(5,'FAC-005', 5, 5, '2023-05-20', 699.00, 1),
(6, 'FAC-006', 6, 6, '2023-05-19', 1099.00, 1),
(7, 'FAC-007', 7, 7, '2023-05-18', 279.00, 1),
(8, 'FAC-008', 8, 8, '2023-05-17', 949.00, 1),
(9, 'FAC-009', 9, 9, '2023-05-16', 899.00, 1),
(10, 'FAC-010', 10, 10, '2023-05-15', 240.00, 1)

-- vistas
-- esta vista mostrara los clientas y las compras que han realizado y ordenados por fecha de compra
CREATE VIEW clientes_con_compras AS
SELECT c.nombre, v.fecha, v.monto
FROM Clientes c
JOIN Ventas v ON c.id = v.id_Clientes
ORDER BY v.fecha DESC

-- vista 2
-- esta vista mostrara los productos con su cantidad en stock y su costo 
CREATE VIEW productos_con_existencias AS
SELECT nombre, cantidad, costo
FROM Stock
WHERE cantidad > 0 AND costo > 0
ORDER BY nombre ASC

-- vista 3
-- esta vista muestra los proveedores y las compras que hemos realizados,ordenados por fecha de compra
CREATE VIEW proveedores_con_compras AS
SELECT p.nombre, c.fecha_oc, c.monto
FROM Proveedores p
JOIN Compras c ON p.id = c.id_proveedor
JOIN Ventas v ON c.factura = v.factura
ORDER BY c.fecha_oc DESC

-- vista 4
-- esta vista me indicara cuantos telefonos y que modelo es solicitado en cada localidad
CREATE VIEW existencias_por_localidad AS
SELECT c.localidad, s.nombre, SUM(p.cantidad) AS cantidad_existencias
FROM Clientes c
JOIN Pagos p ON c.id = p.id_cliente
JOIN Stock s ON p.id_producto = s.id
GROUP BY c.localidad, s.nombre
ORDER BY c.localidad ASC, s.nombre ASC


-- storeprocedure
DELIMITER ??
CREATE PROCEDURE `insertar_venta`(
    IN p_factura VARCHAR(30),
    IN p_fecha DATE,
    IN p_monto DECIMAL(12,1),
    IN p_id_cliente INT,
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO ventas (factura, fecha, monto, id_clientes)
    VALUES (p_factura, p_fecha, p_monto, p_id_cliente);

    UPDATE stock SET cantidad = cantidad - p_cantidad
    WHERE id = p_id_producto;

    INSERT INTO pagos (factura, id_cliente, id_producto, fecha, precio, cantidad)
    VALUES (p_factura, p_id_cliente, p_id_producto, p_fecha, p_monto, p_cantidad);

    COMMIT;
END ??

-- storeprocedure
CREATE DEFINER=`root`@`localhost` PROCEDURE `transaccion_en_clientes`()
BEGIN
   DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
    BEGIN
    ROLLBACK;
END;

START TRANSACTION;
INSERT INTO clientes (id, nombre, cp, direccion, telefono, localidad) VALUES (15, 'Bruno German', '8143', '24 de septiembre 6234', '011-135-1234', 'Montevideo');
INSERT INTO clientes (id, nombre, cp, direccion, telefono, localidad) VALUES (16, 'Iban Ramirez', '1942', 'garay 2134', '011-555-9134', 'Tierra Del Fuego');
COMMIT;
END

-- Funciton 
-- esta funcion sirve para saber la cantidad de stock en cada celular
DELIMITER ??
CREATE FUNCTION `stock_Nombre_Telefono`(name VARCHAR(30)) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE stock INT;
  
  SELECT cantidad  
    INTO stock 
    FROM Stock
   WHERE nombre = name;
            
  RETURN stock;
END ??

-- function
-- esta funcion es para ver cuantas localidades se repite para los envios y tener un registro
DELIMITER ??
CREATE FUNCTION `cantidad_localidad_repetida`(localidad_buscar VARCHAR(255)) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE cantidad INTEGER;
  SELECT COUNT(*) INTO cantidad FROM (
    SELECT localidad, COUNT(*) as cantidad_clientes FROM clientes
    GROUP BY localidad
    HAVING COUNT(*) > 1
  ) t WHERE t.localidad = localidad_buscar;
  RETURN cantidad;
END ??

-- trigger
-- este trigger sirve para llevar un registro de cada cliente nuevo
CREATE TRIGGER add_clientes_nuevos
AFTER INSERT ON clientes
FOR EACH ROW
INSERT INTO  nuevos_clientes (id, nombre, telefono, localidad) VALUES (NEW.id, NEW.nombre, NEW.telefono, NEW.localidad);

-- trigger 
-- este trigger sirve para llevar un registro de cada cliente eliminado
CREATE TRIGGER eliminar_cliente
AFTER DELETE ON clientes
FOR EACH ROW
INSERT INTO nuevos_clientes (id_cliente, fecha_eliminacion) VALUES (OLD.id, NOW());