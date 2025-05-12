# Tarea 2: Trabajo con Índices

## Ejercicio 1: Elimine la tabla "cliente" si existe

Comando:
DROP TABLE IF EXISTS cliente;

## Ejercicio 2: Cree la tabla sin clave primaria y luego inclúyela

Comando:
CREATE TABLE cliente (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    telefono VARCHAR(11)
);

Comando para agregar la clave primaria:
ALTER TABLE cliente ADD PRIMARY KEY (documento);

## Ejercicio 3: Define los siguientes índices

Comando:
CREATE UNIQUE INDEX idx_documento ON cliente (documento);

Comando:
CREATE INDEX idx_ciudad_provincia ON cliente (ciudad, provincia);

Justificación:
El índice único en `documento` asegura que no haya registros duplicados en ese campo. El índice común en `ciudad` y `provincia` mejora las búsquedas basadas en esos dos campos sin exigir valores únicos.

## Ejercicio 4: Vea los índices de la tabla

Comando:
SHOW INDEX FROM cliente;

## Ejercicio 5: Agregue un índice único por el campo "telefono"

Comando:
CREATE UNIQUE INDEX idx_telefono ON cliente (telefono);

## Ejercicio 6: Elimina los índices

Comando:
DROP INDEX idx_documento ON cliente;

Comando:
DROP INDEX idx_ciudad_provincia ON cliente;

Comando:
DROP INDEX idx_telefono ON cliente;
