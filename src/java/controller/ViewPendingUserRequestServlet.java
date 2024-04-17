package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewPendingUserRequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            // Connect to the database
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");
            // Create a statement
            statement = connection.createStatement();
            // Execute a query
            resultSet = statement.executeQuery("SELECT * FROM users where status='pending'");
            // Store the result set in the request as an attribute
            request.setAttribute("resultSet", resultSet);
            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewPendingUser.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Close the result set
                if (resultSet != null) {
                    resultSet.close();
                }
                // Close the statement
                if (statement != null) {
                    statement.close();
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
