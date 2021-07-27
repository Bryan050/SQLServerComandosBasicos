use ejercicio5262;

-- Consultas de selección
-- Sirve para desplegar la información de las tablas
-- sintaxis
-- Select nombres de los campos from tabla where condition;
-- Select columna1, columna3, ... from tabla where condición;

Select * from ALUMNO;

Select codigo_alu, cedula_alu, nombre_alu, email_alu from ALUMNO;

Select cedula_alu, nombre_alu, email_alu from alumno where sexo_alu = 'Femenino';

-- Distinct, toma el primer balor del campo, y no los repetidos

Select DISTINCT sexo_alu from alumno;

-- Consultas con la utilización de IN

-- Todas las consultas pueden utiizar los operacores de <,>,>=,<=,=, <>
-- Between, IN, Like
Select cedula_alu, nombre_alu, direccion_alu, email_alu from alumno
where DIRECCION_ALU IN ('Ambato', 'Latacunga');

Select cedula_alu, nombre_alu,direccion_alu, email_alu from alumno WHERE DIRECCION_ALU like 'A%';
Select cedula_alu, nombre_alu,direccion_alu, email_alu from alumno WHERE NOMBRE_ALU like 'A%';

Create table temporal
(
codigo_tem char(10) constraint pk_tem primary key,
numero_tem int
);

Select * from temporal where numero_tem between 20 and 100; 
Insert into temporal values('Pan',12);
Insert into temporal values('Leche',22);
Insert into temporal values('Carne',80);
Insert into temporal values('Huevos',14);
Insert into temporal values('Harina',24);
Insert into temporal values('Chocolate',81);
Insert into temporal values('Chocolate1',0);

-- Utilización de operadores en consultas de selección And Or y Not

-- select columnas from table where condición1 and/or condición2
-- select columnas from table where not condición

Select * from alumno where direccion_alu = 'Latacunga' and SEXO_ALU = 'Femenino';

Select * from alumno where not direccion_alu = 'Latacunga';

--Consultas de selección para ordenar de acuerdo a la columna planteada
--select columnas from tabla order by columna_a_ordenar asc/desc
Select * from alumno order by Direccion_alu ASC;

-- Select top número de registro a desplegar from tabla where condición;

Select top 4 * from ALUMNO;

-- Utillización del MIn y el Max

Select * from temporal;

Select min(numero_tem) from temporal;

select max(numero_tem) from temporal;
Select top 3 * from temporal;

-- Para sacar otras operaciones se puede utilizar
-- COUNT, AVG, SUM

-- Para obtener el promedio de un atributo

Select avg(numero_tem) from temporal;

-- Para obtener la suma de registros

Select SUM(numero_tem) from temporal;

-- Para obtener el número de registros

Select count(numero_tem) from temporal;

Select * from ALUMNO;

-- Utilización de Like para consultas

Select * from alumno where NOMBRE_ALU LIKE 'A%'; 
-- Obtenemos todos los valores del atributo que empiezen con la letra A

Select * from alumno where nombre_alu LIKE '%A'
-- Obtenemos todos lo valores del atributo que terminen con la letra B

Select * from alumno where nombre_alu LIKE '_c%'
-- la raya baja (_) reserva un espacio

Select * from alumno where nombre_alu LIKE '%ui%'

-- **************************************************************************************************


-- Manejo de los alias en los campos de las entidades

Select * from alumno as A;
-- Para poner un alias a una tabla

Select cedula_alu as CED, nombre_alu, direccion_alu from alumno;

Select cedula_alu CED, nombre_alu, direccion_alu from alumno;

Select * from alumno;

Select nombre_alu, direccion_alu D from alumno where DIRECCION_ALU = 'Latacunga'

Select nombre_alu, nota1_not from alumno A, nota N where A.CELULAR_ALU = N.CODIGO_ALU;

Select nombre_alu, direccion_alu+' '+telefono_alu+' '+celular_alu as [Dirrección completa] from alumno where DIRECCION_ALU = 'Latacunga';

-- Consultas con 2 o más tablas
select * from profesor;
select * from nota;
select * from alumno;
select * from materia;

Select cedula_pro, nombre_pro, nota1_not, nota2_not, nota3_not from profesor, nota where profesor.CODIGO_PRO = nota.CODIGO_PRO; 

Select nombre_alu, nombre_pro, nota1_not, nota2_not, nota3_not from PROFESOR, nota, alumno where 
profesor.CODIGO_PRO = nota.CODIGO_PRO and alumno.CODIGO_ALU = nota.CODIGO_ALU; -- Exijo integridad entre los datos

Select nombre_alu, nombre_pro, nombre_mat, nota1_not, nota2_not, nota3_not from PROFESOR, nota, alumno, materia where 
profesor.CODIGO_PRO = nota.CODIGO_PRO and alumno.CODIGO_ALU = nota.CODIGO_ALU and MATERIA.CODIGO_MAT = nota.CODIGO_MAT;

