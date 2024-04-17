<%-- 
    Document   : UpdatePendingRequest
    Created on : Apr 6, 2024, 12:00:28 PM
    Author     : Proffesor Sum
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
         <title>Ikimina Ms</title>
         <style>
             body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* Ensure the page takes at least the full viewport height */
}
ul {
  list-style-type: none;
}

header {
    background-color: #333;
    color: white;
}

.header-text {
    background-color: white;
    color: #333;
    padding: 10px 20px;
    font-size: 18px;
    font-weight: bold;
    display: flex;
    align-items: center;
}

.logo {
    display: flex;
    align-items: center;
    margin-left: 10px;
    margin-bottom: 25px;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #333;
    color: white;
}

.logo img {
    max-width: 90px;
    margin-right: 10px;
}

.dashboard {
    display: flex;
    flex: 1; /* Expand the dashboard to take remaining vertical space */
}

.sidebar {
    background-color: #222;
    color: white;
    width: 200px;
    padding: 20px;
    display: flex;
    flex-direction: column;
}
.menu {
    list-style: none;
    padding: 0;
}

.menu li a {
    text-decoration: none;
    color: white;
    display: block;
    padding: 10px 0;
}

.menu li.active a {
    background-color: #8080ff;
    color: white;
    text-decoration: none;
    padding: 10px;
}

.menu li.active a:hover {
    background-color:#b3b3ff; /* Change the color on hover */
}


.menu li a i {
    margin-right: 15px; /* Add margin between icon and text */
}

.submenu {
    margin-left: 20px;
    display: none; /* Hide submenu by default */
}

.menu li:hover .submenu {
    display: block; /* Display submenu on parent hover */

}

.content {
    flex: 1;
    padding: 20px;
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.card {
    margin-bottom: 230px;
    background-color: #f4f4f4;
    border-radius: 5px;
    padding: 10px;
    width: 100px !important; /* Set a fixed width for the cards */
    height: 100px; /* Set a fixed height for the cards */
    flex: 1 1 calc(33.33% - 20px); /* Distribute cards in a row with proper spacing */
}

.card-info {
    font-size: 14px;
    color: #666;
}

.library-name {
    text-align: center;
    margin-left: 15%;
}
.card h3 i{
    margin-left: 26px;
  
}
.card p{
    align-items: center;
    margin-left: 20%;
}

footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px 0;
    margin-top: auto; /* Push the footer to the bottom */
}

/*add book form*/

/* AddBookFormStyles.css */

.add-book-form {
    padding: 20px;
    background-color: #f4f4f4;
    border-radius: 5px;
   margin-left: 10%;
    width: 800px;
}

.add-book-form h2 {
    margin-bottom: 10px;
}

.add-book-form label {
    display: block;
    margin-bottom: 5px;
}

.add-book-form input,
.add-book-form select {
    width: 90%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.add-book-form button {
    background-color: #333;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

.add-book-form button:hover {
    background-color: #444;
}

         </style>
    </head>
    <body>
  <header>
    <nav class="navbar">
       
    </nav>
</header>

    

    <div class="dashboard">
        <nav class="sidebar">

            <ul class="menu">
                 
                 <div class="logo">

                 <img src="images/logogo.png" alt=""/>
                </div>
      
                 <%@ include file="AdminMenu.jsp" %>
            </ul>
        </nav>

        <main class="content">

            <div class="library-name">
          <h1>Ikimina Ms SAVE & CREDIT( Welcome, <%= session.getAttribute("Name") %> )</h1>
        </div>
            
            <!-- Form for submitting new books -->
            <div class="add-book-form">
                <h2>Manage Request</h2>
                 <!-- Retrieve user ID from the URL parameter -->
    <%
        String userIdStr = request.getParameter("userId");
        if (userIdStr != null) {
            int userId = Integer.parseInt(userIdStr);
            String userName = ""; // Initialize the username
            
            // Fetch username based on the user ID
            try {
                // Assuming you have a connection to your database
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");
                
                // Prepare the SQL statement to fetch the username
                String query = "SELECT names FROM users WHERE userid=?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, userId);
                
                // Execute the query
                ResultSet resultSet = preparedStatement.executeQuery();
                
                // If a record is found, set the username
                if (resultSet.next()) {
                    userName = resultSet.getString("names");
                }
                
                // Close resources
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle database connection or query errors
            }
    %>
       
                <form action="UpdateUserServlet" method="post">
                    <input type="hidden" id="title" name="userid" value="<%= userId %>" required>
                    <label for="title">Names:</label>
                    <input type="text" id="title" name="name" value="<%= userName %>" required>
                    <label for="status">Status:</label>
                    <select id="status" name="status">
                        <option value="confirmed">confirmed</option>
                        <option value="cancel">canceled</option>
                    </select>

                    <button type="submit">Save Changes</button>
                </form>
     <% } %>
            </div>


        </main>
    </div>

     <footer>
        <p>&copy; 2024 Ikimina Ltd. All rights reserved.</p>
    </footer>
             <!-- Check if the update was successful and display appropriate message -->
  
       
       
         <%-- Check for the status parameter --%>
    <% String status = request.getParameter("status"); %>
    <% if (status != null) { %>
        <%-- If status is 'success', display success message --%>
        <% if (status.equals("success")) { %>
            <script>
                // Display success message using SweetAlert
                Swal.fire({
                    icon: 'success',
                    title: 'User Information Updated Successfully!',
                    showConfirmButton: false,
                    timer: 1500
                });
            </script>
        <% } else if (status.equals("error")) { %>
            <%-- If status is 'error', display error message --%>
            <script>
                // Display error message using SweetAlert
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: 'Failed to update user information. Please try again later.',
                    confirmButtonText: 'OK'
                });
            </script>
        <% } %>
    <% } %>
</body>
</html>

