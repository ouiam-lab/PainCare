package com.période;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/prediction")
public class PredictNextPeriodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException  {
        // Récupérer la date de début des règles et la durée moyenne du cycle depuis le formulaire
        String startDateString = request.getParameter("startDate");
        String cycleDurationString = request.getParameter("cycleDuration");

        try {
            // Conversion des chaînes en objets Java (Date et int)
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(startDateString);
            int cycleDuration = Integer.parseInt(cycleDurationString);

            // Calcul de la date prévue de la prochaine période
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(startDate);
            calendar.add(Calendar.DAY_OF_MONTH, cycleDuration);

            // Formatage de la date prévue
            String nextPeriodDate = sdf.format(calendar.getTime());

            // Transfert du résultat à la JSP
            request.setAttribute("nextPeriodDate", nextPeriodDate);

            // Transfert du contrôle à la JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/periods.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Gérer l'erreur et rediriger si nécessaire
        }
    }
}
