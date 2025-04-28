-- NOMBRE: [TU NOMBRE COMPLETO]
-- ARCHIVO: XX_consultas_multitabla.sql

-------------------------------------------------------------------
-- CONSULTAS BÁSICAS
-------------------------------------------------------------------

-- 1. Listar todos los libros disponibles
SELECT * FROM libro WHERE disponible = 1;

-- 2. Mostrar socios de Madrid ordenados por apellido
SELECT * FROM socio WHERE ciudad = 'Madrid' ORDER BY apellido1;

-- 3. Libros publicados después de 1950
SELECT * FROM libro WHERE año_publicacion > 1950;

-- 4. Bibliotecarios con más de 3 años de antigüedad
SELECT * FROM bibliotecario WHERE antiguedad > 3;

-- 5. Préstamos realizados en 2023
SELECT * FROM prestamo WHERE fecha_prestamo LIKE '2023%';

-- 6. Socios sin segundo apellido
SELECT * FROM socio WHERE apellido2 IS NULL;

-- 7. Libros del género "Realismo mágico"
SELECT * FROM libro WHERE genero = 'Realismo mágico';

-- 8. Préstamos no devueltos
SELECT * FROM prestamo WHERE fecha_devolucion IS NULL;

-------------------------------------------------------------------
-- CONSULTAS MULTITABLA (WHERE)
-------------------------------------------------------------------

-- 9. Préstamos con nombres de socio y libro (sin JOIN)
SELECT prestamo.*, socio.nombre AS socio_nombre, libro.titulo AS libro_titulo
FROM prestamo, socio, libro
WHERE prestamo.id_socio = socio.id AND prestamo.id_libro = libro.id;

-- 10. Libros prestados a socios de Barcelona (sin JOIN)
SELECT libro.*
FROM prestamo, socio, libro
WHERE prestamo.id_socio = socio.id AND prestamo.id_libro = libro.id AND socio.ciudad = 'Barcelona';

-- 11. Socios que han tomado prestado "Cien años de soledad" (sin JOIN)
SELECT socio.*
FROM prestamo, socio, libro
WHERE prestamo.id_socio = socio.id AND prestamo.id_libro = libro.id AND libro.titulo = 'Cien años de soledad';

-- 12. Préstamos con retraso
SELECT *
FROM prestamo
WHERE fecha_devolucion IS NOT NULL 
  AND julianday(fecha_devolucion) - julianday(fecha_prestamo) > 14;

-- 13. Socios que nunca han tomado prestado un libro
SELECT *
FROM socio
WHERE id NOT IN (SELECT id_socio FROM prestamo);

-- 14. Libros más prestados
SELECT id_libro, COUNT(*) AS veces_prestado
FROM prestamo
GROUP BY id_libro
ORDER BY veces_prestado DESC;

-- 15. Autores cuyos libros han sido prestados
SELECT DISTINCT libro.autor
FROM prestamo, libro
WHERE prestamo.id_libro = libro.id;

-------------------------------------------------------------------
-- CONSULTAS MULTITABLA (JOIN)
-------------------------------------------------------------------

-- 16. Préstamos con nombres de socio y libro
SELECT prestamo.id, socio.nombre, libro.titulo
FROM prestamo
JOIN socio ON prestamo.id_socio = socio.id
JOIN libro ON prestamo.id_libro = libro.id;

-- 17. Libros prestados a socios de Barcelona
SELECT libro.*
FROM prestamo
JOIN socio ON prestamo.id_socio = socio.id
JOIN libro ON prestamo.id_libro = libro.id
WHERE socio.ciudad = 'Barcelona';

-- 18. Socios que han tomado prestado "Cien años de soledad"
SELECT socio.*
FROM prestamo
JOIN socio ON prestamo.id_socio = socio.id
JOIN libro ON prestamo.id_libro = libro.id
WHERE libro.titulo = 'Cien años de soledad';

