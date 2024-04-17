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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
    margin-bottom: 100px;
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
      
                <%@ include file="GuestMenu.jsp" %>
            </ul>
        </nav>

        <main class="content">

            <div class="library-name">
   <h1>Ikimina Ms SAVE & CREDIT( Welcome, <%= session.getAttribute("Name") %> )</h1>
        </div>
        <%
    // Retrieve the user ID from the request parameter
    String userIdStr = request.getParameter("userId");
    int userId = Integer.parseInt(userIdStr);

    // Query the database to retrieve user information based on the provided user ID
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet resultSet = null;

    try {
        // Establish connection to the database
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

        // Prepare the query to select user information based on user ID
        String query = "SELECT * FROM users WHERE userid = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        
        // Execute the query
        resultSet = ps.executeQuery();
        
        // Check if a user with the provided ID exists
        if (resultSet.next()) {
            // Retrieve user information from the result set
            String userName = resultSet.getString("email");
            String userPassword = resultSet.getString("password");
            

%>
<!-- Form for updating user profile -->
<div class="add-book-form">
    <h2>Update Profile</h2>
    <!-- Display user information within the form -->
    <form action="GuestUpdateProfileQuery.jsp" method="post">
        <input type="hidden" name="userId" value="<%= userId %>">
        <label for="email">Name:</label>
        <input type="text" id="userName" name="userName" value="<%= userName %>" required>
        <label for="userEmail">Password:</label>
        <input type="password" id="userEmail" name="userpassword" value="<%= userPassword %>" required>
  
        <!-- Submit button -->
        <button type="submit">Save Changes</button>
    </form>
</div>
<%
        } else {
            // If no user found with the provided ID, display an error message
            out.println("User not found.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close all database resources
        try {
            if (resultSet != null) resultSet.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>



        </main>
    </div>

     <footer>
        <p>&copy; 2024 Ikimina Ltd. All rights reserved.</p>
    </footer>
             <!-- Check if the update was successful and display appropriate message -->
  
       



     
</body>
</html>

