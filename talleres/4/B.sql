-- 7) Obtener la mejor nota registrada en la materia 75.15.
select max(nota) nota_maxima
from notas
where codigo = 75 and numero = 15;


-- 8) Obtener el promedio de notas de las materias del departamento de codigo 75.
select avg(nota) promedio
from notas
where codigo = 75;


-- 9) Obtener el promedio de nota de aprobacion de las materias del departamento de codigo 75.
select avg(nota) promedio
from notas
where nota >= 4 and codigo = 75;


-- 10) Obtener la cantidad de alumnos que tienen al menos una nota.
select count(distinct padron) cantidad
from notas
