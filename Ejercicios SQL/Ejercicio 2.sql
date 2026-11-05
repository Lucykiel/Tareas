-- ventas.sql

CREATE DATABASE IF NOT EXISTS ventas;
USE ventas;

-- tabla clientes
CREATE TABLE IF NOT EXISTS clientes(
 pk_cif_nif VARCHAR(9) PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 calle VARCHAR(150),
 numero VARCHAR(10),
 ciudad VARCHAR(100),
 codigo_postal INT(5)
);

-- tabla telefonos_clientes
CREATE TABLE IF NOT EXISTS telefonos_clientes(
 pk_telefono INT AUTO_INCREMENT PRIMARY KEY,
 fk_cif_nif VARCHAR(9),
 FOREIGN KEY (fk_cif_nif) REFERENCES clientes(pk_cif_nif)
);

-- tabla facturas
CREATE TABLE IF NOT EXISTS facturas(
 pk_numero_factura INT AUTO_INCREMENT PRIMARY KEY,
 fk_cif_nif_cliente VARCHAR(9),
 FOREIGN KEY (fk_cif_nif_cliente) REFERENCES clientes(pk_cif_nif),
 fecha DATETIME,
 descuento SMALLINT,
 importe_final DECIMAL(5, 2) DEFAULT 0.00
);

-- tabla proveedores
CREATE TABLE IF NOT EXISTS proveedores(
 pk_cif_nif INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 telefono VARCHAR(50),
 web VARCHAR(150),
 calle VARCHAR(150),
 numero VARCHAR(10),
 ciudad VARCHAR(100),
 codigo_postal VARCHAR(10)
);

-- tabla categorias
CREATE TABLE IF NOT EXISTS categorias(
 pk_categoria INT AUTO_INCREMENT PRIMARY KEY,
 nombre_categoria VARCHAR(50),
 descripcion TEXT
);

-- tabla productos
CREATE TABLE IF NOT EXISTS productos(
 pk_producto INT AUTO_INCREMENT PRIMARY KEY,
 fk_cif_nif_proveedor INT,
 FOREIGN KEY (fk_cif_nif_proveedor) REFERENCES proveedores(pk_cif_nif),
 fk_categoria INT,
 FOREIGN KEY (fk_categoria) REFERENCES categorias(pk_categoria),
 nombre VARCHAR(100) NOT NULL,
 stock INT,
 precio_actual DECIMAL(5, 2)
);

-- tabla facturas_productos
CREATE TABLE IF NOT EXISTS facturas_productos(
 fk_numero_factura INT,
 fk_producto INT,
 CONSTRAINT pk_facturas_productos
    PRIMARY KEY (fk_numero_factura, fk_producto),
 cantidad INT,
 precio_venta DECIMAL (5, 2),
 iva DECIMAL (5, 2)
);

-- foreign keys




