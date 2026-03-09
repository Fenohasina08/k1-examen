SELECT
    Modele_voiture.marque,
    Modele_voiture.modele,
    COUNT(Reparation.id) AS nbre_reparation
FROM Reparation
         JOIN Modele_voiture ON Reparation.id_modele_voiture = Modele_voiture.id
GROUP BY Modele_voiture.marque, Modele_voiture.modele
ORDER BY Modele_voiture.marque, Modele_voiture.modele;

SELECT
    ROUND(100.0 * SUM(CASE WHEN Modele_voiture.modele = 'RANGER' THEN 1 ELSE 0 END) / COUNT(*), 2) AS nbre_reparation_ranger,
    ROUND(100.0 * SUM(CASE WHEN Modele_voiture.modele = 'EVEREST' THEN 1 ELSE 0 END) / COUNT(*), 2) AS nbre_reparation_everest,
    ROUND(100.0 * SUM(CASE WHEN Modele_voiture.modele = 'YUKON' THEN 1 ELSE 0 END) / COUNT(*), 2) AS nbre_reparation_yukon,
    ROUND(100.0 * SUM(CASE WHEN Modele_voiture.modele = 'RAM' THEN 1 ELSE 0 END) / COUNT(*), 2) AS nbre_reparation_ram
FROM Reparation
         JOIN Modele_voiture ON Reparation.id_modele_voiture = Modele_voiture.id;

SELECT
    Modele_voiture.marque,
    Mecanicien.nom AS nom_mecanicien,
    SUM(Reparation.cout) AS cout_reparation
FROM Reparation
         JOIN Modele_voiture ON Reparation.id_modele_voiture = Modele_voiture.id
         JOIN Mecanicien ON Reparation.id_mecanicien = Mecanicien.id
GROUP BY Modele_voiture.marque, Mecanicien.nom
ORDER BY Modele_voiture.marque, Mecanicien.nom;