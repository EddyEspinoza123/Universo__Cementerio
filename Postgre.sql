--UNIVERSO DEL DISCURSO CEMENTERIO
/*==============================================================
          CREACION DE TABLAS 
================================================================*/

/*==============================================================*/
/* Table: ADMINISTRATIVO                                        */
/*==============================================================*/
create table ADMINISTRATIVO (
   ADMIN_ID             SERIAL               not null,
   ADMIN_NOMBRE         VARCHAR(30)          null,
   ADMIN_APELLIDOS      VARCHAR(30)          null,
   ADMIN_DIRECCION      VARCHAR(100)         null,
   ADMIN_TELEFONO       VARCHAR(10)          null,
   ADMIN_ANTIGUEDAD     VARCHAR(30)          null,
   ADMIN_SALARIO        FLOAT8             null,
   ADMIN_CEDULA         NUMERIC(12)          null,
   ADMIN_EXHUMACION     NUMERIC              null,
   ADMIN_CORREO         TEXT                 null,
   constraint PK_ADMINISTRATIVO primary key (ADMIN_ID)
);

/*==============================================================*/
/* Table: DEFUNCION                                             */
/*==============================================================*/
create table DEFUNCION (
   DEFU_ID              SERIAL               not null,
   ADMIN_ID             INT4                 null,
   DEFU_FECHA           DATE                 null,
   DEFU_DESCRIPCION     VARCHAR(100)         null,
   DEFU_CANTIDAD        NUMERIC              null,
   constraint PK_DEFUNCION primary key (DEFU_ID)
);


/*==============================================================*/
/* Table: ENTERRADOR                                            */
/*==============================================================*/
create table ENTERRADOR (
   ENTE_ID              SERIAL               not null,
   ENTE_CEDULA          NUMERIC(12)          null,
   ENTE_NOMBRE          VARCHAR(30)          null,
   ENTE_APELLIDOS       VARCHAR(30)          null,
   ENTE_DIRECCION       VARCHAR(100)         null,
   ENTE_TELEFONO        VARCHAR(10)          null,
   ENTE_ANTIGUEDAD      VARCHAR(30)          null,
   ENTE_SALARIO         FLOAT8               null,
   ENTE_EXHUMACION      NUMERIC              null,
   ENTE_CORREO          TEXT                 null,
   constraint PK_ENTERRADOR primary key (ENTE_ID)
);



/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   FAC_CLAVE            SERIAL               not null,
   ADMIN_ID             INT4                 null,
   FAC_CANTIDAD         NUMERIC(12)          null,
   FAC_FECHA            DATE                 null,
   constraint PK_FACTURA primary key (FAC_CLAVE)
);




/*==============================================================*/
/* Table: FALLECIDO                                             */
/*==============================================================*/
create table FALLECIDO (
   FALLE_ID             SERIAL               not null,
   ENTE_ID              INT4                 null,
   FAM_ID               INT4                 null,
   TUMBA_ID             INT4                 null,
   FALLE_NOMBRE         VARCHAR(30)          null,
   FALLE_APELLIDOS      VARCHAR(30)          null,
   FALLE_FECHANACIMIENTO DATE                 null,
   FALLE_FECHAENTIERRO  DATE                 null,
   FALLE_CAUSAMUERTE    VARCHAR(40)          null,
   FALLE_EDAD           NUMERIC              null,
   FALLE_CEDULA         NUMERIC(12)          null,
   constraint PK_FALLECIDO primary key (FALLE_ID)
);



/*==============================================================*/
/* Table: FAMILIAR                                              */
/*==============================================================*/
create table FAMILIAR (
   FAM_ID               SERIAL               not null,
   FAC_CLAVE            INT4                 null,
   FAM_NOMBRE           VARCHAR(30)          null,
   FAM_APELLIDOS        VARCHAR(30)          null,
   FAM_CORREO           TEXT                 null,
   FAM_CEDULA           NUMERIC(12)          null,
   FAM_TPANTEON         VARCHAR(100)         null,
   FAM_TELEFONO         VARCHAR(12)          null,
   FAM_DIRECCION        VARCHAR(30)          null,
   constraint PK_FAMILIAR primary key (FAM_ID)
);


/*==============================================================*/
/* Table: FOSACOMUN                                             */
/*==============================================================*/
create table FOSACOMUN (
   FOSA_ID              SERIAL               not null,
   TUMBA_ID             INT4                 null,
   FOSA_CAPACIDAD       VARCHAR(100)         null,
   constraint PK_FOSACOMUN primary key (FOSA_ID)
);


/*==============================================================*/
/* Table: JARDINERO                                             */
/*==============================================================*/
create table JARDINERO (
   JAR_ID               SERIAL               not null,
   MANZANA_ID           INT4                 null,
   JAR_NOMBRE           VARCHAR(30)          null,
   JAR_APELLIDOS        VARCHAR(30)          null,
   JAR_DIRECCION        VARCHAR(100)         null,
   JAR_TELEFONO         VARCHAR(10)          null,
   JAR_ANTIGUEDAD       VARCHAR(30)          null,
   JAR_SALARIO          FLOAT8               null,
   JAR_CEDULA           NUMERIC(12)          null,
   JAR_EXHUMACION       NUMERIC              null,
   JAR_CORREO           TEXT                 null,
   constraint PK_JARDINERO primary key (JAR_ID)
);


