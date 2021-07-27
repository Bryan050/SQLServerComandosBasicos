-- Poner en uso la base de datos

use ejercicio5262;

-- Consultas de inserción de registros en una tabla

--Sintaxis 

-- Insert into [nombre de la tabla] values(registros) ---> Cuando son caracteres ', y si son números van sin '

insert into alumno values('L0011213','0502020202','Juan Aris','Salcedo','12/12/1970','Maculino','0987654321','juanarias@gamil.com','0987654321','Ninguna');

insert into alumno values('L0011214','0502020301','María Perez','Latacunga','2/12/1973','Femenino','0987654444','mariaperez@gamil.com','0987654444','Ninguna');

insert into alumno values('L0011215','0502020456','Jose Cruz','Latacunga','2/12/1972','Masculino','0987654345','josecruz@gamil.com','0987654345','Ninguna');

insert into alumno values('L0011216','0502020890','Karla Paredes','Latacunga','2/12/1978','Femenino','0987654346','karlaperez@gamil.com','0987654346','Ninguna');

insert into alumno values('L0011217','0502020924','Pedro Ruíz','Ambato','2/12/1978','Masculino','0987654347','pedroruiz@gamil.com','0987654347','Ninguna');

insert into alumno values('L0011218','0502020100','Luis Segovia','Guayaquil','2/12/1979','Masculino','0987654348','luissegoviva@gamil.com','0987654348','Ninguna');

Select * from alumno;

-- Para revisar si los datos son ingresados correctamente

-- Ingreso tabla materia

insert into materia values ('M001001','Matemática','Ciencias Exactas',6,6,'');

insert into materia values ('M001002','Física','Ciencias Exactas',6,6,'');
insert into materia values ('M001003','Cálculo Diferencial e Integral','Ciencias Exactas',6,6,'');
insert into materia values ('M001004','Álgebra','Ciencias Exactas',6,6,'');
insert into materia values ('M001005','Química','Ciencias Exactas',6,6,'');

Select * from materia;

-- Ingreso tabla profesor

insert into profesor values ('P0021223','1011121314','José Carrillo','Ingeniero en Sitemas','Latacunga','0912345678','12/12/1960','josecarrillo@gmail.com','091234567','');

Select * from profesor; 

-- Ingreso tabla nota

insert into nota values ('N001','P0021223','M001002','L0011214',19.45,18.64,14.15,'');
--insert into nota values ('N002','P0021223','M001001','L0011213',18.45,19.20,20.0,'');

Select * from nota;

-- Consultas de actualización

-- Sintaxis

-- update [nombre de la tabla] set columna = valor where condición

update materia set CREDITOS_MAT = 4 where CODIGO_MAT = 'M001004';

update materia set CARGA_HOR_MAT = 5 where CODIGO_MAT = 'M001002';


-- Consultas de eliminación

-- Sintaxis 

-- delete from [nombre de la materia]

-- delete from [nombre de la materia] where [condición]

delete from materia;

delete from materia where CODIGO_MAT = 'M001005';

Select * from materia;