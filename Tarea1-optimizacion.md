# Tarea 1: Trabajo con Índices

## Ejercicio 1: Elimine la tabla "alumno" si existe

Comando:
DROP TABLE IF EXISTS alumno;

## Ejercicio 2: Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción)

Comando:
CREATE TABLE alumno (
    nro_inscripcion INT NOT NULL,
    anio_inscripcion INT NOT NULL,
    nombre VARCHAR(100),
    documento VARCHAR(20),
    domicilio VARCHAR(100),
    ciudad VARCHAR(50),
    provincia VARCHAR(50),
    PRIMARY KEY (anio_inscripcion, nro_inscripcion)
);

## Ejercicio 3: Define los siguientes índices

Comando:
CREATE UNIQUE INDEX idx_documento ON alumno (documento);

Comando:
CREATE INDEX idx_ciudad_provincia ON alumno (ciudad, provincia);

Justificación:
El índice único en documento evita duplicados. El índice común en ciudad y provincia mejora la búsqueda sin requerir valores únicos.

## Ejercicio 4: Vea los índices de la tabla

Comando:
SHOW INDEX FROM alumno;

## Ejercicio 5: Intente ingresar un alumno con clave primaria repetida

Comando:
INSERT INTO alumno VALUES (1, 2025, 'Juan Perez', '12345678', 'Calle Falsa 123', 'Rosario', 'Santa Fe');

## Ejercicio 6: Intente ingresar un alumno con clave primaria repetida

Comando:
INSERT INTO alumno VALUES (1, 2025, 'Ana Gomez', '87654321', 'Otra Calle 456', 'Córdoba', 'Córdoba');

## Ejercicio 7: Intente ingresar un alumno con documento repetido

Comando:
INSERT INTO alumno VALUES (2, 2025, 'Pedro Lopez', '12345678', 'Calle Nueva 789', 'Mendoza', 'Mendoza');

## Ejercicio 8: Ingrese varios alumnos de la misma ciudad y provincia

Comando:
INSERT INTO alumno VALUES (2, 2025, 'Lucia Ramirez', '11223344', 'Av. Siempre Viva', 'Rosario', 'Santa Fe');
INSERT INTO alumno VALUES (3, 2025, 'Carlos Ruiz', '55667788', 'Pje. Los Andes', 'Rosario', 'Santa Fe');

## Ejercicio 9: Elimina los índices creados, y muestra que ya no se encuentran

Comando:
DROP INDEX idx_documento ON alumno;

Comando:
DROP INDEX idx_ciudad_provincia ON alumno;

Comando:
SHOW INDEX FROM alumno;
