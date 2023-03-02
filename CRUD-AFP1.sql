CREATE TABLE AFP 
    (
     NUMERO INTEGER NOT NULL , 
     LUGAR NVARCHAR (30) NOT NULL , 
     FECHA DATE NOT NULL , 
     RECEPCION NVARCHAR (15) NOT NULL , 
     NOMBRE_RESPOPNSABLE NVARCHAR (30) NOT NULL 
    )
GO

ALTER TABLE AFP ADD CONSTRAINT AFP_PK PRIMARY KEY CLUSTERED (NUMERO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE AREA_TRABAJOv1 
    (
     COD INTEGER NOT NULL , 
     VIDA_LABORAL NVARCHAR (30) NOT NULL 
    )
GO

ALTER TABLE AREA_TRABAJOv1 ADD CONSTRAINT AREA_TRABAJOv1_PK PRIMARY KEY CLUSTERED (COD)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE DIRECCION_IDENTIFICACION
    (
     CI INTEGER NOT NULL , 
     RUN NVARCHAR (5) NOT NULL , 
     PASIE NCHAR (10) NOT NULL , 
     SEXO NVARCHAR (10) NOT NULL , 
     FECHA_NACIMIENTO DATE NOT NULL , 
     ESTADO_CIVIL NVARCHAR (20) NOT NULL , 
     DEPARTAMENTO NVARCHAR (15) NOT NULL , 
     PROVINCIA NVARCHAR (15) NOT NULL , 
     LOCALIDAD NCHAR (20) NOT NULL , 
     BARRIO NVARCHAR (15) NOT NULL , 
     TELEFONO INTEGER NOT NULL , 
     DOMICILIO_ACTUAL NVARCHAR (20) NOT NULL 
    )
GO

INSERT INTO DIRECCION_IDENTIFICACION1  VALUES (23, 'KL', 'L','FEMENINO','03/02/22','SOLTERA','SANTA CRUZ', 'ANDRES IBA�EZ', 'DE LA SIERRA','PERCY FERNANDEZ', '458', 'COTOCA')
SELECT ESTADO_CIVIL  FROM DIRECCION_IDENTIFICACION


ALTER TABLE DIRECCION_IDENTIFICACION ADD CONSTRAINT DIRECCION_IDENTIFICACION_PK PRIMARY KEY CLUSTERED (CI)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE EXAMEN_CLINICO 
    (
     FECHA DATETIME NOT NULL , 
     EVALUACION NCHAR (30) NOT NULL , 
     DIAGNOSTICO NVARCHAR (30) NOT NULL , 
     LUGAR NVARCHAR (20) NOT NULL , 
     CENTRO_MEDICO NVARCHAR (30) NOT NULL , 
     VERIFICACION_NUMERO INTEGER NOT NULL 
    )
GO

--INSERTAR DATOS A LA TABLA--
select * from EXAMEN_CLINICO
INSERT INTO EXAMEN_CLINICO VALUES ( '15/02/22 15:02 ', 'varicela' , 'leve' , 'los penocos', 'foianini' , 5)
INSERT INTO EXAMEN_CLINICO VALUES ( '15/02/22 15:02 ', 'obesidad' , 'desarrollo' , 'macherano', 'caja petrolera' , 6)
INSERT INTO EXAMEN_CLINICO VALUES ( '15/02/22 15:02 ', 'cancer' , 'maligno' , 'madison', 'prosalud' , 7)
INSERT INTO EXAMEN_CLINICO VALUES ( '15/02/22 15:02 ', 'infeccion en los ri�ones' , 'fase manifestada' , 'via', 'universitario' , 8)
INSERT INTO EXAMEN_CLINICO VALUES ( '15/02/22 15:02 ', 'diabetes' , 'fase de convalencia' , 'hermanos', 'martin dockweiler' , 9)
--ANULAR LAS DECLARACIONES--
 delete from EXAMEN_CLINICO
---MODIFICAR LAS DECLARACIONES---

UPDATE EXAMEN_CLINICO
SET FECHA = '30/10/22 15:15 ';
 SELECT * FROM EXAMEN_CLINICO
 -----Seleccionar los formularios por diagnostico presuntivo
 SELECT DIAGNOSTICO FROM EXAMEN_CLINICO


ALTER TABLE EXAMEN_CLINICO ADD CONSTRAINT EXAMEN_CLINICO_PK PRIMARY KEY CLUSTERED (FECHA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE INFORMACION_LABORAL 
    (
     NIT_PERTENECIENTE INTEGER NOT NULL , 
     GRUPO_PERTENECIENTE NVARCHAR (15) NOT NULL , 
     OCUPACION NVARCHAR (15) NOT NULL , 
     FECHA DATE NOT NULL , 
     RAZONSOCIAL_EMPLEADOR NVARCHAR (15) NOT NULL , 
     TELEFONO VARCHAR (8) NOT NULL , 
     FAX INTEGER NOT NULL , 
     N_PATRONAL INTEGER NOT NULL , 
     DEPARTAMENTO NVARCHAR (15) NOT NULL , 
     PROVINCIA NVARCHAR (15) NOT NULL , 
     CIUDAD NVARCHAR (15) NOT NULL , 
     ZONA INTEGER NOT NULL , 
     DOMICILIO_ACTUAL INTEGER NOT NULL , 
     CAPACITACIU�N_TRABAJO NVARCHAR (30) NOT NULL , 
     AREA_TRABAJOv1_COD INTEGER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    INFORMACION_LABORAL__IDX ON INFORMACION_LABORAL 
    ( 
     AREA_TRABAJOv1_COD 
    ) 
GO

ALTER TABLE INFORMACION_LABORAL ADD CONSTRAINT INFORMACION_LABORAL_PK PRIMARY KEY CLUSTERED (NIT_PERTENECIENTE)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Relation_6 
    (
     TRABAJADOR_AFILIADO_CUA INTEGER NOT NULL , 
     EXAMEN_CLINICO_FECHA DATETIME NOT NULL 
    )
GO

ALTER TABLE Relation_6 ADD CONSTRAINT Relation_6_PK PRIMARY KEY CLUSTERED (TRABAJADOR_AFILIADO_CUA, EXAMEN_CLINICO_FECHA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE TRABAJADOR_AFILIADO 
    (
     CUA INTEGER NOT NULL , 
     NOMBRE CHAR (20) NOT NULL , 
     APE_PATERNO CHAR (20) NOT NULL , 
     APE_MATERNO CHAR (20) NOT NULL , 
     APE_CASADA CHAR (20) NOT NULL , 
     AFP_NUMERO INTEGER NOT NULL , 
     INFORMACION_LABORAL_NIT_PERTENECIENTE INTEGER NOT NULL , 
     DIRECCION_IDENTIFICACION_CI INTEGER NOT NULL 
    )
GO

SELECT * FROM TRABAJADOR_AFILIADO
INSERT INTO TRABAJADOR_AFILIADO VALUES (1, 'SOFIA', 'MAMANI', 'TORRICO', 'A�EZ', 10, 524,2)
INSERT INTO TRABAJADOR_AFILIADO VALUES (2, 'MARIA', 'TOLEDO', 'FLORES', 'VALDEZ', 10, 524,2)
INSERT INTO TRABAJADOR_AFILIADO VALUES (3, 'JHONNY', 'GUZMAN', 'POMACUSI', 'RODRIGUEZ', 10, 524,2)
INSERT INTO TRABAJADOR_AFILIADO VALUES (4, 'ANDRES', 'VACA', 'ESCALANTE', 'VARGAS', 10, 524,2)
INSERT INTO TRABAJADOR_AFILIADO VALUES (5, 'CARLA', 'TORREZ', 'PEREZ', 'SOLIZ', 10, 524,2)
INSERT INTO TRABAJADOR_AFILIADO VALUES (6, 'ANDREA', 'CONDORI', 'CHOQUE', 'PEPLA', 10, 524,2)

ALTER TABLE TRABAJADOR_AFILIADO ADD CONSTRAINT TRABAJADOR_AFILIADO_PK PRIMARY KEY CLUSTERED (CUA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE VERIFICACION 
    (
     NUMERO INTEGER NOT NULL , 
     INVESTIGACION_REALIZADA NVARCHAR (30) NOT NULL , 
     DIAGNOSTICO_DEFINIDO NVARCHAR (30) NOT NULL , 
     CONDUCTA NVARCHAR (10) NOT NULL , 
     LUGAR NVARCHAR (30) NOT NULL , 
     FECHA DATE NOT NULL 
    )
GO

ALTER TABLE VERIFICACION ADD CONSTRAINT VERIFICACION_PK PRIMARY KEY CLUSTERED (NUMERO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE EXAMEN_CLINICO 
    ADD CONSTRAINT EXAMEN_CLINICO_VERIFICACION_FK FOREIGN KEY 
    ( 
     VERIFICACION_NUMERO
    ) 
    REFERENCES VERIFICACION 
    ( 
     NUMERO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE INFORMACION_LABORAL 
    ADD CONSTRAINT INFORMACION_LABORAL_AREA_TRABAJOv1_FK FOREIGN KEY 
    ( 
     AREA_TRABAJOv1_COD
    ) 
    REFERENCES AREA_TRABAJOv1 
    ( 
     COD 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_6 
    ADD CONSTRAINT Relation_6_EXAMEN_CLINICO_FK FOREIGN KEY 
    ( 
     EXAMEN_CLINICO_FECHA
    ) 
    REFERENCES EXAMEN_CLINICO 
    ( 
     FECHA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_6 
    ADD CONSTRAINT Relation_6_TRABAJADOR_AFILIADO_FK FOREIGN KEY 
    ( 
     TRABAJADOR_AFILIADO_CUA
    ) 
    REFERENCES TRABAJADOR_AFILIADO 
    ( 
     CUA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE TRABAJADOR_AFILIADO 
    ADD CONSTRAINT TRABAJADOR_AFILIADO_AFP_FK FOREIGN KEY 
    ( 
     AFP_NUMERO
    ) 
    REFERENCES AFP 
    ( 
     NUMERO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE TRABAJADOR_AFILIADO 
    ADD CONSTRAINT TRABAJADOR_AFILIADO_DIRECCION_IDENTIFICACION_FK FOREIGN KEY 
    ( 
     DIRECCION_IDENTIFICACION_CI
    ) 
    REFERENCES DIRECCION_IDENTIFICACION 
    ( 
     CI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE TRABAJADOR_AFILIADO 
    ADD CONSTRAINT TRABAJADOR_AFILIADO_INFORMACION_LABORAL_FK FOREIGN KEY 
    ( 
     INFORMACION_LABORAL_NIT_PERTENECIENTE
    ) 
    REFERENCES INFORMACION_LABORAL 
    ( 
     NIT_PERTENECIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO