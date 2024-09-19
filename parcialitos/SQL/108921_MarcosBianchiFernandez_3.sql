-- c) Se necesita saber el promedio general para cada carrera y cada departamento. Devolviendo código de carrera, código de departamento, y el promedio de notas para todos los alumnos de cada departamento, ordenados por carrera y departamento.

-- Nota: no considerar combinaciones de departamento / carrera tal que no haya alumnos de dicha carrera con notas en dicho departamento.

-- Nota 2: Si un alumno está inscripto en más de una carrera, sus notas aportan a los promedios de todas esas carreras.

SELECT c.codigo carrera, d.codigo departamento, AVG(nota) promedio
FROM notas
INNER JOIN materias USING(codigo, numero)
INNER JOIN departamentos d USING(codigo)
INNER JOIN inscripto_en i USING(padron)
INNER JOIN carreras c on i.codigo = c.codigo
GROUP BY c.codigo, d.codigo
ORDER BY c.codigo, d.codigo

-- RESULTADOS --

-- | carrera | departamento | promedio |
-- +---------+--------------+----------+
-- |        5|            61|         7|
-- |        5|            62|      7.25|
-- |        6|            61|       8.8|
-- |        6|            62|         7|
-- |        9|            71|     6.714|
-- |        9|            75|     6.693|
-- |       10|            71|      6.75|
-- |       10|            75|       6.5|
