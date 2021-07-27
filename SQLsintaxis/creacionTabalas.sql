-- Crear una base de datos
-- Create database [nombre de la bases de datos]
-- 30/06/2021


Create database ejercicio5262;

-- Para poner en uso una base de datos

use ejercicio5262;

-- Pegamos el script de sql obtenido del dise�o

/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     29/6/2021 7:38:28                            */
/*==============================================================*/


/*==============================================================*/
/* Table: ALUMNO                                                */
/*==============================================================*/
create table ALUMNO (
   CODIGO_ALU           char(10)             not null,
   CEDULA_ALU           char(10)             not null,
   NOMBRE_ALU           char(100)            not null,
   DIRECCION_ALU        char(100)            null,
   FECHA_NAC_ALU        datetime             null,
   SEXO_ALU             char(10)             null,
   TELEFONO_ALU         char(12)             null,
   EMAIL_ALU            char(50)             null,
   CELULAR_ALU          char(12)             null,
   OBSERVACIONES_ALU    varchar(100)         null,
   constraint PK_ALUMNO primary key nonclustered (CODIGO_ALU)
)
go

/*==============================================================*/
/* Table: MATERIA                                               */
/*==============================================================*/
create table MATERIA (
   CODIGO_MAT           char(10)             not null,
   NOMBRE_MAT           char(100)            not null,
   DESCRIPCION_MAT      varchar(1000)        null,
   CARGA_HOR_MAT        int                  null,
   CREDITOS_MAT         int                  null,
   OBSERVACIONES_MAT    varchar(1000)        null,
   constraint PK_MATERIA primary key nonclustered (CODIGO_MAT)
)
go

/*==============================================================*/
/* Table: PROFESOR                                              */
/*==============================================================*/
create table PROFESOR (
   CODIGO_PRO           char(10)             not null,
   CEDULA_PRO           char(10)             not null,
   NOMBRE_PRO           char(100)            not null,
   TITULO_PRO           char(100)            null,
   DIRECCION_PRO        char(100)            not null,
   TELEFONO_PRO         char(12)             null,
   FECHA_NAC_PRO        datetime             null,
   EMAIL_PRO            char(50)             null,
   CELULAR_PRO          char(12)             null,
   OBSERVACIONES_PRO    varchar(1000)        null,
   constraint PK_PROFESOR primary key nonclustered (CODIGO_PRO)
)
go

/*==============================================================*/
/* Table: NOTA                                                  */
/*==============================================================*/
create table NOTA (
   CODIGO_NOT           char(10)             not null,
   CODIGO_PRO           char(10)             null,
   CODIGO_MAT           char(10)             null,
   CODIGO_ALU           char(10)             null,
   NOTA1_NOT            decimal(5,2)         null,
   NOTA2_NOT            decimal(5,2)         null,
   NOTA3_NOT            decimal(5,2)         null,
   OBSERVACIONES_NOT    varchar(1000)        null,
   constraint PK_NOTA primary key nonclustered (CODIGO_NOT),
   constraint FK_NOTA_RELATIONS_MATERIA foreign key (CODIGO_MAT)
      references MATERIA (CODIGO_MAT),
   constraint FK_NOTA_RELATIONS_PROFESOR foreign key (CODIGO_PRO)
      references PROFESOR (CODIGO_PRO),
   constraint FK_NOTA_RELATIONS_ALUMNO foreign key (CODIGO_ALU)
      references ALUMNO (CODIGO_ALU)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on NOTA (
CODIGO_MAT ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on NOTA (
CODIGO_PRO ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on NOTA (
CODIGO_ALU ASC
)
go


-- Comandos para crear tablas

-- Create table [nombre de la tabla]
-- (campos tipo de datos ..., campos N);

Create table temporal1
(codigo_tem char(10) constraint pk_temp primary key,
nombre_tem char(100),
direccion_tem char(100),
telefono_tem char(12),
celular_tem char(12),
email_tem char(100)
);

-- Crear una tabla con claves foraneas

Create table temporal2
(codigo_tmp char(10) constraint pf_temp2 primary key,
nombre_tmp char(100),
direccion_tmp char(100),
telefono_tmp char(12),
celular_tmp char(12),
email_tmp char(100),
observaciones_tmp varchar(1000),
codigo_tem char(10) constraint fk_temp references temporal1(codigo_tem)
);

-- Consultas para agregar/quitar campos(atributos)

-- Consulta para agregar un atributo 

alter table temporal1 add observaciones_tem varchar(1000);

alter table temporal2 add observaciones1_tmp varchar(1000);

--Consulta para quitar un atributo de una tabla

alter table temporal1 drop column observaciones_tem;

alter table temporal2 drop column observaciones1_tmp;

-- drop table comando para eliminar una tabla

drop table temporal2;

drop table temporal1;


Create table temporal3
(codigo_te3 integer constraint pk_temp primary key identity,
nombre_te3 char(100),
direccion_te3 char(100),
telefono_te3 char(12),
celular_te3 char(12),
email_te3 char(100)
);

--Sacar respaldos mediante código

BACKUP DATABASE factura5262
to disk = 'z:\respaldosSQLServer\factura15072021.bak'
with no_compression, name = 'factura5262_1'


