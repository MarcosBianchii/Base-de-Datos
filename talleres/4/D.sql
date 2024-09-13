-- 13) Devolver para cada materia su nombre y el nombre del departamento.
select m.nombre materia, d.nombre departamento
from materias m join departamentos d using(codigo)

-- Usando ON
select m.nombre materia, d.nombre departamento
from materias m join departamentos d on m.codigo = d.codigo


-- 14) Para cada 10 registrado, devuelva el padron y nombre del alumno y el nombre de la materia correspondientes a dicha nota.
select padron, a.nombre, m.nombre materia
from alumnos a
inner join notas using(padron)
inner join materias m using(codigo)
where nota = 10;

-- Opcion ON
select a.padron, a.nombre, m.nombre materia
from alumnos a
inner join notas n on a.padron = n.padron
inner join materias m on n.codigo = m.codigo
where nota = 10;

-- Opcion Filtrado previo
select a.padron, a.nombre, m.nombre materia
from alumnos a
inner join notas n on a.padron = n.padron and n.nota = 10
inner join materias m using(codigo);

-- Opcion Subconsulta
select alumnos_con_nota.padron, alumnos_con_nota.nombre, m.nombre materia
from (
    select a.padron, a.nombre, n.nota, n.codigo
    from alumnos a
    inner join notas n using(padron)
) as alumnos_con_nota
inner join materias m using(codigo)
where nota = 10;


-- 15) Listar para cada carrera su nombre y el padron de los alumnos que esten anotados en ella. Incluir tambien las carreras sin alumnos inscriptos.
select c.nombre as carrera, padron
from carreras c
left join inscripto_en using(codigo)
left join alumnos using(padron);


-- 16) Listar para cada carrera su nombre y el padron de los alumnos con padron mayor a 75000 que esten anotados en ella. Incluir tambien las carreras sin alumnos inscriptos con padron mayor a 75000.
select nombre, padron
from carreras c
left join inscripto_en using(codigo)
where padron > 75000
union
select nombre, padron
from carreras c
left join inscripto_en using(codigo)
where c.codigo not in (
    select codigo
    from carreras c
    left join inscripto_en using(codigo)
    where padron > 75000
)


-- 17) Listar el padron de aquellos alumnos que tengan mas de una nota en la materia 75.15.
select distinct padron
from notas n1
inner join notas n2 using(padron, codigo, numero)
where codigo = 75 and numero = 15 and n1.fecha <> n2.fecha


-- 18) Obtenga el padron y nombre de los alumnos que aprobaron la materia 71.14 y no aprobaron la materia 71.15

select a.padron, a.nombre
from alumnos a
where a.padron in (
    select padron
    from notas n
    where n.nota >= 4 and codigo = 71 and numero = 14
)
and a.padron not in (
    select a.padron
    from alumnos a
    left join notas n on a.padron = n.padron
    where (n.nota < 4 and codigo = 71 and numero = 15) or n.padron is null
);

-- Opcion EXISTS
select a.padron, a.nombre
from alumnos a
left join notas n on a.padron = n.padron
where ((nota < 4 and codigo = 71 and numero = 15) or n.padron is null)
    and exists (
        select padron
        from notas n2
        where (nota >= 4 and codigo = 71 and numero = 14)
            and n2.padron = n.padron
    );

-- Opcion 2 con IN
select a.padron, a.nombre
from alumnos a
left join notas n using(padron)
inner join (
    select padron
    from notas
    where (nota >= 4 and codigo = 71 and numero = 14)
) aprobados_71_14 using(padron)
where ((nota < 4 and codigo = 71 and numero = 15) or n.padron is null)
