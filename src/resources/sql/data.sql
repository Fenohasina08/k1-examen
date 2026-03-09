SELECT
    Modele_voiture.marque,
    Modele_voiture.modele,
    COUNT(Reparation.id) AS nbre_reparation
FROM Reparation
         JOIN Modele_voiture ON Reparation.id_modele_voiture = Modele_voiture.id
GROUP BY Modele_voiture.marque, Modele_voiture.modele
ORDER BY Modele_voiture.marque, Modele_voiture.modele;

