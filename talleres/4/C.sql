-- 11) Devolver los padrones de los alumnos que no registran nota en materias.
select padron from alumnos
except
select distinct padron from notas

-- Opcion con IN
select padron
from alumnos a
where a.padron not in (select n.padron from notas n)

-- Opcion LEFT JOIN
select padron
from alumnos left join notas using(padron)
where nota is null


-- 12) Con el objetivo de traducir a otro idioma los nombres de materias y departamentos, devolver en una unica consulta los nombres de todas las materias y de todos los departamentos.
select nombre from departamentos
union
select nombre from materias