/*==============================================================*/
/* Table: MANZANA                                               */
/*==============================================================*/
create table MANZANA (
   MANZANA_ID           SERIAL               not null,
   MANZANA_NOMBRE       CHAR(30)             null,
   MANZANA_SUPERFICIE   VARCHAR(100)         null,
   MANZANA_CAPACIDAD    VARCHAR(100)         null,
   constraint PK_MANZANA primary key (MANZANA_ID)
);



/*==============================================================*/
/* Table: NICHO                                                 */
/*==============================================================*/
create table NICHO (
   NICHO_ID             SERIAL               not null,
   TUMBA_ID             INT4                 null,
   NICHO_ALTURA         VARCHAR(100)         null,
   NICHO_DESCRIPCION    VARCHAR(100)         null,
   constraint PK_NICHO primary key (NICHO_ID)
);



/*==============================================================*/
/* Table: PANTEON                                               */
/*==============================================================*/
create table PANTEON (
   PANTEON_ID           SERIAL               not null,
   TUMBA_ID             INT4                 null,
   FAM_ID               INT4                 null,
   PANTEON_INSCRIPCION  CHAR(100)            null,
   PANTEON_CAPACIDAD    VARCHAR(100)         null,
   constraint PK_PANTEON primary key (PANTEON_ID)
);


/*==============================================================*/
/* Table: TRAMITE                                               */
/*==============================================================*/
create table TRAMITE (
   TRAMITES_ID          SERIAL               not null,
   ADMIN_ID             INT4                 null,
   TIPO_TRAMITES        VARCHAR(30)          null,
   CANTIDAD_TRAMITES    NUMERIC              null,
   DESCRIPCION_TRAMITES VARCHAR(100)         null,
   constraint PK_TRAMITE primary key (TRAMITES_ID)
);


/*==============================================================*/
/* Table: TUMBA                                                 */
/*==============================================================*/
create table TUMBA (
   TUMBA_ID             SERIAL               not null,
   MANZANA_ID           INT4                 null,
   TUMBA_TIPO           CHAR(100)            null,
   constraint PK_TUMBA primary key (TUMBA_ID)
);

/*==============================================================
          CREACION DE LLAVES FORANEAS
================================================================*/

alter table DEFUNCION
   add constraint FK_DEFUNCIO_FK_DEFUNC_ADMINIST foreign key (ADMIN_ID)
      references ADMINISTRATIVO (ADMIN_ID)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_FK_FACTUR_ADMINIST foreign key (ADMIN_ID)
      references ADMINISTRATIVO (ADMIN_ID)
      on delete restrict on update restrict;

alter table FALLECIDO
   add constraint FK_FALLECID_FK_FALLEC_ENTERRAD foreign key (ENTE_ID)
      references ENTERRADOR (ENTE_ID)
      on delete restrict on update restrict;

alter table FALLECIDO
   add constraint FK_FALLECID_FK_FALLEC_FAMILIAR foreign key (FAM_ID)
      references FAMILIAR (FAM_ID)
      on delete restrict on update restrict;

alter table FALLECIDO
   add constraint FK_FALLECID_FK_FALLEC_TUMBA foreign key (TUMBA_ID)
      references TUMBA (TUMBA_ID)
      on delete restrict on update restrict;

alter table FAMILIAR
   add constraint FK_FAMILIAR_FK_FAMILI_FACTURA foreign key (FAC_CLAVE)
      references FACTURA (FAC_CLAVE)
      on delete restrict on update restrict;

alter table FOSACOMUN
   add constraint FK_FOSACOMU_FK_FOSACO_TUMBA foreign key (TUMBA_ID)
      references TUMBA (TUMBA_ID)
      on delete restrict on update restrict;

alter table JARDINERO
   add constraint FK_JARDINER_FK_JARDIN_MANZANA foreign key (MANZANA_ID)
      references MANZANA (MANZANA_ID)
      on delete restrict on update restrict;

alter table NICHO
   add constraint FK_NICHO_FK_NICHO__TUMBA foreign key (TUMBA_ID)
      references TUMBA (TUMBA_ID)
      on delete restrict on update restrict;

alter table PANTEON
   add constraint FK_PANTEON_FK_PANTEO_FAMILIAR foreign key (FAM_ID)
      references FAMILIAR (FAM_ID)
      on delete restrict on update restrict;

alter table PANTEON
   add constraint FK_PANTEON_FK_PANTEO_TUMBA foreign key (TUMBA_ID)
      references TUMBA (TUMBA_ID)
      on delete restrict on update restrict;

alter table TRAMITE
   add constraint FK_TRAMITE_FK_TRAMIT_ADMINIST foreign key (ADMIN_ID)
      references ADMINISTRATIVO (ADMIN_ID)
      on delete restrict on update restrict;

