package com.example.empfilesrep;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.format.DateTimeParseException;

@WebServlet(name = "CreateProfileServlet", value = "/createProfile")
public class CreateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "LBYCPD2project";

        // SQL query to insert employee data into the database
        String sql = "INSERT INTO employee (firstName, middleName, lastName, jobPosition, dateHired, address, contactNumber, birthdate, sss, tin, philHealth, pagIbig, emergencyContactName, emergencyContactNumber, employeeContractDateCompleted, " +
                "employeeContractRemarks, microsoftAccountDateCompleted, microsoftAccountRemarks, issuedAssetsDateCompleted, issuedAssetsRemarks, requiredLicensesDateCompleted, requiredLicensesRemarks, trelloInviteDateCompleted, trelloInviteRemarks, " +
                "teamsShiftsDateCompleted, teamsShiftsRemarks, enrolToPayrollDateCompleted, enrolToPayrollRemarks, certificateEmploymentDateCompleted, certificateEmploymentRemarks, birForm2316DateCompleted, birForm2316Remarks, returnIssuedAssetsDateCompleted, " +
                "returnIssuedAssetsRemarks, quitclaimFinalPayDateCompleted, quitclaimFinalPayRemarks, knowledgeTransferSheetDateCompleted, knowledgeTransferSheetRemarks, resignationDate, lastDay, finalPayReleaseDate) " + // Add the name of the missing column here
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set values for the prepared statement
            stmt.setString(1, firstName);
            stmt.setString(2, middleName);
            stmt.setString(3, lastName);
            stmt.setString(4, jobPosition);
            stmt.setDate(5, dateHired != null ? java.sql.Date.valueOf(dateHired) : null);
            stmt.setString(6, address);
            stmt.setString(7, contactNumber);
            stmt.setDate(8, birthdate != null ? java.sql.Date.valueOf(birthdate) : null);
            stmt.setString(9, sss);
            stmt.setString(10, tin);
            stmt.setString(11, philHealth);
            stmt.setString(12, pagIbig);
            stmt.setString(13, emergencyContactName);
            stmt.setString(14, emergencyContactNumber);
            stmt.setDate(15, employeeContractDateCompleted != null ? java.sql.Date.valueOf(employeeContractDateCompleted) : null);
            stmt.setString(16, employeeContractRemarks);
            stmt.setDate(17, microsoftAccountDateCompleted != null ? java.sql.Date.valueOf(microsoftAccountDateCompleted) : null);
            stmt.setString(18, microsoftAccountRemarks);
            stmt.setDate(19, issuedAssetsDateCompleted != null ? java.sql.Date.valueOf(issuedAssetsDateCompleted) : null);
            stmt.setString(20, issuedAssetsRemarks);
            stmt.setDate(21, requiredLicensesDateCompleted != null ? java.sql.Date.valueOf(requiredLicensesDateCompleted) : null);
            stmt.setString(22, requiredLicensesRemarks);
            stmt.setDate(23, trelloInviteDateCompleted != null ? java.sql.Date.valueOf(trelloInviteDateCompleted) : null);
            stmt.setString(24, trelloInviteRemarks);
            stmt.setDate(25, teamsShiftsDateCompleted != null ? java.sql.Date.valueOf(teamsShiftsDateCompleted) : null);
            stmt.setString(26, teamsShiftsRemarks);
            stmt.setDate(27, enrolToPayrollDateCompleted != null ? java.sql.Date.valueOf(enrolToPayrollDateCompleted) : null);
            stmt.setString(28, enrolToPayrollRemarks);
            stmt.setDate(29, certificateEmploymentDateCompleted != null ? java.sql.Date.valueOf(certificateEmploymentDateCompleted) : null);
            stmt.setString(30, certificateEmploymentRemarks);
            stmt.setDate(31, birForm2316DateCompleted != null ? java.sql.Date.valueOf(birForm2316DateCompleted) : null);
            stmt.setString(32, birForm2316Remarks);
            stmt.setDate(33, returnIssuedAssetsDateCompleted != null ? java.sql.Date.valueOf(returnIssuedAssetsDateCompleted) : null);
            stmt.setString(34, returnIssuedAssetsRemarks);
            stmt.setDate(35, quitclaimFinalPayDateCompleted != null ? java.sql.Date.valueOf(quitclaimFinalPayDateCompleted) : null);
            stmt.setString(36, quitclaimFinalPayRemarks);
            stmt.setDate(37, knowledgeTransferSheetDateCompleted != null ? java.sql.Date.valueOf(knowledgeTransferSheetDateCompleted) : null);
            stmt.setString(38, knowledgeTransferSheetRemarks);
            stmt.setDate(39, resignationDate != null ? java.sql.Date.valueOf(resignationDate) : null);
            stmt.setDate(40, lastDay != null ? java.sql.Date.valueOf(lastDay) : null);
            stmt.setDate(41, finalPayReleaseDate != null ? java.sql.Date.valueOf(finalPayReleaseDate) : null);

            // Execute the query
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                // Employee inserted successfully, display pop-up message
                response.setContentType("text/html");
                String htmlResponse = "<html><script>window.alert('A new employee was inserted successfully!');</script></html>";
                response.getWriter().println(htmlResponse);
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