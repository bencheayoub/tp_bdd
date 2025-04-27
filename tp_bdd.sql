DROP DATABASE IF EXISTS MYDB;
CREATE DATABASE MYDB;
USE MYDB;

DROP TABLE IF EXISTS Score, Epreuve, Elève, Lycée, Wilaya, Tournoi;

-- Création des tables

CREATE table Tournoi(
	idTournoi INT PRIMARY KEY,
    nom VARCHAR(50),
    année int
);

CREATE TABLE Wilaya(
	idWilaya INT PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE Lycée(
	idLycée INT PRIMARY KEY,
    nom VARCHAR(50),
    idWilaya INT,
    foreign key (idWilaya) REFERENCES Wilaya(idWilaya)
);

CREATE TABLE Elève(
	idEleve INT PRIMARY KEY,
    nom VARCHAR(50),
    prénom VARCHAR(50),
    date_naiss DATE,
    email VARCHAR(50),
    niveau ENUM('1AS', '2AS', '3AS'),
    spécialité enum('Science', 'Math', 'MathTechnique'),
    idLycée int,
    foreign key (idLycée) REFERENCES Lycée(idLycée)
);

CREATE TABLE Epreuve(
	IdEpreuve INT PRIMARY KEY,
    type_Epreuve ENUM('Algèbre', 'Géométrie', 'Combinatoire'),
    date_epreuve DATE,
    id_tournoi int,
    foreign key (id_tournoi) REFERENCES Tournoi(idTournoi)
);

CREATE TABLE Score(
	idEleve INT,
    IdEpreuve INT,
    POINTS INT,
    PRIMARY KEY (idEleve, IdEpreuve),
    foreign key (idEleve) REFERENCES Elève(idEleve),
    foreign key (IdEpreuve) REFERENCES Epreuve(IdEpreuve)
);