alter table TUMBA
   add constraint FK_TUMBA_FK_TUMBA__MANZANA foreign key (MANZANA_ID)
      references MANZANA (MANZANA_ID)
      on delete restrict on update restrict;

/*==============================================================
          INGRESO DE DATOS
================================================================*/

--TABLA ADMINISTRATIVO
INSERT INTO ADMINISTRATIVO (ADMIN_ID,ADMIN_NOMBRE,ADMIN_APELLIDOS,ADMIN_DIRECCION,ADMIN_TELEFONO,
ADMIN_ANTIGUEDAD,ADMIN_SALARIO,ADMIN_CEDULA,ADMIN_EXHUMACION,ADMIN_CORREO)
VALUES ('1','MARIO','GONZALES','MANTA - MALECON Y CALLE 14','0987456321','2','100','1314578655','2','MARIO@GMAIL.COM');
INSERT INTO ADMINISTRATIVO (ADMIN_ID,ADMIN_NOMBRE,ADMIN_APELLIDOS,ADMIN_DIRECCION,ADMIN_TELEFONO,
ADMIN_ANTIGUEDAD,ADMIN_SALARIO,ADMIN_CEDULA,ADMIN_EXHUMACION,ADMIN_CORREO)
VALUES ('2','MARIA','DELGADO','MANTA Ave. 4 de Noviembre','0988956321','2','100','1314242655','1','MARIA@GMAIL.COM');
INSERT INTO ADMINISTRATIVO (ADMIN_ID,ADMIN_NOMBRE,ADMIN_APELLIDOS,ADMIN_DIRECCION,ADMIN_TELEFONO,
ADMIN_ANTIGUEDAD,ADMIN_SALARIO,ADMIN_CEDULA,ADMIN_EXHUMACION,ADMIN_CORREO)
VALUES ('3','JUAN','ZAMBRANO','MANTA AVE. 4 CALLES 13','0966456321','2','100','0914578655','2','JUAN@GMAIL.COM');
INSERT INTO ADMINISTRATIVO (ADMIN_ID,ADMIN_NOMBRE,ADMIN_APELLIDOS,ADMIN_DIRECCION,ADMIN_TELEFONO,
ADMIN_ANTIGUEDAD,ADMIN_SALARIO,ADMIN_CEDULA,ADMIN_EXHUMACION,ADMIN_CORREO)
VALUES ('4','JULIO','ANANGONO','PORTOVIEJO CALLE ALAJUELA','0987456258','3','120','1317538655','1','JULIO@GMAIL.COM');
INSERT INTO ADMINISTRATIVO (ADMIN_ID,ADMIN_NOMBRE,ADMIN_APELLIDOS,ADMIN_DIRECCION,ADMIN_TELEFONO,
ADMIN_ANTIGUEDAD,ADMIN_SALARIO,ADMIN_CEDULA,ADMIN_EXHUMACION,ADMIN_CORREO)
VALUES ('5','MARTHA','VERA','PORTOVIEJO REALES TAMARINDO','0987586321','2','110','1314575985','3','MARTHA@GMAIL.COM');
INSERT INTO ADMINISTRATIVO (ADMIN_ID,ADMIN_NOMBRE,ADMIN_APELLIDOS,ADMIN_DIRECCION,ADMIN_TELEFONO,
ADMIN_ANTIGUEDAD,ADMIN_SALARIO,ADMIN_CEDULA,ADMIN_EXHUMACION,ADMIN_CORREO)
VALUES ('6','DAMIAN','DIAZ','MONTECRISTI CALLE MANTA','0924986321','2','110','1314524754','2','DAMIAN@GMAIL.COM');
INSERT INTO ADMINISTRATIVO (ADMIN_ID,ADMIN_NOMBRE,ADMIN_APELLIDOS,ADMIN_DIRECCION,ADMIN_TELEFONO,
ADMIN_ANTIGUEDAD,ADMIN_SALARIO,ADMIN_CEDULA,ADMIN_EXHUMACION,ADMIN_CORREO)
VALUES ('7','JONATHAN','ALVEZ','MONTECRISTI CALLE QUITO','0987547421','3','120','1317489985','1','JONATHAN@GMAIL.COM');

