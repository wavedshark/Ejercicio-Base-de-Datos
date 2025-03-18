1. Creación de la Base de Datos
Para comenzar, se creó el archivo empleados-dump.sql, el cual contiene la estructura de la tabla empleados y una serie de registros insertados en ella. La tabla está compuesta por las siguientes columnas:

id: Identificador único de cada empleado.
nombre: Nombre del empleado.
salario: Salario en valor numérico.
departamento: Área en la que trabaja el empleado.
Carga del Archivo en SQLite
Desde la terminal, se accedió a SQLite y se ejecutó el siguiente comando para crear la base de datos y cargar los datos:

sqlite3 tarea3.db
.read empleados-dump.sql
Con esto, la base de datos quedó lista para realizar consultas.

2. Consultas Realizadas
A continuación, se detallan las consultas ejecutadas y su propósito:

2.1. Manipulación de Texto
Se transformaron los nombres de los empleados a mayúsculas con UPPER(nombre).
Se concatenó el nombre y el departamento de cada empleado utilizando || como operador de concatenación.
2.2. Funciones Numéricas y Agregación
Se calculó la suma total de los salarios con SUM(salario).
Se obtuvo el promedio de los salarios mediante AVG(salario).
Se redondearon los salarios a dos decimales con ROUND(salario, 2).
2.3. Consultas Basadas en Condiciones
Se filtraron empleados de Ventas con salarios superiores a 52,000.
Se seleccionaron empleados cuyos nombres contienen la letra "a", ordenando los resultados por salario ascendente.
Se listaron empleados con salarios fuera del rango de 55,000 a 70,000, organizados por departamento.
2.4. Funciones de Fecha y Hora
Se mostró la fecha actual con DATE('now').
Se obtuvo la hora actual con TIME('now').
2.5. Consultas Avanzadas con CASE y LIKE
Se categorizó a los empleados según sus salarios en "Bajo", "Medio" y "Alto" usando CASE.
Se contaron los empleados por departamento con COUNT(*) GROUP BY departamento.
Se seleccionaron empleados cuyos nombres terminan en "o" o "a" dentro del departamento de Ventas.
