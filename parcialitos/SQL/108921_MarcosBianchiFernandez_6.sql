-- f) Listar el padrón de aquellos alumnos que, por lo menos, tienen nota en todas las materias que aprobó el alumno del padrón 83000.

WITH aprobadas_83000 AS (
    SELECT codigo, numero
    FROM notas
    WHERE padron = 83000 AND nota >= 4
)
SELECT padron
FROM notas n
WHERE EXISTS (
    SELECT *
    FROM aprobadas_83000 a
    WHERE n.codigo = a.codigo AND n.numero = a.numero
)
GROUP BY padron
HAVING COUNT(padron) = (
    SELECT COUNT(*)
    FROM aprobadas_83000
)

-- RESULTADOS --

-- | padron |
-- +--------+
-- |   85000|
-- |   83000|
-- |   84000|
