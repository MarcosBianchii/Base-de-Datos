-- a) Obtener el padrón y apellido de el/los alumno/s que tenga/n la mayor cantidad de materias promocionadas (asumiendo que se promociona si la nota es mayor o igual a 7). Nota: Considerar la posibilidad de que sean más de uno.

WITH promociones as (
    SELECT padron, COUNT(nota) cantidad_promociones
    FROM notas
    WHERE nota >= 7
    GROUP BY padron
)
SELECT padron, apellido, cantidad_promociones
FROM promociones
INNER JOIN alumnos using(padron)
WHERE cantidad_promociones >= ALL (
    SELECT MAX(cantidad_promociones)
    FROM promociones
)

-- RESULTADOS --

-- | padron | apellido | cantidad_promociones |
-- +--------+----------+----------------------+
-- |   86000|      Díaz|                     4|
-- |   88000|    Vargas|                     4|
-- |   83000|     Gómez|                     4|
-- |   85000| Fernández|                     4|