-- 19. Socios con sus préstamos activos
SELECT socio.nombre, prestamo.fecha_prestamo
FROM socio
JOIN prestamo ON socio.id = prestamo.id_socio
WHERE prestamo.fecha_devolucion IS NULL;

-- 20. Libros nunca prestados
SELECT libro.*
FROM libro
LEFT JOIN prestamo ON libro.id = prestamo.id_libro
WHERE prestamo.id_libro IS NULL;

-- 21. Autores con número de libros prestados
SELECT libro.autor, COUNT(*) AS prestamos
FROM prestamo
JOIN libro ON prestamo.id_libro = libro.id
GROUP BY libro.autor;

-------------------------------------------------------------------
-- CONSULTAS RESUMEN
-------------------------------------------------------------------

-- 22. Número de socios por ciudad
SELECT ciudad, COUNT(*) AS num_socios
FROM socio
GROUP BY ciudad;

-- 23. Promedio de antigüedad de bibliotecarios
SELECT AVG(antiguedad) AS promedio_antiguedad
FROM bibliotecario;

-- 24. Cantidad de préstamos por mes en 2023
SELECT strftime('%m', fecha_prestamo) AS mes, COUNT(*) AS prestamos
FROM prestamo
WHERE fecha_prestamo LIKE '2023%'
GROUP BY mes;

-- 25. Libros más populares (por veces prestados)
SELECT libro.titulo, COUNT(*) AS veces_prestado
FROM prestamo
JOIN libro ON prestamo.id_libro = libro.id
GROUP BY libro.titulo
ORDER BY veces_prestado DESC;

-- 26. Socios más activos (por préstamos realizados)
SELECT socio.nombre, COUNT(*) AS prestamos_realizados
FROM prestamo
JOIN socio ON prestamo.id_socio = socio.id
GROUP BY socio.nombre
ORDER BY prestamos_realizados DESC;

-- 27. Porcentaje de libros disponibles
SELECT (SELECT COUNT(*) FROM libro WHERE disponible = 1) * 100.0 / COUNT(*) AS porcentaje_disponibles
FROM libro;

-- 28. Días promedio de préstamo
SELECT AVG(julianday(fecha_devolucion) - julianday(fecha_prestamo)) AS promedio_dias
FROM prestamo
WHERE fecha_devolucion IS NOT NULL;

-- 29. Número de préstamos por categoría de socio
SELECT socio.categoria, COUNT(*) AS prestamos
FROM prestamo
JOIN socio ON prestamo.id_socio = socio.id
GROUP BY socio.categoria;

-------------------------------------------------------------------
-- SUBCONSULTAS
-------------------------------------------------------------------

-- 30. Socios que han prestado libros de Gabriel García Márquez
SELECT DISTINCT socio.*
FROM socio
WHERE id IN (
    SELECT id_socio
    FROM prestamo
    JOIN libro ON prestamo.id_libro = libro.id
    WHERE libro.autor = 'Gabriel García Márquez'
);

-- 31. Libros con préstamos superiores al promedio
SELECT id_libro, COUNT(*) AS total
FROM prestamo
GROUP BY id_libro
HAVING total > (SELECT AVG(conteo) FROM (SELECT COUNT(*) AS conteo FROM prestamo GROUP BY id_libro));

-- 32. Socios con todos los préstamos devueltos a tiempo
SELECT socio.*
FROM socio
WHERE id NOT IN (
    SELECT id_socio
    FROM prestamo
    WHERE fecha_devolucion IS NULL OR julianday(fecha_devolucion) - julianday(fecha_prestamo) > 14
);

-- 33. Socios que han prestado más libros que el promedio
SELECT socio.*
FROM socio
WHERE id IN (
    SELECT id_socio
    FROM prestamo
    GROUP BY id_socio
    HAVING COUNT(*) > (SELECT AVG(conteo) FROM (SELECT COUNT(*) AS conteo FROM prestamo GROUP BY id_socio))
);

-- 34. Libros disponibles que nunca han sido prestados
SELECT *
FROM libro
WHERE
