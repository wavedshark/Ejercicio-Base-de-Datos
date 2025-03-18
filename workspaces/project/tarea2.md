Paso 1: Creación de la Base de Datos y las Tablas
Creación de la base de datos
El primer paso fue abrir la terminal y ejecutar SQLite3 para crear una nueva base de datos llamada tarea2.db. Para ello, utilicé el siguiente comando:

sqlite3 tarea2.db

Este comando abre SQLite3 y crea una nueva base de datos llamada tarea2.db. Si la base de datos ya existía, simplemente la abre, pero si no existía, se crea automáticamente.

Creación de las tablas
A continuación, creé las dos tablas necesarias para este ejercicio: Propietarios y Vehículos. La relación entre las dos tablas es de tipo uno a muchos, lo que significa que un propietario puede tener varios vehículos, pero cada vehículo solo pertenece a un único propietario.

Tabla Propietarios
La tabla Propietarios almacena la información sobre los propietarios. Esta tabla tiene los siguientes campos:

id: un campo entero que es clave primaria y se autoincrementa automáticamente con cada nuevo propietario.
nombre: el nombre del propietario.
apellido: el apellido del propietario.
dni: un campo único para el DNI del propietario.
Para crear esta tabla, utilicé el siguiente comando SQL:

CREATE TABLE Propietarios ( id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL, apellido TEXT NOT NULL, dni TEXT UNIQUE NOT NULL );

Tabla Vehículos
La tabla Vehículos almacena la información sobre los vehículos. Esta tabla tiene los siguientes campos:

id: un campo entero que es clave primaria y se autoincrementa con cada nuevo vehículo.
marca: la marca del vehículo.
modelo: el modelo del vehículo.
anio: el año de fabricación del vehículo.
id_propietario: un campo que es una clave foránea que hace referencia a la tabla Propietarios, asociando cada vehículo a un propietario.
Para crear esta tabla, utilicé el siguiente comando SQL:

CREATE TABLE Vehiculos ( id INTEGER PRIMARY KEY AUTOINCREMENT, marca TEXT NOT NULL, modelo TEXT NOT NULL, anio INTEGER NOT NULL, id_propietario INTEGER, FOREIGN KEY (id_propietario) REFERENCES Propietarios(id) );

Con estos dos comandos, se crearon las tablas Propietarios y Vehículos, con los campos necesarios y las relaciones entre ellas.

Paso 2: Inserción de Datos
A continuación, inserté 20 entradas de datos en ambas tablas. La información proporcionada incluía detalles de los propietarios (nombre, apellido, DNI) y de los vehículos (marca, modelo, año). Para insertar estos datos, utilicé el comando INSERT INTO.

Por ejemplo, para insertar el primer propietario y su vehículo, utilicé el siguiente comando:

INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Juan', 'Perez', '12345678A'); INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Ford', 'Fiesta', 2019, 1);

Repetí este proceso para insertar las 20 entradas de datos de acuerdo con la información proporcionada. Al final, todos los registros fueron correctamente almacenados en las tablas correspondientes.

Paso 3: Consultas de Datos
Una vez que los datos fueron insertados, realicé una serie de consultas para obtener diferentes tipos de información de las tablas. Las consultas que realicé fueron las siguientes:

Seleccionar todos los propietarios: Utilicé el siguiente comando para ver toda la información de los propietarios:
SELECT * FROM Propietarios;

Listar todos los vehículos: Para listar todos los vehículos, utilicé el siguiente comando:
SELECT * FROM Vehiculos;

Seleccionar solo los nombres y apellidos de los propietarios: Para obtener solo los nombres y apellidos, utilicé este comando:
SELECT nombre, apellido FROM Propietarios;

Listar todas las marcas y modelos de los vehículos: Para obtener solo las marcas y modelos, utilicé:
SELECT marca, modelo FROM Vehiculos;

Seleccionar solo los propietarios con apellido "Perez": Para obtener solo los propietarios con ese apellido, usé:
SELECT * FROM Propietarios WHERE apellido = 'Perez';

Listar todos los vehículos con año 2019: Para listar solo los vehículos fabricados en 2019, utilicé:
SELECT * FROM Vehiculos WHERE anio = 2019;

Seleccionar propietarios que tienen vehículos de la marca "Toyota": Para esto, hice una consulta que utilizaba una relación entre las dos tablas:
SELECT p.nombre, p.apellido FROM Propietarios p JOIN Vehiculos v ON p.id = v.id_propietario WHERE v.marca = 'Toyota';

Listar vehículos con marca "Ford" y modelo "Fiesta": Para listar solo los vehículos Ford con el modelo Fiesta, utilicé el siguiente comando:
SELECT * FROM Vehiculos WHERE marca = 'Ford' AND modelo = 'Fiesta';

Seleccionar propietarios con DNI "12345678A": Para buscar el propietario con ese DNI, utilicé:
SELECT * FROM Propietarios WHERE dni = '12345678A';

Listar vehículos que pertenecen al propietario con ID 5: Para encontrar los vehículos del propietario con ID 5, utilicé:
SELECT * FROM Vehiculos WHERE id_propietario = 5;

Con estas consultas, pude obtener la información solicitada y verificar que la base de datos estaba correctamente configurada y poblada.

Paso 4: Actualización de Datos
Finalmente, realicé varias actualizaciones en la base de datos para modificar algunos de los registros existentes.

Actualizar el nombre de un propietario con DNI "12345678A": Para cambiar el nombre del propietario, utilicé el siguiente comando:
UPDATE Propietarios SET nombre = 'Juan Carlos' WHERE dni = '12345678A';

Modificar el año de un vehículo con ID 3 a 2022: Para cambiar el año de fabricación del vehículo con ID 3, utilicé:
UPDATE Vehiculos SET anio = 2022 WHERE id = 3;

Cambiar el modelo de todos los vehículos Nissan a "Micra": Para actualizar el modelo de todos los vehículos Nissan, utilicé el siguiente comando:
UPDATE Vehiculos SET modelo = 'Micra' WHERE marca = 'Nissan';

Actualizar el apellido de un propietario con ID 7 a "Gomez": Para modificar el apellido del propietario con ID 7, utilicé:
UPDATE Propietarios SET apellido = 'Gomez' WHERE id = 7;

Modificar la marca de un vehículo con modelo "Fiesta" a "Renault": Para cambiar la marca de todos los vehículos con el modelo "Fiesta", utilicé:
UPDATE Vehiculos SET marca = 'Renault' WHERE modelo = 'Fiesta';

Con estos comandos, realicé las actualizaciones necesarias en la base de datos.
