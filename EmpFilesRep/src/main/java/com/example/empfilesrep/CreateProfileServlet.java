package com.example.empfilesrep;

import java.io.IOException;
import java.io.InputStream;
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

@WebServlet(name = "CreateProfileServlet", value = "/createProfile")
@MultipartConfig
public class CreateProfileServlet extends HttpServlet {
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
        String employeeContractRemarks = request.getParameter("employeeContractRemarks");
        String microsoftAccountRemarks = request.getParameter("microsoftAccountRemarks");
        String issuedAssetsRemarks = request.getParameter("issuedAssetsRemarks");
        String requiredLicensesRemarks = request.getParameter("requiredLicensesRemarks");
        String trelloInviteRemarks = request.getParameter("trelloInviteRemarks");
        String teamsShiftsRemarks = request.getParameter("teamsShiftsRemarks");
        String enrolToPayrollRemarks = request.getParameter("enrolToPayrollRemarks");

        // Offboarding Checklist parameters
        String certificateEmploymentRemarks = request.getParameter("certificateEmploymentRemarks");
        String birForm2316Remarks = request.getParameter("birForm2316Remarks");
        String returnIssuedAssetsRemarks = request.getParameter("returnIssuedAssetsRemarks");
        String quitclaimFinalPayRemarks = request.getParameter("quitclaimFinalPayRemarks");
        String knowledgeTransferSheetRemarks = request.getParameter("knowledgeTransferSheetRemarks");

        // Resignation parameters
        Boolean resigned = Boolean.valueOf(request.getParameter("resigned"));

        // Handle file uploads
        List<String> fileNames = new ArrayList<>();
        List<InputStream> fileContents = new ArrayList<>();
        List<String> fileTypes = new ArrayList<>();

        for (Part filePart : request.getParts()) {
            if ("file".equals(filePart.getName()) && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Get name of file
                String fileType = filePart.getContentType(); // Get the MIME type of the file
                fileNames.add(fileName);
                fileContents.add(filePart.getInputStream());
                fileTypes.add(fileType);
            }
        }


        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "LBYCPD2project";

        // SQL query to insert employee data into the database
        String sqlEmployee = "INSERT INTO employee (firstName, middleName, lastName, jobPosition, dateHired, address, contactNumber, birthdate, sss, tin, philHealth, pagIbig, emergencyContactName, emergencyContactNumber, employeeContractDateCompleted, " +
                "employeeContractRemarks, microsoftAccountDateCompleted, microsoftAccountRemarks, issuedAssetsDateCompleted, issuedAssetsRemarks, requiredLicensesDateCompleted, requiredLicensesRemarks, trelloInviteDateCompleted, trelloInviteRemarks, " +
                "teamsShiftsDateCompleted, teamsShiftsRemarks, enrolToPayrollDateCompleted, enrolToPayrollRemarks, certificateEmploymentDateCompleted, certificateEmploymentRemarks, birForm2316DateCompleted, birForm2316Remarks, returnIssuedAssetsDateCompleted, " +
                "returnIssuedAssetsRemarks, quitclaimFinalPayDateCompleted, quitclaimFinalPayRemarks, knowledgeTransferSheetDateCompleted, knowledgeTransferSheetRemarks, resigned, resignationDate, lastDay, finalPayReleaseDate) " + // Add the name of the missing column here
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlFile = "INSERT INTO EmployeeFiles (employee_id, filename, filetype, filedata) VALUES (?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, username, password);
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

            for (int i = 0; i < fileNames.size(); i++) {
                stmtFile.setInt(1, employeeId);
                stmtFile.setString(2, fileNames.get(i));
                stmtFile.setString(3, fileTypes.get(i));
                stmtFile.setBlob(4, fileContents.get(i));
                stmtFile.executeUpdate();
            }


            // Redirect to dashboard
            response.sendRedirect(request.getContextPath() + "/dashboard.jsp");

        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("createProfile.jsp").forward(request, response);
    }

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