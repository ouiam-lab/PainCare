package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/QuizServlet")
public class SaveQuizResponseInDatabase extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les réponses du formulaire depuis la requête
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        boolean diabetes = "yes".equals(request.getParameter("diabetes"));
        boolean overweight = "yes".equals(request.getParameter("overweight"));
        boolean hypertension = "yes".equals(request.getParameter("hypertension"));
        boolean smoking = "yes".equals(request.getParameter("smoking"));
        boolean injury = "yes".equals(request.getParameter("injury"));
        boolean cholesterol = "yes".equals(request.getParameter("cholesterol"));
        boolean painSymptom = "pain".equals(request.getParameter("symptom"));
        boolean fatigueSymptom = "fatigue".equals(request.getParameter("symptom"));
        boolean nauseaSymptom = "nausea".equals(request.getParameter("symptom"));
        boolean feverSymptom = "fever".equals(request.getParameter("symptom"));
        boolean persistentCoughSymptom = "on".equals(request.getParameter("cancer_symptom") );
        boolean unexplainedWeightLossSymptom = "on".equals(request.getParameter("cancer_symptom") );
        boolean cancerFatigueSymptom = "on".equals(request.getParameter("cancer_symptom") );
        boolean bloodInStoolSymptom = "on".equals(request.getParameter("cancer_symptom") );
        int painSeverity = Integer.parseInt(request.getParameter("painSeverity"));
        String painFrequency = request.getParameter("painFrequency");
        String painDuration = request.getParameter("painDuration");
        String painTriggers = request.getParameter("painTriggers");
        String additionalDetails = request.getParameter("additionalDetails");
        String painImpact = request.getParameter("painImpact");
        String painImpactPercentage = request.getParameter("painImpactPercentage");
        // Créer une instance de QuizResponse
        QuizResponse quizResponse = new QuizResponse(gender, age, diabetes, overweight, hypertension, smoking, injury, cholesterol,
                painSymptom, fatigueSymptom, nauseaSymptom, feverSymptom, persistentCoughSymptom,
                unexplainedWeightLossSymptom, cancerFatigueSymptom, bloodInStoolSymptom,
                painSeverity, painFrequency, painDuration, painTriggers,
                additionalDetails, painImpact, painImpactPercentage);

        // Enregistrer les réponses dans la base de données
        SaveQuizResponseInDatabas.saveQuizResponseInDatabase(quizResponse);

        // Rediriger ou afficher une page de confirmation
        response.sendRedirect("quiz.jsp");
    }

    public static class SaveQuizResponseInDatabas {

        public static void saveQuizResponseInDatabase(QuizResponse quizResponse) {
            String url = "jdbc:mysql://localhost:3306/paincare";
            String username = "root";
            String password = "OUIAM";

            try (Connection connection = DriverManager.getConnection(url, username, password)) {
            	String sql = "INSERT INTO quiz_responses (gender, age, diabetes, overweight, hypertension, smoking, injury, cholesterol, symptom, fatigue_symptom, nausea_symptom, fever_symptom, persistent_cough_symptom, unexplained_weight_loss_symptom, cancer_fatigue_symptom, blood_in_stool_symptom, pain_severity, pain_frequency, pain_duration, pain_triggers, additional_details, pain_impact, pain_impact_percentage) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                	preparedStatement.setString(1, quizResponse.getGender());
                	preparedStatement.setInt(2, quizResponse.getAge());
                	preparedStatement.setBoolean(3, quizResponse.isDiabetes());
                	preparedStatement.setBoolean(4, quizResponse.isOverweight());
                	preparedStatement.setBoolean(5, quizResponse.isHypertension());
                	preparedStatement.setBoolean(6, quizResponse.isSmoking());
                	preparedStatement.setBoolean(7, quizResponse.isInjury());
                	preparedStatement.setBoolean(8, quizResponse.isCholesterol());
                	preparedStatement.setBoolean(9, quizResponse.isPainSymptom());
                	preparedStatement.setBoolean(10, quizResponse.isFatigueSymptom());
                	preparedStatement.setBoolean(11, quizResponse.isNauseaSymptom());
                	preparedStatement.setBoolean(12, quizResponse.isFeverSymptom());
                	preparedStatement.setBoolean(13, quizResponse.isPersistentCoughSymptom());
                	preparedStatement.setBoolean(14, quizResponse.isUnexplainedWeightLossSymptom());
                	preparedStatement.setBoolean(15, quizResponse.isCancerFatigueSymptom());
                	preparedStatement.setBoolean(16, quizResponse.isBloodInStoolSymptom());
                	preparedStatement.setInt(17, quizResponse.getPainSeverity());
                	preparedStatement.setString(18, quizResponse.getPainFrequency());
                	preparedStatement.setString(19, quizResponse.getPainDuration());
                	preparedStatement.setString(20, quizResponse.getPainTriggers());
                	preparedStatement.setString(21, quizResponse.getAdditionalDetails());
                	preparedStatement.setString(22, quizResponse.getPainImpact());
                	preparedStatement.setString(23, quizResponse.getPainImpactPercentage());


                    preparedStatement.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Gérer les erreurs de base de données de manière appropriée
            }
        }
    }
}
