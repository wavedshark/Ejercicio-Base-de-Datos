-- Eliminación y creación de la tabla autor
DROP TABLE IF EXISTS autor;
CREATE TABLE IF NOT EXISTS autor (
    id INTEGER PRIMARY KEY,
    nombre TEXT
);

-- Eliminación y creación de la tabla libro
DROP TABLE IF EXISTS libro;
CREATE TABLE IF NOT EXISTS libro (
    codigo INTEGER PRIMARY KEY,
    titulo TEXT,
    autor_id INTEGER,
    editorial TEXT,
    precio REAL,
    FOREIGN KEY (autor_id) REFERENCES autor(id)
);

-- Inserción de autores
INSERT INTO autor (id, nombre) VALUES
    (1, 'J.K. Rowling'),
    (2, 'Stephen King'),
    (3, 'George Orwell'),
    (4, 'Jane Austen'),
    (5, 'Agatha Christie');

-- Inserción de libros
INSERT INTO libro (titulo, autor_id, editorial, precio) VALUES
    ('Harry Potter and the Philosopher''s Stone', 1, 'Bloomsbury', 20.99),
    ('The Shining', 2, 'Doubleday', 15.95),
    ('1984', 3, 'Secker & Warburg', 18.75),
    ('Pride and Prejudice', 4, 'T. Egerton', 22.50),
    ('Murder on the Orient Express', 5, 'Collins Crime Club', 17.99);

-- Consultas con expresiones regulares

-- 1. Libros cuyo título comienza con "H"
SELECT * FROM libro WHERE titulo REGEXP '^H';

-- 2. Libros escritos por autores cuyos nombres terminan con "ing"
SELECT * FROM libro WHERE autor_id IN (SELECT id FROM autor WHERE nombre REGEXP 'ing$');

-- 3. Libros con títulos que contienen la palabra "and"
SELECT * FROM libro WHERE titulo REGEXP '\band\b';

-- 4. Libros cuyo título comienza con una vocal
SELECT * FROM libro WHERE titulo REGEXP '^[AEIOUaeiou]';

-- 5. Libros cuyo autor tiene al menos una vocal repetida
SELECT * FROM libro WHERE autor_id IN (SELECT id FROM autor WHERE nombre REGEXP '(.*[aeiou])\1');

-- 6. Libros con precios que tienen dos dígitos decimales exactos
SELECT * FROM libro WHERE precio REGEXP '\d+\.\d{2}$';

-- 7. Libros cuyos títulos tienen al menos tres palabras
SELECT * FROM libro WHERE titulo REGEXP '^[^ ]+ [^ ]+ [^ ]+';

-- 8. Autores cuyo nombre empieza con "A"
SELECT * FROM autor WHERE nombre REGEXP '^A';

-- 9. Libros cuyo título contiene "SQL"
SELECT * FROM libro WHERE titulo REGEXP 'SQL';

-- 10. Autores cuyo nombre termina con "ez"
SELECT * FROM autor WHERE nombre REGEXP 'ez$';

-- 11. Autores con al menos 5 caracteres en su nombre
SELECT * FROM autor WHERE nombre REGEXP '^.{5,}$';

-- 12. Libros cuya editorial no es "EditorialX"
SELECT * FROM libro WHERE editorial NOT LIKE 'EditorialX';

-- 13. Autores cuyo nombre tiene al menos una vocal
SELECT * FROM autor WHERE nombre REGEXP '[aeiouAEIOU]';

-- 14. Libros cuyo título comienza con una mayúscula
SELECT * FROM libro WHERE titulo REGEXP '^[A-Z]';

-- 15. Autores cuyo nombre no contiene la letra "r"
SELECT * FROM autor WHERE nombre NOT REGEXP 'r';

-- 16. Libros cuya editorial empieza con "P"
SELECT * FROM libro WHERE editorial REGEXP '^P';

-- 17. Autores con exactamente 6 caracteres en su nombre
SELECT * FROM autor WHERE nombre REGEXP '^.{6}$';

-- 18. Libros cuyo título contiene al menos un número
SELECT * FROM libro WHERE titulo REGEXP '[0-9]';

-- 19. Autores cuyo nombre inicia con una vocal
SELECT * FROM autor WHERE nombre REGEXP '^[AEIOUaeiou]';

-- 20. Autores sin espacios en su nombre
SELECT * FROM autor WHERE nombre NOT REGEXP ' ';

-- 21. Libros cuyo título termina con una vocal
SELECT * FROM libro WHERE titulo REGEXP '[aeiouAEIOU]$';

-- 22. Autores cuyo nombre contiene "er"
SELECT * FROM autor WHERE nombre REGEXP 'er';

-- 23. Libros cuyo título empieza con "The"
SELECT * FROM libro WHERE titulo REGEXP '^The\b';

-- 24. Autores con al menos una letra mayúscula
SELECT * FROM autor WHERE nombre REGEXP '[A-Z]';

-- 25. Libros con precio de dos decimales exactos
SELECT * FROM libro WHERE precio REGEXP '\d+\.\d{2}$';

-- 26. Autores sin números en su nombre
SELECT * FROM autor WHERE nombre NOT REGEXP '[0-9]';

-- 27. Libros con al menos tres vocales
SELECT * FROM libro WHERE titulo REGEXP '.*[aeiou].*[aeiou].*[aeiou]';

-- 28. Autores cuyo nombre inicia con una consonante
SELECT * FROM autor WHERE nombre REGEXP '^[^AEIOUaeiou]';

-- 29. Libros cuyo título no contiene "Science"
SELECT * FROM libro WHERE titulo NOT REGEXP 'Science';

-- 30. Autores con al menos una letra repetida consecutivamente
SELECT * FROM autor WHERE nombre REGEXP '(.)\1';

-- 31. Autores cuyo nombre empieza con "M" o termina con "n"
SELECT * FROM autor WHERE nombre REGEXP '^M|n$';

-- 32. Autores sin caracteres especiales
SELECT * FROM autor WHERE nombre NOT REGEXP '[^a-zA-Z ]';