--TABLA ENTERRADOR
INSERT INTO ENTERRADOR (ENTE_ID,ENTE_CEDULA,ENTE_NOMBRE,ENTE_APELLIDOS,ENTE_DIRECCION,ENTE_TELEFONO,ENTE_ANTIGUEDAD,
ENTE_SALARIO,ENTE_EXHUMACION,ENTE_CORREO)
VALUES ('1','1354785485','MARIO','PLATA','MANTA TARQUI','0987451487','5','150','6','MARIO@GMAIL.COM');
INSERT INTO ENTERRADOR (ENTE_ID,ENTE_CEDULA,ENTE_NOMBRE,ENTE_APELLIDOS,ENTE_DIRECCION,ENTE_TELEFONO,ENTE_ANTIGUEDAD,
ENTE_SALARIO,ENTE_EXHUMACION,ENTE_CORREO)
VALUES ('2','1357489874','DARIO','ZAMBRANO','MANTA 20 DE MAYO','0988747487','6','150','8','DARIO@GMAIL.COM');
INSERT INTO ENTERRADOR (ENTE_ID,ENTE_CEDULA,ENTE_NOMBRE,ENTE_APELLIDOS,ENTE_DIRECCION,ENTE_TELEFONO,ENTE_ANTIGUEDAD,
ENTE_SALARIO,ENTE_EXHUMACION,ENTE_CORREO)
VALUES ('3','1354544789','MARIELA','RODRIGUEZ','MANTA LOS ESTEROS','0999451487','4','150','9','MARIELA@GMAIL.COM');
INSERT INTO ENTERRADOR (ENTE_ID,ENTE_CEDULA,ENTE_NOMBRE,ENTE_APELLIDOS,ENTE_DIRECCION,ENTE_TELEFONO,ENTE_ANTIGUEDAD,
ENTE_SALARIO,ENTE_EXHUMACION,ENTE_CORREO)
VALUES ('4','1314578459','MARIA','ZAMORA','PORTOVIEJO LOS PINOS','0989514487','2','100','1','MARIA@GMAIL.COM');
INSERT INTO ENTERRADOR (ENTE_ID,ENTE_CEDULA,ENTE_NOMBRE,ENTE_APELLIDOS,ENTE_DIRECCION,ENTE_TELEFONO,ENTE_ANTIGUEDAD,
ENTE_SALARIO,ENTE_EXHUMACION,ENTE_CORREO)
VALUES ('5','1314574898','ANTONIO','VALENCIA','PORTOVIEJO ELOY ALFARO','0997458787','7','170','10','ANTONIO@GMAIL.COM');
INSERT INTO ENTERRADOR (ENTE_ID,ENTE_CEDULA,ENTE_NOMBRE,ENTE_APELLIDOS,ENTE_DIRECCION,ENTE_TELEFONO,ENTE_ANTIGUEDAD,
ENTE_SALARIO,ENTE_EXHUMACION,ENTE_CORREO)
VALUES ('6','1314578499','BYRON','CASTILLO','PICOAZA ALAJUELA','0987448756','5','150','3','BYRON@GMAIL.COM');
INSERT INTO ENTERRADOR (ENTE_ID,ENTE_CEDULA,ENTE_NOMBRE,ENTE_APELLIDOS,ENTE_DIRECCION,ENTE_TELEFONO,ENTE_ANTIGUEDAD,
ENTE_SALARIO,ENTE_EXHUMACION,ENTE_CORREO)
VALUES ('7','1314578844','KARLA','DELGADO','PICOAZA AV. 5 DE JUNIO','0984787487','2','100','1','KARLA@GMAIL.COM');

--TABLA FACTURA
INSERT INTO FACTURA (FAC_CLAVE,ADMIN_ID,FAC_CANTIDAD,FAC_FECHA)
VALUES ('1','1','20','2000/07/12');
INSERT INTO FACTURA (FAC_CLAVE,ADMIN_ID,FAC_CANTIDAD,FAC_FECHA)
VALUES ('2','2','30','2010/01/12');
INSERT INTO FACTURA (FAC_CLAVE,ADMIN_ID,FAC_CANTIDAD,FAC_FECHA)
VALUES ('3','3','40','2012/06/09');
INSERT INTO FACTURA (FAC_CLAVE,ADMIN_ID,FAC_CANTIDAD,FAC_FECHA)
VALUES ('4','4','50','2014/05/12');
INSERT INTO FACTURA (FAC_CLAVE,ADMIN_ID,FAC_CANTIDAD,FAC_FECHA)
VALUES ('5','5','60','2016/07/12');
INSERT INTO FACTURA (FAC_CLAVE,ADMIN_ID,FAC_CANTIDAD,FAC_FECHA)
VALUES ('6','6','10','2002/03/09');
INSERT INTO FACTURA (FAC_CLAVE,ADMIN_ID,FAC_CANTIDAD,FAC_FECHA)
VALUES ('7','7','70','2013/07/10');
--TABLA MANZANA
INSERT INTO MANZANA (MANZANA_ID,MANZANA_NOMBRE,MANZANA_SUPERFICIE,MANZANA_CAPACIDAD)
VALUES ('1','MANZANA1','500 METROS CUADRADO ','504');
INSERT INTO MANZANA (MANZANA_ID,MANZANA_NOMBRE,MANZANA_SUPERFICIE,MANZANA_CAPACIDAD)
VALUES ('2','MANZANA2','500 METROS CUADRADO','504');
INSERT INTO MANZANA (MANZANA_ID,MANZANA_NOMBRE,MANZANA_SUPERFICIE,MANZANA_CAPACIDAD)
VALUES ('3','MANZANA3','500 METROS CUADRADO','504');
INSERT INTO MANZANA (MANZANA_ID,MANZANA_NOMBRE,MANZANA_SUPERFICIE,MANZANA_CAPACIDAD)
VALUES ('4','MANZANA4','500 METROS CUADRADO','504');
--TABLA TUMBA
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('1','1','FOSA COMUN');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('2','1','NICHO');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('3','1','PANTEON');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('1','2','FOSA COMUN');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('5','2','NICHO');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('6','2','PANTEON');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('7','3','FOSA COMUN');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('8','3','NICHO');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('9','3','PANTEON');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('10','4','FOSA COMUN');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('11','4','NICHO');
INSERT INTO TUMBA (TUMBA_ID,MANZANA_ID,TUMBA_TIPO)
VALUES ('12','4','PANTEON');

