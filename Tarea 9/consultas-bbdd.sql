- Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.
SELECT a.nombre AS alumno, c.nombre AS clase FROM Inscripciones i JOIN Alumnos a ON i.id_alumno = a.id JOIN Clases c ON i.id_clase = c.id;

- Obtener el nombre del alumno y la materia de las clases en las que está inscrito.
SELECT a.nombre AS alumno, c.materia FROM Inscripciones i JOIN Alumnos a ON i.id_alumno = a.id JOIN Clases c ON i.id_clase = c.id;
- Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.
SELECT a.nombre AS alumno, a.edad, c.profesor FROM Inscripciones i JOIN Alumnos a ON i.id_alumno = a.id JOIN Clases c ON i.id_clase = c.id;
- Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.
SELECT DISTINCT a.nombre AS alumno, a.direccion FROM Inscripciones i JOIN Alumnos a ON i.id_alumno = a.id;
- Obtener el nombre del alumno y el nombre de la clase junto con el profesor.
SELECT a.nombre AS alumno, c.nombre AS clase, c.profesor FROM Inscripciones i JOIN Alumnos a ON i.id_alumno = a.id JOIN Clases c ON i.id_clase = c.id;
- Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.
SELECT a.nombre AS alumno, c.materia, c.profesor FROM Inscripciones i JOIN Alumnos a ON i.id_alumno = a.id JOIN Clases c ON i.id_clase = c.id;
- Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.
SELECT a.nombre AS alumno, a.edad, c.materia FROM Inscripciones i JOIN Alumnos a ON i.id_alumno = a.id JOIN Clases c ON i.id_clase = c.id;
- Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.
SELECT a.nombre AS alumno, a.direccion, c.profesor FROM Inscripciones i JOIN Alumnos a ON i.id_alumno = a.id JOIN Clases c ON i.id_clase = c.id;
- Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.
SELECT a.nombre AS alumno, c.materia FROM Inscripciones i JOIN Alumnos a ON i.id_alumno = a.id JOIN Clases c ON i.id_clase = c.id ORDER BY a.nombre ASC;
- Contar cuántos alumnos están inscritos en cada clase.
SELECT c.nombre AS clase, COUNT(i.id_alumno) AS cantidad_alumnos FROM Inscripciones i JOIN Clases c ON i.id_clase = c.id GROUP BY c.id ORDER BY cantidad_alumnos DESC;