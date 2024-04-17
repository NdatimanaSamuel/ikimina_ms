/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Proffesor Sum
 */
public class UpdatePendingCreditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdStr = request.getParameter("userid");
        String statusChange = request.getParameter("status");
         // Parse the user ID
        int userId = Integer.parseInt(userIdStr);
        
              // Database connection variables
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        RequestDispatcher dispatcher = null;
        
           try {
            // Connect to the database
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

            // Prepare the SQL statement to update the user's name
            String query = "UPDATE creditb SET status=? WHERE creditid=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, statusChange);
            preparedStatement.setInt(2, userId);

            // Execute the update
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                // If update successful, set success attribute
                 request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("AdminViewPendingCredit.jsp");
            } else {
                // If update failed, set error attribute
                request.setAttribute("updateSuccess", false);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection or query errors
            request.setAttribute("updateSuccess", false);
        } finally {
            try {
                // Close the prepared statement and database connection
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        
            // Forward the request to the viewPendingUser.jsp page with status parameter
        response.sendRedirect("AdminViewPendingCredit.jsp?status=" + request.getAttribute("status"));
    }

    

}
