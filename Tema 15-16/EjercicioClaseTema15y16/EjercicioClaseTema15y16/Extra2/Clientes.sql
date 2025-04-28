-- Crear la base de datos
DROP TABLE IF EXISTS clientes;
CREATE DATABASE IF NOT EXISTS mi_base;
USE mi_base;

-- Crear la tabla de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    edad INT NOT NULL,
    total_gastado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    antiguedad INT NOT NULL DEFAULT 0 -- Años como cliente
);

-- Insertar datos en la tabla de clientes
INSERT INTO clientes (nombre, apellidos, email, edad, total_gastado, antiguedad) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', 30, 150.75, 5),
('María', 'López', 'maria.lopez@example.com', 25, 200.50, 3),
('Carlos', 'Gómez', 'carlos.gomez@example.com', 40, 350.20, 8);

SELECT 
    CONCAT(
        '<?xml version="1.0" encoding="UTF-8"?>',
        '\n  <clientes>',
        GROUP_CONCAT(
            CONCAT(
                '\n    <cliente>',
                    '\n      <id>', id, '</id>',
                    '\n      <nombre>', nombre, '</nombre>',
                    '\n      <apellidos>', apellidos, '</apellidos>',
                    '\n      <email>', email, '</email>',
                    '\n      <edad>', edad, '</edad>',
                    '\n      <total_gastado>', total_gastado, '</total_gastado>',
                    '\n      <antiguedad>', antiguedad, '</antiguedad>',
                '\n    </cliente>'
            ) SEPARATOR ''
        ),
        '\n  </clientes>'
    ) AS xml_result
FROM clientes;