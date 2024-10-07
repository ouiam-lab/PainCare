<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Suivi des Périodes</title>
    
    <!-- Intégration de Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-pink-100">

    <div class="container mx-auto my-8 p-4 bg-white rounded shadow-md">
        <h2 class="text-3xl font-semibold mb-4 text-pink-800">Suivi des Périodes</h2>

        <!-- Bouton pour ouvrir le tracker -->
        <button type="button" class="bg-pink-500 text-white py-2 px-4 rounded block mb-4" data-toggle="modal" data-target="#periodTracker">
            Ouvrir le Tracker
        </button>

        <!-- Modal du tracker -->
        <div class="modal fade" id="periodTracker" tabindex="-1" role="dialog" aria-labelledby="periodTrackerLabel" aria-hidden="true">
            <div class="modal-dialog mx-auto mt-16" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                       
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulaire pour ajouter une période -->
                        <form action="${pageContext.request.contextPath}/prediction" method="post">
                            <div class="mb-4">
                                <label for="startDate" class="text-pink-800">Date de début des règles:</label>
                                <input type="date" name="startDate" required class="border-2 border-pink-500 rounded px-4 py-2 focus:outline-none focus:border-pink-700 w-full">
                            </div>
                            <div class="mb-4">
                                <label for="cycleDuration" class="text-pink-800">Durée moyenne du cycle (en jours):</label>
                                <input type="number" name="cycleDuration" required class="border-2 border-pink-500 rounded px-4 py-2 focus:outline-none focus:border-pink-700 w-full" min="1">
                            </div>
                            <button type="submit" class="bg-pink-500 text-white py-2 px-4 rounded w-full">Prédire la Prochaine Période</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Afficher la liste des périodes -->
        <div class="mt-4">
            <h3 class="text-pink-800 mb-3">Liste des Périodes</h3>
            <!-- Utilisation de la syntaxe JSTL pour itérer sur les périodes (à remplacer par votre propre logique) -->
            <!--
            <c:forEach var="period" items="${periods}">
                <div class="bg-pink-100 rounded p-3 mb-2">
                    <p class="text-pink-800">Date de début: ${period.startDate}</p>
                    <p class="text-pink-800">Durée des règles: ${period.duration} jours</p>
                    <p class="text-pink-800">Date de fin: ${period.endDate}</p>
                </div>
            </c:forEach>
            -->
        </div>
        
        <!-- Afficher la prédiction de la prochaine période -->
        <div class="mt-4">
            <h3 class="text-pink-800 mb-3">Prochaine Période Prévue</h3>
            <div class="bg-pink-100 rounded p-3">
                <!-- Exemple d'affichage de la prédiction (à remplacer par vos données réelles) -->
                <% String nextPeriodDate = (String)request.getAttribute("nextPeriodDate"); %>
                <% if (nextPeriodDate != null) { %>
                    <p class="text-pink-800">Date prévue: <%= nextPeriodDate %></p>
                <% } else { %>
                    <p class="text-pink-800">Aucune prédiction disponible</p>
                <% } %>
            </div>
        </div>
    </div>
<div class="btn-container mt-8">
    <a href="help.jsp" class="bg-pink-500 hover:bg-pink-700 text-white font-bold py-2 px-4 rounded">
        Cliquez ici pour terminer
    </a>
   
</div>

    <!-- Intégration de Tailwind CSS JS (pour les fonctionnalités JavaScript) -->
    <script src="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.js"></script>
</body>
<style> .btn-container {
            margin-top: 20px;
            text-align: center;
        }</style>
</html>
