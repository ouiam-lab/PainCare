package com.uniquedeveloper.registration;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/submitPainForm")
public class SubmitPainFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Récupérer la réponse du formulaire (niveau de douleur)
        String painSeverity = request.getParameter("painSeverity");

        // Vous pouvez stocker la réponse dans une base de données ou effectuer d'autres opérations côté serveur si nécessaire
        // ...

        // Afficher la valeur de painSeverity dans la console du serveur
        System.out.println("Pain Severity: " + painSeverity);

        // Envoyer une réponse au client avec des données de graphique statiques pour simuler un nouveau jour
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Générer des données de graphique statiques pour simuler un nouveau jour (utiliser des données différentes pour le quiz et la douleur)
        String painChartData = "{ \"labels\": [\"Day 1\", \"Day 2\", \"Day 3\", \"Day 4\", \"Day 5\"], \"data\": [4, 3, 5, 2, 6] }";

        PrintWriter out = response.getWriter();
        out.print(painChartData);
        out.flush();
    }
}

