-- a) Obtener el padrón y apellido de el/los alumno/s que tenga/n la mayor cantidad de materias promocionadas (asumiendo que se promociona si la nota es mayor o igual a 7). Nota: Considerar la posibilidad de que sean más de uno.

WITH promocionados as (
    SELECT padron, COUNT(nota) promociones
    FROM notas
    WHERE nota >= 7
    GROUP BY padron
)
SELECT padron, apellido
FROM promocionados
INNER JOIN alumnos USING(padron)
WHERE promociones = (
    SELECT MAX(promociones)
    FROM promocionados
)

-- RESULTADOS --

-- | padron | apellido |
-- +--------+----------+
-- |   83000|     Gómez|
-- |   85000| Fernández|
-- |   88000|    Vargas|
-- |   86000|      Díaz|