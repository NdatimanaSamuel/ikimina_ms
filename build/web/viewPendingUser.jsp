<%-- 
    Document   : viewPendingUser
    Created on : Apr 5, 2024, 5:30:38 PM
    Author     : Proffesor Sum
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

               <!-- Table to display available books -->
               <div  style="width:100%;margin-bottom: 200px;">
                    <h2>Pending Users</h2>
   <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Type</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
                if (resultSet != null) {
                    while (resultSet.next()) {
                        // Get user ID from the result set
                int userId = resultSet.getInt("userid");
            %>
            <tr>
                <td><%= resultSet.getInt("userid") %></td>
                <td><%= resultSet.getString("names") %></td>
                <td><%= resultSet.getString("email") %></td>
                <td><%= resultSet.getString("phone") %></td>
                <td><%= resultSet.getString("type") %></td>
                <td><%= resultSet.getString("status") %></td>
                <td>
                    <a href="UpdatePendingRequest.jsp?userId=<%= userId %>" class="action-update">Update</a>
                    <a href="#" onclick="confirmDelete(<%= userId %>)" class="action-delete">Delete</a>
                </td>
            </tr>
            <%
                    }
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
        
        
        <script>
        // Check if the status parameter is present in the URL
        const urlParams = new URLSearchParams(window.location.search);
        const status = urlParams.get('status');

        // If the status is 'success', display the success message
        if (status === 'success') {
            Swal.fire({
                icon: 'success',
                title: 'User Deleted Successfully!',
                text: 'The user has been Deleted successfully.',
                confirmButtonText: 'OK'
            });
        }
    </script>
    
    <script>
    function confirmDelete(userId) {
        // Display a confirmation dialog
        Swal.fire({
            title: 'Are you sure?',
            text: 'You are about to delete this user. This action cannot be undone.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            // If user confirms, redirect to delete action
            if (result.isConfirmed) {
                window.location.href = 'deleteUser?userId=' + userId;
            }
        });
    }
</script>

</body>
</html>