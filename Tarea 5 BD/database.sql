-- Elimino la tabla autor si existe
DROP TABLE IF EXISTS autor;
CREATE TABLE IF NOT EXISTS autor (
    id INTEGER PRIMARY KEY,
    nombre TEXT
);

-- Elimino la tabla libro si existe
DROP TABLE IF EXISTS libro;
CREATE TABLE IF NOT EXISTS libro (
    codigo INTEGER PRIMARY KEY,
    titulo TEXT,
    autor_id INTEGER,
    editorial TEXT,
    precio REAL,
    FOREIGN KEY (autor_id) REFERENCES autor(id)
);

-- Insertar datos en la tabla autor
INSERT INTO autor (nombre) VALUES
    ('J.K. Rowling'),
    ('Stephen King'),
    ('George Orwell'),
    ('Jane Austen'),
    ('Agatha Christie');

-- Insertar datos en la tabla libro
INSERT INTO libro (titulo, autor_id, editorial, precio) VALUES
    ('The Great Gatsby', 6, 'Charles Scribner''s Sons', 20.99),
    ('To Kill a Mockingbird', 7, 'J.B. Lippincott & Co.', 15.95),
    ('The Catcher in the Rye', 8, 'Little, Brown and Company', 18.75),
    ('One Hundred Years of Solitude', 9, 'Harper & Row', 22.50),
    ('Brave New World', 3, 'Chatto & Windus', 17.99),
    ('The Hobbit', 10, 'George Allen & Unwin', 24.99),
    
;
