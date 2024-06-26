package com.example.empfilesrep;

import java.io.IOException;
import java.nio.file.Paths;
import java.sql.*;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class for creating a new employee profile.
 * This servlet handles the POST request to create a new employee profile and the GET request to display the form.
 */
@WebServlet(name = "CreateProfileServlet", value = "/createProfile")
@MultipartConfig
public class CreateProfileServlet extends HttpServlet {
    /**
     * Handles the HTTP POST method used to create a new employee profile.
     * This method retrieves form parameters, establishes a database connection, and inserts the new employee data into the database.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws IOException if an input or output error is detected when the servlet handles the POST request
     * @throws ServletException if the request for the POST could not be handled
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Retrieve required form parameters
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        String jobPosition = request.getParameter("jobPosition");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contactNumber");
        String emergencyContactName = request.getParameter("emergencyContactName");
        String emergencyContactNumber = request.getParameter("emergencyContactNumber");

        // Set optional parameters
        String sss = request.getParameter("sss");
        String tin = request.getParameter("tin");
        String philHealth = request.getParameter("philHealth");
        String pagIbig = request.getParameter("pagIbig");

        // Parse date fields with default value as null if empty
        LocalDate dateHired = parseDate(request.getParameter("dateHired"));
        LocalDate birthdate = parseDate(request.getParameter("birthdate"));
        LocalDate employeeContractDateCompleted = parseDate(request.getParameter("employeeContractDateCompleted"));
        LocalDate microsoftAccountDateCompleted = parseDate(request.getParameter("microsoftAccountDateCompleted"));
        LocalDate issuedAssetsDateCompleted = parseDate(request.getParameter("issuedAssetsDateCompleted"));
        LocalDate requiredLicensesDateCompleted = parseDate(request.getParameter("requiredLicensesDateCompleted"));
        LocalDate trelloInviteDateCompleted = parseDate(request.getParameter("trelloInviteDateCompleted"));
        LocalDate teamsShiftsDateCompleted = parseDate(request.getParameter("teamsShiftsDateCompleted"));
        LocalDate enrolToPayrollDateCompleted = parseDate(request.getParameter("enrolToPayrollDateCompleted"));
        LocalDate certificateEmploymentDateCompleted = parseDate(request.getParameter("certificateEmploymentDateCompleted"));
        LocalDate birForm2316DateCompleted = parseDate(request.getParameter("birForm2316DateCompleted"));
        LocalDate returnIssuedAssetsDateCompleted = parseDate(request.getParameter("returnIssuedAssetsDateCompleted"));
        LocalDate quitclaimFinalPayDateCompleted = parseDate(request.getParameter("quitclaimFinalPayDateCompleted"));
        LocalDate knowledgeTransferSheetDateCompleted = parseDate(request.getParameter("knowledgeTransferSheetDateCompleted"));
        LocalDate resignationDate = parseDate(request.getParameter("resignationDate"));
        LocalDate lastDay = parseDate(request.getParameter("lastDay"));
        LocalDate finalPayReleaseDate = parseDate(request.getParameter("finalPayReleaseDate"));

        // Onboarding Checklist parameters
        boolean employeeContract = Boolean.parseBoolean(request.getParameter("employeeContract"));
        String employeeContractRemarks = request.getParameter("employeeContractRemarks");
        boolean microsoftAccount = Boolean.parseBoolean(request.getParameter("microsoftAccount"));
        String microsoftAccountRemarks = request.getParameter("microsoftAccountRemarks");
        boolean issuedAssets = Boolean.parseBoolean(request.getParameter("issuedAssets"));
        String issuedAssetsRemarks = request.getParameter("issuedAssetsRemarks");
        boolean requiredLicenses = Boolean.parseBoolean(request.getParameter("requiredLicenses"));
        String requiredLicensesRemarks = request.getParameter("requiredLicensesRemarks");
        boolean trelloInvite = Boolean.parseBoolean(request.getParameter("trelloInvite"));
        String trelloInviteRemarks = request.getParameter("trelloInviteRemarks");
        boolean teamsShifts = Boolean.parseBoolean(request.getParameter("teamsShifts"));
        String teamsShiftsRemarks = request.getParameter("teamsShiftsRemarks");
        boolean enrolToPayroll = Boolean.parseBoolean(request.getParameter("enrolToPayroll"));
        String enrolToPayrollRemarks = request.getParameter("enrolToPayrollRemarks");

        // Offboarding Checklist parameters
        boolean certificateEmployment = Boolean.parseBoolean(request.getParameter("certificateEmployment"));
        String certificateEmploymentRemarks = request.getParameter("certificateEmploymentRemarks");
        boolean birForm2316 = Boolean.parseBoolean(request.getParameter("birForm2316"));
        String birForm2316Remarks = request.getParameter("birForm2316Remarks");
        boolean returnIssuedAssets = Boolean.parseBoolean(request.getParameter("returnIssuedAssets"));
        String returnIssuedAssetsRemarks = request.getParameter("returnIssuedAssetsRemarks");
        boolean quitclaimFinalPay = Boolean.parseBoolean(request.getParameter("quitclaimFinalPay"));
        String quitclaimFinalPayRemarks = request.getParameter("quitclaimFinalPayRemarks");
        boolean knowledgeTransferSheet = Boolean.parseBoolean(request.getParameter("knowledgeTransferSheet"));
        String knowledgeTransferSheetRemarks = request.getParameter("knowledgeTransferSheetRemarks");

        // Resignation parameters
        boolean resigned = Boolean.parseBoolean(request.getParameter("resigned"));

        // Handle file uploads
        List<EmployeeFile> employeeFiles = new ArrayList<>();

        for (Part filePart : request.getParts()) {
            if (filePart.getSize() > 0) {
                String submittedFileName = filePart.getSubmittedFileName();
                if (submittedFileName != null) {
                    String fileName = Paths.get(submittedFileName).getFileName().toString(); // Get name of file
                    String fileType = filePart.getContentType(); // Get the MIME type of the file
                    boolean isChecklistFile = Boolean.parseBoolean(request.getParameter(filePart.getName() + "_isChecklistFile")); // Get the isChecklistFile parameter
                    String checklistName = request.getParameter(filePart.getName() + "_checklistName"); // Get the checklistName parameter
                    employeeFiles.add(new EmployeeFile(0, 0, isChecklistFile, checklistName, fileName, fileType, filePart.getInputStream().readAllBytes()));
                }
            }
        }

        // Establish database connection
       DatabaseConnection db = new DatabaseConnection();

        // SQL query to insert employee data into the database
        String sqlEmployee = "INSERT INTO employee (firstName, middleName, lastName, jobPosition, dateHired, address, contactNumber, birthdate, sss, tin, philHealth, pagIbig, emergencyContactName, emergencyContactNumber, employeeContractDateCompleted, " +
                "employeeContractRemarks, microsoftAccountDateCompleted, microsoftAccountRemarks, issuedAssetsDateCompleted, issuedAssetsRemarks, requiredLicensesDateCompleted, requiredLicensesRemarks, trelloInviteDateCompleted, trelloInviteRemarks, " +
                "teamsShiftsDateCompleted, teamsShiftsRemarks, enrolToPayrollDateCompleted, enrolToPayrollRemarks, certificateEmploymentDateCompleted, certificateEmploymentRemarks, birForm2316DateCompleted, birForm2316Remarks, returnIssuedAssetsDateCompleted, " +
                "returnIssuedAssetsRemarks, quitclaimFinalPayDateCompleted, quitclaimFinalPayRemarks, knowledgeTransferSheetDateCompleted, knowledgeTransferSheetRemarks, resigned, resignationDate, lastDay, finalPayReleaseDate, employeeContract, microsoftAccount," +
                "issuedAssets, requiredLicenses, trelloInvite, teamsShifts, enrolToPayroll, certificateEmployment, birForm2316, returnIssuedAssets, quitClaimFinalPay, knowledgeTransferSheet) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlFile = "INSERT INTO EmployeeFiles (employee_id, isChecklistFile, checklistName, filename, filetype, filedata) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = db.getConnection();
             PreparedStatement stmtEmployee = conn.prepareStatement(sqlEmployee, Statement.RETURN_GENERATED_KEYS);
             PreparedStatement stmtFile = conn.prepareStatement(sqlFile)) {

            // Set values for the prepared statement
            stmtEmployee.setString(1, firstName);
            stmtEmployee.setString(2, middleName);
            stmtEmployee.setString(3, lastName);
            stmtEmployee.setString(4, jobPosition);
            stmtEmployee.setDate(5, dateHired != null ? java.sql.Date.valueOf(dateHired) : null);
            stmtEmployee.setString(6, address);
            stmtEmployee.setString(7, contactNumber);
            stmtEmployee.setDate(8, birthdate != null ? java.sql.Date.valueOf(birthdate) : null);
            stmtEmployee.setString(9, sss);
            stmtEmployee.setString(10, tin);
            stmtEmployee.setString(11, philHealth);
            stmtEmployee.setString(12, pagIbig);
            stmtEmployee.setString(13, emergencyContactName);
            stmtEmployee.setString(14, emergencyContactNumber);
            stmtEmployee.setDate(15, employeeContractDateCompleted != null ? java.sql.Date.valueOf(employeeContractDateCompleted) : null);
            stmtEmployee.setString(16, employeeContractRemarks);
            stmtEmployee.setDate(17, microsoftAccountDateCompleted != null ? java.sql.Date.valueOf(microsoftAccountDateCompleted) : null);
            stmtEmployee.setString(18, microsoftAccountRemarks);
            stmtEmployee.setDate(19, issuedAssetsDateCompleted != null ? java.sql.Date.valueOf(issuedAssetsDateCompleted) : null);
            stmtEmployee.setString(20, issuedAssetsRemarks);
            stmtEmployee.setDate(21, requiredLicensesDateCompleted != null ? java.sql.Date.valueOf(requiredLicensesDateCompleted) : null);
            stmtEmployee.setString(22, requiredLicensesRemarks);
            stmtEmployee.setDate(23, trelloInviteDateCompleted != null ? java.sql.Date.valueOf(trelloInviteDateCompleted) : null);
            stmtEmployee.setString(24, trelloInviteRemarks);
            stmtEmployee.setDate(25, teamsShiftsDateCompleted != null ? java.sql.Date.valueOf(teamsShiftsDateCompleted) : null);
            stmtEmployee.setString(26, teamsShiftsRemarks);
            stmtEmployee.setDate(27, enrolToPayrollDateCompleted != null ? java.sql.Date.valueOf(enrolToPayrollDateCompleted) : null);
            stmtEmployee.setString(28, enrolToPayrollRemarks);
            stmtEmployee.setDate(29, certificateEmploymentDateCompleted != null ? java.sql.Date.valueOf(certificateEmploymentDateCompleted) : null);
            stmtEmployee.setString(30, certificateEmploymentRemarks);
            stmtEmployee.setDate(31, birForm2316DateCompleted != null ? java.sql.Date.valueOf(birForm2316DateCompleted) : null);
            stmtEmployee.setString(32, birForm2316Remarks);
            stmtEmployee.setDate(33, returnIssuedAssetsDateCompleted != null ? java.sql.Date.valueOf(returnIssuedAssetsDateCompleted) : null);
            stmtEmployee.setString(34, returnIssuedAssetsRemarks);
            stmtEmployee.setDate(35, quitclaimFinalPayDateCompleted != null ? java.sql.Date.valueOf(quitclaimFinalPayDateCompleted) : null);
            stmtEmployee.setString(36, quitclaimFinalPayRemarks);
            stmtEmployee.setDate(37, knowledgeTransferSheetDateCompleted != null ? java.sql.Date.valueOf(knowledgeTransferSheetDateCompleted) : null);
            stmtEmployee.setString(38, knowledgeTransferSheetRemarks);
            stmtEmployee.setBoolean(39, resigned);
            stmtEmployee.setDate(40, resignationDate != null ? java.sql.Date.valueOf(resignationDate) : null);
            stmtEmployee.setDate(41, lastDay != null ? java.sql.Date.valueOf(lastDay) : null);
            stmtEmployee.setDate(42, finalPayReleaseDate != null ? java.sql.Date.valueOf(finalPayReleaseDate) : null);
            stmtEmployee.setBoolean(43, employeeContract);
            stmtEmployee.setBoolean(44, microsoftAccount);
            stmtEmployee.setBoolean(45, issuedAssets);
            stmtEmployee.setBoolean(46, requiredLicenses);
            stmtEmployee.setBoolean(47, trelloInvite);
            stmtEmployee.setBoolean(48, teamsShifts);
            stmtEmployee.setBoolean(49, enrolToPayroll);
            stmtEmployee.setBoolean(50, certificateEmployment);
            stmtEmployee.setBoolean(51, birForm2316);
            stmtEmployee.setBoolean(52, returnIssuedAssets);
            stmtEmployee.setBoolean(53, quitclaimFinalPay);
            stmtEmployee.setBoolean(54, knowledgeTransferSheet);

            int affectedRows = stmtEmployee.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating employee failed, no rows affected.");
            }

            // Retrieve the generated employee ID
            ResultSet generatedKeys = stmtEmployee.getGeneratedKeys();
            int employeeId;
            if (generatedKeys.next()) {
                employeeId = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Creating employee failed, no ID obtained.");
            }

            // Process file uploads
            for (EmployeeFile employeeFile : employeeFiles) {
                stmtFile.setInt(1, employeeId);
                stmtFile.setBoolean(2, employeeFile.getIsChecklistFile());
                stmtFile.setString(3, employeeFile.getChecklistName());
                stmtFile.setString(4, employeeFile.getFilename());
                stmtFile.setString(5, employeeFile.getFiletype());
                stmtFile.setBytes(6, employeeFile.getFiledata());
                stmtFile.executeUpdate();
            }

            // Redirect to dashboard
            response.sendRedirect(request.getContextPath() + "/dashboard.jsp");

        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    /**
     * Handles the HTTP GET method used to display the form for creating a new employee profile.
     * This method retrieves the list of employees from the database and forwards the request to the JSP page to display the form.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if the request for the GET could not be handled
     * @throws IOException if an input or output error is detected when the servlet handles the GET request
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filter = request.getParameter("filter");
        List<Employee> employees;

        // Check if the filter parameter is set to "resigned"
        if ("resigned".equals(filter)) {
            employees = EmployeeService.getResignedEmployeesFromDatabase();
        } else {
            employees = EmployeeService.getCurrentEmployeesFromDatabase();
        }
        request.setAttribute("employees", employees);
        request.getRequestDispatcher("createProfile.jsp").forward(request, response);
    }

    /**
     * Parses a date string into a LocalDate object.
     * This method returns null if the date string is null or empty, or if the date string cannot be parsed into a LocalDate object.
     * @param dateString the date string to parse
     * @return the parsed LocalDate object, or null if the date string is null or empty, or if the date string cannot be parsed
     */
    private LocalDate parseDate(String dateString) {
        if (dateString != null && !dateString.isEmpty()) {
            try {
                return LocalDate.parse(dateString);
            } catch (DateTimeParseException e) {
                // Log the parsing error if needed
                e.printStackTrace();
                // Return null or handle the error gracefully
                return null;
            }
        }
        return null;
    }
}
