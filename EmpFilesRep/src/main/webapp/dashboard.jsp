<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Employee Records and File Repository/Dashboard</title>
  <style>
    table {
      border-collapse: collapse;
      width: 80%;
      margin: 20px auto;
    }
    th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: left;
    }
    h1 {
      text-align: center;
    }
    .logout-button {
      float: right;
      margin-right: 20px;
    }
  </style>
</head>
<body>
<h1>Employees Dashboard</h1>
<hr style="border-top: 4px solid black;">

<!-- Button container for Create Profile and Log Out buttons -->
<div class="button-container">
  <button onclick="window.location.href='createProfile.jsp'">Create Profile</button>
  <button onclick="window.location.href='resigndashboard.jsp'">Toggle Resigned Employees</button>
  <button class="logout-button" onclick="confirmLogout()">Log Out</button>
</div>

<table>
  <tr>
    <th>First Name</th>
    <th>Middle Name</th>
    <th>Last Name</th>
    <th>Job Position</th>
    <th>Date Hired</th>
    <th>Action</th>
  </tr>
  <% for (com.example.empfilesrep.Employee employee : com.example.empfilesrep.EmployeeService.getAllEmployeesFromDatabase()) { %>
  <tr>
    <td><%= employee.getFirstName() %></td>
    <td><%= employee.getMiddleName() %></td>
    <td><%= employee.getLastName() %></td>
    <td><%= employee.getJobPosition() %></td>
    <td><%= employee.getDateHired() %></td>
    <td><a href="viewProfile?employeeId=<%= employee.getId() %>">View</a></td>
  </tr>
  <% } %>
</table>

<script>
  function confirmLogout() {
    var confirmLogout = confirm("Are you sure you want to log out?");
    if (confirmLogout) {
      window.location.href = "login.jsp"; // Redirect to login page
    }
  }
</script>

</body>
</html>
