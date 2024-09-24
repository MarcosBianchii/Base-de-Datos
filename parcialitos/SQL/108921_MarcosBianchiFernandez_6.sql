-- f) Listar el padrón de aquellos alumnos que, por lo menos, tienen nota en todas las materias que aprobó el alumno del padrón 83000.

WITH aprobadas_83000 AS (
    SELECT codigo, numero
    FROM notas
    WHERE padron = 83000 AND nota >= 4
)
SELECT padron
FROM notas n
WHERE padron <> 83000
AND (codigo, numero) IN (
    SELECT *
    FROM aprobadas_83000
)
GROUP BY padron
HAVING COUNT(DISTINCT (codigo, numero)) = (
    SELECT COUNT(*)
    FROM aprobadas_83000
)

-- RESULTADOS --

-- | padron |
-- +--------+
-- |   84000|
-- |   85000|


