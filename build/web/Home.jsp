<%-- 
    Document   : Home
    Created on : Apr 4, 2024, 5:13:59 PM
    Author     : Proffesor Sum
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/styles.css" rel="stylesheet" type="text/css"/>
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
    margin-left: 40px;
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
    width: 80px !important; /* Set a fixed width for the cards */
    height: 100px; /* Set a fixed height for the cards */
    flex: 1 1 calc(20.33% - 20px); /* Distribute cards in a row with proper spacing */
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
        <img src="images/logogo.png" alt="" style="width: 300px;"/>
    </div>

        <%@ include file="AdminMenu.jsp" %>
    </ul>

        </nav>

        <main class="content">

            <div class="library-name">
       <h1>Ikimina Ms SAVE & CREDIT( Welcome, <%= session.getAttribute("Name") %> )</h1>
        </div>
            <div class="card" style="background-color: greenyellow;">
    <h3><i class="fa-solid fa-right-left"></i> Available Users</h3>
        <%
            // JDBC code to execute the SQL query and retrieve the count
            try {
                // Establish a connection to your database
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

                // Prepare the SQL statement
                String query = "SELECT COUNT(*) AS user_count FROM users";
                PreparedStatement preparedStatement = connection.prepareStatement(query);

                // Execute the query
                ResultSet resultSet = preparedStatement.executeQuery();

                // Process the result
                if (resultSet.next()) {
                    int userCount = resultSet.getInt("user_count");
        %>
                    <p><%= userCount %></p>
        <%
                }

                // Close resources
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle any potential errors
            }
        %>
    </div>

            <div class="card"style="background-color: yellow;">
                <h3><i class="fas fa-book"></i> Pending Credit</h3>
                
                 <%
            // JDBC code to execute the SQL query and retrieve the count
            try {
                // Establish a connection to your database
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

                // Prepare the SQL statement
                String query = "SELECT COUNT(*) AS user_count FROM creditb where status='pending'";
                PreparedStatement preparedStatement = connection.prepareStatement(query);

                // Execute the query
                ResultSet resultSet = preparedStatement.executeQuery();

                // Process the result
                if (resultSet.next()) {
                    int userCount = resultSet.getInt("user_count");
        %>
                    <p><%= userCount %></p>
        <%
                }

                // Close resources
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle any potential errors
            }
        %>
                <!-- - Content of available books card -->
            </div>

           <div class="card" style="background-color: skyblue;">
                <h3> <i class="fa-solid fa-right-left"></i> Pending Payment Online </h3>
                
                                    <%
            // JDBC code to execute the SQL query and retrieve the count
            try {
                // Establish a connection to your database
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

                // Prepare the SQL statement
                String query = "SELECT COUNT(*) AS user_count FROM savingtb where status='pending'";
                PreparedStatement preparedStatement = connection.prepareStatement(query);

                // Execute the query
                ResultSet resultSet = preparedStatement.executeQuery();

                // Process the result
                if (resultSet.next()) {
                    int userCount = resultSet.getInt("user_count");
        %>
                    <p><%= userCount %></p>
        <%
                }

                // Close resources
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle any potential errors
            }
        %>
                <!--  Content of borrowed books card -- -->
            </div>
            <div class="card"style="background-color: red;">
                <h3><i class="fas fa-book"></i> Pending Request</h3>
                
                
                       <%
            // JDBC code to execute the SQL query and retrieve the count
            try {
                // Establish a connection to your database
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");

                // Prepare the SQL statement
                String query = "SELECT COUNT(*) AS user_count FROM users where status='pending'";
                PreparedStatement preparedStatement = connection.prepareStatement(query);

                // Execute the query
                ResultSet resultSet = preparedStatement.executeQuery();

                // Process the result
                if (resultSet.next()) {
                    int userCount = resultSet.getInt("user_count");
        %>
                    <p><%= userCount %></p>
        <%
                }

                // Close resources
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle any potential errors
            }
        %>
                <!-- - Content of available books card -->
            </div>

        </main>
    </div>

    <footer>
        <p>&copy; 2024 Ikimina Ltd. All rights reserved.</p>
    </footer>
</body>
</html>
