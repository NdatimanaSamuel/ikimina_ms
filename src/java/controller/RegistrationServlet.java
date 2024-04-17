package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("names");
        String uemail = request.getParameter("email");
        String uphone = request.getParameter("phone");
        String uaddress = request.getParameter("address");
        String upassword = request.getParameter("password");
        RequestDispatcher dispatcher = null;
        Connection conn = null;
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
            checkStmt.setString(1, uemail);
            ResultSet resultSet = checkStmt.executeQuery();
            if (resultSet.next()) {
                // If record already exists, send error message to index.jsp
                request.setAttribute("status", "exists");
                dispatcher = request.getRequestDispatcher("SignUp.jsp");
            } else {
                // If record does not exist, insert new record
                PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO users (names, email, location, phone, password, type, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
                insertStmt.setString(1, uname);
                insertStmt.setString(2, uemail);
                insertStmt.setString(3, uaddress);
                insertStmt.setString(4, uphone);
                insertStmt.setString(5, upassword);
                insertStmt.setString(6, "guest");
                insertStmt.setString(7, "pending");
                int rowCount = insertStmt.executeUpdate();
                if (rowCount > 0) {
                    // If insertion successful, send success message to SignUp.jsp
                    request.setAttribute("status", "success");
                    dispatcher = request.getRequestDispatcher("SignUp.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (dispatcher != null) {
            dispatcher.forward(request, response);
        } else {
            out.println("An error occurred.");
        }
    }
}
