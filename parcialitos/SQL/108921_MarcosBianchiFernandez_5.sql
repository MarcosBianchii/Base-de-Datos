-- e) Para cada nota del alumno con la fecha de ingreso más reciente, mostrar su padrón, código de departamento, número de materia y el valor de la nota.

-- Nota: En caso de que sean más de uno los alumnos con la fecha de ingreso más reciente, mostrar dichos datos para todos esos alumnos.

-- Nota 2: Si bien en la realidad puede darse que los valores de padrón sean estrictamente crecientes en el tiempo. NO utilizar este criterio para determinar al alumno con la fecha de ingreso más reciente.


SELECT padron, codigo, numero, nota
FROM notas
INNER JOIN alumnos USING(padron)
WHERE fecha_ingreso = (
    SELECT MAX(fecha_ingreso)
    FROM alumnos
)

-- RESULTADOS --

-- | padron | codigo | numero | nota |
-- +--------+--------+--------+------+
-- |   88000|      75|       1|     9|
-- |   88000|      71|      14|     8|
-- |   88000|      75|      42|     7|
-- |   88000|      75|       6|     9|
