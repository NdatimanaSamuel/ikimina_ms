<%-- 
    Document   : SignUp
    Created on : Apr 4, 2024, 4:52:23 PM
    Author     : Proffesor Sum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ikimina MS</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
   <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

    <div class="container">
        <div class="left">
            <!-- Photo on the left side -->
<!--            <img src="Admin/images/loginimage.jpg" alt="" class="photo"/>-->
            <img src="images/loginimage.jpg" alt="" class="photo"/>
        </div>
        <div class="right">
            <div class="login-container" style="margin-bottom: 5%;">
                <h2>Create Account Here</h2>
                <% 
                    // Check if status is 'exists' and display appropriate message
                    String status = (String) request.getAttribute("status");
                    if (status != null && status.equals("exists")) {
                %>
                    <div class="alert alert-danger" role="alert" style="color:red;">
                        This email address is already registered. Please try again with a different email.
                    </div>
                <% } %>
                <form action="register" method="post">
                    <div class="input-group">
                        <label for="username">Names:</label>
                        <input type="text" id="names" name="names" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Phone:</label>
                        <input type="text" id="phone" name="phone" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Address:</label>
                        <input type="text" id="address" name="address" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <button type="submit">Submit</button>
                </form>
                <div class="create-account">
                    <p>Already have an account? <a href="index.jsp">Login Here</a></p>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="footer-content">
            <p>&copy; <span id="year"></span> Ikimina Ltd . All rights reserved.</p>
        </div>
    </footer>

    <script>
        // JavaScript to get the current year and update the footer
        document.getElementById("year").textContent = new Date().getFullYear();
    </script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        // JavaScript to display the alert message if registration was successful
        window.onload = function() {
            var status = document.getElementById("status").value;
            if (status === "success") {
                swal("Congrats", "Account Created Successfully", "success");
            }
        };
    </script>
</body>
</html>
