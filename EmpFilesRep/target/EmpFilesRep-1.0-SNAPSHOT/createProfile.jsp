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
    table {
      width: 100%;
    }
  </style>

  <script>
    // Function to format date to yyyy-MM-dd
    function formatDate(dateString) {
      var date = new Date(dateString);
      var year = date.getFullYear();
      var month = ('0' + (date.getMonth() + 1)).slice(-2);
      var day = ('0' + date.getDate()).slice(-2);
      return year + '-' + month + '-' + day;
    }

    // Function to format all date input fields
    // Function to format all date input fields
    function formatAllDates() {
      var dateFields = document.querySelectorAll("input[type='date']");
      dateFields.forEach(function(field) {
        if (field.value.trim() !== "") {
          field.value = formatDate(field.value);
        } else {
          // Handle empty date field appropriately
          console.error("Empty date field encountered.");
          // You can choose to set it to null or provide some default value
          // For now, let's set it to an empty string
          field.value = null; // or null, depending on your preference
        }
      });
    }


    // Function to enable/disable editing based on checkbox state
    function enableEditing(checkbox) {
      var row = checkbox.parentNode.parentNode;
      var cells = row.getElementsByTagName('input');
      for (var i = 1; i < cells.length - 1; i++) {
        cells[i].disabled = !checkbox.checked;
      }
    }
  </script>

