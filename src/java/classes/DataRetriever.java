import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class DataRetriever {
    private DBConnection dbConnection;

    public DataRetriever(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

    public List<CoutParMecanicien> findCoutParMecanicien() {
        List<CoutParMecanicien> list = new ArrayList<>();

        String sql = """
        SELECT Modele_voiture.marque,
               Mecanicien.nom AS nom_mecanicien,
               SUM(Reparation.cout) AS cout_reparation
        FROM Reparation
        JOIN Modele_voiture ON Reparation.id_modele_voiture = Modele_voiture.id
        JOIN Mecanicien ON Reparation.id_mecanicien = Mecanicien.id
        GROUP BY Modele_voiture.marque, Mecanicien.nom
        ORDER BY Modele_voiture.marque, Mecanicien.nom
    """;

        try (Connection connection = dbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                CoutParMecanicien cpm = new CoutParMecanicien();
                cpm.setMarque(resultSet.getString("marque"));
                cpm.setNomMecanicien(resultSet.getString("nom_mecanicien"));
                cpm.setCoutReparation(resultSet.getDouble("cout_reparation"));
                list.add(cpm);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }
 }
}

