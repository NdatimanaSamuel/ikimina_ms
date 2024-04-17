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
<!--            <img src="Admin/images/loginimage.jpg" alt="" class="photo"/>-->
            <img src="images/loginimage.jpg" alt="" class="photo"/>
            
        </div>
        <div class="right">
            <div class="login-container">
                   <%
    String status = (String) request.getAttribute("status");
    if (status != null) {
        if (status.equals("failed")) {
%>
            <div class="error-message" style="color:red;">Invalid username or password. Please try again.</div>
<%
        } else if (status.equals("pending")) {
%>
            <div class="error-message" style="color:red;">Your account is pending approval. Please wait for confirmation.</div>
<%
        }
    }
%>

                <h2>Login</h2>
                <form action="login" method="post">
                    <div class="input-group">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <button type="submit">Login</button>
                </form>
                <div class="create-account">
                    <p>Don't have an account? <a href="SignUp.jsp">Create one</a></p>
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
        document.getElementById("year").textContent = new Date().getFullYear();
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script>
        window.onload = function() {
            var status = document.getElementById("status").value;
            if (status === "failed") {
                swal("Error", "Invalid username or password", "error");
            }
        };
    </script>
</body>
</html>