--TABLA TRAMITE
INSERT INTO TRAMITE (TRAMITES_ID,ADMIN_ID,TIPO_TRAMITES,CANTIDAD_TRAMITES,DESCRIPCION_TRAMITES)
VALUES ('1','7','TRASLADO','10','MES DE FEBRERO DEL 2018');
INSERT INTO TRAMITE (TRAMITES_ID,ADMIN_ID,TIPO_TRAMITES,CANTIDAD_TRAMITES,DESCRIPCION_TRAMITES)
VALUES ('2','5','CREMACION','50','MES DE JULIO DEL 2020');
INSERT INTO TRAMITE (TRAMITES_ID,ADMIN_ID,TIPO_TRAMITES,CANTIDAD_TRAMITES,DESCRIPCION_TRAMITES)
VALUES ('3','1','EXHUMACION','100','MES DE ENERO DEL 2010');
INSERT INTO TRAMITE (TRAMITES_ID,ADMIN_ID,TIPO_TRAMITES,CANTIDAD_TRAMITES,DESCRIPCION_TRAMITES)
VALUES ('4','4','INHUMAR','70','MES DE AGOSTO DEL 2000');
INSERT INTO TRAMITE (TRAMITES_ID,ADMIN_ID,TIPO_TRAMITES,CANTIDAD_TRAMITES,DESCRIPCION_TRAMITES)
VALUES ('5','2','VELATORIO','150','MES DE ABRIL DEL 2016');
INSERT INTO TRAMITE (TRAMITES_ID,ADMIN_ID,TIPO_TRAMITES,CANTIDAD_TRAMITES,DESCRIPCION_TRAMITES)
VALUES ('6','6','MAUSOLEO','100','MES DE JULIO DEL 2012');
INSERT INTO TRAMITE (TRAMITES_ID,ADMIN_ID,TIPO_TRAMITES,CANTIDAD_TRAMITES,DESCRIPCION_TRAMITES)
VALUES ('7','3','CENIZAS','200','MES DE MARZO DEL 2019');

--TABLA DEFUNCION
INSERT INTO DEFUNCION (DEFU_ID,ADMIN_ID,DEFU_FECHA,DEFU_DESCRIPCION,DEFU_CANTIDAD)
VALUES ('1','1','2020/09/01','Cifras del 1 al 31 de agosto de 2020','600');
INSERT INTO DEFUNCION (DEFU_ID,ADMIN_ID,DEFU_FECHA,DEFU_DESCRIPCION,DEFU_CANTIDAD)
VALUES ('2','2','2020/05/01','Cifras del 1 al 31 de abril de 2020','500');
INSERT INTO DEFUNCION (DEFU_ID,ADMIN_ID,DEFU_FECHA,DEFU_DESCRIPCION,DEFU_CANTIDAD)
VALUES ('3','3','2016/09/01','Cifras del 1 al 31 de agosto de 2016','300');
INSERT INTO DEFUNCION (DEFU_ID,ADMIN_ID,DEFU_FECHA,DEFU_DESCRIPCION,DEFU_CANTIDAD)
VALUES ('4','4','2012/10/01','Cifras del 1 al 31 de septiembre de 2012','220');
INSERT INTO DEFUNCION (DEFU_ID,ADMIN_ID,DEFU_FECHA,DEFU_DESCRIPCION,DEFU_CANTIDAD)
VALUES ('5','5','2000/08/01','Cifras del 1 al 31 de julio de 2000','180');
INSERT INTO DEFUNCION (DEFU_ID,ADMIN_ID,DEFU_FECHA,DEFU_DESCRIPCION,DEFU_CANTIDAD)
VALUES ('6','6','1999/06/01','Cifras del 1 al 31 de mayo de 1999','120');
INSERT INTO DEFUNCION (DEFU_ID,ADMIN_ID,DEFU_FECHA,DEFU_DESCRIPCION,DEFU_CANTIDAD)
VALUES ('7','7','1998/11/01','Cifras del 1 al 31 de octubre de 1998','100');

