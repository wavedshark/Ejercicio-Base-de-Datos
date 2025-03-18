Estructura de la Tabla
La tabla Ejemplo tiene seis columnas:

id: Un identificador único que se autoincrementa para cada registro.
texto: Un campo de tipo texto.
entero: Un valor entero.
decimal: Un valor decimal.
fecha: Una fecha en formato YYYY-MM-DD.
booleano: Un valor booleano (0 o 1).
Estos campos permiten almacenar una variedad de datos que pueden ser útiles en distintos tipos de aplicaciones.

Pasos Realizados
1. Creación de la Base de Datos y la Tabla
Lo primero que se hizo fue crear una base de datos llamada tarea1.db y, dentro de ella, una tabla llamada Ejemplo. Esta tabla fue diseñada con los campos mencionados anteriormente, lo que nos permite almacenar una combinación de diferentes tipos de datos.

2. Inserción de Datos
Una vez creada la tabla, se insertaron 50 registros con valores distintos. Cada uno de estos registros contenía datos variados, desde cadenas de texto y números, hasta fechas y valores booleanos. La columna id se configuró para autoincrementarse, lo que garantiza que cada registro tenga un identificador único.

3. Consultas Realizadas
Para interactuar con los datos, se realizaron algunas consultas básicas. Primero, se utilizaron comandos como SELECT * FROM Ejemplo; para obtener todos los registros de la tabla y SELECT * FROM Ejemplo WHERE entero > 50; para filtrar los registros donde el valor de la columna entero sea mayor a 50. Estas consultas nos ayudaron a comprobar que los datos se almacenaron correctamente y que las operaciones de filtrado funcionaban como se esperaba.

4. Modificaciones y Eliminaciones
Después de insertar los datos, se realizaron varias modificaciones y eliminaciones para experimentar con los comandos de actualización y eliminación en SQLite:

Se eliminaron los registros donde el valor de la columna booleano era 1 (verdadero).
Se modificaron los registros cuyo valor de entero era menor a 30, cambiando el texto de esos registros a "Modificado".
También se eliminaron los registros con un valor específico de entero (50 en este caso).
Se incrementó en 10 el valor de la columna entero en aquellos registros donde booleano era 0 (falso).
Se eliminaron los registros donde el valor de la columna decimal era menor que 50.
Finalmente, se actualizó la fecha en todos los registros a la fecha actual usando el comando DATE('now').
