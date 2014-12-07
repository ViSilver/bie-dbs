-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2014-12-01 18:39:30 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE Actor
  (
    ActID   INTEGER NOT NULL ,
    name    VARCHAR2 (20) NOT NULL ,
    surname VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE Actor ADD CONSTRAINT Actor_PK PRIMARY KEY ( ActID ) ;

CREATE TABLE Actor_Awards_Movie
  (
    ActAwdMoID INTEGER NOT NULL ,
    YEAR       INTEGER NOT NULL ,
    ActID      INTEGER ,
    AwID       INTEGER ,
    MoID       INTEGER
  ) ;
ALTER TABLE Actor_Awards_Movie ADD CONSTRAINT Actor_Awards_Movie_PK PRIMARY KEY ( ActAwdMoID ) ;

CREATE TABLE Awards
  ( AwID INTEGER NOT NULL , name VARCHAR2 (40) NOT NULL
  ) ;
ALTER TABLE Awards ADD CONSTRAINT Awards_PK PRIMARY KEY ( AwID ) ;

CREATE TABLE Copy
  ( CoID INTEGER NOT NULL , MoID INTEGER
  ) ;
ALTER TABLE Copy ADD CONSTRAINT Copy_PK PRIMARY KEY ( CoID ) ;

CREATE TABLE Customer
  (
    CuID INTEGER NOT NULL ,
    name VARCHAR2 (30) NOT NULL
  ) ;
ALTER TABLE Customer ADD CONSTRAINT Customer_PK PRIMARY KEY ( CuID ) ;

CREATE TABLE Genre
  ( GeID INTEGER NOT NULL , name VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE Genre ADD CONSTRAINT Genre_PK PRIMARY KEY ( GeID ) ;

CREATE TABLE Manager
  (
    MaID    INTEGER NOT NULL ,
    name    VARCHAR2 (20) NOT NULL ,
    surname VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE Manager ADD CONSTRAINT Manager_PK PRIMARY KEY ( MaID ) ;

CREATE TABLE Movie
  (
    MoID  INTEGER NOT NULL ,
    title VARCHAR2 (40) NOT NULL ,
    YEAR  INTEGER NOT NULL
  ) ;
ALTER TABLE Movie ADD CONSTRAINT Movie_PK PRIMARY KEY ( MoID ) ;

CREATE TABLE MovieShop
  (
    MoShID  INTEGER NOT NULL ,
    name    VARCHAR2 (30) NOT NULL ,
    address VARCHAR2 (40) NOT NULL
  ) ;
ALTER TABLE MovieShop ADD CONSTRAINT MovieShop_PK PRIMARY KEY ( MoShID ) ;

CREATE TABLE Sale
  (
    SaID   INTEGER NOT NULL ,
    date1  DATE NOT NULL ,
    ShAID  INTEGER ,
    CuID   INTEGER NOT NULL ,
    CoID   INTEGER
  ) ;
ALTER TABLE Sale ADD CONSTRAINT Sale_PK PRIMARY KEY ( SaID ) ;

CREATE TABLE Shop_Assistant
  (
    ShAID   INTEGER NOT NULL ,
    name    VARCHAR2 (20) NOT NULL ,
    surname VARCHAR2 (20) NOT NULL ,
    MoShID  INTEGER NOT NULL
  ) ;
ALTER TABLE Shop_Assistant ADD CONSTRAINT Shop_Assistant_PK PRIMARY KEY ( ShAID ) ;

CREATE TABLE manag_mov_sh
  (
    MaID   INTEGER NOT NULL ,
    MoShID INTEGER NOT NULL
  ) ;
ALTER TABLE manag_mov_sh ADD CONSTRAINT manag_mov_sh_PK PRIMARY KEY ( MaID, MoShID ) ;

CREATE TABLE movie_actor
  ( MoID INTEGER NOT NULL , ActID INTEGER NOT NULL
  ) ;
ALTER TABLE movie_actor ADD CONSTRAINT movie_actor_PK PRIMARY KEY ( MoID, ActID ) ;

CREATE TABLE movie_awards
  (
    AwID INTEGER NOT NULL ,
    MoID INTEGER NOT NULL ,
    YEAR INTEGER NOT NULL
  ) ;
ALTER TABLE movie_awards ADD CONSTRAINT movie_awards_PK PRIMARY KEY ( AwID, MoID ) ;

CREATE TABLE movie_genres
  ( MoID INTEGER NOT NULL , GeID INTEGER NOT NULL
  ) ;
ALTER TABLE movie_genres ADD CONSTRAINT movie_genres_PK PRIMARY KEY ( MoID, GeID ) ;

ALTER TABLE Actor_Awards_Movie ADD CONSTRAINT Actor_Awards_Movie_Actor_FK FOREIGN KEY ( ActID ) REFERENCES Actor ( ActID ) ;

ALTER TABLE Actor_Awards_Movie ADD CONSTRAINT Actor_Awards_Movie_Awards_FK FOREIGN KEY ( AwID ) REFERENCES Awards ( AwID ) ;

ALTER TABLE Actor_Awards_Movie ADD CONSTRAINT Actor_Awards_Movie_Movie_FK FOREIGN KEY ( MoID ) REFERENCES Movie ( MoID ) ;

ALTER TABLE Copy ADD CONSTRAINT Copy_Movie_FK FOREIGN KEY ( MoID ) REFERENCES Movie ( MoID ) ;

ALTER TABLE Sale ADD CONSTRAINT Sale_Copy_FK FOREIGN KEY ( CoID ) REFERENCES Copy ( CoID ) ;

ALTER TABLE Sale ADD CONSTRAINT Sale_Customer_FK FOREIGN KEY ( CuID ) REFERENCES Customer ( CuID ) ;

ALTER TABLE Sale ADD CONSTRAINT Sale_Shop_Assistant_FK FOREIGN KEY ( ShAID ) REFERENCES Shop_Assistant ( ShAID ) ;

ALTER TABLE Shop_Assistant ADD CONSTRAINT Shop_Assistant_MovieShop_FK FOREIGN KEY ( MoShID ) REFERENCES MovieShop ( MoShID ) ;

ALTER TABLE movie_actor ADD CONSTRAINT act_act_mov FOREIGN KEY ( ActID ) REFERENCES Actor ( ActID ) ;

ALTER TABLE movie_actor ADD CONSTRAINT act_mov_mov FOREIGN KEY ( MoID ) REFERENCES Movie ( MoID ) ;

ALTER TABLE movie_awards ADD CONSTRAINT awd_awd_mov FOREIGN KEY ( AwID ) REFERENCES Awards ( AwID ) ;

ALTER TABLE manag_mov_sh ADD CONSTRAINT mng_mng_mov_sh FOREIGN KEY ( MaID ) REFERENCES Manager ( MaID ) ;

ALTER TABLE manag_mov_sh ADD CONSTRAINT mng_mov_sh_mov_sh FOREIGN KEY ( MoShID ) REFERENCES MovieShop ( MoShID ) ;

ALTER TABLE movie_genres ADD CONSTRAINT mov_gnr_gnr FOREIGN KEY ( GeID ) REFERENCES Genre ( GeID ) ;

ALTER TABLE movie_awards ADD CONSTRAINT mov_mov_awd FOREIGN KEY ( MoID ) REFERENCES Movie ( MoID ) ;

ALTER TABLE movie_genres ADD CONSTRAINT mov_mov_gnr FOREIGN KEY ( MoID ) REFERENCES Movie ( MoID ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             31
-- CREATE VIEW                              0
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
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
