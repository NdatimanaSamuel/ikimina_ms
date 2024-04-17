<%-- 
    Document   : viewPendingUser
    Created on : Apr 5, 2024, 5:30:38 PM
    Author     : Proffesor Sum
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet, java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
a{
    text-decoration: none;
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

.menu li a i {
    margin-right: 15px; /* Add margin between icon and text */
}

/* activeMenuStyles.css */

.menu li.active a {
    background-color: #8080ff;
    color: white;
    text-decoration: none;
    padding: 10px;
}

.menu li.active a:hover {
    background-color:#b3b3ff; /* Change the color on hover */
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


/*about view books table*/

   table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .action-update{
            border-radius: 10px;
            border: none;
            padding: 10px;
            background-color: #0066ff;
             color:white;
        }

          .action-delete{
            border-radius: 10px;
            border: none;
            padding: 10px;
            background-color: #ff0000;
            color:white;
        }
        

    </style>
</head>
<body>
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

        <!-- Table to display user's information -->
        <div style="width:100%;margin-bottom: 200px;">
             <h2>Pending Payment Request</h2>
            <table>
                <thead>
                <tr>
                    <th>#</th>
                    <th>Names</th>
                    <th>Email</th>
                    <th>Amount</th>
                    <th>Dates</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
               <%
    try {
        // Establish connection to the database
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");
        Statement stmt = conn.createStatement();
        
        // Retrieve saving information from the saving table based on session ID
        ResultSet savingResultSet = stmt.executeQuery("SELECT * FROM savingtb where status='pending'");
        while (savingResultSet.next()) {
            String saveId = savingResultSet.getString("savingid");
            int userId = savingResultSet.getInt("userid");
            int amount = savingResultSet.getInt("amount");
            String dates = savingResultSet.getString("dates");
            String status = savingResultSet.getString("status");

            // Retrieve user's information from the users table based on the obtained user ID
            ResultSet userResultSet = stmt.executeQuery("SELECT * FROM users WHERE userid = " + userId);
            if (userResultSet.next()) {
                String names = userResultSet.getString("names");
                String email = userResultSet.getString("email");

                // Display the retrieved information in the table
%>
<tr>
    <td><%= userId %></td>
    <td><%= names %></td>
    <td><%= email %></td>
    <td><%= amount %> Frw</td>
    <td><%= dates %></td>
    <td style="color:red;"><%= status %></td>
    <td>
         <a href="UpdatePendingPaymentRequest.jsp?saveId=<%= saveId %>" class="action-update">Update</a>
    </td>
</tr>
<%
            }
            userResultSet.close();
        }
        savingResultSet.close();
        stmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

                </tbody>
            </table>
        </div>
    </main>
</div>

<footer>
    <p>&copy; 2024 Ikimina Ltd. All rights reserved.</p>
</footer>
</body>
</html>
