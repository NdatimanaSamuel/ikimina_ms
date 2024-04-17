package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
            checkStmt.setString(1, username);
            checkStmt.setString(2, password);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                 String userId = rs.getString("userid");
                String userType = rs.getString("type");
                String accountStatus = rs.getString("status");
                
                 session.setAttribute("userId", userId);
                 session.setAttribute("Name", rs.getString("names"));
                session.setAttribute("email", rs.getString("email"));

                if ("admin".equals(userType)) {
                    // User is admin, redirect to admin dashboard
                    dispatcher = request.getRequestDispatcher("Home.jsp");
                } else if ("guest".equals(userType)) {
                    if ("confirmed".equals(accountStatus)) {
                        // User is guest with confirmed account, redirect to guest dashboard
                        dispatcher = request.getRequestDispatcher("HomeGuest.jsp");
                    } else if ("pending".equals(accountStatus)) {
                        // Guest account is pending, show message and stay on login page
                        request.setAttribute("status", "pending");
                        dispatcher = request.getRequestDispatcher("index.jsp");
                    }
                } else {
                    // User is not admin and does not have a confirmed account, redirect to index.jsp with error message
                    request.setAttribute("status", "failed");
                    dispatcher = request.getRequestDispatcher("index.jsp");
                }
            } else {
                // Authentication failed, redirect to index.jsp with error message
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("index.jsp");
            }

            dispatcher.forward(request, response);
            rs.close();
            checkStmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
    }
}
