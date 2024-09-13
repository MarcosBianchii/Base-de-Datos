-- 1) Devuelva todos los datos de las notas que no sean de la materia 75.1
select *
from notas
where not ( codigo = 75 and numero = 1 );


-- 2) Devuelva para cada materia dos columnas: una llamada “codigo” que contenga una concatenacion del codigo de departamento, un punto y el n ́umero de materia, con el formato “XX.YY” (ambos valores con dos d ́ıgitos, agregando ceros a la izquierda en caso de ser necesario) y otra con el nombre de la materia.
select to_char(codigo, 'fm00') || '.' || to_char(numero, 'fm00') as codigo_materia
from materias;


-- 3) Para cada nota registrada, devuelva el padron, codigo de departamento, numero de materia, fecha y nota expresada como un valor entre 1 y 100
select padron, codigo, numero, fecha, nota * 10 as nota
from notas;


-- 4) Idem al anterior pero mostrando los resultados paginados en paginas de 5 resultados cada una, devolviendo la segunda pagina
select padron, codigo, numero, fecha, nota * 10 as nota
from notas
order by padron, codigo, numero, fecha
limit 5 offset 5;


-- 5) Ejecute una consulta SQL que devuelva el padron y nombre de los alumnos cuyo apellido es “Molina”.
select padron, nombre
from alumnos
where lower(apellido) = 'molina';

-- Con ILIKE
select padron, nombre
from alumnos
where apellido ilike 'molina';


-- 6) Obtener el padron de los alumnos que ingresaron a la facultad en el anio 2010.
select padron
from alumnos
where fecha_ingreso between '2010-01-01' and '2010-12-31';
