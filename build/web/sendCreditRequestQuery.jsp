<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Pending Payment Request</title>
    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>

<%
    // Retrieve the data parameters from the request URL
    String userId = (String) session.getAttribute("userId");

    // Assuming other parameters such as requestedAmount and dates are retrieved from the request
    String requestedAmount = request.getParameter("requestedAmount");
    String dates = request.getParameter("dates");
    String status = "pending";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Establish connection to the database
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

        // Prepare the insert query for the credittb table
        String insertQuery = "INSERT INTO creditb (userid, requestedamount, status, doneon) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, userId);
        pstmt.setString(2, requestedAmount);
        pstmt.setString(3, status);
        pstmt.setString(4, dates);

        // Execute the insert query
        int rowsAffected = pstmt.executeUpdate();

        // Check if the insert was successful
        if (rowsAffected > 0) {
            // Display a success message using SweetAlert
%>
<script>
    Swal.fire({
        icon: 'success',
        title: 'Success!',
        text: 'The credit request has been successfully sent.',
        confirmButtonText: 'OK'
    }).then((result) => {
        // Redirect to another page after the user clicks OK
        window.location.href = 'AdminViewPendingPaymentRequest.jsp';
    });
</script>
<%
        } else {
            // If no rows were affected, display an error message
%>
<script>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Failed to insert the payment request into the credittb table.',
        confirmButtonText: 'OK'
    });
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Handle any exceptions here
        // Display an error message to the user
%>
<script>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'An error occurred while processing your request. Please try again later.',
        confirmButtonText: 'OK'
    });
</script>
<%
    } finally {
        // Close the database resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>

</body>
</html>
