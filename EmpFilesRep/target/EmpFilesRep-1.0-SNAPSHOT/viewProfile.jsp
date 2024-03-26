<%@ page import="com.example.empfilesrep.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Retrieve employee details from the database
    Employee employee = (Employee) request.getAttribute("employee");
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
    <button type="button" onclick="toggleFields() && enableAllFields()">Edit Details</button>
    <button type="button" onclick="deleteProfile()">Delete Profile</button>
</div>
<form id="deleteProfileForm" action="deleteProfile" method="post">
    
    <input type="hidden" id="employeeId" name="id" value="<%= employee.getId() %>">
</form>
<script>
    function deleteProfile() {
        // Get the employee ID
        var employeeId = document.getElementById("employeeId").value;

        // Confirm deletion
        var confirmDelete = confirm('Are you sure you want to delete this profile?');

        // If confirmed, submit the form
        if (confirmDelete) {
            var form = document.getElementById("deleteProfileForm");
            form.submit();
        }

        // Prevent default form submission
        return false;
    }
</script>
<form action="editProfile" method="post" enctype="multipart/form-data">
    <!-- EMPLOYEE DETAILS -->
    <h2>EMPLOYEE DETAILS</h2>
    <!-- First Name -->
    <label for="firstName">First Name: <span style="color: red;">*</span></label>
    <input type="text" id="firstName" name="firstName" value="<%= employee.getFirstName() %>" required><br>
    <!-- Middle Name -->
    <label for="middleName">Middle Name: <span style="color: red;">*</span></label>
    <input type="text" id="middleName" name="middleName" value="<%= employee.getMiddleName() %>" required><br>
    <!-- Last Name -->
    <label for="lastName">Last Name: <span style="color: red;">*</span></label>
    <input type="text" id="lastName" name="lastName" value="<%= employee.getLastName() %>" required><br>
    <!-- Job Position -->
    <label for="jobPosition">Job Position: <span style="color: red;">*</span></label>
    <input type="text" id="jobPosition" name="jobPosition" value="<%= employee.getJobPosition() %>" required><br>
    <!-- Date Hired -->
    <label for="dateHired">Date Hired: <span style="color: red;">*</span></label>
    <input type="date" id="dateHired" name="dateHired" value="<%= employee.getDateHired() %>" required><br>
    <br>
    <!-- Address -->
    <label for="address">Address: <span style="color: red;">*</span></label>
    <input type="text" id="address" name="address" value="<%= employee.getAddress() %>" required><br>
    <!-- Contact Number -->
    <label for="contactNumber">Contact Number: <span style="color: red;">*</span></label>
    <input type="text" id="contactNumber" name="contactNumber" value="<%= employee.getContactNumber() %>" required><br>
    <!-- Birthdate -->
    <label for="birthdate">Birthdate: <span style="color: red;">*</span></label>
    <input type="date" id="birthdate" name="birthdate" value="<%= employee.getBirthdate() %>" required><br>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- GOVERNMENT NUMBERS -->
    <h2>GOVERNMENT NUMBERS</h2>
    <!-- SSS -->
    <label for="sss">SSS:</label>
    <input type="text" id="sss" name="sss" value="<%= employee.getSss() %>" disabled><br>
    <!-- TIN -->
    <label for="tin">TIN:</label>
    <input type="text" id="tin" name="tin" value="<%= employee.getTin() %>" disabled><br>
    <!-- PhilHealth -->
    <label for="philHealth">PhilHealth:</label>
    <input type="text" id="philHealth" name="philHealth" value="<%= employee.getPhilHealth() %>" disabled><br>
    <!-- PAG-IBIG -->
    <label for="pagIbig">PAG-IBIG:</label>
    <input type="text" id="pagIbig" name="pagIbig" value="<%= employee.getPagIbig() %>" disabled><br>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- EMERGENCY -->
    <h2>EMERGENCY CONTACT DETAILS</h2>
    <!-- Emergency Contact Name -->
    <label for="emergencyContactName">Emergency Contact Name: <span style="color: red;">*</span></label>
    <input type="text" id="emergencyContactName" name="emergencyContactName" value="<%=employee.getEmergencyContactName()%>" required><br>
    <!-- Emergency Contact Number -->
    <label for="emergencyContactNumber">Emergency Contact Number: <span style="color: red;">*</span></label>
    <input type="text" id="emergencyContactNumber" name="emergencyContactNumber" value="<%=employee.getEmergencyContactNumber()%>" required><br>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- Script to enable editing of columns when checkbox is checked -->
    <script>
        function enableEditing(checkbox, dateId, remarksId) {
            var dateField = document.getElementById(dateId);
            var remarksField = document.getElementById(remarksId);

            if (checkbox.checked) {
                dateField.disabled = false;
                remarksField.disabled = false;
            } else {
                dateField.disabled = true;
                remarksField.disabled = true;
                dateField.value = ''; // Clear the date field
                remarksField.value = ''; // Clear the remarks field
            }
        }
    </script>

    <!-- ONBOARDING CHECKLIST -->
    <h2>ONBOARDING CHECKLIST</h2>
    <!-- Table for Onboarding Checklist -->
    <table border="1">
        <!-- Table headers -->
        <tr>
            <th>Checklist Item</th>
            <th>Date Completed</th>
            <th>Remarks</th>
            <th>Check</th>
        </tr>
        <!-- Table rows -->
        <tr>
            <td style="text-align: center;">Employee Contract</td>
            <td style="text-align: center;"><input type="date" name="employeeContractDateCompleted" value="<%= employee.getEmployeeContractDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><input type="text" name="employeeContractRemarks" value="<%= employee.getEmployeeContractRemarks() %>" disabled></td>
            <td style="text-align: center;"><input type="checkbox" id="employeeContract" onclick="enableEditing(this, 'employeeContractDateCompleted', 'employeeContractRemarks')"
                <% if (employee.getEmployeeContractDateCompleted() != null || (employee.getEmployeeContractRemarks() != null && !employee.getEmployeeContractRemarks().isEmpty())) { %> checked <% } %>></td>
        </tr>
        <tr>
            <td style="text-align: center;">Microsoft Account / Email Address</td>
            <td style="text-align: center;"><label for="microsoftAccountDateCompleted"></label><input type="date" id="microsoftAccountDateCompleted" name="microsoftAccountDateCompleted" value="<%= employee.getMicrosoftAccountDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="microsoftAccountRemarks"></label><input type="text" id="microsoftAccountRemarks" name="microsoftAccountRemarks" value="<%= employee.getMicrosoftAccountRemarks() %>" disabled></td>
            <td style="text-align: center;"><label for="microsoftAccount"></label><input type="checkbox" id="microsoftAccount" onchange="enableEditing(this, 'microsoftAccountDateCompleted', 'microsoftAccountRemarks')"
                <% if (employee.getMicrosoftAccountDateCompleted() != null || (employee.getMicrosoftAccountRemarks() != null && !employee.getMicrosoftAccountRemarks().isEmpty())) { %> checked <% } %>></td>
        </tr>
        <tr>
            <td style="text-align: center;">Issued Assets</td>
            <td style="text-align: center;"><label for="issuedAssetsDateCompleted"></label><input type="date" id="issuedAssetsDateCompleted" name="issuedAssetsDateCompleted" value="<%= employee.getIssuedAssetsDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="issuedAssetsRemarks"></label><input type="text" id="issuedAssetsRemarks" name="issuedAssetsRemarks" value="<%= employee.getIssuedAssetsRemarks() %>" disabled></td>
            <td><label for="issuedAssets"></label><input type="checkbox" id="issuedAssets" onchange="enableEditing(this, 'issuedAssetsDateCompleted', 'issuedAssetsRemarks')"
                <% if (employee.getIssuedAssetsDateCompleted() != null || (employee.getIssuedAssetsRemarks() != null && !employee.getIssuedAssetsRemarks().isEmpty())) { %> checked <% } %>></td>></td>
        </tr>
        <tr>
            <td style="text-align: center;">Required Licenses</td>
            <td style="text-align: center;"><label for="requiredLicensesDateCompleted"></label><input type="date" id="requiredLicensesDateCompleted" name="requiredLicensesDateCompleted" value="<%= employee.getRequiredLicensesDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="requiredLicensesRemarks"></label><input type="text" id="requiredLicensesRemarks" name="requiredLicensesRemarks" value="<%= employee.getRequiredLicensesRemarks() %>" disabled></td>
            <td><label for="requiredLicenses"></label><input type="checkbox" id="requiredLicenses" onchange="enableEditing(this, 'requiredLicensesDateCompleted', 'requiredLicensesRemarks')"
                <% if (employee.getRequiredLicensesDateCompleted() != null || (employee.getRequiredLicensesRemarks() != null && !employee.getRequiredLicensesRemarks().isEmpty())) { %> checked <% } %>></td>></td>></td>
        </tr>
        <tr>
            <td style="text-align: center;">Trello Invite</td>
            <td style="text-align: center;"><label for="trelloInviteDateCompleted"></label><input type="date" id="trelloInviteDateCompleted" name="trelloInviteDateCompleted" value="<%= employee.getTrelloInviteDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="trelloInviteRemarks"></label><input type="text" id="trelloInviteRemarks" name="trelloInviteRemarks" value="<%= employee.getTrelloInviteRemarks() %>" disabled></td>
            <td><label for="trelloInvite"></label><input type="checkbox" id="trelloInvite" onchange="enableEditing(this, 'trelloInviteDateCompleted', 'trelloInviteRemarks')"
                <% if (employee.getTrelloInviteDateCompleted() != null || (employee.getTrelloInviteRemarks() != null && !employee.getTrelloInviteRemarks().isEmpty())) { %> checked <% } %>></td>></td>></td>
        </tr>
        <tr>
            <td style="text-align: center;">Teams/Shifts</td>
            <td style="text-align: center;"><label for="teamsShiftsDateCompleted"></label><input type="date" id="teamsShiftsDateCompleted" name="teamsShiftsDateCompleted" value="<%= employee.getTeamsShiftsDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="teamsShiftsRemarks"></label><input type="text" id="teamsShiftsRemarks" name="teamsShiftsRemarks" value="<%= employee.getTeamsShiftsRemarks() %>" disabled></td>
            <td><label for="teamsShifts"></label><input type="checkbox" id="teamsShifts" onchange="enableEditing(this, 'teamsShiftsDateCompleted', 'teamsShiftsRemarks')"
                <% if (employee.getTeamsShiftsDateCompleted() != null || (employee.getTeamsShiftsRemarks() != null && !employee.getTeamsShiftsRemarks().isEmpty())) { %> checked <% } %>></td>></td>></td>></td>
        </tr>
        <tr>
            <td style="text-align: center;">Enrol to Payroll</td>
            <td style="text-align: center;"><label for="enrolToPayrollDateCompleted"></label><input type="date" id="enrolToPayrollDateCompleted" name="enrolToPayrollDateCompleted" value="<%= employee.getEnrolToPayrollDateCompleted() %>"disabled></td>
            <td style="text-align: center;"><label for="enrolToPayrollRemarks"></label><input type="text" id="enrolToPayrollRemarks" name="enrolToPayrollRemarks" value="<%= employee.getEnrolToPayrollRemarks() %>"disabled></td>
            <td><label for="enrolToPayroll"></label><input type="checkbox" id="enrolToPayroll" onchange="enableEditing(this, 'enrolToPayrollDateCompleted', 'enrolToPayrollRemarks')"
                <% if (employee.getEnrolToPayrollDateCompleted() != null || (employee.getEnrolToPayrollRemarks() != null && !employee.getEnrolToPayrollRemarks().isEmpty())) { %> checked <% } %>></td>>
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
            <th>Check</th>
        </tr>
        <!-- Table rows -->
        <tr>
            <td>Certificate of Employment</td>
            <td><input type="date" name="certificateEmploymentDateCompleted" value="<%= employee.getCertificateEmploymentDateCompleted() %>" disabled></td>
            <td><input type="text" name="certificateEmploymentRemarks" value="<%= employee.getCertificateEmploymentRemarks() %>" disabled></td>
            <td><input type="checkbox" id="certificateEmployment" onclick="enableEditing(this, 'certificateEmploymentDateCompleted', 'certificateEmploymentRemarks')" <% if (employee.getCertificateEmploymentDateCompleted() != null || (employee.getCertificateEmploymentRemarks() != null && !employee.getCertificateEmploymentRemarks().isEmpty())) { %> checked <% } %>></td>
        </tr>
        <!-- Add more rows (incomplete) -->
    </table>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- RESIGNATION DETAILS -->
    <h2>RESIGNATION DETAILS</h2>
    <!-- Resignation details -->
    <!-- Resignation Checkbox -->
    <label for="resigned">Resigned?</label>
    <input type="checkbox" id="resigned" name="resigned" <% if (employee.isResigned()) { %> checked <% } %> onclick="toggleResignationDetails()"><br>
    <!-- Resignation Date -->
    <label for="resignationDate">Resignation Date:</label>
    <input type="date" id="resignationDate" name="resignationDate" value="<%= employee.getResignationDate() %>" <% if (!employee.isResigned()) { %> disabled <% } %>><br>
    <!-- Last Day -->
    <label for="lastDay">Last Day:</label>
    <input type="date" id="lastDay" name="lastDay" value="<%= employee.getLastDay() %>" <% if (!employee.isResigned()) { %> disabled <% } %>><br>
    <!-- Final Pay Release Date -->
    <label for="finalPayReleaseDate">Final Pay Release Date:</label>
    <input type="date" id="finalPayReleaseDate" name="finalPayReleaseDate" value="<%= employee.getFinalPayReleaseDate() %>" <% if (!employee.isResigned()) { %> disabled <% } %>><br>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- FILE UPLOAD -->
    <h2>FILE UPLOAD</h2>
    <!-- File upload section -->
    <label for="file">Upload Files:</label>
    <input type="file" id="file" name="file" multiple <% if (!employee.isResigned()) { %> disabled <% } %>><br>
    <!-- Display uploaded files -->
    <ul id="uploadedFiles"></ul>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- Hidden input field for employee ID -->
    <input type="hidden" name="id" value="<%= employee.getId() %>">

    <!-- Submit Button -->
    <input type="submit" value="Save Changes">

    <!-- Script to enable or disable editing of fields -->
    <script>
        function toggleFields() {
            var fields = document.querySelectorAll('input[type="text"], input[type="date"], input[type="checkbox"]');
            fields.forEach(function (field) {
                field.disabled = !field.disabled;
            });
        }

        function enableEditing(checkbox, dateId, remarksId) {
            var dateField = document.getElementById(dateId);
            var remarksField = document.getElementById(remarksId);

            if (checkbox.checked) {
                dateField.disabled = false;
                remarksField.disabled = false;
            } else {
                dateField.disabled = true;
                remarksField.disabled = true;
                dateField.value = ''; // Clear the date field
                remarksField.value = ''; // Clear the remarks field
            }
        }

        function toggleResignationDetails() {
            var checkbox = document.getElementById("resigned");
            var resignationDateInput = document.getElementById("resignationDate");
            var lastDayInput = document.getElementById("lastDay");
            var finalPayReleaseDateInput = document.getElementById("finalPayReleaseDate");
            var fileUploadInput = document.getElementById("file");

            if (checkbox.checked) {
                resignationDateInput.disabled = false;
                lastDayInput.disabled = false;
                finalPayReleaseDateInput.disabled = false;
                fileUploadInput.disabled = false;
            } else {
                resignationDateInput.value = "";
                lastDayInput.value = "";
                finalPayReleaseDateInput.value = "";
                resignationDateInput.disabled = true;
                lastDayInput.disabled = true;
                finalPayReleaseDateInput.disabled = true;
                fileUploadInput.disabled = true;
            }
        }
    </script>

    <script>
        function enableAllFields() {
            var inputs = document.querySelectorAll('input[type="text"], input[type="date"]');
            inputs.forEach(function(input) {
                input.disabled = false;
            });
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function(checkbox) {
                checkbox.disabled = false;
            });
        }
    </script>
    <!-- Script to display uploaded files -->
    <script>
        document.getElementById("file").addEventListener("change", function () {
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