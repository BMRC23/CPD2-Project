<%@ page import="com.example.empfilesrep.Employee" %>
<%@ page import="com.example.empfilesrep.EmployeeFile" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Retrieve employee details from the database
    Employee employee = (Employee) request.getAttribute("employee");
    @SuppressWarnings("unchecked") // Suppress warning for this line
    List<EmployeeFile> files = (List<EmployeeFile>) request.getAttribute("files");

%>

<html>
<head>
    <title>Employee Records and File Repository/View Profile</title>
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
            background-size: 80%;
            background-position: center;
            background-attachment: fixed;
            z-index: -1;
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

        form {
            width: 50%;
            margin: 10vh auto 2vh;
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
        input[type="text"], input[type="checkbox"] {
            width: calc(100% - 20px);
            padding: 5px;
            margin-bottom: 10px;
            font-size: 14px; /* Adjust font size */
        }
        input[type="submit"] {
            display: flex;
            background-color: dodgerblue;
            color: black;
            padding: 0.5vh 0.5vw;
            border-radius: 1vh; /* Adjust border radius based on viewport height */
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Pixeloid Sans', sans-serif;
            font-size: 0.8vw;
            margin-bottom: 12vh; /* Increased bottom margin */
            z-index: 1; /* Ensure button is visible */
            width: calc(100% - 20px);
            text-align: center;
            justify-content: center;
            align-items: center;
        }
        input[type="submit"]:hover {
            background-color: #000040;
            color: goldenrod;
        }
        .logout-button {
            position: absolute;
            bottom: 0;
            right: 0;
        }
        button{
            background-color: dodgerblue;
            color: black;
            padding: 0.5vh 0.5vw;
            border-radius: 1vh; /* Adjust border radius based on viewport height */
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Pixeloid Sans', sans-serif;
            font-size: 0.8vw;
        }
        button:hover:not(:disabled) {
            background-color: #000040;
            color: goldenrod;
        }
        button:disabled {
            background-color: lightgray;
            color: black;
            padding: 0.5vh 0.5vw;
            border-radius: 1vh; /* Adjust border radius based on viewport height */
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Pixeloid Sans', sans-serif;
            font-size: 0.8vw;
        }
        table {
            width: 100%;
            background-color: white;
        }
        .space {
            display: flex;
            margin-bottom: 12vh
        }
        /* Style for the navigation menu button */
        .nav-button {
            position: fixed;
            top: 3vh;
            left: 3vh;
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
            align-items: center;
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
    <button type="button" id="toggleEditing" name="toggleEditing" onclick="toggleAllFields()">Toggle Editing</button>
    <button type="button" onclick="deleteProfile()">Delete Profile</button>
    <button id="backToResignDashboard" style="display: none;" onclick="window.location.href='resigndashboard.jsp'">Go to Resigned Employees Dashboard</button>
    <button class="logout-button" onclick="confirmLogout()">Log Out</button>
</div>

<<div class="top-line">
    View Profile
</div>

<div class="background"></div>

<script>
    let isResigned = <%= employee.isResigned() %>;

    if (isResigned) {
        document.getElementById("backToResignDashboard").style.display = "block"; // Display the button
    }
</script>

<form id="deleteProfileForm" action="deleteProfile" method="post">
    <input type="hidden" id="employeeId" name="employeeId" value="<%= employee.getId() %>">
</form>


<script>
    function deleteProfile() {
        // Confirm deletion
        let confirmDelete = confirm('Are you sure you want to delete this profile?');

        // If confirmed, submit the form
        if (confirmDelete) {
            let form = document.getElementById("deleteProfileForm");
            form.submit();
        }

        // Prevent default form submission
        return false;
    }
</script>

<form action="editProfile" method="post" enctype="multipart/form-data" id="editProfileForm" onsubmit="handleSubmit()">
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
    <input type="text" id="sss" name="sss" value="<%= employee.getSss() != null ? employee.getSss() : "" %>" disabled><br>
    <!-- TIN -->
    <label for="tin">TIN:</label>
    <input type="text" id="tin" name="tin" value="<%= employee.getTin() != null ? employee.getTin() : "" %>" disabled><br>
    <!-- PhilHealth -->
    <label for="philHealth">PhilHealth:</label>
    <input type="text" id="philHealth" name="philHealth" value="<%= employee.getPhilHealth() != null ? employee.getTin() : "" %>" disabled><br>
    <!-- PAG-IBIG -->
    <label for="pagIbig">PAG-IBIG:</label>
    <input type="text" id="pagIbig" name="pagIbig" value="<%= employee.getPagIbig() != null ? employee.getPagIbig() : "" %>" disabled><br>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- EMERGENCY -->
    <h2>EMERGENCY CONTACT DETAILS</h2>
    <!-- Emergency Contact Name -->
    <label for="emergencyContactName">Emergency Contact Name: <span style="color: red;">*</span></label>
    <input type="text" id="emergencyContactName" name="emergencyContactName" value="<%=employee.getEmergencyContactName()%>" required disabled><br>
    <!-- Emergency Contact Number -->
    <label for="emergencyContactNumber">Emergency Contact Number: <span style="color: red;">*</span></label>
    <input type="text" id="emergencyContactNumber" name="emergencyContactNumber" value="<%=employee.getEmergencyContactNumber()%>" required disabled><br>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <!-- Script to enable editing of columns when checkbox is checked -->
    <script>
        function enableEditing(checkbox, dateId, remarksId) {
            let dateField = document.getElementById(dateId);
            let remarksField = document.getElementById(remarksId);
            let booleanValue = checkbox.checked;

            if (booleanValue) {
                dateField.disabled = false;
                remarksField.disabled = false;
            } else {
                dateField.disabled = true;
                remarksField.disabled = true;
                dateField.value = ''; // Clear the date field
                remarksField.value = ''; // Clear the remarks field
            }

            // Set the corresponding boolean value
            document.getElementById(checkbox.id).value = booleanValue.toString(); // Set boolean value as string
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
            <td style="text-align: center;"><label for="employeeContractDateCompleted"></label><input type="date" id="employeeContractDateCompleted" name="employeeContractDateCompleted" value="<%= employee.getEmployeeContractDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="employeeContractRemarks"></label><input type="text" id="employeeContractRemarks" name="employeeContractRemarks" value="<%= employee.getEmployeeContractRemarks() != null ? employee.getEmployeeContractRemarks() : "" %>" disabled></td>
            <td style="text-align: center;"><label for="employeeContract"></label><input type="checkbox" id="employeeContract" name="employeeContract" data-id="date remarks" data-date-id="employeeContractDateCompleted" data-remarks-id="employeeContractRemarks" onclick="enableEditing(this, 'employeeContractDateCompleted', 'employeeContractRemarks')" <% if (employee.isEmployeeContract()) { %> checked <% } %> disabled></td>
        </tr>
        <tr>
            <td style="text-align: center;">Microsoft Account / Email Address</td>
            <td style="text-align: center;"><label for="microsoftAccountDateCompleted"></label><input type="date" id="microsoftAccountDateCompleted" name="microsoftAccountDateCompleted" value="<%= employee.getMicrosoftAccountDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="microsoftAccountRemarks"></label><input type="text" id="microsoftAccountRemarks" name="microsoftAccountRemarks" value="<%= employee.getMicrosoftAccountRemarks() != null ? employee.getMicrosoftAccountRemarks() : "" %>" disabled></td>
            <td style="text-align: center;"><label for="microsoftAccount"></label><input type="checkbox" id="microsoftAccount" name="microsoftAccount" data-id="date remarks" data-date-id="microsoftAccountDateCompleted" data-remarks-id="microsoftAccountRemarks" onclick="enableEditing(this, 'microsoftAccountDateCompleted', 'microsoftAccountRemarks')" <% if (employee.isMicrosoftAccount()) { %> checked <% } %> disabled></td>
        </tr>
        <tr>
            <td style="text-align: center;">Issued Assets</td>
            <td style="text-align: center;"><label for="issuedAssetsDateCompleted"></label><input type="date" id="issuedAssetsDateCompleted" name="issuedAssetsDateCompleted" value="<%= employee.getIssuedAssetsDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="issuedAssetsRemarks"></label><input type="text" id="issuedAssetsRemarks" name="issuedAssetsRemarks" value="<%= employee.getIssuedAssetsRemarks() != null ? employee.getIssuedAssetsRemarks() : "" %>" disabled></td>
            <td style="text-align: center;"><label for="issuedAssets"></label><input type="checkbox" id="issuedAssets" name="issuedAssets" data-id="date remarks" data-date-id="issuedAssetsDateCompleted" data-remarks-id="issuedAssetsRemarks" onclick="enableEditing(this, 'issuedAssetsDateCompleted', 'issuedAssetsRemarks')" <% if (employee.isIssuedAssets()) { %> checked <% } %> disabled></td>
        </tr>
        <tr>
            <td style="text-align: center;">Required Licenses</td>
            <td style="text-align: center;"><label for="requiredLicensesDateCompleted"></label><input type="date" id="requiredLicensesDateCompleted" name="requiredLicensesDateCompleted" value="<%= employee.getRequiredLicensesDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="requiredLicensesRemarks"></label><input type="text" id="requiredLicensesRemarks" name="requiredLicensesRemarks" value="<%= employee.getRequiredLicensesRemarks() != null ? employee.getRequiredLicensesRemarks() : "" %>" disabled></td>
            <td style="text-align: center;"><label for="requiredLicenses"></label><input type="checkbox" id="requiredLicenses" name="requiredLicenses" data-id="date remarks" data-date-id="requiredLicensesDateCompleted" data-remarks-id="requiredLicensesRemarks" onclick="enableEditing(this, 'requiredLicensesDateCompleted', 'requiredLicensesRemarks')" <% if (employee.isRequiredLicenses()) { %> checked <% } %> disabled></td>
        </tr>
        <tr>
            <td style="text-align: center;">Trello Invite</td>
            <td style="text-align: center;"><label for="trelloInviteDateCompleted"></label><input type="date" id="trelloInviteDateCompleted" name="trelloInviteDateCompleted" value="<%= employee.getTrelloInviteDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="trelloInviteRemarks"></label><input type="text" id="trelloInviteRemarks" name="trelloInviteRemarks" value="<%= employee.getTrelloInviteRemarks() != null ? employee.getTrelloInviteRemarks() : "" %>" disabled></td>
            <td style="text-align: center;"><label for="trelloInvite"></label><input type="checkbox" id="trelloInvite" name="trelloInvite" data-id="date remarks" data-date-id="trelloInviteDateCompleted" data-remarks-id="trelloInviteRemarks" onclick="enableEditing(this, 'trelloInviteDateCompleted', 'trelloInviteRemarks')" <% if (employee.isTrelloInvite()) { %> checked <% } %> disabled></td>
        </tr>
        <tr>
            <td style="text-align: center;">Teams/Shifts</td>
            <td style="text-align: center;"><label for="teamsShiftsDateCompleted"></label><input type="date" id="teamsShiftsDateCompleted" name="teamsShiftsDateCompleted" value="<%= employee.getTeamsShiftsDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="teamsShiftsRemarks"></label><input type="text" id="teamsShiftsRemarks" name="teamsShiftsRemarks" value="<%= employee.getTeamsShiftsRemarks() != null ? employee.getTeamsShiftsRemarks() : "" %>" disabled></td>
            <td style="text-align: center;"><label for="teamsShifts"></label><input type="checkbox" id="teamsShifts" name="teamsShifts" data-id="date remarks" data-date-id="teamsShiftsDateCompleted" data-remarks-id="teamsShiftsRemarks" onclick="enableEditing(this, 'teamsShiftsDateCompleted', 'teamsShiftsRemarks')" <% if (employee.isTeamsShifts()) { %> checked <% } %> disabled></td>
        </tr>
        <tr>
            <td style="text-align: center;">Enrol to Payroll</td>
            <td style="text-align: center;"><label for="enrolToPayrollDateCompleted"></label><input type="date" id="enrolToPayrollDateCompleted" name="enrolToPayrollDateCompleted" value="<%= employee.getEnrolToPayrollDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="enrolToPayrollRemarks"></label><input type="text" id="enrolToPayrollRemarks" name="enrolToPayrollRemarks" value="<%= employee.getEnrolToPayrollRemarks() != null ? employee.getEnrolToPayrollRemarks() : ""  %>" disabled></td>
            <td style="text-align: center;"><label for="enrolToPayroll"></label><input type="checkbox" id="enrolToPayroll" name="enrolToPayroll" data-id="date remarks" data-date-id="enrolToPayrollDateCompleted" data-remarks-id="enrolToPayrollRemarks" onclick="enableEditing(this, 'enrolToPayrollDateCompleted', 'enrolToPayrollRemarks')" <% if (employee.isEnrolToPayroll()) { %> checked <% } %> disabled></td>
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
            <td style="text-align: center;">Certificate of Employment</td>
            <td style="text-align: center;"><label for="certificateEmploymentDateCompleted"></label><input type="date" id="certificateEmploymentDateCompleted" name="certificateEmploymentDateCompleted" value="<%= employee.getCertificateEmploymentDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="certificateEmploymentRemarks"></label><input type="text" id="certificateEmploymentRemarks" name="certificateEmploymentRemarks" value="<%= employee.getCertificateEmploymentRemarks() != null ? employee.getCertificateEmploymentRemarks() : ""  %>" disabled></td>
            <td style="text-align: center;">
                <label for="certificateEmployment"></label>
                <input type="checkbox" id="certificateEmployment" name="certificateEmployment" data-id="date remarks" data-date-id="certificateEmploymentDateCompleted" data-remarks-id="certificateEmploymentRemarks" onclick="enableEditing(this, 'certificateEmploymentDateCompleted', 'certificateEmploymentRemarks')" <% if (employee.isCertificateEmployment()) { %> checked <% } %> disabled>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">BIR Form 2316</td>
            <td style="text-align: center;"><label for="birForm2316DateCompleted"></label><input type="date" id="birForm2316DateCompleted" name="birForm2316DateCompleted" value="<%= employee.getBirForm2316DateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="birForm2316Remarks"></label><input type="text" id="birForm2316Remarks" name="birForm2316Remarks" value="<%= employee.getBirForm2316Remarks() != null ? employee.getBirForm2316Remarks() : "" %>" disabled></td>
            <td style="text-align: center;">
                <label for="birForm2316"></label>
                <input type="checkbox" id="birForm2316" name="birForm2316" data-id="date remarks" data-date-id="birForm2316DateCompleted" data-remarks-id="birForm2316Remarks" onclick="enableEditing(this, 'birForm2316DateCompleted', 'birForm2316Remarks')" <% if (employee.isBirForm2316()) { %> checked <% } %> disabled>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">Return of Issued Assets</td>
            <td style="text-align: center;"><label for="returnIssuedAssetsDateCompleted"></label><input type="date" id="returnIssuedAssetsDateCompleted" name="returnIssuedAssetsDateCompleted" value="<%= employee.getReturnIssuedAssetsDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="returnIssuedAssetsRemarks"></label><input type="text" id="returnIssuedAssetsRemarks" name="returnIssuedAssetsRemarks" value="<%= employee.getReturnIssuedAssetsRemarks() != null ? employee.getReturnIssuedAssetsRemarks() : "" %>" disabled></td>
            <td style="text-align: center;">
                <label for="returnIssuedAssets"></label>
                <input type="checkbox" id="returnIssuedAssets" name="returnIssuedAssets" data-id="date remarks" data-date-id="returnIssuedAssetsDateCompleted" data-remarks-id="returnIssuedAssetsRemarks" onclick="enableEditing(this, 'returnIssuedAssetsDateCompleted', 'returnIssuedAssetsRemarks')" <% if (employee.isReturnIssuedAssets()) { %> checked <% } %> disabled>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">Quitclaim + Final Pay</td>
            <td style="text-align: center;"><label for="quitclaimFinalPayDateCompleted"></label><input type="date" id="quitclaimFinalPayDateCompleted" name="quitclaimFinalPayDateCompleted" value="<%= employee.getQuitclaimFinalPayDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="quitclaimFinalPayRemarks"></label><input type="text" id="quitclaimFinalPayRemarks" name="quitclaimFinalPayRemarks" value="<%= employee.getQuitclaimFinalPayRemarks() != null ? employee.getQuitclaimFinalPayRemarks() : "" %>" disabled></td>
            <td style="text-align: center;">
                <label for="quitclaimFinalPay"></label>
                <input type="checkbox" id="quitclaimFinalPay" name="quitclaimFinalPay" data-id="date remarks" data-date-id="quitclaimFinalPayDateCompleted" data-remarks-id="quitclaimFinalPayRemarks" onclick="enableEditing(this, 'quitclaimFinalPayDateCompleted', 'quitclaimFinalPayRemarks')" <% if (employee.isQuitclaimFinalPay()) { %> checked <% } %> disabled>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">Knowledge Transfer Sheet</td>
            <td style="text-align: center;"><label for="knowledgeTransferSheetDateCompleted"></label><input type="date" id="knowledgeTransferSheetDateCompleted" name="knowledgeTransferSheetDateCompleted" value="<%= employee.getKnowledgeTransferSheetDateCompleted() %>" disabled></td>
            <td style="text-align: center;"><label for="knowledgeTransferSheetRemarks"></label><input type="text" id="knowledgeTransferSheetRemarks" name="knowledgeTransferSheetRemarks" value="<%= employee.getKnowledgeTransferSheetRemarks() != null ? employee.getKnowledgeTransferSheetRemarks() : "" %>" disabled></td>
            <td style="text-align: center;">
                <label for="knowledgeTransferSheet"></label>
                <input type="checkbox" id="knowledgeTransferSheet" name="knowledgeTransferSheet" data-id="date remarks" data-date-id="knowledgeTransferSheetDateCompleted" data-remarks-id="knowledgeTransferSheetRemarks" onclick="enableEditing(this, 'knowledgeTransferSheetDateCompleted', 'knowledgeTransferSheetRemarks')" <% if (employee.isKnowledgeTransferSheet()) { %> checked <% } %> disabled>
            </td>
        </tr>
    </table>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">

    <script>
        // Function to toggle resignation details based on existing data
        function toggleResignationDetails() {
            let checkbox = document.getElementById("resigned");
            let resignationDetails = document.getElementById("resignationDetails");
            let resignationDateInput = document.getElementById("resignationDate");
            let lastDayInput = document.getElementById("lastDay");
            let finalPayReleaseDateInput = document.getElementById("finalPayReleaseDate");
            let booleanValue = checkbox.checked;

            if (booleanValue) {
                resignationDetails.style.display = "block";
                resignationDateInput.disabled = false;
                lastDayInput.disabled = false;
                finalPayReleaseDateInput.disabled = false;
            } else {
                resignationDetails.style.display = "none";
                resignationDateInput.value = "";
                lastDayInput.value = "";
                finalPayReleaseDateInput.value = "";
                resignationDateInput.disabled = true;
                lastDayInput.disabled = true;
                finalPayReleaseDateInput.disabled = true;
            }

            // Set the corresponding boolean value
            document.getElementById("resigned").value = booleanValue ? 'true' : 'false'; // Set boolean value as string
        }

        // Function to check the checkbox based on the value returned by isResigned()
        function checkResignedCheckbox() {
            let checkbox = document.getElementById("resigned");
            let resignationDetails = document.getElementById("resignationDetails");
            let resignationDateInput = document.getElementById("resignationDate");
            let lastDayInput = document.getElementById("lastDay");
            let finalPayReleaseDateInput = document.getElementById("finalPayReleaseDate");
            checkbox.checked = <%= employee.isResigned() %>;

            if (checkbox.checked) {
                resignationDetails.style.display = "block";
                resignationDateInput.disabled = true;
                lastDayInput.disabled = true;
                finalPayReleaseDateInput.disabled = true;
            } else {
                resignationDetails.style.display = "none";
                resignationDateInput.value = "";
                lastDayInput.value = "";
                finalPayReleaseDateInput.value = "";
                resignationDateInput.disabled = true;
                lastDayInput.disabled = true;
                finalPayReleaseDateInput.disabled = true;
            }
        }

        // Call the function to set the checkbox state on page load
        window.onload = function() {
            checkResignedCheckbox();
        };
    </script>


    <!-- RESIGNATION DETAILS -->
    <h2>RESIGNATION DETAILS</h2>
    <!-- Centered Resigned label and checkbox -->
    <div style="text-align: center;">
        <label for="resigned" style="display: inline-block; width: 100px; text-align: center;">Resigned? </label>
        <input type="checkbox" id="resigned" name="resigned" onclick="toggleResignationDetails()" style="display: inline-block;" <% if (employee.isResigned()) { %> checked <% } %> disabled>
    </div>
    <br>
    <div id="resignationDetails">
        <!-- Resignation Date -->
        <label for="resignationDate">Resignation Date:</label>
        <input type="date" id="resignationDate" name="resignationDate" value="<%= employee.getResignationDate() %>" disabled ><br><br>
        <!-- Last Day -->
        <label for="lastDay">Last Day:</label>
        <input type="date" id="lastDay" name="lastDay" value="<%= employee.getLastDay() %>" disabled ><br><br>
        <!-- Final Pay Release Date -->
        <label for="finalPayReleaseDate">Final Pay Release Date:</label>
        <input type="date" id="finalPayReleaseDate" name="finalPayReleaseDate" value="<%= employee.getFinalPayReleaseDate() %>" disabled ><br><br>
    </div>
    <br>
    <br>
    <hr style="border-top: 2px solid black;">


    <!-- FILE UPLOAD -->
    <h2>FILE UPLOAD</h2>
    <!-- File upload section -->
    <label for="file">Upload Files:</label>
    <input type="file" id="file" name="file" multiple disabled ><br>
    <!-- Display uploaded files -->
    <h3>Uploaded Files:</h3>
    <ul>
        <% if (files != null) { %>
        <% for (EmployeeFile file : files) { %>
        <li>
            <a href="downloadFile?fileId=<%= file.getId() %>" target="_blank"><%= file.getFilename() %></a>
            <!-- Delete button with onclick event to call deleteFile function -->
            <button onclick="deleteFile(<%= file.getId() %>)" disabled >Delete</button>
        </li>
        <% } %>
        <% } else { %>
        <li>No files available</li>
        <% } %>
    </ul>
    <hr style="border-top: 2px solid black;">
    <br>

    <div class="space"></div>

    <!-- Hidden input field for employee ID -->
    <input type="hidden" name="id" value="<%= employee.getId() %>">

    <!-- Submit Button -->
    <input type="submit" id="saveChangesButton" value="Save Changes" style="display: none;">


    <!-- Script to enable or disable editing of fields -->
    <script>
        // Function to toggle editing of date completed and remarks fields
        function toggleDateCompletedAndRemarksFields() {
            let checkboxes = document.querySelectorAll('input[type="checkbox"][data-id="date remarks"]');

            checkboxes.forEach(function(checkbox) {
                let dateCompletedInput = document.getElementById(checkbox.dataset.dateId);
                let remarksInput = document.getElementById(checkbox.dataset.remarksId);

                if (!checkbox.disabled && checkbox.checked) {
                    dateCompletedInput.disabled = false;
                    remarksInput.disabled = false;
                } else if (!checkbox.disabled && !checkbox.checked) {
                    dateCompletedInput.disabled = true;
                    remarksInput.disabled = true;
                    dateCompletedInput.value = ""; // Clear the value
                    remarksInput.value = ""; // Clear the value
                } else {
                    dateCompletedInput.disabled = true;
                    remarksInput.disabled = true;
                }
            });
        }


        // Function to toggle all fields
        function toggleAllFields() {
            let inputs = document.querySelectorAll('input[type="text"], input[type="date"], input[type="file"], input[type="checkbox"]');
            inputs.forEach(function(input) {
                input.disabled = !input.disabled;
            });

            // Enable or disable delete buttons for uploaded files
            let deleteButtons = document.querySelectorAll('ul li button');
            deleteButtons.forEach(function(button) {
                button.disabled = !button.disabled;
            });

            // Call toggleDateCompletedAndRemarksFields function to update date completed and remarks fields
            toggleDateCompletedAndRemarksFields();

            // Toggle the visibility of the "Save Changes" button
            let saveChangesButton = document.getElementById("saveChangesButton");
            saveChangesButton.style.display = saveChangesButton.style.display === "none" ? "block" : "none";

            // Toggle the visibility of the div with id "spaceDiv"
            let spaceDiv = document.getElementsByClassName("space")[0];
            spaceDiv.style.display = saveChangesButton.style.display === "block" ? "none" : "block";
        }
    </script>

    <!-- Function to delete a file -->
    <script>
        function deleteFile(fileId) {
            // Confirm deletion
            let confirmDelete = confirm('Are you sure you want to delete this file?');

            // If confirmed, send an AJAX request to the DeleteFileServlet
            if (confirmDelete) {
                let xhr = new XMLHttpRequest();
                xhr.open("POST", "deleteFile");
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("fileId=" + fileId);
            }
        }
    </script>

    <!-- Script to display uploaded files -->
    <script>
        document.getElementById("file").addEventListener("change", function () {
            let fileList = document.getElementById("uploadedFiles");
            fileList.innerHTML = ""; // Clear the list

            let files = this.files;
            for (let i = 0; i < files.length; i++) {
                let listItem = document.createElement("li");
                listItem.textContent = files[i].name;
                fileList.appendChild(listItem);
            }
        });
    </script>

    <!-- Function to handle form submission -->
    <script>
        function handleSubmit() {
            // Iterate over all the checkboxes and set their corresponding boolean values
            let checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function(checkbox) {
                document.getElementById(checkbox.name).value = checkbox.checked;
            });
            // Submit the form
            document.getElementById("editProfileForm").submit();
        }
        // Function to open navigation menu
        function openNav() {
            document.getElementById("navMenu").style.width = "25vh";
        }
        // Function to close navigation menu
        function closeNav() {
            document.getElementById("navMenu").style.width = "0";
        }
    </script>

    <!-- Function for logout button -->
    <script>
        function confirmLogout() {
            let confirmLogout = confirm("Are you sure you want to log out?");
            if (confirmLogout) {
                window.location.href = "login.jsp"; // Redirect to login page
            }
        }
    </script>

    <script>
        // Variable to store the click count
        let clickCount = 0;
        let saveChangesPressed = false; // Flag to track if "Save Changes" button is pressed

        // Function to check if the form is modified
        function formIsModified() {
            // Check if any input field's value has been changed
            let inputs = document.querySelectorAll('input[type="text"], input[type="date"], input[type="checkbox"]');
            for (let i = 0; i < inputs.length; i++) {
                if (inputs[i].defaultValue !== inputs[i].value) {
                    return true; // Return true if any field is modified
                }
            }
            return false; // Return false if no field is modified
        }

        // Function to handle button click and increment clickCount
        function handleButtonClick() {
            clickCount++; // Increment the click count
        }

        // Function to handle "Save Changes" button click
        function handleSaveChangesClick() {
            saveChangesPressed = true; // Set the flag to true when "Save Changes" button is pressed
        }

        // Assign the handleButtonClick function to the window.onbeforeunload event
        window.onbeforeunload = function() {
            if (formIsModified() && clickCount > 0 && !saveChangesPressed) {
                return 'You have unsaved changes. Are you sure you want to leave this page?';
            }
        };

        // Event listener for the specific button
        document.getElementById("toggleEditing").addEventListener("click", handleButtonClick);
        // Event listener for the "Save Changes" button
        document.getElementById("saveChangesButton").addEventListener("click", handleSaveChangesClick);
    </script>

    <div class="bottom-line">
        Pixelated Games Inc.
    </div>

</form>
</body>
</html>