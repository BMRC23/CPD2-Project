<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Create Profile</title>
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
    .button-container {
      text-align: left;
      margin-bottom: 10px;
    }
    .button-container button {
      margin-right: 10px;
    }
    table {
      width: 100%;
    }
  </style>
</head>
<body>

<h1>Create Profile</h1>
<hr style="border-top: 4px solid black;">
<!--Back Button-->
<div class="button-container">
  <button onclick="window.location.href='dashboard.jsp'">Back to Dashboard</button>
</div>
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
  <table border="1">
    <tr>
      <th>Checklist Item</th>
      <th>Date Completed</th>
      <th>Remarks</th>
      <th>Check</th>
    </tr>
    <tr>
      <td style="text-align: center;">Employee Contract</td>
      <td style="text-align: center;"><label for="employeeContractDateCompleted"></label><input type="date" id="employeeContractDateCompleted" name="employeeContractDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="employeeContractRemarks"></label><input type="text" id="employeeContractRemarks" name="employeeContractRemarks" disabled></td>
      <td>
        <label for="employeeContract"></label>
        <input type="checkbox" id="employeeContract" name="employeeContract" onclick="enableEditing(this, 'employeeContractDateCompleted', 'employeeContractRemarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Microsoft Account / Email Address</td>
      <td style="text-align: center;"><label for="microsoftAccountDateCompleted"></label><input type="date" id="microsoftAccountDateCompleted" name="microsoftAccountDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="microsoftAccountRemarks"></label><input type="text" id="microsoftAccountRemarks" name="microsoftAccountRemarks" disabled></td>
      <td>
        <label for="microsoftAccount"></label>
        <input type="checkbox" id="microsoftAccount" name="microsoftAccount" onclick="enableEditing(this, 'microsoftAccountDateCompleted', 'microsoftAccountRemarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Issued Assets</td>
      <td style="text-align: center;"><label for="issuedAssetsDateCompleted"></label><input type="date" id="issuedAssetsDateCompleted" name="issuedAssetsDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="issuedAssetsRemarks"></label><input type="text" id="issuedAssetsRemarks" name="issuedAssetsRemarks" disabled></td>
      <td>
        <label for="issuedAssets"></label>
        <input type="checkbox" id="issuedAssets" name="issuedAssets" onclick="enableEditing(this, 'issuedAssetsDateCompleted', 'issuedAssetsRemarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Required Licenses</td>
      <td style="text-align: center;"><label for="requiredLicensesDateCompleted"></label><input type="date" id="requiredLicensesDateCompleted" name="requiredLicensesDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="requiredLicensesRemarks"></label><input type="text" id="requiredLicensesRemarks" name="requiredLicensesRemarks" disabled></td>
      <td>
        <label for="requiredLicenses"></label>
        <input type="checkbox" id="requiredLicenses" name="requiredLicenses" onclick="enableEditing(this, 'requiredLicensesDateCompleted', 'requiredLicensesRemarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Trello Invite</td>
      <td style="text-align: center;"><label for="trelloInviteDateCompleted"></label><input type="date" id="trelloInviteDateCompleted" name="trelloInviteDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="trelloInviteRemarks"></label><input type="text" id="trelloInviteRemarks" name="trelloInviteRemarks" disabled></td>
      <td>
        <label for="trelloInvite"></label>
        <input type="checkbox" id="trelloInvite" name="trelloInvite" onclick="enableEditing(this, 'trelloInviteDateCompleted', 'trelloInviteRemarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Teams/Shifts</td>
      <td style="text-align: center;"><label for="teamsShiftsDateCompleted"></label><input type="date" id="teamsShiftsDateCompleted" name="teamsShiftsDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="teamsShiftsRemarks"></label><input type="text" id="teamsShiftsRemarks" name="teamsShiftsRemarks" disabled></td>
      <td>
        <label for="teamsShifts"></label>
        <input type="checkbox" id="teamsShifts" name="teamsShifts" onclick="enableEditing(this, 'teamsShiftsDateCompleted', 'teamsShiftsRemarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Enrol to Payroll</td>
      <td style="text-align: center;"><label for="enrolToPayrollDateCompleted"></label><input type="date" id="enrolToPayrollDateCompleted" name="enrolToPayrollDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="enrolToPayrollRemarks"></label><input type="text" id="enrolToPayrollRemarks" name="enrolToPayrollRemarks" disabled></td>
      <td>
        <label for="enrolToPayroll"></label>
        <input type="checkbox" id="enrolToPayroll" name="enrolToPayroll" onclick="enableEditing(this, 'enrolToPayrollDateCompleted', 'enrolToPayrollRemarks')" value="false">
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
      <td style="text-align: center;">Certificate of Employment</td>
      <td style="text-align: center;"><label for="certificateEmploymentDateCompleted"></label><input type="date" id="certificateEmploymentDateCompleted" name="certificateEmploymentDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="certificateEmploymentRemarks"></label><input type="text" id="certificateEmploymentRemarks" name="certificateEmploymentRemarks" disabled></td>
      <td>
        <label for="certificateEmployment"></label>
        <input type="checkbox" id="certificateEmployment" name="certificateEmployment" onclick="enableEditing(this, 'certificateEmploymentDateCompleted', 'certificateEmploymentRemarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">BIR Form 2316</td>
      <td style="text-align: center;"><label for="birForm2316DateCompleted"></label><input type="date" id="birForm2316DateCompleted" name="birForm2316DateCompleted" disabled></td>
      <td style="text-align: center;"><label for="birForm2316Remarks"></label><input type="text" id="birForm2316Remarks" name="birForm2316Remarks" disabled></td>
      <td>
        <label for="birForm2316"></label>
        <input type="checkbox" id="birForm2316" name="birForm2316" onclick="enableEditing(this, 'birForm2316DateCompleted', 'birForm2316Remarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Return of Issued Assets</td>
      <td style="text-align: center;"><label for="returnIssuedAssetsDateCompleted"></label><input type="date" id="returnIssuedAssetsDateCompleted" name="returnIssuedAssetsDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="returnIssuedAssetsRemarks"></label><input type="text" id="returnIssuedAssetsRemarks" name="returnIssuedAssetsRemarks" disabled></td>
      <td>
        <label for="returnIssuedAssets"></label>
        <input type="checkbox" id="returnIssuedAssets" name="returnIssuedAssets" onclick="enableEditing(this, 'returnIssuedAssetsDateCompleted', 'returnIssuedAssetsRemarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Quitclaim + Final Pay</td>
      <td style="text-align: center;"><label for="quitclaimFinalPayDateCompleted"></label><input type="date" id="quitclaimFinalPayDateCompleted" name="quitclaimFinalPayDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="quitclaimFinalPayRemarks"></label><input type="text" id="quitclaimFinalPayRemarks" name="quitclaimFinalPayRemarks" disabled></td>
      <td>
        <label for="quitclaimFinalPay"></label>
        <input type="checkbox" id="quitclaimFinalPay" name="quitclaimFinalPay" onclick="enableEditing(this, 'quitclaimFinalPayDateCompleted', 'quitclaimFinalPayRemarks')" value="false">
      </td>
    </tr>
    <tr>
      <td style="text-align: center;">Knowledge Transfer Sheet</td>
      <td style="text-align: center;"><label for="knowledgeTransferSheetDateCompleted"></label><input type="date" id="knowledgeTransferSheetDateCompleted" name="knowledgeTransferSheetDateCompleted" disabled></td>
      <td style="text-align: center;"><label for="knowledgeTransferSheetRemarks"></label><input type="text" id="knowledgeTransferSheetRemarks" name="knowledgeTransferSheetRemarks" disabled></td>
      <td>
        <label for="knowledgeTransferSheet"></label>
        <input type="checkbox" id="knowledgeTransferSheet" name="knowledgeTransferSheet" onclick="enableEditing(this, 'knowledgeTransferSheetDateCompleted', 'knowledgeTransferSheetRemarks')" value="false">
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
    <label for="resignationDate">Resignation Date:</label>
    <input type="date" id="resignationDate" name="resignationDate" disabled><br><br>
    <!-- Last Day -->
    <label for="lastDay">Last Day:</label>
    <input type="date" id="lastDay" name="lastDay" disabled><br><br>
    <!-- Final Pay Release Date -->
    <label for="finalPayReleaseDate">Final Pay Release Date:</label>
    <input type="date" id="finalPayReleaseDate" name="finalPayReleaseDate" disabled><br><br>
  </div>
  <br>
  <br>
  <hr style="border-top: 2px solid black;">



  <!-- FILE UPLOAD -->
  <h2>FILE UPLOAD</h2>
  <label for="file">Upload File(s):</label>
  <input type="file" id="file" name="file" multiple><br><br>

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
  <input type="submit" value="Submit">
</form>
</body>
</html>
