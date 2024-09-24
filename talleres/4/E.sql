-- 20) Para cada departamento, devuelva su codigo, nombre, la cantidad de materias que tiene y la cantidad total de notas registradas en materias del departamento. Ordene por la cantidad de materias descendente.

SELECT d.codigo, d.nombre, COUNT(DISTINCT m.numero) materias, COUNT(nota) notas
FROM departamentos d
INNER JOIN materias m USING(codigo)
INNER JOIN notas n USING(codigo)
GROUP BY d.codigo
ORDER BY materias DESC


-- 21) Para cada carrera devuelva su nombre y la cantidad de alumnos inscriptos. Incluya las carreras sin alumnos.

SELECT nombre, COUNT(padron)
FROM carreras
LEFT JOIN inscripto_en USING(codigo)
GROUP BY codigo


-- 22) Para cada alumno con al menos tres notas, devuelva su padron, nombre, promedio de notas y mejor nota registrada.

SELECT padron, nombre, AVG(nota) promedio, MAX(nota) maxima_nota
FROM notas
INNER JOIN alumnos USING(padron)
GROUP BY padron, nombre
HAVING COUNT(nota) >= 3
