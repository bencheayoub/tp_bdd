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

-- Insertion des données

INSERT INTO Tournoi VALUES (1, 'Olympiade Nationale de Mathématiques', 2024),
(2, 'Olympiade Nationale de Mathématiques', 2023),
(3, 'Olympiade Nationale de Mathématiques', 2022),
(4, 'Olympiade Nationale de Mathématiques', 2021);

INSERT INTO Wilaya VALUES 
(1, 'Alger'),
(2, 'Oran'),
(3, 'Constantine'),
(4, 'Blida'),
(5, 'Tizi Ouzou'),
(6, 'Sétif'),
(7, 'Annaba'),
(8, 'Batna'),
(9, 'Bejaia'),
(10, 'Tlemcen');

INSERT INTO Lycée VALUES
(1, 'Lycée Emir Abdelkader', 1),
(2, 'Lycée Pasteur', 1),
(3, 'Lycée Ibn Badis', 2),
(4, 'Lycée El-Khansa', 3),
(5, 'Lycée Frantz Fanon', 4),
(6, 'Lycée Mouloud Mammeri', 5),
(7, 'Lycée Mohamed Kerouani', 6),
(8, 'Lycée Saint Augustin', 7),
(9, 'Lycée Ben Boulaid', 8),
(10, 'Lycée Abane Ramdane', 9),
(11, 'Lycée Ibn Rochd', 10);

INSERT INTO Elève VALUES
(1, 'Bensalem', 'Rania', '2008-05-14', 'rania.bensalem@gmail.com', '1AS', 'Math', 1),
(2, 'Mokhtar', 'Ilyes', '2007-03-22', 'ilyes.mokhtar@yahoo.fr', '2AS', 'MathTechnique', 2),
(3, 'Ziani', 'Amina', '2006-07-10', 'amina.ziani@ yahoo.fr', '3AS', 'Science', 3),
(4, 'Kacem', 'Yassine', '2008-09-18', 'yassine.kacem@ gmail.com', '1AS', 'MathTechnique', 4),
(5, 'Saadi', 'Nour', '2007-11-30', 'nour.saadi@ hotmail.com', '2AS', 'Math', 5),
(6, 'Chibane', 'Anis', '2006-02-25', 'anis.chibane@ yahoo.fr', '3AS', 'MathTechnique', 6),
(7, 'Hamidi', 'Sara', '2008-06-08', 'sara.hamidi@ hotmail.com', '1AS', 'Math', 7),
(8, 'Mehdi', 'Omar', '2007-12-01', 'omar.mehdi@ gmail.com', '2AS', 'Science', 8),
(9, 'Belaid', 'Fatima', '2006-04-21', 'fatima.belaid@ yahoo.fr', '3AS', 'MathTechnique', 9),
(10, 'Guedda', 'Reda', '2008-08-19', 'reda.guedda@ gmail.com', '1AS', 'Science', 10),
(11, 'Zerrouki', 'Salim', '2007-10-05', 'salim.zerrouki@hotmail.com', '2AS', 'Math', 11);

INSERT INTO Epreuve VALUES
-- Tournoi 2024
(1, 'Algèbre', '2024-05-11', 1),
(2, 'Géométrie', '024-05-11', 1),
(3, 'Combinatoire', '2024-05-11', 1),
-- Tournoi 2023
(4, 'Algèbre', '2024-05-05', 2),
(5, 'Géométrie', '2024-05-05', 2),
(6, 'Combinatoire', '2024-05-05', 2),
-- Tournoi 2022
(7, 'Algèbre', '2024-06-01', 3),
(8, 'Géométrie', '2024-06-01', 3),
(9, 'Combinatoire', '2024-06-01', 3);

INSERT INTO Score VALUES
-- Tournoi 2024
(1, 1, 85), (1, 2, 78), (1, 3, 90),
(2, 1, 92), (2, 2, 88), (2, 3, 81),
(3, 1, 75), (3, 2, 89), (3, 3, 95),
(4, 1, 70), (4, 2, 85), (4, 3, 88),
(5, 1, 90), (5, 2, 79), (5, 3, 86),
(6, 1, 82), (6, 2, 91), (6, 3, 87),
(7, 1, 80), (7, 2, 92), (7, 3, 85),
-- Tournoi 2023
(8, 4, 88), (8, 5, 83), (8, 6, 89),
(9, 4, 79), (9, 5, 91), (9, 6, 94),
-- Tournoi 2022
(10, 7, 95), (10, 8, 78), (10, 9, 92),
(11, 7, 84), (11, 8, 88), (11, 9, 90);

