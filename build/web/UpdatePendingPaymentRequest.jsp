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
    // Retrieve the ID parameter from the request URL
    String id = request.getParameter("saveId");

    try {
        // Establish connection to the database
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

        // Prepare the update query for the savingtb table
        String updateQuery = "UPDATE savingtb SET status = 'completed' WHERE savingid = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, id);

        // Execute the update query
        int rowsAffected = pstmt.executeUpdate();
        pstmt.close();
        conn.close();

        // Check if the update was successful
        if (rowsAffected > 0) {
            // Display a success message using SweetAlert
%>
<script>
    Swal.fire({
        icon: 'success',
        title: 'Success!',
        text: 'The payment request has been successfully updated.',
        confirmButtonText: 'OK'
    }).then((result) => {
        // Redirect to AdminViewPendingPaymentRequest.jsp after the user clicks OK
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
        text: 'Failed to update the payment request.',
        confirmButtonText: 'OK'
    }).then((result) => {
        // Redirect to AdminViewPendingPaymentRequest.jsp after the user clicks OK
        window.location.href = 'AdminViewPendingPaymentRequest.jsp';
    });
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Handle any exceptions here
    }
%>

</body>
</html>
