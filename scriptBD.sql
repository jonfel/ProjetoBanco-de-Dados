SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table GRAU
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS GRAU (
  COD_GRAU INT NOT NULL,
  ANO INT,
  NOME VARCHAR(45),
  PRIMARY KEY (COD_GRAU));


-- -----------------------------------------------------
-- Table TURMA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS TURMA (
  COD_TURMA INT NOT NULL,
  PROF_ID INT NOT NULL,
  ID_SALA INT NOT NULL,
  PRIMARY KEY (COD_TURMA),
  FOREIGN KEY (ID_SALA)
    REFERENCES SALA (ID_SALA),
  FOREIGN KEY (PROF_ID)
    REFERENCES SERVIDOR (ID));
    

-- -----------------------------------------------------
-- Table DISCIPLINA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS DISCIPLINA (
  COD_DISC INT NOT NULL,
  NOME_DISC VARCHAR(45),
  PRE_REQUI VARCHAR(45),
  TURMA_COD INT NOT NULL,
  PRIMARY KEY (COD_DISC, TURMA_COD),
  FOREIGN KEY (TURMA_COD)
  REFERENCES TURMA (COD_TURMA));


-- -----------------------------------------------------
-- Table ALUNO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ALUNO (
  RA INT NOT NULL,
  NOME VARCHAR(45),
  MENSALIDADE FLOAT,
  GRAU_COD INT NOT NULL,
  DISCIPLINA_COD INT NOT NULL,
  PRIMARY KEY (RA),
  FOREIGN KEY (GRAU_COD)
  REFERENCES GRAU (COD_GRAU),
  FOREIGN KEY (DISCIPLINA_COD)
  REFERENCES DISCIPLINA (COD_DISC));


-- -----------------------------------------------------
-- Table SALA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SALA (
  ID_SALA INT NOT NULL,
  BLOCO INT,
  SERVENTE_ID INT NOT NULL,
  PRIMARY KEY (ID_SALA),
  FOREIGN KEY (TURMA_COD)
  REFERENCES TURMA (COD_TURMA),
  FOREIGN KEY (SERVENTE_ID)
  REFERENCES SERVIDOR (ID));


-- -----------------------------------------------------
-- Table SERVIDOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SERVIDOR (
  ID INT NOT NULL,
  NOME VARCHAR(45),
  SALARIO FLOAT NULL,
  PRIMARY KEY (ID));


-- -----------------------------------------------------
-- Table PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PROFESSOR (
  ATUACAO VARCHAR(45),
  SERVIDOR_ID INT NOT NULL,
  PRIMARY KEY (SERVIDOR_ID),
  FOREIGN KEY (SERVIDOR_ID)
    REFERENCES SERVIDOR (ID));


-- -----------------------------------------------------
-- Table SERVENTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SERVENTE (
  SERVIDOR_ID INT NOT NULL,
  PRIMARY KEY (SERVIDOR_ID),
  FOREIGN KEY (SERVIDOR_ID)
    REFERENCES SERVIDOR (ID));


-- -----------------------------------------------------
-- Table TURMA_has_ALUNO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS TURMA_has_ALUNO (
  TURMA_COD INT NOT NULL,
  ALUNO_RA INT NOT NULL,
  PRIMARY KEY (TURMA_COD, ALUNO_RA),
  FOREIGN KEY (TURMA_COD)
    REFERENCES TURMA (COD_TURMA),
  FOREIGN KEY (ALUNO_RA)
    REFERENCES ALUNO (RA));


-- -----------------------------------------------------
-- Table DISCIPLINA_has_PROFESSOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS DISCIPLINA_has_PROFESSOR (
  DISCIPLINA_COD INT NOT NULL,
  PROFESSOR_ID VARCHAR(30) NOT NULL,
  PRIMARY KEY (DISCIPLINA_COD, PROFESSOR_DEPARTAMENTO),
  FOREIGN KEY (DISCIPLINA_COD)
    REFERENCES DISCIPLINA (COD_DISC),
  FOREIGN KEY (PROFESSOR_ID)
    REFERENCES SERVIDOR (ID));


-- -----------------------------------------------------
-- Table GRAU_has_DISCIPLINA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS GRAU_has_DISCIPLINA (
  GRAU_COD INT NOT NULL,
  DISCIPLINA_COD INT NOT NULL,
  PRIMARY KEY (GRAU_COD, DISCIPLINA_COD),
  FOREIGN KEY (GRAU_COD)
    REFERENCES GRAU (COD_GRAU),
  FOREIGN KEY (DISCIPLINA_COD)
    REFERENCES DISCIPLINA (COD_DISC));



