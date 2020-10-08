DROP Table Inscription;
DROP Table Etudiant;

CREATE TABLE Etudiant (
  matricule INT NOT NULL,
  nom varchar(255) DEFAULT NULL,
  prenom varchar(255) DEFAULT NULL,
  dateNaissance date DEFAULT NULL,
  PRIMARY KEY (matricule)
);


SELECT * FROM Etudiant;

TRUNCATE TABLE Etudiant;
DROP Table Etudiant;



INSERT INTO Etudiant --(matricule, prenom, nom, dateNaissance)
VALUES
	(1, 'Verdyck', 'Alfred', '2001-01-02'),
	(2, 'Friling', 'Alfred', '2001-01-02'),
	(3, 'Poelmans', 'Edgard', '1999-03-04'),
	(4, 'Charles', 'Cambier', NULL),
	(5, 'Poelmans', 'Edgard', '1999-03-06');

INSERT INTO Etudiant (matricule)
VALUES
    (6), (7), (8);


--Projections
	
SELECT * FROM Etudiant;

SELECT nom FROM Etudiant;
SELECT prenom, nom FROM Etudiant;
SELECT nom, prenom FROM Etudiant;
SELECT nom, nom, prenom FROM Etudiant;
SELECT prenom, UPPER(nom) FROM Etudiant;
SELECT prenom, UPPER(nom) as "Nom en majuscules" FROM Etudiant;
SELECT prenom, nom, UPPER(nom), LOWER(nom) as lowerNom FROM Etudiant;

SELECT lower(SUBSTR(nom, 1, 1)) || upper(SUBSTR(nom, 2)) FROM Etudiant;

SELECT DISTINCT(prenom) FROM Etudiant;

SELECT COUNT(nom) FROM Etudiant;
SELECT COUNT(prenom) FROM Etudiant;
SELECT COUNT(DISTINCT(prenom)) FROM Etudiant;

SELECT MAX(nom) FROM Etudiant;
SELECT MIN(nom) FROM Etudiant;
SELECT MAX(matricule) FROM Etudiant;
SELECT AVG(matricule) FROM Etudiant;

SELECT SUBSTR("Coucou", -3);

-- SELECT NOW(); -- MySQL
-- SELECT GETDATE(); -- SqlServer
SELECT date('now');
SELECT CURRENT_DATE; -- Sqlite
SELECT datetime('now'); -- Sqlite
SELECT CURRENT_TIMESTAMP;
SELECT time('now');
SELECT CURRENT_TIME;
SELECT date('now','start of month');
SELECT date('now','start of month','+1 month');
SELECT date('now','start of month','+1 month','-1 day');
SELECT date('2000-02-01', '+1 month', '-1 day');

-- Selections

SELECT * FROM Etudiant WHERE prenom <> 'Alfred';
SELECT nom, prenom FROM Etudiant WHERE prenom <> 'Alfred';
SELECT * FROM Etudiant WHERE prenom = 'Alfred' AND nom = 'Friling';
SELECT * FROM Etudiant WHERE prenom = 'Alfred' OR nom = 'Friling';
SELECT * FROM Etudiant WHERE prenom = 'Alfred' OR (nom = 'Charles' AND prenom = 'Cambier');
SELECT * FROM Etudiant WHERE SUBSTR(prenom, 1,1) >= 'C';
SELECT * FROM Etudiant WHERE NOT (matricule > 2);
SELECT * FROM Etudiant WHERE matricule <= 2;
SELECT * FROM Etudiant WHERE NOT (matricule <= 2);
SELECT * FROM Etudiant WHERE matricule <> 2;
SELECT * FROM Etudiant WHERE matricule != 2;

SELECT * FROM Etudiant WHERE matricule BETWEEN 1 AND 3;
SELECT * FROM Etudiant WHERE dateNaissance BETWEEN '2000-01-01' AND '2015-01-01';
SELECT * FROM Etudiant WHERE nom BETWEEN 'Clara' AND 'Urluberlu';

SELECT * FROM Etudiant WHERE prenom LIKE 'A%';

SELECT * FROM Etudiant WHERE prenom LIKE '%d';
SELECT * FROM Etudiant WHERE prenom LIKE '%r%';

SELECT * FROM Etudiant WHERE prenom LIKE '%a%rd';

SELECT * FROM Etudiant WHERE dateNaissance IS NOT NULL;
SELECT * FROM Etudiant WHERE dateNaissance IS NULL;

SELECT * FROM Etudiant WHERE dateNaissance = NULL; -- ne fonctionne pas


SELECT * FROM Etudiant WHERE matricule IN (1,3,5,15);
SELECT * FROM Etudiant WHERE NOT(matricule IN (1,3,5,15));
SELECT * FROM Etudiant WHERE matricule NOT IN (1,3,5,15);

-- Groups
SELECT prenom FROM Etudiant GROUP BY prenom;

SELECT prenom, COUNT(*) FROM Etudiant GROUP BY prenom;
SELECT prenom, SUM(matricule) FROM Etudiant GROUP BY prenom;
SELECT * FROM Etudiant;
SELECT prenom, nom, dateNaissance FROM Etudiant GROUP BY prenom; -- à proscrire

SELECT prenom, COUNT(*) as NB FROM Etudiant GROUP BY prenom;
SELECT prenom, nom, COUNT(*) as NB FROM Etudiant GROUP BY prenom, nom;

