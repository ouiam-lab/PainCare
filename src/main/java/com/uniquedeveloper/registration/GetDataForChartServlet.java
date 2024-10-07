package com.uniquedeveloper.registration;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/getDataForChart")
public class GetDataForChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        List<Integer> painImpactPercentages = getPainImpactPercentagesFromDatabase();
        String jsonData = convertDataToJson(painImpactPercentages);

        response.setContentType("application/json");
        response.getWriter().write(jsonData);
    }

    private String convertDataToJson(List<Integer> painImpactPercentages) {
        int dayCounter = 1; // Compteur de jours
        StringBuilder jsonData = new StringBuilder("{ \"labels\": [");

        for (int percentage : painImpactPercentages) {
            jsonData.append("\"Day ").append(dayCounter).append("\", ");
            dayCounter++;
        }

        if (!painImpactPercentages.isEmpty()) {
            jsonData.setLength(jsonData.length() - 2); // Supprimer la virgule en trop
        }

        jsonData.append("], \"data\": [");

        for (int percentage : painImpactPercentages) {
            jsonData.append(percentage).append(", ");
        }

        if (!painImpactPercentages.isEmpty()) {
            jsonData.setLength(jsonData.length() - 2); // Supprimer la virgule en trop
        }

        jsonData.append("] }");

        return jsonData.toString();
    }

    private List<Integer> getPainImpactPercentagesFromDatabase() {
        List<Integer> percentages = new ArrayList<>();

        try {
            // Chargement du pilote JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Établissement de la connexion à la base de données
            String jdbcURL = "jdbc:mysql://localhost:3306/paincare";
            String username = "root";
            String password = "OUIAM";
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);

            // Exécution de la requête SQL
            String sql = "SELECT pain_impact_percentage FROM quiz_responses";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                ResultSet resultSet = statement.executeQuery();

                // Récupération des données
                while (resultSet.next()) {
                    percentages.add(resultSet.getInt("pain_impact_percentage"));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Gestion des exceptions à votre manière
        }

        return percentages;
    }
}
