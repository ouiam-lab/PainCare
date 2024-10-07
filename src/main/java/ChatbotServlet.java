import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArrayList;

@ServerEndpoint("/chatbot")
public class ChatbotServlet {

    private static final CopyOnWriteArrayList<Session> sessions = new CopyOnWriteArrayList<>();

    @OnOpen
    public void onOpen(Session session) {
        // Ajouter la nouvelle session à la liste
        sessions.add(session);
    }

    @OnMessage
    public void onMessage(String message, Session clientSession) {
        // Traiter le message de l'utilisateur et obtenir la réponse du chatbot
        String botResponse = processUserMessage(message);

        // Envoyer la réponse du chatbot à tous les clients
        broadcastMessage(botResponse);
    }

    @OnClose
    public void onClose(Session session) {
        // Retirer la session fermée de la liste
        sessions.remove(session);
    }

    private String processUserMessage(String userMessage) {
        // Implémenter la logique du chatbot ici
        return "Chatbot: Merci pour votre message - " + userMessage;
    }

    private void broadcastMessage(String message) {
        // Envoyer le message à tous les clients connectés
        for (Session session : sessions) {
            try {
                session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
