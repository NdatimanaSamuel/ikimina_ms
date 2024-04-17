<%@page import="java.sql.*"%>
<%
    // Check if the form is submitted
    if (request.getMethod().equalsIgnoreCase("post")) {
        // Retrieve form data
        String userEmail = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userpassword");

        // Establish connection to the database
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

            // Prepare the update query
            String query = "UPDATE users SET email = ?, password = ? WHERE userid = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, userEmail);
            ps.setString(2, userPassword);
            ps.setString(3, userId);

            // Execute the update query
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Update successful, set attribute for displaying sweet alert
                request.setAttribute("success", "true");
            } else {
                // Update failed, set attribute for displaying sweet alert
                request.setAttribute("success", "false");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Update failed, set attribute for displaying sweet alert
            request.setAttribute("success", "false");
        } finally {
            // Close the database resources
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Profile</title>
    <!-- Include SweetAlert library -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<%-- Your update form here --%>

<%
    // Check if the "success" attribute is set
    String success = (String) request.getAttribute("success");
    if ("true".equals(success)) {
%>
    <!-- Display sweet alert for successful update -->
    <script>
        swal("Success!", "User profile updated successfully!", "success")
        // Redirect user to GuestProfileSettings.jsp after 2 seconds
        setTimeout(function() {
            window.location.href = "GuestProfileSettings.jsp";
        }, 2000); // 2000 milliseconds = 2 seconds
    </script>
<%
    } else if ("false".equals(success)) {
%>
    <!-- Display sweet alert for failed update -->
    <script>
        swal("Error!", "Failed to update user profile!", "error");
    </script>
<%
    }
%>
</body>
</html>
