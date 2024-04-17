<%-- 
    Document   : viewPendingUser
    Created on : Apr 5, 2024, 5:30:38 PM
    Author     : Professor Sum
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

.add-book-form input,
.add-book-form select {
    width: 50%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
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
 <!-- Form for submitting new books -->
        <div class="add-book-form">
            <form action="" method="GET">
                <div style="display: flex; align-items: center;">
                    <label for="months" style="margin-right:5px;">Year:</label>
                    <select id="months" name="year"  required>
                         <%
        // Get the current year
        int currentYear = java.time.LocalDate.now().getYear();

        // Start the loop from 2020 and continue until the current year
        for (int year = 2020; year <= currentYear; year++) {
            %>
            <option value="<%= year %>"><%= year %></option>
            <%
        }
        %>
                    </select>

                    <label for="months" style="margin-left:30px;">Status:</label>
                    <select id="months" name="creditstatus" required>
                        <option value="pending">pending</option>
                        <option value="approved">approved</option>
                        <option value="reject">rejected</option>
                    </select>

                    <label for="months" style="margin-left:30px;">Pay:</label>
                    <select id="months" name="paystatus" required style="margin-left:20px;">
                        <option value="paid">paid</option>
                        <option value="not paid">not paid</option>
                    </select>
                    <!-- Submit button -->
                    <button type="submit" name="showdata" value="Save Changes" style="width:250px; margin-left: 20px;">Show</button>
                </div>
            </form>
        </div>
        <!-- Table to display user's information -->
        <div style="width:100%;margin-bottom: 200px;">
            <h2>Show Credit Based on Status </h2>
            <table id="tablepaging">
                <!-- Table header -->
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Names</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Amount</th>
                        <th>Paid Amount</th>
                        <th>Dates</th>
                        <th>Status</th>
                        <th>Pay Status</th>
                    </tr>
                </thead>
                <!-- Table body -->
                <tbody>
                    <% 
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    int totalAmount = 0; // Variable to store the total amount
                   int   PaidtotalAmount=0;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ikimina", "root", "");
                        if (request.getParameter("showdata") != null) {
                            // Get parameters from the form
                            String selectedYear = request.getParameter("year");
                            String selectedStatus = request.getParameter("creditstatus");
                            String selectedPayStatus = request.getParameter("paystatus");

                            // Construct the SQL query with additional conditions for selected year and status
                            String query = "SELECT creditb.*, users.names, users.email, users.phone FROM creditb JOIN users ON creditb.userid = users.userid WHERE creditb.status = ? AND creditb.paystatus = ?";
                           
                            ps = conn.prepareStatement(query);
                            ps.setString(1, selectedStatus);
                            ps.setString(2, selectedPayStatus);
                            rs = ps.executeQuery();
                            
                            int count = 0;
                            boolean dataFound = false; // Flag to check if data is found
                            while (rs.next()) {
                                dataFound = true; // Set flag to true if data is found
                                count++;
                                
                                int amount = rs.getInt("requestedamount");
                                totalAmount += amount; // Add amount to total
                                //about interest
                                int paidamount=rs.getInt("amountpaid");
                                PaidtotalAmount+=paidamount;
                                
                                // Retrieve data from the result set
                                String names = rs.getString("names");
                                String email = rs.getString("email");
                                String phone = rs.getString("phone");
                                String amountRequested = rs.getString("requestedamount");
                                 String amountPaid = rs.getString("amountpaid");
                                String creditDate = rs.getString("dates");
                                String creditStatus = rs.getString("status");
                                String creditPayStatus = rs.getString("paystatus");
                    %>
                                <!-- Display user information -->
                                <tr>
                                    <td><%= count %></td>
                                    <td><%= names %></td>
                                    <td><%= email %></td>
                                    <td><%= phone %></td>
                                    <td><%= amountRequested %> Frw</td>
                                    <td><%= amountPaid %> Frw</td>
                                    <td><%= creditDate %></td>
                                    <td style="color:red;"><%= creditStatus %></td>
                                    <td style="color:red;"><%= creditPayStatus %></td>
                                </tr>
                    <% 
                            }
                            if (!dataFound) { // Display message if no data is found
                    %>
                                <tr>
                                    <td colspan="6" style="text-align: center; color: red;">No data found for the selected criteria.</td>
                                </tr>
                    <%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (ps != null) ps.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    %>
                </tbody>
            </table>

            <div style="text-align: right; margin-top: 10px;">
                <strong>Total Amount: <%= totalAmount %> Frw</strong>
            </div>
            <div style="text-align: left; margin-top: 10px;">
                <strong>Total Amount Per Interest of 5% : <%= PaidtotalAmount %> Frw</strong>
            </div>
            <div class="pagination" id="pagination"></div>
        </div>
    </main>
</div>

<footer>
    <p>&copy; 2024 Ikimina Ltd. All rights reserved.</p>
</footer>
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
