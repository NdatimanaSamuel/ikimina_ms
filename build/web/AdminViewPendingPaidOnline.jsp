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
        .search-input-form{
    padding: 10px;
    border-radius: 5px;
     margin-left: 10%;
     margin-bottom: 10px;
   
}

/* Pagination styles */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination button {
            cursor: pointer;
            border: none;
            background-color: #f4f4f4;
            padding: 5px 10px;
            margin: 0 2px;
            border-radius: 3px;
        }

        .pagination button.active {
            background-color: #8080ff;
            color: white;
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
             <form>
                 <div class="input-group" style="margin-left:80%;">
                          <input type="search" id="myInput" onkeyup="myFunction()"  placeholder="Search by email.." class="search-input-form" />
                          <div class="input-group-btn">
                           <!--  <button class="btn btn-secondary"><i class="ion ion-search"></i></button> -->
                          </div>
                        </div>
                      </form>
            <table id="tablepaging">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Names</th>
                    <th>Email</th>
                    <th>Amount</th>
                    <th>Dates</th>
                    <th>Status</th>
                   
                </tr>
                </thead>
              <tbody>
<%
    Connection conn = null;
    PreparedStatement savingStmt = null;
    ResultSet savingResultSet = null;
    PreparedStatement userStmt = null;
    ResultSet userResultSet = null;

    try {
        // Establish connection to the database
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");
        
        // Prepare and execute query to retrieve saving information from the saving table
        String savingQuery = "SELECT * FROM savingtb WHERE status='completed' ORDER BY savingid DESC";
        savingStmt = conn.prepareStatement(savingQuery);
        savingResultSet = savingStmt.executeQuery();
        
        int count = 0;
        while (savingResultSet.next()) {
            String saveId = savingResultSet.getString("savingid");
            int userId = savingResultSet.getInt("userid");
            int amount = savingResultSet.getInt("amount");
            String dates = savingResultSet.getString("dates");
            String status = savingResultSet.getString("status");
            count++;

            // Prepare and execute query to retrieve user's information from the users table
            String userQuery = "SELECT * FROM users WHERE userid = ?";
            userStmt = conn.prepareStatement(userQuery);
            userStmt.setInt(1, userId);
            userResultSet = userStmt.executeQuery();
            
            if (userResultSet.next()) {
                String names = userResultSet.getString("names");
                String email = userResultSet.getString("email");

                // Display the retrieved information in the table
%>
<tr>
    <td><%= count %></td>
    <td><%= names %></td>
    <td><%= email %></td>
    <td><%= amount %> Frw</td>
    <td><%= dates %></td>
    <td style="color:green;"><%= status %></td>
</tr>
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close all database resources
        try {
            if (userResultSet != null) userResultSet.close();
            if (userStmt != null) userStmt.close();
            if (savingResultSet != null) savingResultSet.close();
            if (savingStmt != null) savingStmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
</tbody>

            </table>
 <div class="pagination" id="pagination"></div>
        </div>
    </main>
</div>

<footer>
    <p>&copy; 2024 Ikimina Ltd. All rights reserved.</p>
</footer>

 <script>
function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("tablepaging");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>

<script>
        // Pagination JavaScript
        var table = document.getElementById("tablepaging");
        var rowsPerPage = 5;
        var currentPage = 1;

        function displayRows(start, end) {
            for (var i = 0; i < table.rows.length; i++) {
                if (i >= start && i < end) {
                    table.rows[i].style.display = "";
                } else {
                    table.rows[i].style.display = "none";
                }
            }
        }

        function setupPagination() {
            var totalPages = Math.ceil(table.rows.length / rowsPerPage);

            var pagination = document.getElementById("pagination");
            pagination.innerHTML = "";

            for (var i = 1; i <= totalPages; i++) {
                var button = document.createElement("button");
                button.textContent = i;
                button.onclick = function() {
                    currentPage = parseInt(this.textContent);
                    var start = (currentPage - 1) * rowsPerPage;
                    var end = start + rowsPerPage;
                    displayRows(start, end);
                    updatePaginationButtons();
                };
                pagination.appendChild(button);
            }

            updatePaginationButtons();
        }

        function updatePaginationButtons() {
            var paginationButtons = document.getElementById("pagination").getElementsByTagName("button");
            for (var i = 0; i < paginationButtons.length; i++) {
                paginationButtons[i].classList.remove("active");
                if (parseInt(paginationButtons[i].textContent) === currentPage) {
                    paginationButtons[i].classList.add("active");
                }
            }
        }

        // Initial setup
        window.onload = function() {
            setupPagination();
        };
    </script>
</body>
</html>
