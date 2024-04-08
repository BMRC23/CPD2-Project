<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Employee Records and File Repository/Resigned Employees Dashboard</title>
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
            position: fixed;
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
            position: relative;
            border-collapse: collapse;
            width: 80%;
            background-color: white;
            border: 2px solid black;
            z-index: 1;
            margin: 15vh auto 2vh;
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
        .logout-button {
            position: absolute;
            bottom: 0;
            right: 0;
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
        /* Style for the navigation menu button */
        .nav-button {
            position: fixed;
            top: 2vh;
            left: 2vh;
            background-color: goldenrod;
            color: black;
            padding: 0.5vh 0.5vw;
            border-radius: 1vh;
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Pixeloid Sans', sans-serif;
            font-size: 0.8vw;
            z-index: 1; /* Ensure button is visible */
        }
        .nav-button:hover {
            background-color: darkgoldenrod;
            color: black;
        }

        /* Style for the navigation menu */
        .nav-menu {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            width: 0;
            overflow-x: hidden;
            transition: 0.5s;
            z-index: 2;
            padding-top: 7vh;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            background-color: #000040;
        }
        .nav-menu button {
            background-color: dodgerblue;
            color: black;
            margin: 1vh 1vw;
            padding: 0.5vh 0.5vw;
            border-radius: 1vh;
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Pixeloid Sans', sans-serif;
            font-size: 0.8vw;
            text-align: left;
        }
        .nav-menu button:not(.close-button) {
            margin-top: 5px;
        }
        .nav-menu button:hover {
            background-color: #000040;
            color: goldenrod;
        }
        .nav-menu .close-button {
            position: absolute;
            top: 0;
            right: 0;
            background-color: goldenrod;
            color: black;
            padding: 0.5vh 0.5vw;
            border-radius: 1vh;
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Pixeloid Sans', sans-serif;
            font-size: 0.8vw;
        }
        .nav-menu .close-button:hover {
            background-color: darkgoldenrod;
            color: black;
        }
    </style>
</head>
<body>
<button class="nav-button" onclick="openNav()">Menu</button>

<div id="navMenu" class="nav-menu">
    <button class="close-button" onclick="closeNav()">Close</button>
    <button onclick="window.location.href='dashboard.jsp'">Back to Dashboard</button>
    <button class="logout-button" onclick="confirmLogout()">Log Out</button>
</div>

<div class="top-line">
    Resigned Employees Dashboard
</div>

<div class="background"></div>

<table>
    <tr>
        <th>First Name</th>
        <th>Middle Name</th>
        <th>Last Name</th>
        <th>Job Position</th>
        <th>Date Hired</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <% for (com.example.empfilesrep.Employee employee : com.example.empfilesrep.EmployeeService.getResignedEmployeesFromDatabase()) { %>
    <tr>
        <td><%= employee.getFirstName() %></td>
        <td><%= employee.getMiddleName() %></td>
        <td><%= employee.getLastName() %></td>
        <td><%= employee.getJobPosition() %></td>
        <td><%= employee.getDateHired() %></td>
        <td><%= employee.getStatus() %></td>
        <td><a href="viewProfile?employeeId=<%= employee.getId() %>">View</a></td>
    </tr>
    <% } %>
</table>

<script>
    function openNav() {
        document.getElementById("navMenu").style.width = "25vh";
    }

    function closeNav() {
        document.getElementById("navMenu").style.width = "0";
    }

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
