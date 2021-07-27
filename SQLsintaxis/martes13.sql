Create database factura5262;
use factura5262;

/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     13/07/2021 7:52:30                           */
/*==============================================================*/


/*==============================================================*/
/* Table: CABECERA                                              */
/*==============================================================*/
create table CABECERAFACT 
(
   CODIGO_CAB           char(13)                       not null,
   CODIGO_CLI           char(13)                       null,
   NUMERO_CAB           integer                        null,
   FECHA_CAB            date                           null,
   OBSERVACIONES_CAB    varchar(1000)                  null,
   constraint PK_CABECERA primary key (CODIGO_CAB)
);

/*==============================================================*/
/* Index: CABECERA_PK                                           */
/*==============================================================*/
create unique index CABECERA_PK on CABECERAFACT (
CODIGO_CAB ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on CABECERAFACT (
CODIGO_CLI ASC
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   CODIGO_CLI           char(13)                       not null,
   CEDULA_CLI           char(13)                       null,
   NOMBRE_CLI           char(100)                      null,
   DIRECCION_CLI        char(100)                      null,
   TELEFONO_CLI         char(12)                       null,
   EMAIL_CLI            char(100)                      null,
   OBSERVACIONES_CLI    varchar(1000)                  null,
   constraint PK_CLIENTE primary key (CODIGO_CLI)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CODIGO_CLI ASC
);

/*==============================================================*/
/* Table: CUERPOFACT                                            */
/*==============================================================*/
create table CUERPOFACT 
(
   CODIGO_CUE           integer        identity        not null,
   CODIGO_CAB           char(13)                       null,
   CODIGO_PRO           char(13)                       null,
   CANTIDAD_CUE         integer                        null,
   IVA_CUE              numeric(5,2)                   null,
   ICE_CUE              numeric(5,2)                   null,
   SUBTOTAL_CUE         numeric(8,2)                   null,
   OBSERVACIONES_CUE    varchar(1000)                  null,
   constraint PK_CUERPOFACT primary key (CODIGO_CUE)
);

/*==============================================================*/
/* Index: CUERPOFACT_PK                                         */
/*==============================================================*/
create unique index CUERPOFACT_PK on CUERPOFACT (
CODIGO_CUE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on CUERPOFACT (
CODIGO_PRO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on CUERPOFACT (
CODIGO_CAB ASC
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   CODIGO_PRO           char(13)                       not null,
   NOMBRE_PRO           char(100)                      null,
   DESCRIPCION_PRO      varchar(1000)                  null,
   UNIDADMEDIA_PRO      char(20)                       null,
   COSTO_PRO            numeric(6,2)                   null,
   VALOR_PRO            numeric(6,2)                   null,
   OBSERVACIONES_PRO    varchar(1000)                  null,
   constraint PK_PRODUCTO primary key (CODIGO_PRO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
CODIGO_PRO ASC
);

alter table CABECERAFACT
   add constraint FK_CABECERA_RELATIONS_CLIENTE foreign key (CODIGO_CLI)
      references CLIENTE (CODIGO_CLI)
      on update restrict
      on delete restrict;

alter table CUERPOFACT
   add constraint FK_CUERPOFA_RELATIONS_PRODUCTO foreign key (CODIGO_PRO)
      references PRODUCTO (CODIGO_PRO)
      on update restrict
      on delete restrict;

alter table CUERPOFACT
   add constraint FK_CUERPOFA_RELATIONS_CABECERA foreign key (CODIGO_CAB)
      references CABECERAFACT (CODIGO_CAB)
      on update restrict
      on delete restrict;

Create table temporal
(
codigo_tem integer constraint temp_pk primary key identity,
cantidad_tem integer,
iva_tem numeric(5,2),
ice_tem numeric(5,2),
subtotal_cue numeric(8,2),
observaciones_cue varchar(1000),
codigo_cab char(13),
codigo_pro char(13)

);


Create table temporal1
(
codigo_tel integer constraint teml_pk primary key identity,
cantidad_tel integer,
iva_tel numeric(5,2),
ice_tel numeric(5,2),
subtotal_cue numeric(8,2),
observaciones_cue varchar(1000),
codigo_cab char(13),
codigo_pro char(13)

);

alter table temporal add codigo_usu char(13);

alter table temporal add fechar_tem datetime;

alter table temporal drop column codigo_usu;

drop table temporal1;
drop table CUERPOFACT;

insert into CLIENTE values('C01001001','0504030201', 'Luis Muso', 'Salcedo','032723666','luismuso@gmail.com','')

insert into PRODUCTO values('P001001001','Leche','Leche Entera 1 lt','1 Litro',0.50,0.80,'');
select * from PRODUCTO;

insert into CABECERAFACT values('0010010001','C01001001',1,'13/07/2021','');
select * from CABECERAFACT;

insert into CUERPOFACT values('0010010001','P001001001',120,12,15,0,'');
insert into CUERPOFACT values('0010010002','P001001002',121,13,16,1,'');
select * from CUERPOFACT;

update CLIENTE set DIRECCION_CLI = 'Latacunga' where CODIGO_CLI = 'C01001001';

select * from cliente;

delete from CLIENTE;

delete from CUERPOFACT;
delete from CABECERAFACT;