</head>
<body>
<h1>Create Profile</h1>
<form action="createProfile" method="post">
  <!-- Add form fields for creating a new profile -->
  <!-- EMPLOYEE DETAILS -->
  <h2>EMPLOYEE DETAILS</h2>
  <!-- First Name -->
  <label for="firstName">First Name:</label>
  <input type="text" id="firstName" name="firstName" required><br>
  <!-- Middle Name -->
  <label for="middleName">Middle Name:</label>
  <input type="text" id="middleName" name="middleName" required><br>
  <!-- Last Name -->
  <label for="lastName">Last Name:</label>
  <input type="text" id="lastName" name="lastName" required><br>
  <!-- Job Position -->
  <label for="jobPosition">Job Position:</label>
  <input type="text" id="jobPosition" name="jobPosition" required><br>
  <!-- Date Hired -->
  <label for="dateHired">Date Hired:</label>
  <input type="date" id="dateHired" name="dateHired" required><br>
  <!-- Address -->
  <label for="address">Address:</label>
  <input type="text" id="address" name="address" required><br>
  <!-- Contact Number -->
  <label for="contactNumber">Contact Number:</label>
  <input type="text" id="contactNumber" name="contactNumber" required><br>
  <!-- Birthdate -->
  <label for="birthdate">Birthdate:</label>
  <input type="date" id="birthdate" name="birthdate" required><br>

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

  <!-- EMERGENCY -->
  <h2>EMERGENCY</h2>
  <!-- Emergency Contact Name -->
  <label for="emergencyContactName">Emergency Contact Name:</label>
  <input type="text" id="emergencyContactName" name="emergencyContactName" required><br>
  <!-- Emergency Contact Number -->
  <label for="emergencyContactNumber">Emergency Contact Number:</label>
  <input type="text" id="emergencyContactNumber" name="emergencyContactNumber" required><br>


  <!-- Script to enable editing of columns when checkbox is checked -->
  <script>
    function enableEditing(checkbox) {
      var row = checkbox.parentNode.parentNode;
      var cells = row.getElementsByTagName('td');
      for (var i = 1; i < cells.length; i++) {
        if (checkbox.checked) {
          cells[i].setAttribute('contenteditable', 'true');
        } else {
          cells[i].setAttribute('contenteditable', 'false');
        }
      }
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
      <td>Employee Contract</td>
      <td><label for="employeeContractDateCompleted"></label><input type="date" id="employeeContractDateCompleted" name="employeeContractDateCompleted"></td>
      <td><label for="employeeContractRemarks"></label><input type="text" id="employeeContractRemarks" name="employeeContractRemarks"></td>
      <td><label for="employeeContract"></label><input type="checkbox" id="employeeContract" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>Microsoft Account / Email Address</td>
      <td><label for="microsoftAccountDateCompleted"></label><input type="date" id="microsoftAccountDateCompleted" name="microsoftAccountDateCompleted"></td>
      <td><label for="microsoftAccountRemarks"></label><input type="text" id="microsoftAccountRemarks" name="microsoftAccountRemarks"></td>
      <td><label for="microsoftAccount"></label><input type="checkbox" id="microsoftAccount" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>Issued Assets</td>
      <td><label for="issuedAssetsDateCompleted"></label><input type="date" id="issuedAssetsDateCompleted" name="issuedAssetsDateCompleted"></td>
      <td><label for="issuedAssetsRemarks"></label><input type="text" id="issuedAssetsRemarks" name="issuedAssetsRemarks"></td>
      <td><label for="issuedAssets"></label><input type="checkbox" id="issuedAssets" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>Required Licenses</td>
      <td><label for="requiredLicensesDateCompleted"></label><input type="date" id="requiredLicensesDateCompleted" name="requiredLicensesDateCompleted"></td>
      <td><label for="requiredLicensesRemarks"></label><input type="text" id="requiredLicensesRemarks" name="requiredLicensesRemarks"></td>
      <td><label for="requiredLicenses"></label><input type="checkbox" id="requiredLicenses" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>Trello Invite</td>
      <td><label for="trelloInviteDateCompleted"></label><input type="date" id="trelloInviteDateCompleted" name="trelloInviteDateCompleted"></td>
      <td><label for="trelloInviteRemarks"></label><input type="text" id="trelloInviteRemarks" name="trelloInviteRemarks"></td>
      <td><label for="trelloInvite"></label><input type="checkbox" id="trelloInvite" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>Teams/Shifts</td>
      <td><label for="teamsShiftsDateCompleted"></label><input type="date" id="teamsShiftsDateCompleted" name="teamsShiftsDateCompleted"></td>
      <td><label for="teamsShiftsRemarks"></label><input type="text" id="teamsShiftsRemarks" name="teamsShiftsRemarks"></td>
      <td><label for="teamsShifts"></label><input type="checkbox" id="teamsShifts" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>Enrol to Payroll</td>
      <td><label for="enrolToPayrollDateCompleted"></label><input type="date" id="enrolToPayrollDateCompleted" name="enrolToPayrollDateCompleted"></td>
      <td><label for="enrolToPayrollRemarks"></label><input type="text" id="enrolToPayrollRemarks" name="enrolToPayrollRemarks"></td>
      <td><label for="enrolToPayroll"></label><input type="checkbox" id="enrolToPayroll" onchange="enableEditing(this)"></td>
    </tr>
  </table>

  <!-- OFFBOARDING CHECKLIST -->
  <h2>OFFBOARDING CHECKLIST</h2>
  <table border="1">
    <tr>
      <th>Checklist Item</th>
      <th>Date Completed</th>
      <th>Remarks</th>
      <th>Check</th>
    </tr>
    <tr>
      <td>Certificate of Employment</td>
      <td><label for="certificateEmploymentDateCompleted"></label><input type="date" id="certificateEmploymentDateCompleted" name="certificateEmploymentDateCompleted"></td>
      <td><label for="certificateEmploymentRemarks"></label><input type="text" id="certificateEmploymentRemarks" name="certificateEmploymentRemarks"></td>
      <td><label for="certificateEmployment"></label><input type="checkbox" id="certificateEmployment" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>BIR Form 2316</td>
      <td><label for="birForm2316DateCompleted"></label><input type="date" id="birForm2316DateCompleted" name="birForm2316DateCompleted"></td>
      <td><label for="birForm2316Remarks"></label><input type="text" id="birForm2316Remarks" name="birForm2316Remarks"></td>
      <td><label for="birForm2316"></label><input type="checkbox" id="birForm2316" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>Return of Issued Assets</td>
      <td><label for="returnIssuedAssetsDateCompleted"></label><input type="date" id="returnIssuedAssetsDateCompleted" name="returnIssuedAssetsDateCompleted"></td>
      <td><label for="returnIssuedAssetsRemarks"></label><input type="text" id="returnIssuedAssetsRemarks" name="returnIssuedAssetsRemarks"></td>
      <td><label for="returnIssuedAssets"></label><input type="checkbox" id="returnIssuedAssets" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>Quitclaim + Final Pay</td>
      <td><label for="quitclaimFinalPayDateCompleted"></label><input type="date" id="quitclaimFinalPayDateCompleted" name="quitclaimFinalPayDateCompleted"></td>
      <td><label for="quitclaimFinalPayRemarks"></label><input type="text" id="quitclaimFinalPayRemarks" name="quitclaimFinalPayRemarks"></td>
      <td><label for="quitclaimFinalPay"></label><input type="checkbox" id="quitclaimFinalPay" onchange="enableEditing(this)"></td>
    </tr>
    <tr>
      <td>Knowledge Transfer Sheet</td>
      <td><label for="knowledgeTransferSheetDateCompleted"></label><input type="date" id="knowledgeTransferSheetDateCompleted" name="knowledgeTransferSheetDateCompleted"></td>
      <td><label for="knowledgeTransferSheetRemarks"></label><input type="text" id="knowledgeTransferSheetRemarks" name="knowledgeTransferSheetRemarks"></td>
      <td><label for="knowledgeTransferSheet"></label><input type="checkbox" id="knowledgeTransferSheet" onchange="enableEditing(this)"></td>
    </tr>
  </table>

  <!-- Script to toggle visibility of resignation details -->
  <script>
    function toggleResignationDetails() {
      var checkbox = document.getElementById("resigned");
      var resignationDetails = document.getElementById("resignationDetails");
      if (checkbox.checked) {
        resignationDetails.style.display = "block";
      } else {
        resignationDetails.style.display = "none";
      }
    }
  </script>

  <!-- RESIGNATION DETAILS -->
  <h2>RESIGNATION DETAILS</h2>
  <!-- Resigned -->
  <label for="resigned">Resigned?</label>
  <input type="checkbox" id="resigned" name="resigned" onclick="toggleResignationDetails()"><br>
  <div id="resignationDetails" style="display: none;">
    <!-- Resignation Date -->
    <label for="resignationDate">Resignation Date:</label>
    <input type="date" id="resignationDate" name="resignationDate"><br>
    <!-- Last Day -->
    <label for="lastDay">Last Day:</label>
    <input type="date" id="lastDay" name="lastDay"><br>
    <!-- Final Pay Release Date -->
    <label for="finalPayReleaseDate">Final Pay Release Date:</label>
    <input type="date" id="finalPayReleaseDate" name="finalPayReleaseDate"><br>
  </div>

  <!-- FILE UPLOAD -->
  <h2>FILE UPLOAD</h2>
  <!-- Add file upload fields -->
  <!-- Submit Button -->
  <input type="button" value="Submit" onclick="formatAllDates(); document.forms[0].submit();">
</form>
</body>
</html>
