package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateUserProfile extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the updated user information from the form
        String userIdStr = request.getParameter("userid");
        String NamesChange = request.getParameter("name");
        String emailChange = request.getParameter("email");
        String locationChange = request.getParameter("location");
        String phoneChange = request.getParameter("phone");
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
            String query = "UPDATE users SET names=?,email=?,location=?,phone=?, status=? WHERE userid=?";
            preparedStatement = connection.prepareStatement(query);
             preparedStatement.setString(1, NamesChange);
              preparedStatement.setString(2, emailChange);
               preparedStatement.setString(3, locationChange);
                preparedStatement.setString(4, phoneChange);
            preparedStatement.setString(5, statusChange);
            preparedStatement.setInt(6, userId);

            // Execute the update
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                // If update successful, set success attribute
                 request.setAttribute("updatesuccess", "success");
                dispatcher = request.getRequestDispatcher("viewAllUser.jsp");
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
        response.sendRedirect("viewUser?status=" + request.getAttribute("updatesuccess"));

        
    }
}