-- Interrogation de la base de données

SELECT E.nom, E.prénom, L.nom AS Lycée, W.nom AS Wilaya
FROM Elève E 
JOIN Lycée L ON L.idLycée = E.idLycée
JOIN Wilaya W ON W.idWilaya = L.idWilaya
WHERE E.idEleve IN (
    SELECT DISTINCT S.idEleve
    FROM Score S
    JOIN Epreuve Ep ON S.IdEpreuve = Ep.IdEpreuve
    WHERE Ep.id_tournoi = 1
);

SELECT E.nom, E.prénom, ROUND(AVG(S.points), 1) AS Moyenne
FROM Elève E
JOIN Score S ON E.idEleve = S.idEleve
JOIN Epreuve Ep ON S.IdEpreuve = Ep.IdEpreuve
WHERE Ep.id_tournoi = 1
GROUP BY E.idEleve
ORDER BY Moyenne DESC;

SELECT E.nom, E.prénom, L.nom AS Lycée, W.nom AS Wilaya, ROUND(AVG(S.points), 1) AS Moyenne
FROM Elève E
JOIN Lycée L ON E.idLycée = L.idLycée
JOIN Wilaya W ON L.idWilaya = W.idWilaya
JOIN Score S ON E.idEleve = S.idEleve
JOIN Epreuve Ep ON S.IdEpreuve = Ep.IdEpreuve
WHERE Ep.id_tournoi = 1
GROUP BY E.idEleve
ORDER BY Moyenne DESC
LIMIT 1;

SELECT L.nom AS Lycée, MAX(Moyenne) AS Meilleure_Moyenne
FROM (
    SELECT E.idLycée, AVG(S.points) AS Moyenne
    FROM Elève E
    JOIN Score S ON E.idEleve = S.idEleve
    JOIN Epreuve Ep ON S.IdEpreuve = Ep.IdEpreuve
    WHERE Ep.id_tournoi = 1
    GROUP BY E.idEleve
) AS Sub
JOIN Lycée L ON Sub.idLycée = L.idLycée
GROUP BY L.idLycée
ORDER BY Meilleure_Moyenne DESC
LIMIT 3;

SELECT E.nom, E.prénom, ROUND(AVG(S.points), 1) AS Moyenne
FROM Elève E
JOIN Score S ON E.idEleve = S.idEleve
GROUP BY E.idEleve
HAVING Moyenne > 80;

SELECT W.nom, COUNT(*) AS Participants
FROM Wilaya W
JOIN Lycée L ON W.idWilaya = L.idWilaya
JOIN Elève E ON L.idLycée = E.idLycée
GROUP BY W.idWilaya
ORDER BY Participants DESC
LIMIT 1;

SELECT W.nom, ROUND(AVG(S.points), 1) AS Moyenne
FROM Wilaya W
JOIN Lycée L ON W.idWilaya = L.idWilaya
JOIN Elève E ON L.idLycée = E.idLycée
JOIN Score S ON E.idEleve = S.idEleve
GROUP BY W.idWilaya
ORDER BY Moyenne DESC;

SELECT niveau, spécialité, ROUND(AVG(S.points), 1) AS Moyenne
FROM Elève E
JOIN Score S ON E.idEleve = S.idEleve
GROUP BY niveau, spécialité;

DELETE FROM Tournoi
WHERE idTournoi NOT IN (
    SELECT DISTINCT Ep.id_tournoi
    FROM Epreuve Ep
    JOIN Score S ON Ep.IdEpreuve = S.IdEpreuve
);

SELECT * FROM Tournoi;

UPDATE Epreuve
SET date_epreuve = '2024-05-20'
WHERE id_tournoi = 1;

SELECT * FROM Epreuve;
