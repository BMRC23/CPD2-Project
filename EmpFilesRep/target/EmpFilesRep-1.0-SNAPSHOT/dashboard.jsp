<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Employee Records and File Repository/Dashboard</title>
  <style>
    @font-face {
      font-family: 'Pixeloid Sans Bold';
      src: url('fonts/PixeloidSansBold-PKnYd.ttf') format('truetype');
    }

    @font-face {
      font-family: 'Pixeloid Sans';
      src: url('fonts/PixeloidSans-mLxMm.ttf') format('truetype');
    }

    body {
      font-family: 'Pixeloid Sans', sans-serif;
      background-color: #000040;
      color: black;
      margin: 0;
      padding: 0;
    }
    .background {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: white;
      background-size: cover;
      background-position: center;
      z-index: -1;
    }

    table {
      border-collapse: collapse;
      width: 80%;
      margin: 2vh auto; /* Increased top and bottom margin */
      background-color: white;
      border: 2px solid black;
    }
    .top-line {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      background-color: #000040;
      padding: 3vh 0;
      font-family: 'Pixeloid Sans Bold', sans-serif;
      font-size: 3vh;
      color: goldenrod;
      text-align: center;
      border-bottom: darkgoldenrod 4px solid;
      margin: 0;
      text-transform: uppercase;
        text-shadow: -0.1vh 0 white, 0 0.1vh white, 0.1vh 0 white, 0 -0.1vh white;
    }
    th {
      border: 1px solid black;
      padding: 8px;
      color: dodgerblue;
      text-align: center;
      font-weight: bold;
    }

    td {
      border: 1px solid black;
      padding: 8px;
      text-align: center;
    }
    .button-container {
      display: flex;
      justify-content: flex-start;
      margin-top: 12vh; /* Increased top margin */
      z-index: 1; /* Ensure buttons are visible */
    }
    .logout-button {
      margin-left: auto;
    }
    .bottom-line {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      background-color: #000040;
      padding: 3vh 0;
      font-family: 'Pixeloid Sans Bold', sans-serif;
      font-size: 2vh;
      color: goldenrod;
      text-align: center;
      border-top: darkgoldenrod 4px solid;
        text-shadow: -0.05vh 0 white, 0 0.05vh white, 0.05vh 0 white, 0 -0.05vh white;
    }
    button {
      background-color: dodgerblue;
      color: black;
      margin: 0.5vw;
      padding: 0.5vh 0.5vw;
      border-radius: 1vh; /* Adjust border radius based on viewport height */
      cursor: pointer;
      transition: background-color 0.3s;
      font-family: 'Pixeloid Sans', sans-serif;
      font-size: 0.8vw;
    }
    button:hover {
      background-color: #000040;
      color: goldenrod;
    }
  </style>
</head>
<body>
<div class="top-line">
  Employees Dashboard
</div>

<div class="background"></div>

<!-- Button container for Create Profile, Go to Resigned Employees Dashboard, and Log Out buttons -->
<div class="button-container">
  <button onclick="window.location.href='createProfile.jsp'">Create Profile</button>
  <button onclick="window.location.href='resigndashboard.jsp'">Go to Resigned Employees Dashboard</button>
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
  <% for (com.example.empfilesrep.Employee employee : com.example.empfilesrep.EmployeeService.getCurrentEmployeesFromDatabase()) { %>
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
    let confirmLogout = confirm("Are you sure you want to log out?");
    if (confirmLogout) {
      window.location.href = "login.jsp"; // Redirect to login page
    }
  }
</script>

<div class="bottom-line">
  Pixelated Games Inc.
</div>

</body>
</html>
