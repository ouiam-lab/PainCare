package com.uniquedeveloper.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uemail = request.getParameter("username");
        String upwd = request.getParameter("password"); // Assuming the parameter name is "password"
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
       
        try {
        	 Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "OUIAM");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE uemail=? AND  upwd=?"); 
            pst.setString(1, uemail);
            pst.setString(2, upwd);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                session.setAttribute("name", rs.getString("uname")); // Assuming the column name is "uname"
                dispatcher = request.getRequestDispatcher("help.jsp");
            } else {
                session.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("login.jsp");
            }

            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
