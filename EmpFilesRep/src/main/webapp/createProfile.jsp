<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Employee Records and File Repository/Create Profile</title>
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
      margin: 12vh auto 2vh;
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
    button:hover {
      background-color: #000040;
      color: goldenrod;
    }
    table {
      width: 100%;
      background-color: white;
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
  Create Profile
</div>

<div class="background"></div>

<form action="createProfile" method="post" enctype="multipart/form-data">
  <!-- EMPLOYEE DETAILS -->
  <h2>EMPLOYEE DETAILS</h2>
  <!-- First Name -->
  <label for="firstName">First Name: <span style="color: red;">*</span></label>
  <input type="text" id="firstName" name="firstName" required><br>
  <!-- Middle Name -->
  <label for="middleName">Middle Name: <span style="color: red;">*</span></label>
  <input type="text" id="middleName" name="middleName" required><br>
  <!-- Last Name -->
  <label for="lastName">Last Name: <span style="color: red;">*</span></label>
  <input type="text" id="lastName" name="lastName" required><br>
  <!-- Job Position -->
  <label for="jobPosition">Job Position: <span style="color: red;">*</span></label>
  <input type="text" id="jobPosition" name="jobPosition" required><br>
  <!-- Date Hired -->
  <label for="dateHired">Date Hired: <span style="color: red;">*</span></label>
  <input type="date" id="dateHired" name="dateHired" required><br>
  <br>
  <!-- Address -->
  <label for="address">Address: <span style="color: red;">*</span></label>
  <input type="text" id="address" name="address" required><br>
  <!-- Contact Number -->
  <label for="contactNumber">Contact Number: <span style="color: red;">*</span></label>
  <input type="text" id="contactNumber" name="contactNumber" required><br>
  <!-- Birthdate -->
  <label for="birthdate">Birthdate: <span style="color: red;">*</span></label>
  <input type="date" id="birthdate" name="birthdate" required><br>
  <br>
  <br>
  <hr style="border-top: 2px solid black;">

  <!-- GOVERNMENT NUMBERS -->
  <h2>GOVERNMENT NUMBERS</h2>
  <!-- SSS -->
  <label for="sss">SSS:</label>
  <input type="text" id="sss" name="sss"><br>
  <!-- TIN -->
  <label for="tin">TIN:</label>
  <input type="text" id="tin" name="tin"><br>
  <!-- PhilHealth -->
  <label for="philHealth">PhilHealth:</label>
  <input type="text" id="philHealth" name="philHealth"><br>
  <!-- PAG-IBIG -->
  <label for="pagIbig">PAG-IBIG:</label>
  <input type="text" id="pagIbig" name="pagIbig"><br>
  <br>
  <br>
  <hr style="border-top: 2px solid black;">

  <!-- EMERGENCY -->
  <h2>EMERGENCY CONTACT DETAILS</h2>
  <!-- Emergency Contact Name -->
  <label for="emergencyContactName">Emergency Contact Name: <span style="color: red;">*</span></label>
  <input type="text" id="emergencyContactName" name="emergencyContactName" required><br>
  <!-- Emergency Contact Number -->
  <label for="emergencyContactNumber">Emergency Contact Number: <span style="color: red;">*</span></label>
  <input type="text" id="emergencyContactNumber" name="emergencyContactNumber" required><br>
  <br>
  <br>
  <hr style="border-top: 2px solid black;">


  <!-- Script to enable editing of columns when checkbox is checked -->
  <script>
    function enableEditing(checkbox, dateId, remarksId, fileId) {
      let dateField = document.getElementById(dateId);
      let remarksField = document.getElementById(remarksId);
      let fileField = document.getElementById(fileId);
      let booleanValue = checkbox.checked;

      if (booleanValue) {
        dateField.disabled = false;
        remarksField.disabled = false;
        fileField.disabled = false;
      } else {
        dateField.disabled = true;
        remarksField.disabled = true;
        fileField.disabled = true;
        dateField.value = '';
        remarksField.value = '';
        fileField.value = '';
      }

      // Set the corresponding boolean value
      document.getElementById(checkbox.id).value = booleanValue.toString(); // Set boolean value as string
    }
  </script>

  <!-- Function to set isChecklistFile parameter -->
  <script>
    function setChecklistFileParameter(fileInputId, isChecklistFileId) {
      let fileInput = document.getElementById(fileInputId);
      let isChecklistFileInput = document.getElementById(isChecklistFileId);

      if (fileInput.files.length > 0) {
        // If a file is selected, set isChecklistFile to true
        isChecklistFileInput.value = "true";
      } else {
        // If no file is selected, set isChecklistFile to false
        isChecklistFileInput.value = "false";
      }
    }
  </script>


  <!-- ONBOARDING CHECKLIST -->
  <h2>ONBOARDING CHECKLIST</h2>
  <table border="1">
    <tr>
      <th>Checklist Item</th>
      <th>File</th>
      <th>Date Completed</th>
      <th>Remarks</th>
      <th>Check</th>
    </tr>
    <tr>
      <td style="text-align: center;">Employee Contract</td>
      <td style="text-align: center;">
        <input type="file" id="employeeContractFile" name="employeeContractFile" disabled onchange="setChecklistFileParameter('employeeContractFile', 'employeeContractIsChecklistFile')">
        <input type="hidden" id="employeeContractIsChecklistFile" name="employeeContractFile_isChecklistFile" value="false">
        <input type="hidden" name="employeeContractFile_checklistName" value="Employee Contract">
      </td>
      <td style="text-align: center;"><label for="employeeContractDateCompleted"></label><input type="date" id="employeeContractDateCompleted" name="employeeContractDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="employeeContractRemarks"></label><input type="text" id="employeeContractRemarks" name="employeeContractRemarks" disabled></td>
      <td>
        <label for="employeeContract"></label>
        <input type="checkbox" id="employeeContract" name="employeeContract" onclick="enableEditing(this, 'employeeContractDateCompleted', 'employeeContractRemarks', 'employeeContractFile')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Microsoft Account / Email Address</td>
      <td style="text-align: center;">
        <input type="file" id="microsoftAccountFile" name="microsoftAccountFile" disabled onchange="setChecklistFileParameter('microsoftAccountFile', 'microsoftAccountIsChecklistFile')">
        <input type="hidden" id="microsoftAccountIsChecklistFile" name="microsoftAccountFile_isChecklistFile" value="false">
        <input type="hidden" name="microsoftAccountFile_checklistName" value="Microsoft Account / Email Address">
      </td>
      <td style="text-align: center;"><label for="microsoftAccountDateCompleted"></label><input type="date" id="microsoftAccountDateCompleted" name="microsoftAccountDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="microsoftAccountRemarks"></label><input type="text" id="microsoftAccountRemarks" name="microsoftAccountRemarks" disabled></td>
      <td>
        <label for="microsoftAccount"></label>
        <input type="checkbox" id="microsoftAccount" name="microsoftAccount" onclick="enableEditing(this, 'microsoftAccountDateCompleted', 'microsoftAccountRemarks', 'microsoftAccountFile')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Issued Assets</td>
      <td style="text-align: center;">
        <input type="file" id="issuedAssetsFile" name="issuedAssetsFile" disabled onchange="setChecklistFileParameter('issuedAssetsFile', 'issuedAssetsIsChecklistFile')">
        <input type="hidden" id="issuedAssetsIsChecklistFile" name="issuedAssetsFile_isChecklistFile" value="false">
        <input type="hidden" name="issuedAssetsFile_checklistName" value="Issued Assets">
      </td>
      <td style="text-align: center;"><label for="issuedAssetsDateCompleted"></label><input type="date" id="issuedAssetsDateCompleted" name="issuedAssetsDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="issuedAssetsRemarks"></label><input type="text" id="issuedAssetsRemarks" name="issuedAssetsRemarks" disabled></td>
      <td>
        <label for="issuedAssets"></label>
        <input type="checkbox" id="issuedAssets" name="issuedAssets" onclick="enableEditing(this, 'issuedAssetsDateCompleted', 'issuedAssetsRemarks', 'issuedAssetsFile')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Required Licenses</td>
      <td style="text-align: center;">
        <input type="file" id="requiredLicensesFile" name="requiredLicensesFile" disabled onchange="setChecklistFileParameter('requiredLicensesFile', 'requiredLicensesIsChecklistFile')">
        <input type="hidden" id="requiredLicensesIsChecklistFile" name="requiredLicensesFile_isChecklistFile" value="false">
        <input type="hidden" name="requiredLicensesFile_checklistName" value="Required Licenses">
      </td>
      <td style="text-align: center;"><label for="requiredLicensesDateCompleted"></label><input type="date" id="requiredLicensesDateCompleted" name="requiredLicensesDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="requiredLicensesRemarks"></label><input type="text" id="requiredLicensesRemarks" name="requiredLicensesRemarks" disabled></td>
      <td>
        <label for="requiredLicenses"></label>
        <input type="checkbox" id="requiredLicenses" name="requiredLicenses" onclick="enableEditing(this, 'requiredLicensesDateCompleted', 'requiredLicensesRemarks', 'requiredLicensesFile')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Trello Invite</td>
      <td style="text-align: center;">
        <input type="file" id="trelloInviteFile" name="trelloInviteFile" disabled onchange="setChecklistFileParameter('trelloInviteFile', 'trelloInviteIsChecklistFile')">
        <input type="hidden" id="trelloInviteIsChecklistFile" name="trelloInviteFile_isChecklistFile" value="false">
        <input type="hidden" name="trelloInviteFile_checklistName" value="Trello Invite">
      </td>
      <td style="text-align: center;"><label for="trelloInviteDateCompleted"></label><input type="date" id="trelloInviteDateCompleted" name="trelloInviteDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="trelloInviteRemarks"></label><input type="text" id="trelloInviteRemarks" name="trelloInviteRemarks" disabled></td>
      <td>
        <label for="trelloInvite"></label>
        <input type="checkbox" id="trelloInvite" name="trelloInvite" onclick="enableEditing(this, 'trelloInviteDateCompleted', 'trelloInviteRemarks', 'trelloInviteFile')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Teams/Shifts</td>
      <td style="text-align: center;">
        <input type="file" id="teamsShiftsFile" name="teamsShiftsFile" disabled onchange="setChecklistFileParameter('teamsShiftsFile', 'teamsShiftsIsChecklistFile')">
        <input type="hidden" id="teamsShiftsIsChecklistFile" name="teamsShiftsFile_isChecklistFile" value="false">
        <input type="hidden" name="teamsShiftsFile_checklistName" value="Teams/Shifts">
      </td>
      <td style="text-align: center;"><label for="teamsShiftsDateCompleted"></label><input type="date" id="teamsShiftsDateCompleted" name="teamsShiftsDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="teamsShiftsRemarks"></label><input type="text" id="teamsShiftsRemarks" name="teamsShiftsRemarks" disabled></td>
      <td>
        <label for="teamsShifts"></label>
        <input type="checkbox" id="teamsShifts" name="teamsShifts" onclick="enableEditing(this, 'teamsShiftsDateCompleted', 'teamsShiftsRemarks', 'teamsShiftsFile')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Enrol to Payroll</td>
      <td style="text-align: center;">
        <input type="file" id="enrolToPayrollFile" name="enrolToPayrollFile" disabled onchange="setChecklistFileParameter('enrolToPayrollFile', 'enrolToPayrollIsChecklistFile')">
        <input type="hidden" id="enrolToPayrollIsChecklistFile" name="enrolToPayrollFile_isChecklistFile" value="false">
        <input type="hidden" name="enrolToPayrollFile_checklistName" value="Enrol to Payroll">
      </td>
      <td style="text-align: center;"><label for="enrolToPayrollDateCompleted"></label><input type="date" id="enrolToPayrollDateCompleted" name="enrolToPayrollDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="enrolToPayrollRemarks"></label><input type="text" id="enrolToPayrollRemarks" name="enrolToPayrollRemarks" disabled></td>
      <td>
        <label for="enrolToPayroll"></label>
        <input type="checkbox" id="enrolToPayroll" name="enrolToPayroll" onclick="enableEditing(this, 'enrolToPayrollDateCompleted', 'enrolToPayrollRemarks', 'enrolToPayrollFile')" value="false">
      </td>
    </tr>

  </table>
  <br>
  <br>
  <hr style="border-top: 2px solid black;">


  <!-- OFFBOARDING CHECKLIST -->
  <h2>OFFBOARDING CHECKLIST</h2>
  <table border="1">
    <tr>
      <th>Checklist Item</th>
      <th>File</th>
      <th>Date Completed</th>
      <th>Remarks</th>
      <th>Check</th>
    </tr>
    <tr>
      <td style="text-align: center;">Certificate of Employment</td>
      <td style="text-align: center;">
        <input type="file" id="certificateEmploymentFile" name="certificateEmploymentFile" disabled onchange="setChecklistFileParameter('certificateEmploymentFile', 'certificateEmploymentIsChecklistFile')">
        <input type="hidden" id="certificateEmploymentIsChecklistFile" name="certificateEmploymentFile_isChecklistFile" value="false">
        <input type="hidden" name="certificateEmploymentFile_checklistName" value="Certificate of Employment">
      </td>
      <td style="text-align: center;"><label for="certificateEmploymentDateCompleted"></label><input type="date" id="certificateEmploymentDateCompleted" name="certificateEmploymentDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="certificateEmploymentRemarks"></label><input type="text" id="certificateEmploymentRemarks" name="certificateEmploymentRemarks" disabled></td>
      <td>
        <label for="certificateEmployment"></label>
        <input type="checkbox" id="certificateEmployment" name="certificateEmployment" onclick="enableEditing(this, 'certificateEmploymentDateCompleted', 'certificateEmploymentRemarks', 'certificateEmploymentFile')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">BIR Form 2316</td>
      <td style="text-align: center;">
        <input type="file" id="birForm2316File" name="birForm2316File" disabled onchange="setChecklistFileParameter('birForm2316File', 'birForm2316IsChecklistFile')">
        <input type="hidden" id="birForm2316IsChecklistFile" name="birForm2316File_isChecklistFile" value="false">
        <input type="hidden" name="birForm2316File_checklistName" value="BIR Form 2316">
      </td>
      <td style="text-align: center;"><label for="birForm2316DateCompleted"></label><input type="date" id="birForm2316DateCompleted" name="birForm2316DateCompleted" disabled></td>
      <td style="text-align: center;"><label for="birForm2316Remarks"></label><input type="text" id="birForm2316Remarks" name="birForm2316Remarks" disabled></td>
      <td>
        <label for="birForm2316"></label>
        <input type="checkbox" id="birForm2316" name="birForm2316" onclick="enableEditing(this, 'birForm2316DateCompleted', 'birForm2316Remarks', 'birForm2316File')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Return of Issued Assets</td>
      <td style="text-align: center;">
        <input type="file" id="returnIssuedAssetsFile" name="returnIssuedAssetsFile" disabled onchange="setChecklistFileParameter('returnIssuedAssetsFile', 'returnIssuedAssetsIsChecklistFile')">
        <input type="hidden" id="returnIssuedAssetsIsChecklistFile" name="returnIssuedAssetsFile_isChecklistFile" value="false">
        <input type="hidden" name="returnIssuedAssetsFile_checklistName" value="Return of Issued Assets">
      </td>
      <td style="text-align: center;"><label for="returnIssuedAssetsDateCompleted"></label><input type="date" id="returnIssuedAssetsDateCompleted" name="returnIssuedAssetsDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="returnIssuedAssetsRemarks"></label><input type="text" id="returnIssuedAssetsRemarks" name="returnIssuedAssetsRemarks" disabled></td>
      <td>
        <label for="returnIssuedAssets"></label>
        <input type="checkbox" id="returnIssuedAssets" name="returnIssuedAssets" onclick="enableEditing(this, 'returnIssuedAssetsDateCompleted', 'returnIssuedAssetsRemarks', 'returnIssuedAssetsFile')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Quitclaim + Final Pay</td>
      <td style="text-align: center;">
        <input type="file" id="quitclaimFinalPayFile" name="quitclaimFinalPayFile" disabled onchange="setChecklistFileParameter('quitclaimFinalPayFile', 'quitclaimFinalPayIsChecklistFile')">
        <input type="hidden" id="quitclaimFinalPayIsChecklistFile" name="quitclaimFinalPayFile_isChecklistFile" value="false">
        <input type="hidden" name="quitclaimFinalPayFile_checklistName" value="Quitclaim + Final Pay">
      </td>
      <td style="text-align: center;"><label for="quitclaimFinalPayDateCompleted"></label><input type="date" id="quitclaimFinalPayDateCompleted" name="quitclaimFinalPayDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="quitclaimFinalPayRemarks"></label><input type="text" id="quitclaimFinalPayRemarks" name="quitclaimFinalPayRemarks" disabled></td>
      <td>
        <label for="quitclaimFinalPay"></label>
        <input type="checkbox" id="quitclaimFinalPay" name="quitclaimFinalPay" onclick="enableEditing(this, 'quitclaimFinalPayDateCompleted', 'quitclaimFinalPayRemarks', 'quitclaimFinalPayFile')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Knowledge Transfer Sheet</td>
      <td style="text-align: center;">
        <input type="file" id="knowledgeTransferSheetFile" name="knowledgeTransferSheetFile" disabled onchange="setChecklistFileParameter('knowledgeTransferSheetFile', 'knowledgeTransferSheetIsChecklistFile')">
        <input type="hidden" id="knowledgeTransferSheetIsChecklistFile" name="knowledgeTransferSheetFile_isChecklistFile" value="false">
        <input type="hidden" name="knowledgeTransferSheetFile_checklistName" value="Knowledge Transfer Sheet">
      </td>
      <td style="text-align: center;"><label for="knowledgeTransferSheetDateCompleted"></label><input type="date" id="knowledgeTransferSheetDateCompleted" name="knowledgeTransferSheetDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="knowledgeTransferSheetRemarks"></label><input type="text" id="knowledgeTransferSheetRemarks" name="knowledgeTransferSheetRemarks" disabled></td>
      <td>
        <label for="knowledgeTransferSheet"></label>
        <input type="checkbox" id="knowledgeTransferSheet" name="knowledgeTransferSheet" onclick="enableEditing(this, 'knowledgeTransferSheetDateCompleted', 'knowledgeTransferSheetRemarks', 'knowledgeTransferSheetFile')" value="false">
      </td>
    </tr>
  </table>
  <br>
  <br>
  <hr style="border-top: 2px solid black;">

  <!-- Script to toggle visibility and manage resignation details -->
  <script>
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
        resignationDateInput.required = true;
        lastDayInput.disabled = false;
        lastDayInput.required = true;
        finalPayReleaseDateInput.disabled = false;
        finalPayReleaseDateInput.required = true;
      } else {
        resignationDetails.style.display = "none";
        resignationDateInput.value = "";
        lastDayInput.value = "";
        finalPayReleaseDateInput.value = "";
        resignationDateInput.disabled = true;
        resignationDateInput.required = false;
        lastDayInput.disabled = true;
        lastDayInput.required = false;
        finalPayReleaseDateInput.disabled = true;
        finalPayReleaseDateInput.required = false;
      }

      // Set the corresponding boolean value
      document.getElementById("resigned").value = booleanValue ? 'true' : 'false'; // Set boolean value as string
    }

  </script>

  <!-- RESIGNATION DETAILS -->
  <h2>RESIGNATION DETAILS</h2>
  <!-- Centered Resigned label and checkbox -->
  <div style="text-align: center;">
    <label for="resigned" style="display: inline-block; width: 100px; text-align: center;">Resigned? </label>
    <input type="checkbox" id="resigned" name="resigned" onclick="toggleResignationDetails()" style="display: inline-block;" value="false">
  </div>
  <br>
  <div id="resignationDetails" style="display: none;">
    <!-- Resignation Date -->
    <label for="resignationDate">Resignation Date: <span style="color: red;">*</span></label>
    <input type="date" id="resignationDate" name="resignationDate" required disabled><br><br>
    <!-- Last Day -->
    <label for="lastDay">Last Day: <span style="color: red;">*</span></label>
    <input type="date" id="lastDay" name="lastDay" required disabled><br><br>
    <!-- Final Pay Release Date -->
    <label for="finalPayReleaseDate">Final Pay Release Date: <span style="color: red;">*</span></label>
    <input type="date" id="finalPayReleaseDate" name="finalPayReleaseDate" required disabled><br><br>
  </div>
  <br>
  <br>
  <hr style="border-top: 2px solid black;">



  <!-- FILE UPLOAD -->
  <h2>ADDITIONAL FILES UPLOAD</h2>
  <label for="file">Upload Additional File(s):</label>
  <input type="file" id="file" name="file" multiple><br><br>
  <input type="hidden" id="isChecklistFile" name="file_isChecklistFile" value="false">
  <input type="hidden" id="checklistName" name="file_checklistName" value="">

  <!-- Display uploaded files -->
  <h3>Uploaded Files:</h3>
  <ul id="uploadedFiles"></ul>
  <hr style="border-top: 2px solid black;">
  <br>

  <script>
    document.getElementById("file").addEventListener("change", function() {
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


  <!-- Submit Button -->
  <input type="submit" id="submitButton" value="Submit">

  <!-- Function for logout button -->
  <script>
    function confirmLogout() {
      let confirmLogout = confirm("Are you sure you want to log out?");
      if (confirmLogout) {
        window.location.href = "login.jsp"; // Redirect to login page
      }
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

  <script>
    let submitPressed = false; // Flag to track if "Submit" button is pressed

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

    // Function to handle "Save Changes" button click
    function handleSubmitClick() {
      submitPressed = true; // Set the flag to true when "Submit" button is pressed
    }

    // Assign the handleButtonClick function to the window.onbeforeunload event
    window.onbeforeunload = function() {
      if (formIsModified() && !submitPressed) {
        return 'You have unsaved changes. Are you sure you want to leave this page?';
      }
    };

    // Event listener for the "Submit" button
    document.getElementById("submitButton").addEventListener("click", handleSubmitClick);
  </script>

  <div class="bottom-line">
    Pixelated Games Inc.
  </div>

</form>
</body>
</html>