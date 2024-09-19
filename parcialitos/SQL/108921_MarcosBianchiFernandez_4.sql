-- d) Mostrar el padrón, apellido y promedio para aquellos alumnos que tienen nota en más de 4 materias y un promedio de al menos 6.

SELECT padron, apellido, promedio
FROM (
    SELECT padron, AVG(nota) promedio, COUNT(*) cantidad_notas
    FROM notas
    GROUP BY padron
) padron_promedio_cantidad
INNER JOIN alumnos USING(padron)
WHERE cantidad_notas > 4 AND promedio >= 6

-- RESULTADOS --

-- | padron | apellido | promedio |
-- +--------+----------+----------+
-- |   73000|    Molina|       6.6|
-- |   86000|      Díaz|       7.8|
