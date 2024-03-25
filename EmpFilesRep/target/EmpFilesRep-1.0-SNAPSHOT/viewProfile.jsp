<%@ page import="com.example.empfilesrep.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.empfilesrep.Employee" %>

<%  // Retrieve employee details from the database
    Employee employee = (Employee)request.getAttribute("employee");
%>
<html>
<head>
    <title>View Profile</title>
    <style>
        /* Center align the form */
        form {
            width: 50%;
            margin: 0 auto;
            text-align: left;
        }
        /* Center align the headings */
        h1, h2 {
            text-align: center;
        }
        /* Add additional styling as needed */
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="submit"], input[type="checkbox"] {
            width: calc(100% - 20px);
            padding: 5px;
            margin-bottom: 10px;
            font-size: 14px; /* Adjust font size */
        }
        table {
            width: 100%;
        }
        .button-container {
            text-align: left;
            margin-bottom: 10px;
        }
        .button-container button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<h1>View Profile</h1>
<hr style="border-top: 4px solid black;">
<div class="button-container">
    <button onclick="window.location.href='dashboard.jsp'">Back to Dashboard</button>
    <button type="button" onclick="toggleFields()">Toggle Editing</button>
</div>
<form action="viewProfile" method="post" enctype="multipart/form-data">
    <!-- EMPLOYEE DETAILS -->
    <h2>EMPLOYEE DETAILS</h2>
    <!-- First Name -->
    <label for="firstName">First Name: <span style="color: red;">*</span></label>
    <input type="text" id="firstName" name="firstName" value="<%= employee.getFirstName() %>" required disabled><br>
    <!-- Middle Name -->
    <label for="middleName">Middle Name: <span style="color: red;">*</span></label>
    <input type="text" id="middleName" name="middleName" value="<%= employee.getMiddleName() %>" required disabled><br>
    <!-- Last Name -->
    <label for="lastName">Last Name: <span style="color: red;">*</span></label>
    <input type="text" id="lastName" name="lastName" value="<%= employee.getLastName() %>" required disabled><br>
    <!-- Job Position -->
    <label for="jobPosition">Job Position: <span style="color: red;">*</span></label>
    <input type="text" id="jobPosition" name="jobPosition" value="<%= employee.getJobPosition() %>" required disabled><br>
    <!-- Date Hired -->
    <label for="dateHired">Date Hired: <span style="color: red;">*</span></label>
    <input type="date" id="dateHired" name="dateHired" value="<%= employee.getDateHired() %>" required disabled><br>
    <br>
    <!-- Address -->
    <label for="address">Address: <span style="color: red;">*</span></label>
    <input type="text" id="address" name="address" value="<%= employee.getAddress() %>" required disabled><br>
    <!-- Contact Number -->
    <label for="contactNumber">Contact Number: <span style="color: red;">*</span></label>
    <input type="text" id="contactNumber" name="contactNumber" value="<%= employee.getContactNumber() %>" required disabled><br>
    <!-- Birthdate -->
    <label for="birthdate">Birthdate: <span style="color: red;">*</span></label>
    <input type="date" id="birthdate" name="birthdate" value="<%= employee.getBirthdate() %>" required disabled><br>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- GOVERNMENT NUMBERS -->
    <h2>GOVERNMENT NUMBERS</h2>
    <!-- SSS -->
    <label for="sss">SSS:</label>
    <input type="text" id="sss" name="sss" value="<%= employee.getSss() %>" required disabled><br>
    <!-- TIN -->
    <label for="tin">TIN:</label>
    <input type="text" id="tin" name="tin" value="<%= employee.getTin() %>" required disabled><br>
    <!-- PhilHealth -->
    <label for="philHealth">PhilHealth:</label>
    <input type="text" id="philHealth" name="philHealth" value="<%= employee.getPhilHealth() %>" required disabled><br>
    <!-- PAG-IBIG -->
    <label for="pagIbig">PAG-IBIG:</label>
    <input type="text" id="pagIbig" name="pagIbig" value="<%= employee.getPagIbig() %>" required disabled><br>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- ONBOARDING CHECKLIST -->
    <h2>ONBOARDING CHECKLIST</h2>
    <!-- Table for Onboarding Checklist -->
    <table border="1">
        <!-- Table headers -->
        <tr>
            <th>Checklist Item</th>
            <th>Date Completed</th>
            <th>Remarks</th>
        </tr>
        <!-- Table rows -->
        <tr>
            <td>Employee Contract</td>
            <td><input type="date" name="employeeContractDateCompleted" value="<%= employee.getEmployeeContractDateCompleted() %>" disabled></td>
            <td><input type="text" name="employeeContractRemarks" value="<%= employee.getEmployeeContractRemarks() %>" disabled></td>
        </tr>

    </table>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- OFFBOARDING CHECKLIST -->
    <h2>OFFBOARDING CHECKLIST</h2>
    <!-- Table for Offboarding Checklist -->
    <table border="1">
        <!-- Table headers -->
        <tr>
            <th>Checklist Item</th>
            <th>Date Completed</th>
            <th>Remarks</th>
        </tr>
        <!-- Table rows -->
        <!-- Add more rows as needed -->
        <tr>
            <td>Certificate of Employment</td>
            <td><input type="date" name="certificateEmploymentDateCompleted" value="<%= employee.getCertificateEmploymentDateCompleted() %>" disabled></td>
            <td><input type="text" name="certificateEmploymentRemarks" value="<%= employee.getCertificateEmploymentRemarks() %>" disabled></td>
        </tr>
    </table>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- RESIGNATION DETAILS -->
    <h2>RESIGNATION DETAILS</h2>
    <!-- Resignation details -->
    <!-- Resignation Checkbox -->
    <label for="resigned">Resigned?</label>
    <input type="checkbox" id="resigned" name="resigned" <% if (employee.isResigned()) { %> checked <% } %> disabled><br>
    <!-- Resignation Date -->
    <label for="resignationDate">Resignation Date:</label>
    <input type="date" id="resignationDate" name="resignationDate" value="<%= employee.getResignationDate() %>" disabled><br>
    <!-- Last Day -->
    <label for="lastDay">Last Day:</label>
    <input type="date" id="lastDay" name="lastDay" value="<%= employee.getLastDay() %>" disabled><br>
    <!-- Final Pay Release Date -->
    <label for="finalPayReleaseDate">Final Pay Release Date:</label>
    <input type="date" id="finalPayReleaseDate" name="finalPayReleaseDate" value="<%= employee.getFinalPayReleaseDate() %>" disabled><br>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- FILE UPLOAD -->
    <h2>FILE UPLOAD</h2>
    <!-- File upload section -->
    <label for="file">Upload Files:</label>
    <input type="file" id="file" name="file" multiple disabled><br>
    <!-- Display uploaded files -->
    <ul id="uploadedFiles"></ul>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- Submit Button -->
    <input type="submit" value="Submit">

    <!-- Script to enable or disable editing of fields -->
    <script>
        function toggleFields() {
            var fields = document.querySelectorAll('input[type="text"], input[type="date"]');
            fields.forEach(function(field) {
                field.disabled = !field.disabled;
            });
        }
    </script>

    <!-- Script to display uploaded files -->
    <script>
        document.getElementById("file").addEventListener("change", function() {
            var fileList = document.getElementById("uploadedFiles");
            fileList.innerHTML = ""; // Clear the list

            var files = this.files;
            for (var i = 0; i < files.length; i++) {
                var listItem = document.createElement("li");
                listItem.textContent = files[i].name;
                fileList.appendChild(listItem);
            }
        });
    </script>
</form>
</body>
</html>
