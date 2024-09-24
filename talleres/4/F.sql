-- 23) Obtener el codigo y numero de la o las materias con mayor cantidad de notas registradas.

SELECT codigo, numero
FROM notas
GROUP BY codigo, numero
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM notas
    GROUP BY codigo, numero
)


-- 24) Obtener el padron de los alumnos que tienen nota en todas las materias.

SELECT padron
FROM notas
GROUP BY padron
HAVING COUNT(DISTINCT (codigo, numero)) = (
    SELECT COUNT(*)
    FROM materias
)


-- 25) Obtener el promedio general de notas por alumno (cuantas notas tiene en promedio un alumno), considerando ´unicamente alumnos con al menos una nota.

SELECT AVG(cantidad_notas)
FROM (
    SELECT padron, COUNT(nota) cantidad_notas
    FROM notas
    GROUP BY padron
) cantidad_de_notas_por_alumno