--TABLA FALLECIDO
INSERT INTO FALLECIDO(FALLE_ID,ENTE_ID,FAM_ID,TUMBA_ID,FALLE_NOMBRE,FALLE_APELLIDOS,FALLE_FECHANACIMIENTO,FALLE_FECHAENTIERRO,
FALLE_CAUSAMUERTE,FALLE_EDAD,FALLE_CEDULA) 
VALUES ('1','1','1','1','JUAN','PEREZ','1975/06/12','2000/07/11','INFARTO','25','1234567894');
INSERT INTO FALLECIDO(FALLE_ID,ENTE_ID,FAM_ID,TUMBA_ID,FALLE_NOMBRE,FALLE_APELLIDOS,FALLE_FECHANACIMIENTO,FALLE_FECHAENTIERRO,
FALLE_CAUSAMUERTE,FALLE_EDAD,FALLE_CEDULA)
VALUES ('2','2','2','2','MARIO','VERAS','1925/06/12','2000/08/10','INFARTO','75','1323456798');
INSERT INTO FALLECIDO(FALLE_ID,ENTE_ID,FAM_ID,TUMBA_ID,FALLE_NOMBRE,FALLE_APELLIDOS,FALLE_FECHANACIMIENTO,FALLE_FECHAENTIERRO,
FALLE_CAUSAMUERTE,FALLE_EDAD,FALLE_CEDULA)
VALUES ('3','3','3','3','STEFANIA','MANTUANO','1925/02/02','1999/08/10','ACCIDENTE DE TRANSITO','74','1398521445');
INSERT INTO FALLECIDO(FALLE_ID,ENTE_ID,FAM_ID,TUMBA_ID,FALLE_NOMBRE,FALLE_APELLIDOS,FALLE_FECHANACIMIENTO,FALLE_FECHAENTIERRO,
FALLE_CAUSAMUERTE,FALLE_EDAD,FALLE_CEDULA)
VALUES ('4','4','4','4','CATALINA','ZAMBRANO','1950/01/12','1998/10/08','ASESINATO','48','1323458751');
INSERT INTO FALLECIDO(FALLE_ID,ENTE_ID,FAM_ID,TUMBA_ID,FALLE_NOMBRE,FALLE_APELLIDOS,FALLE_FECHANACIMIENTO,FALLE_FECHAENTIERRO,
FALLE_CAUSAMUERTE,FALLE_EDAD,FALLE_CEDULA)
VALUES ('5','5','5','5','MANUEL','LOPEZ','1975/06/12','2016/08/10','TERREMOTO','41','1223466588');
INSERT INTO FALLECIDO(FALLE_ID,ENTE_ID,FAM_ID,TUMBA_ID,FALLE_NOMBRE,FALLE_APELLIDOS,FALLE_FECHANACIMIENTO,FALLE_FECHAENTIERRO,
FALLE_CAUSAMUERTE,FALLE_EDAD,FALLE_CEDULA)
VALUES ('6','6','6','6','ENMANUEL','MARTINEZ','1980/06/06','2020/08/11','COVID','40','1319855779');
INSERT INTO FALLECIDO(FALLE_ID,ENTE_ID,FAM_ID,TUMBA_ID,FALLE_NOMBRE,FALLE_APELLIDOS,FALLE_FECHANACIMIENTO,FALLE_FECHAENTIERRO,
FALLE_CAUSAMUERTE,FALLE_EDAD,FALLE_CEDULA)
VALUES ('7','7','7','7','FATIMA','MERO','1999/10/12','2020/06/10','COVID','21','1315869981');

--TABLA FAMILIAR
INSERT INTO FAMILIAR (FAM_ID,FAC_CLAVE,FAM_NOMBRE,FAM_APELLIDOS,FAM_CORREO,FAM_CEDULA,FAM_TPANTEON,FAM_TELEFONO,
FAM_DIRECCION)
VALUES ('1','1','EDUARDO','MACIAS','EDU@GMAIL.COM','1314787494','POSEE 2 ','0987587894',
'MANTA AV. UNIVERSITARIA');
INSERT INTO FAMILIAR (FAM_ID,FAC_CLAVE,FAM_NOMBRE,FAM_APELLIDOS,FAM_CORREO,FAM_CEDULA,FAM_TPANTEON,FAM_TELEFONO,
FAM_DIRECCION)
VALUES ('2','2','SONIA','HERNANDEZ','SONIAA@GMAIL.COM','1314787554','POSEE 1 ','0987588774',
'MANTA TARQUI');
INSERT INTO FAMILIAR (FAM_ID,FAC_CLAVE,FAM_NOMBRE,FAM_APELLIDOS,FAM_CORREO,FAM_CEDULA,FAM_TPANTEON,FAM_TELEFONO,
FAM_DIRECCION)
VALUES ('3','3','ARTURO','MINA','MINA@GMAIL.COM','1314765474','POSEE 2 ','0957487894',
'PORTOVIEJO AV. UNIVERSITARIA');
INSERT INTO FAMILIAR (FAM_ID,FAC_CLAVE,FAM_NOMBRE,FAM_APELLIDOS,FAM_CORREO,FAM_CEDULA,FAM_TPANTEON,FAM_TELEFONO,
FAM_DIRECCION)
VALUES ('4','4','JOSEFA','MARTINEZ','JOSEFA@GMAIL.COM','1314757889','POSEE 1 ','0987544894',
'PORTOVIEJO ALAJUELA');
INSERT INTO FAMILIAR (FAM_ID,FAC_CLAVE,FAM_NOMBRE,FAM_APELLIDOS,FAM_CORREO,FAM_CEDULA,FAM_TPANTEON,FAM_TELEFONO,
FAM_DIRECCION)
VALUES ('5','5','JUAN','RIVEROS','JUAN@GMAIL.COM','1314759494','POSEE 2 ','0987542894',
'JARAMIJO CALLE H');
INSERT INTO FAMILIAR (FAM_ID,FAC_CLAVE,FAM_NOMBRE,FAM_APELLIDOS,FAM_CORREO,FAM_CEDULA,FAM_TPANTEON,FAM_TELEFONO,
FAM_DIRECCION)
VALUES ('6','6','LIZ','CORDOVA','LIZ@GMAIL.COM','1313258494','POSEE 1 ','0987947894',
'ROCAFUERTE 30 DE SEPTIEMBRE');
INSERT INTO FAMILIAR (FAM_ID,FAC_CLAVE,FAM_NOMBRE,FAM_APELLIDOS,FAM_CORREO,FAM_CEDULA,FAM_TPANTEON,FAM_TELEFONO,
FAM_DIRECCION)
VALUES ('7','7','CARLOZ','MUÑOZ','MUÑOZGMAIL.COM','1319853494','POSEE 3 ','0987547514',
'ROCAFUERTE AV. SUCRE');

