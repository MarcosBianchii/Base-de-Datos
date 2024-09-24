-- b) Obtener el padrón y apellido de aquellos alumnos que tienen nota en las materias 75.40 y 75.41 y no tienen nota ni en la materia 62.05 ni en 75.01.

SELECT DISTINCT padron, apellido
FROM notas
INNER JOIN alumnos USING(padron)
WHERE padron IN (
    -- Tienen nota en 75.40 y 75.41
    SELECT padron
    FROM notas
    WHERE codigo = 75 AND numero = 40
    INTERSECT
    SELECT padron
    FROM notas
    WHERE codigo = 75 AND NUMERO = 41
)
AND padron NOT IN (
    -- Tienen nota en 62.05 ni en 75.01
    SELECT padron
    FROM notas
    WHERE codigo = 62 AND numero = 5
    INTERSECT
    SELECT padron
    FROM notas
    WHERE codigo = 75 AND numero = 1
)

-- RESULTADOS --

-- | padron | apellido |
-- +--------+----------+
-- |   83000|     Gómez|
-- |   84000|     López|
-- |   85000| Fernández|
