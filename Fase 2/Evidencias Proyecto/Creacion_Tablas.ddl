-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-11-11 21:55:20 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE categoria (
    id_categoria     INTEGER NOT NULL,
    nombre_marca     VARCHAR2(500) NOT NULL,
    nombre_categoria VARCHAR2(500) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE historial (
    id_historial                 INTEGER NOT NULL,
    ingresos_id_ingreso          INTEGER NOT NULL,
    salidas_salida_id            INTEGER NOT NULL,
    tipo_movimiento              VARCHAR2(500) NOT NULL,
    fecha                        DATE NOT NULL,
    id_producto                  INTEGER NOT NULL,
    cantidad                     INTEGER NOT NULL,
    id_usuario                   INTEGER NOT NULL,
    nombre_usuario               VARCHAR2(500) NOT NULL,
    modificacion_id_modificacion INTEGER NOT NULL
);

ALTER TABLE historial ADD CONSTRAINT historial_pk PRIMARY KEY ( id_historial );

CREATE TABLE ingresos (
    id_ingreso           INTEGER NOT NULL,
    cantidad             INTEGER NOT NULL,
    detalle              VARCHAR2(1000) NOT NULL,
    fecha_ingreso        DATE NOT NULL,
    producto_id_producto INTEGER NOT NULL
);

ALTER TABLE ingresos ADD CONSTRAINT ingresos_pk PRIMARY KEY ( id_ingreso );

CREATE TABLE modificacion (
    id_modificacion      INTEGER NOT NULL,
    fecha_modificacion   DATE NOT NULL,
    razon                VARCHAR2(500) NOT NULL,
    cantidad_anterior    INTEGER NOT NULL,
    nueva_cantidad       INTEGER NOT NULL,
    producto_id_producto INTEGER NOT NULL
);

ALTER TABLE modificacion ADD CONSTRAINT modificacion_pk PRIMARY KEY ( id_modificacion );

CREATE TABLE producto (
    id_producto            INTEGER NOT NULL,
    nombre_producto        VARCHAR2(500) NOT NULL,
    stock                  INTEGER NOT NULL,
    codigo                 VARCHAR2(500) NOT NULL,
    categoria_id_categoria INTEGER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE rol (
    id_rol     INTEGER NOT NULL,
    nombre_rol VARCHAR2(500) NOT NULL
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id_rol );

CREATE TABLE salidas (
    salida_id            INTEGER NOT NULL,
    cantidad             INTEGER NOT NULL,
    detalle              VARCHAR2(1000) NOT NULL,
    fecha_salida         DATE NOT NULL,
    producto_id_producto INTEGER NOT NULL
);

ALTER TABLE salidas ADD CONSTRAINT salidas_pk PRIMARY KEY ( salida_id );

CREATE TABLE usuario (
    usuario_id             INTEGER NOT NULL,
    nombre                 VARCHAR2(500) NOT NULL,
    apellido               VARCHAR2(500) NOT NULL,
    correo                 VARCHAR2(500),
    telefono               VARCHAR2(500) NOT NULL,
    direccion              VARCHAR2(500) NOT NULL,
    rol_id_rol             INTEGER NOT NULL,
    historial_id_historial INTEGER NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( usuario_id );

ALTER TABLE historial
    ADD CONSTRAINT historial_ingresos_fk FOREIGN KEY ( ingresos_id_ingreso )
        REFERENCES ingresos ( id_ingreso );

ALTER TABLE historial
    ADD CONSTRAINT historial_modificacion_fk FOREIGN KEY ( modificacion_id_modificacion )
        REFERENCES modificacion ( id_modificacion );

ALTER TABLE historial
    ADD CONSTRAINT historial_salidas_fk FOREIGN KEY ( salidas_salida_id )
        REFERENCES salidas ( salida_id );

ALTER TABLE ingresos
    ADD CONSTRAINT ingresos_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE modificacion
    ADD CONSTRAINT modificacion_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_id_categoria )
        REFERENCES categoria ( id_categoria );

ALTER TABLE salidas
    ADD CONSTRAINT salidas_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_historial_fk FOREIGN KEY ( historial_id_historial )
        REFERENCES historial ( id_historial );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY ( rol_id_rol )
        REFERENCES rol ( id_rol );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
