<%-- 
    Document   : payReal
    Created on : Apr 8, 2024, 7:43:35 PM
    Author     : Proffesor Sum
--%>

<%@page import="java.sql.*, java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment Processing</title>
    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    
    <input type="hidden" id="title" name="userid" value="<%= session.getAttribute("userId") %>" required>
    
<%
    try {
        // Retrieve userId from session
        String userId = (String) session.getAttribute("userId");
        
        // Example amount and date
        String amount = "100";
        String date = LocalDate.now().toString(); // Get current date
        
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
//        System.out.println("Current year: " + year);
        String yearString = String.valueOf(year);

        
        // Perform the insert operation into the 'savingtb' table
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");
        PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO savingtb (userid, amount, dates,saveyear, status) VALUES (?, ?, ?, ?, ?)");
        insertStmt.setString(1, userId);
        insertStmt.setString(2, amount);
        insertStmt.setString(3, date);
        insertStmt.setString(4, yearString);
        
        insertStmt.setString(5, "pending");
        
        // Execute the insert query
        int rowsAffected = insertStmt.executeUpdate();
        conn.close(); // Close connection
        
        if (rowsAffected > 0) {
            // Display a success message using SweetAlert if the insert is successful
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  icon: 'success',");
            out.println("  title: 'Payment Successful!',");
            out.println("  text: 'Your payment has been successfully processed.',");
            out.println("}).then((result) => {");
            out.println("  if (result.isConfirmed) {");
            out.println("    window.location.href = 'GuestviewPendingPayment.jsp';"); // Redirect to HomeGuest.jsp after user clicks OK
            out.println("  }");
            out.println("});");
            out.println("</script>");
        } else {
            // Display an error message if the insert fails
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  icon: 'error',");
            out.println("  title: 'Error',");
            out.println("  text: 'An error occurred while processing your payment.',");
            out.println("})");
            out.println("</script>");
        }
    } catch (Exception e) {
        // Handle any exceptions here
        e.printStackTrace(); // Print the exception details for debugging
        out.println("<script>");
        out.println("Swal.fire({");
        out.println("  icon: 'error',");
        out.println("  title: 'Error',");
        out.println("  text: 'An error occurred while processing your payment.',");
        out.println("})");
        out.println("</script>");
    }
%>
</body>
</html>