--TABLA FOSACOMUN
INSERT INTO FOSACOMUN (FOSA_ID,TUMBA_ID,FOSA_CAPACIDAD)
VALUES ('1','1','ALBERCA 504 FOSACOMUN');

--TABLA NICHO
INSERT INTO NICHO (NICHO_ID,TUMBA_ID,NICHO_ALTURA,NICHO_DESCRIPCION)
VALUES ('1','2','0,65 metros de altura','un ancho de 0,80 metros de anchura,y 2,50 metros de longitud.');

--TABLA PANTEON
INSERT INTO PANTEON (PANTEON_ID,TUMBA_ID,FAM_ID,PANTEON_INSCRIPCION,PANTEON_CAPACIDAD)
VALUES ('1','3','1','panteon familiar','2.30M Ancho X 2.90M ALTO');
INSERT INTO PANTEON (PANTEON_ID,TUMBA_ID,FAM_ID,PANTEON_INSCRIPCION,PANTEON_CAPACIDAD)
VALUES ('2','3','2','panteon familiar','2.60M Ancho X 3.00M ALTO');
INSERT INTO PANTEON (PANTEON_ID,TUMBA_ID,FAM_ID,PANTEON_INSCRIPCION,PANTEON_CAPACIDAD)
VALUES ('3','3','3','panteon familiar','2.20M Ancho X 2.80M ALTO');
INSERT INTO PANTEON (PANTEON_ID,TUMBA_ID,FAM_ID,PANTEON_INSCRIPCION,PANTEON_CAPACIDAD)
VALUES ('4','3','4','panteon familiar','3.30M Ancho X 3.00M ALTO');
INSERT INTO PANTEON (PANTEON_ID,TUMBA_ID,FAM_ID,PANTEON_INSCRIPCION,PANTEON_CAPACIDAD)
VALUES ('5','3','5','panteon familiar','2.50M Ancho X 2.60M ALTO');
INSERT INTO PANTEON (PANTEON_ID,TUMBA_ID,FAM_ID,PANTEON_INSCRIPCION,PANTEON_CAPACIDAD)
VALUES ('6','3','6','panteon familiar','2.85M Ancho X 2.95M ALTO');
INSERT INTO PANTEON (PANTEON_ID,TUMBA_ID,FAM_ID,PANTEON_INSCRIPCION,PANTEON_CAPACIDAD)
VALUES ('7','3','7','panteon familiar','3.30M Ancho X 3.10M ALTO');