INSERT INTO ALUNO (RA, NOME, MENSALIDADE, GRAU_COD, DISCIPLINA_COD) VALUES (1235467, 'Testelvinea de Jesus', 300, 01, 200), ( 1000000, 'Testerson Pereira', 300, 02, 201), ( 1000001, 'Jucileide da Costa', 300, 03, 202), ( 100002, 'Marinalva Tereza', 300, 04, 203), ( 1000003, 'Mindy Schowz', 300, 04, 204), 
( 1000004, 'Luis Carlos Warker', 300, 01, 205), ( 1000005, 'Eduardo Lima', 300, 02, 206), ( 1000006, 'Rian Iwao', 300, 03, 207), ( 1000007, 'Herivelton Candido', 500, 05, 208), ( 1000008, 'Paula Barbosa', 500, 06, 209), ( 1000009, 'Amabile Pinto', 500, 05, 210), ( 1000010, 'Diego Pereira', 500, 07, 211), 
( 1000011, 'Jose Airton', 300, 05, 212), ( 1000012, 'Abedi Wolf', 300, 06, 213), ( 1000013, 'Patricia Lopes', 300, 07, 214), ( 1000014, 'Andressa Skorz', 300, 05, 215), ( 1000015, 'Joaquim Lmfao', 300, 06, 216), ( 1000016, 'Caique Bowls', 500, 06, 217), ( 1000017, 'Matheus Kehl', 500, 07, 218),
( 1000018, 'Gabriel Sabo', 300, 01, 200), ( 1000019, 'Leonardo Bertolini', 300, 02, 201), ( 1000020, 'Dougras Cardoso', 300, 03, 202), ( 1000021, 'Ricardo Sander', 300, 04, 203), ( 1000022, 'Welsey Cabello', 300, 03, 204), ( 1000023, 'Davi Lucca', 300, 02, 205), ( 1000024, 'Hillary Chagas', 300, 01, 206),
( 1000025, 'Djeferson Ferreira', 300, 04, 207), ( 1000026, 'Maria Rilsa', 500, 05, 208), ( 1000027, 'Leticia Mazzo', 500, 07, 209), ( 1000028, 'Goku Wasaki', 500, 06, 210), ( 1000029, 'Israel Rodriguez', 500, 06, 211), ( 1000030, 'Pablo Escobar', 500, 05, 212), ( 1000031, 'Bruno Feitoza', 500, 07, 213);


INSERT INTO GRAU (COD_GRAU, ANO, NOME) VALUES (01, 6, 'Ensino Fundamental'), (02, 7, 'Ensino Fundamental'), (03, 8, 'Ensino Fundamental'), (04, 9, 'Ensino Fundamental'), (05, 1, 'Ensino Medio'), (06, 2, 'Ensino Medio'), (07, 3, 'Ensino Medio');

INSERT INTO TURMA (COD_TURMA, ID_SALA, PROF_ID) VALUES (100, 101, 2002), (101, 102, 2003), (102, 103, 2004), (103, 104, 2005), (104, 105, 2006), (105, 201, 2007), (106, 202, 2007), (107, 203, 2008), (108, 204, 2009), (109, 205, 2011), (110, 101, 2010), (111, 102, 2012),  (112, 103, 2014), (113, 104, 2013), (114, 105, 2002), (115, 201), (116, 202), (117, 203, 2007), (118, 205, 2011);

INSERT INTO DISCIPLINA (COD_DISC, NOME_DISC, PRE_REQUI, TURMA_COD) VALUES (200, 'Portugues', 'Nenhum', 100), (201, 'Matematica', 'Nenhum', 101), (202, 'Ciencias', 'Nenhum', 102), (203, 'Historia', 'Nenhum', 103), (204, 'Geografia', 'Nenhum', 104),
(205, 'Educacao Fisica', 'Nenhum', 105), (206, 'Ingles', 'Nenhum', 106), (207, 'Artes', 'Nenhum', 107), (208, 'Portugues', 'Portugues', 108), (209, 'Matematica', 'Matematica', 109),  (210, 'Biologia', 'Ciencias', 110), (211, 'Historia', 'Historia', 111),
(212, 'Geografia', 'Geografia', 112), (213, 'Educacao Fisica', 'Educacao Fisica', 113), (214, 'Ingles', 'Ingles', 114),(215, 'Quimica', 'Ciencias', 115), (216, 'Sociologia', 'Nenhum', 116), (217, 'Filosofia', 'Nenhum', 117),(218, 'Fisica', 'Matematica', 118);

INSERT INTO SALA (ID_SALA, BLOCO, SERVENTE_ID) VALUES (101, 01, 2000), (102, 01, 2001), (103, 01, 2000), (104, 01, 2000), (105, 01), (201, 02, 2001), (202, 02, 2000), (203, 02, 2000), (204, 02, 2001), (205, 02, 2001);

INSERT INTO SERVIDOR (ID, NOME, SALARIO) VALUES (2000, 'Jose Da Costa', 1800), (2001, 'Joana Oliveira', 1800), (2002, 'Cesar Ruiz', 2700), (2003, 'Julia Coutinho', 2700), (2004, 'Felipe Vieira', 2700), (2005, 'Mariana Smoliak' , 2700), (2006, 'Thalita Santos', 2700), 
(2007, 'Joao Pedro', 3300), (2008, 'Cleide Mara', 3300), (2009, 'Mariclene Podolski', 3300), (2010, 'Cristiano Araujo', 3300), (2011, 'Rosa Marques', 3300), (2012, 'Alfredo Nunes', 3300), (2013, 'Luiza Spurs', 3300), (2014, 'Rogerio Azevedo', 3300), (2015, 'Alzira Neves', 3300);

INSERT INTO PROFESSOR (SERVIDOR_ID, ATUACAO) VALUES (2002, Humanas), (2003, Exatas), (2004, Biologicas), (2005, Humanas), (2006, Humanas), (2007, Biologicas), (2008, Humanas), (2009, Exatas), (2010, Biologicas), (2011, Exatas), (2012, Humanas), (2013, Biologicas), (2014, Humanas), (2015, Exatas);

INSERT INTO SERVENTE (SERVIDOR_ID) VALUES (2000), (2001);
 
 
