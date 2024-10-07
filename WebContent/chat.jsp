<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>chatboot</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="..." crossorigin="anonymous">
   <style>
        body {
            background: #f9f9f9; /* Fond gris clair */
            font-family: 'Arial', sans-serif;
        }

        .container {
            background-color: #e0f7fa; /* Fond bleu ciel */
            border-radius: 10px; /* Coins arrondis */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Ombre légère */
            padding: 30px;
            margin-top: 50px;
        }

        #chat-container {
            height: 300px;
            overflow-y: auto;
            border: 2px solid #81d4fa; /* Bordure bleu ciel */
            border-radius: 10px;
            padding: 20px;
            background-color: #e0f7fa; /* Fond bleu ciel */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Ombre légère */
            color: #000; /* Texte noir */
        }

        #chat-form {
            margin-top: 20px;
        }

        .btn-primary {
            background-color: #81d4fa; /* Bleu ciel émeraude */
            border-color: #81d4fa;
        }

        .btn-primary:hover {
            background-color: #4fc3f7; /* Teinte plus foncée au survol */
            border-color: #4fc3f7;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center text-dark">chatbot</h2>

    <div id="chat-container" class="border mb-4"></div>

    <form id="chat-form" class="form-inline">
        <input type="text" id="userMessage" class="form-control mr-2" placeholder="Type your fantastic message...">
        <button type="button" class="btn btn-primary" onclick="sendMessage()">Send</button>
    </form>
    <div class="btn-container mt-8">
    <a href="help.jsp" class="bg-pink-500 hover:bg-pink-700 text-white font-bold py-2 px-4 rounded">
        Cliquez ici pour terminer
    </a>
    
</div>
    
</div>


<script>
    var socket = new WebSocket("ws://localhost:8080/PainCare/chatbot");

    socket.onmessage = function(event) {
        // Mettre à jour le journal de chat avec la réponse du chatbot
        $("#chat-container").append("<p class='mb-3'>" + event.data + "</p>");

        // Faire défiler vers le bas pour afficher le dernier message
        $("#chat-container").scrollTop($("#chat-container")[0].scrollHeight);
    };

    function sendMessage() {
        var userMessage = $("#userMessage").val();

        // Envoyer le message à travers la connexion WebSocket
        socket.send(userMessage);

        // Effacer le champ de saisie utilisateur
        $("#userMessage").val("");
    }
</script>

</body>
</html>
