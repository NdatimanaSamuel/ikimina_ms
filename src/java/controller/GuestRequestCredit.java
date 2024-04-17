package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestRequestCredit extends HttpServlet {

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Retrieve form data
    String userId = (String) request.getSession().getAttribute("userId");
    String requestedAmount = request.getParameter("requestedamounts");
    String dates = request.getParameter("dates");
    String status = "pending";
    PrintWriter out = response.getWriter();
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Establish connection to the database
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

        // Check if there is any pending request for the user
       String checkPendingQuery = "SELECT * FROM creditb WHERE userid = ? AND status = ? OR paystatus =?";
        pstmt = conn.prepareStatement(checkPendingQuery);
        pstmt.setString(1, userId);
        pstmt.setString(2, "pending");
        pstmt.setString(3 , "not paid");
        ResultSet rs = pstmt.executeQuery();

        // If there is a pending request, display a message and redirect back to the form
        if (rs.next()) {
            response.sendRedirect("requestCreditForm.jsp?pending=true");
        } else {
            // If there is no pending request, proceed with inserting the new request
            String insertQuery = "INSERT INTO creditb (userid, requestedamount, amountpaid, status, paystatus, pendapprove, dates) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, userId);
            pstmt.setString(2, requestedAmount);
            pstmt.setString(3,"null");
            pstmt.setString(4, status);
            pstmt.setString(5, "not paid");
            pstmt.setString(6, "pending");
            pstmt.setString(7, dates);
            

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Redirect the user to the requestCreditForm view with a success message
                response.sendRedirect("requestCreditForm.jsp?success=true");
            } else {
                // If no rows were affected, display an error message
                response.sendRedirect("requestCreditForm.jsp?success=false");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Handle any exceptions here
        // Redirect the user to the requestCreditForm view with an error message
        response.sendRedirect("requestCreditForm.jsp?success=false");
    } finally {
        // Close the database resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}}