--TABLA JARDINERO
INSERT INTO JARDINERO(JAR_ID,MANZANA_ID,JAR_NOMBRE,JAR_APELLIDOS,JAR_DIRECCION,JAR_TELEFONO,JAR_ANTIGUEDAD,JAR_SALARIO,
JAR_CEDULA,JAR_EXHUMACION,JAR_CORREO)
VALUES ('1','1','MARLON','LOPEZ','MANTA EL PALMAR','0954781254','2 AÑOS','200','1314574942','1','MARLON@GMAIL.COM');
INSERT INTO JARDINERO(JAR_ID,MANZANA_ID,JAR_NOMBRE,JAR_APELLIDOS,JAR_DIRECCION,JAR_TELEFONO,JAR_ANTIGUEDAD,JAR_SALARIO,
JAR_CEDULA,JAR_EXHUMACION,JAR_CORREO)
VALUES ('2','2','MANUELA','CAÑIZARES','MANTA TARQUI','0954788524','4 AÑOS','400','1314557498','5','MANUELA@GMAIL.COM');
INSERT INTO JARDINERO(JAR_ID,MANZANA_ID,JAR_NOMBRE,JAR_APELLIDOS,JAR_DIRECCION,JAR_TELEFONO,JAR_ANTIGUEDAD,JAR_SALARIO
JAR_CEDULA,JAR_EXHUMACION,JAR_CORREO)
VALUES ('3','3','JUAN','VALDEZ','PORTOVIEJO ALAJUELA','0975491254','3 AÑOS','300','1314598742','4','JUAN@GMAIL.COM');
INSERT INTO JARDINERO(JAR_ID,MANZANA_ID,JAR_NOMBRE,JAR_APELLIDOS,JAR_DIRECCION,JAR_TELEFONO,JAR_ANTIGUEDAD,JAR_SALARIO,
JAR_CEDULA,JAR_EXHUMACION,JAR_CORREO)
VALUES ('4','4','STEFANIA','BAILON','MONTECRISTI LA SEQUITA','0954784554','5 AÑOS','500','1325474942','10','STEFANIA@GMAIL.COM');
INSERT INTO JARDINERO(JAR_ID,MANZANA_ID,JAR_NOMBRE,JAR_APELLIDOS,JAR_DIRECCION,JAR_TELEFONO,JAR_ANTIGUEDAD,JAR_SALARIO,
JAR_CEDULA,JAR_EXHUMACION,JAR_CORREO)
VALUES ('5','1','NICOL','DELGADO','MONTECRISTI PEPA DE USO','0954785489','6 AÑOS','500','1318784942','12','NICOL@GMAIL.COM');
INSERT INTO JARDINERO(JAR_ID,MANZANA_ID,JAR_NOMBRE,JAR_APELLIDOS,JAR_DIRECCION,JAR_TELEFONO,JAR_ANTIGUEDAD,JAR_SALARIO,
JAR_CEDULA,JAR_EXHUMACION,JAR_CORREO)
VALUES ('6','2','CRISTHIAN','LOPEZ','ROCAFUERTE ALAJUELA','0954574588','4 AÑOS','400','1314575888','5','CRISTHIAN@GMAIL.COM');
INSERT INTO JARDINERO(JAR_ID,MANZANA_ID,JAR_NOMBRE,JAR_APELLIDOS,JAR_DIRECCION,JAR_TELEFONO,JAR_ANTIGUEDAD,JAR_SALARIO,
JAR_CEDULA,JAR_EXHUMACION,JAR_CORREO)
VALUES ('7','3','STEVEEN','CHAVEZ','MONTECRISTI LA PROAÑO','0954788988','3 AÑOS','300','1314564842','4','STEVEEN@GMAIL.COM');
INSERT INTO JARDINERO(JAR_ID,MANZANA_ID,JAR_NOMBRE,JAR_APELLIDOS,JAR_DIRECCION,JAR_TELEFONO,JAR_ANTIGUEDAD,JAR_SALARIO,
JAR_CEDULA,JAR_EXHUMACION,JAR_CORREO)
VALUES ('8','4','WILIAN','RIVEROS','ROCAFUERTE ALAJUELA','0954785444','5 AÑOS','300','1314588542','4','WILIAN@GMAIL.COM');

/*==============================================================
          CONSULTAS
================================================================*/
--CONSULTA 1
/*
Mostrar cuantas exhumaciones a estado cada Personal del cementerio.
*/
select 
  admin_nombre as nombre, 
  admin_exhumacion as exhumaciones, 
  'ADMINISTRATIVO' as Origen 
from administrativo
union all
select 
  jar_nombre,
  jar_exhumacion, 
  'JARDINERO'
from jardinero
union all 
select 
  ente_nombre,
  ente_exhumacion,
  'ENTERRADOR' 
from enterrador
order by  exhumaciones desc

--CONSULTA 2
/*
Mostrar el numero de trámites que se ha emitido en el cementerio.
*/
select  
  admin_nombre as administrador,
  tipo_tramites as Tramite,
  tramites_id as id_tramite,
  cantidad_tramites as cantidad_tramites_realizados,
  descripcion_tramites as descripcion_de_los_tramites
from administrativo 
  inner join  tramite
  on administrativo.admin_id = tramite.tramites_id
  order by tramite.cantidad_tramites asc

--CONSULTA 3
/*
Conocer por mes y año en forma descendente el listado de los meses en lo que 
ha habido más muerte.
*/
select 
  admin_nombre as administrador ,
  defu_descripcion as cifras_mes_año ,
  defu_cantidad as cantidad_de_muertos
from defuncion
  inner join administrativo 
  on defuncion.defu_id = administrativo.admin_id
  order by defuncion.defu_cantidad desc

--CONSULTA 4
/*
Conocer cuántas propiedades posee un familiar de algún fallecido.
*/
select 
  falle_nombre as nombre_del_fallecido,
  fam_nombre as nombre_del_familiar , 
  fam_apellidos as apellidos_del_familiar, 
  fam_cedula as identificacion, 
  fam_tpanteon as cantidad, 
  panteon_inscripcion as tipo, 
  panteon_capacidad as capacidad
from familiar
  inner join panteon on familiar.fam_id = panteon.panteon_id
  inner join fallecido
  on fallecido.falle_id = panteon.panteon_id