SELECT prenom
    FROM Etudiant 
    WHERE prenom LIKE 'A%';

SELECT prenom, COUNT(*) as NB 
    FROM Etudiant
    WHERE prenom LIKE 'E%'
    GROUP BY prenom 
    HAVING SUM(matricule) > 3;


SELECT prenom, COUNT(*) as NB 
    FROM Etudiant 
    GROUP BY prenom 
    HAVING NB > 1;

-- Order by

SELECT * FROM Etudiant ORDER BY nom DESC;
SELECT * FROM Etudiant ORDER BY prenom DESC, nom ASC;

SELECT * FROM Etudiant ORDER BY dateNaissance DESC;

-- Limit

SELECT * FROM Etudiant LIMIT 2,3;

-- Recap

SELECT prenom FROM Etudiant
    WHERE prenom > 'A'
    GROUP BY prenom
    HAVING COUNT(*) > 1
    ORDER BY prenom DESC
    LIMIT 1


-- JOIN

SELECT * FROM Etudiant as E1, Etudiant as E2;



SELECT COUNT(*) FROM Etudiant as E1;
SELECT COUNT(*) FROM Etudiant as E1,Etudiant as E2;
SELECT COUNT(*) FROM Etudiant as E1,Etudiant as E2, Etudiant as E3;
SELECT COUNT(*) FROM Etudiant as E1,Etudiant as E2, Etudiant as E3, Etudiant as E4;

SELECT * FROM Etudiant as E1,Etudiant as E2, Etudiant as E3, Etudiant as E4;

SELECT * FROM Etudiant as E1,Etudiant as E2, Etudiant as E3, Etudiant as E4
    WHERE E1.matricule = E2.matricule 
        AND E2.matricule = E3.matricule
        AND E3.matricule = E4.matricule;

SELECT * FROM Etudiant as E1,Etudiant as E2
    WHERE 
        E1.dateNaissance = E2.dateNaissance
        AND E1.matricule != E2.matricule
        AND E1.matricule < E2.matricule




-- DROP Table Inscription;
CREATE TABLE Inscription (
  matricule int NOT NULL,
  annee varchar(10) NOT NULL,
  name varchar(10) NOT NULL,
  PRIMARY KEY (matricule,annee),
  FOREIGN KEY (matricule) REFERENCES Etudiant
);

INSERT INTO Inscription (matricule, annee, statut)
VALUES
	(1, '2017', 'ECHEC'),
	(1, '2018', 'REUSSITE'),
	(2, '2017', 'ECHEC'),
	(2, '2018', 'ECHEC'),
	(4, '2018', 'ECHEC'),
	(4, '2019', 'NON PAYE');

PRAGMA FOREIGN_KEYS = ON;
UPDATE Inscription SET matricule = 9999 WHERE matricule = 4;
SELECT * FROM Inscription;

INSERT INTO Inscription (matricule, annee, statut)
VALUES
	(999, '2017', 'ECHEC');

DELETE FROM Inscription WHERE matricule = 999


-- Join

SELECT * FROM Etudiant, Inscription;

SELECT * FROM Inscription;

SELECT * 
    FROM Etudiant as E, Inscription as I
    WHERE E.matricule = I.matricule AND nom LIKE 'V%';

SELECT * FROM Etudiant 
    NATURAL JOIN Inscription; 

SELECT * 
    FROM Etudiant 
    INNER JOIN Inscription 
        ON Etudiant.matricule = Inscription.matricule
    WHERE nom LIKE 'V%'; 


SELECT * 
    FROM Etudiant 
    LEFT JOIN Inscription 
    ON Etudiant.matricule = Inscription.matricule; 

SELECT * FROM Etudiant
 RIGHT JOIN Inscription 
 ON Etudiant.matricule = Inscription.matricule; 
-- ne fonctionne pas en SQLite mais peut s'écrire comme :
SELECT * FROM Inscription
 LEFT JOIN Etudiant 
 ON Etudiant.matricule = Inscription.matricule; 


-- Sous-requêtes

SELECT * FROM Etudiant 
    WHERE matricule IN (
        SELECT DISTINCT(matricule)
        FROM Inscription 
        WHERE statut = 'ECHEC'
);

SELECT DISTINCT matricule, Etudiant.*
    FROM Etudiant
    NATURAL JOIN Inscription
    WHERE statut = 'ECHEC';

SELECT * FROM Inscription 
    JOIN (
        SELECT * 
        FROM Etudiant 
        WHERE prenom LIKE 'A%') as Etud 
    ON Etud.matricule = Inscription.matricule;

SELECT * 
        FROM Inscription ;
SELECT * FROM Etudiant 
    WHERE NOT EXISTS (
        SELECT * 
        FROM Inscription 
        WHERE
            Inscription.matricule = Etudiant.matricule 
            AND statut = 'ECHEC'
        GROUP BY statut
        HAVING COUNT(statut) > 1
        );

SELECT * FROM Etudiant WHERE matricule > ANY (SELECT matricule FROM Etudiant);
SELECT * FROM Etudiant WHERE matricule >= ALL (SELECT matricule FROM Etudiant);

INSERT INTO Etudiant SELECT matricule + 6, nom, prenom, dateNaissance FROM Etudiant

UPDATE Etudiant SET nom = 'Pluquet' 
    WHERE NOT EXISTS (
        SELECT * 
            FROM Inscription 
            WHERE Etudiant.matricule = Inscription.matricule)
