CREATE TABLE Modele_voiture (
                                id SERIAL PRIMARY KEY,
                                marque VARCHAR(10) CHECK (marque IN ('FORD', 'GMC', 'DODGE')),
                                modele VARCHAR(10) CHECK (modele IN ('RANGER', 'EVEREST', 'YUKON', 'RAM'))
);

CREATE TABLE Mecanicien (
                            id SERIAL PRIMARY KEY,
                            nom VARCHAR(50),
                            marque VARCHAR(10) CHECK (marque IN ('FORD', 'GMC', 'DODGE'))
);

CREATE TABLE Reparation (
                            id SERIAL PRIMARY KEY,
                            id_mecanicien INT REFERENCES Mecanicien(id),
                            id_modele_voiture INT REFERENCES Modele_voiture(id),
                            cout NUMERIC
);