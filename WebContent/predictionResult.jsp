<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Ajoutez cette balise script à l'en-tête de votre document -->
    <script src="https://rawgit.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>

    <title>Health Prediction Results</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="..." crossorigin="anonymous">

    <!-- Tailwind CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .prediction-card {
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            transition: transform 0.3s;
        }

        .prediction-card:hover {
            transform: scale(1.05);
        }

        .recommendation {
            color: #000000; /* Changement de la couleur en noir */
        }

        canvas {
            max-width: 100%;
            max-height: 300px;
        }

        /* Ajuster la largeur des boutons */
        .btn-container {
            margin-top: 20px;
            text-align: center;
        }

        .btn {
            width: 150px;
            margin-right: 10px;
        }
        
        /* Nouveau style pour la disposition des graphiques */
        .chart-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .chart-card {
            width: 30%;
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            transition: transform 0.3s;
        }

        .chart-card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<div class="container mx-auto">
    <h2 class="text-3xl font-semibold mb-4">Health Prediction Results</h2>

    <!-- Première ligne - Prédiction de la première maladie -->
    <div class="prediction-card">
        <h4 class="text-2xl font-semibold mb-2">Endometriosis Prediction</h4>
        <p>Prediction: ${endometriosisPrediction}</p>
        <p class="recommendation text-sm mt-2">Recommendation: Get enough sleep, maintain a healthy diet, and consult a gynecologist for further evaluation.</p>
    </div>

    <!-- Deuxième ligne - Prédiction de la deuxième maladie -->
    <div class="prediction-card">
        <h4 class="text-2xl font-semibold mb-2">PCOS Prediction</h4>
        <p>Prediction: ${pcosPrediction}</p>
        
        <p class="recommendation text-sm mt-2">Recommendation: Manage stress, engage in regular physical activity, and consult a healthcare professional for personalized advice.</p>
    </div>

    <!-- Troisième ligne - Graphiques et boutons -->
    <div id="pdf-container" class="chart-container">

        <!-- Nutrition Recommendation Chart -->
        <div class="chart-card">
            <h4 class="text-2xl font-semibold mb-2">Nutrition Recommendation</h4>
            <canvas id="nutritionChart"></canvas>
        </div>

        <!-- Sommeil Recommendation Chart -->
        <div class="chart-card">
            <h4 class="text-2xl font-semibold mb-2">Sommeil Recommendation</h4>
            <canvas id="sleepChart"></canvas>
        </div>

        <!-- Stress Recommendation Chart -->
        <div class="chart-card">
            <h4 class="text-2xl font-semibold mb-2">Stress Recommendation</h4>
            <canvas id="stressChart"></canvas>
        </div>

    </div>

    <!-- Boutons -->
    <div class="btn-container mt-8">
        <a href="help.jsp" class="btn btn-primary">Terminer l'interview</a>
        <!-- Ajoutez un événement onclick au bouton de téléchargement -->
        <button class="btn btn-success" onclick="downloadResults()">Télécharger les résultats</button>
    </div>

</div>

<!-- Scripts Bootstrap et Tailwind JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="..." crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="..." crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="..." crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>

<script>

    var ctxNutrition = document.getElementById('nutritionChart').getContext('2d');
    var nutritionChart = new Chart(ctxNutrition, {
        type: 'doughnut',
        data: {
            labels: ['Vegetables', 'Fruits', 'Proteins', 'Whole Grains', 'Hydration'],
            datasets: [{
                data: [4, 3, 5, 4, 3],
                backgroundColor: [
                    '#f58271', // Rouge
                    '#ffcc29', // Jaune
                    '#9e77d1', // Violet
                    '#77acf1', // Bleu
                    '#62d2a2'  // Vert
                ]
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Nutrition Recommendation'
                }
            }
        }
    });

    var ctxSleep = document.getElementById('sleepChart').getContext('2d');
    var sleepChart = new Chart(ctxSleep, {
        type: 'bar',
        data: {
            labels: ['Hours of Sleep', 'Quality of Sleep'],
            datasets: [{
                label: 'Sleep Recommendation',
                data: [7, 4], // Exemple de données, vous devrez ajuster cela en fonction de votre logique
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 99, 132, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                    max: 10 // Ajustez cela en fonction de votre logique
                }
            },
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Sleep Recommendation'
                }
            }
        }
    });

    var ctxStress = document.getElementById('stressChart').getContext('2d');
    var stressChart = new Chart(ctxStress, {
        type: 'pie',
        data: {
            labels: ['Work Stress', 'Personal Stress', 'Relaxation Time'],
            datasets: [{
                data: [5, 3, 7], // Exemple de données, vous devrez ajuster cela en fonction de votre logique
                backgroundColor: [
                    '#ffcc29',
                    '#9e77d1',
                    '#62d2a2'
                ]
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Stress Recommendation'
                }
            }
        }
    });

    function downloadResults() {
        // Utiliser html2pdf pour générer et télécharger le PDF
        var element = document.getElementById('pdf-container');
        html2pdf(element, {
            margin: 10,
            filename: 'health_prediction_results.pdf',
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
        });
    }
</script>

</body>
</html>
