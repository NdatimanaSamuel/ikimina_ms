package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user ID from the request
        int userId = Integer.parseInt(request.getParameter("userId"));

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            // Connect to the database
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

            // Prepare the delete statement
            String query = "DELETE FROM users WHERE userid=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);

            // Execute the delete
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                // If delete successful, redirect to a success page or display a success message
//                response.sendRedirect("delete_success.jsp");
                 response.sendRedirect("viewPendingUser?status=success");

            } else {
                // If delete failed, redirect to an error page or display an error message
                response.sendRedirect("delete_error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions accordingly
        } finally {
            try {
                // Close the prepared statement
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                // Close the connection
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
