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

@WebServlet("/createProfile")
public class CreateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        String url = "jdbc:mysql://localhost:3306/EmployeeList";
        String username = "root";
        String password = "LBYCPD2project";

        // SQL query to insert employee data into the database
        String sql = "INSERT INTO employees (id, firstName, middleName, lastName, jobPosition, dateHired, address, contactNumber, birthdate, sss, tin, philHealth, pagIbig, emergencyContactName, emergencyContactNumber, employeeContractDateCompleted, " +
                "employeeContractRemarks, microsoftAccountDateCompleted, microsoftAccountRemarks, issuedAssetsDateCompleted, issuedAssetsRemarks, requiredLicensesDateCompleted, requiredLicensesRemarks, trelloInviteDateCompleted, trelloInviteRemarks, " +
                "teamsShiftsDateCompleted, teamsShiftsRemarks, enrolToPayrollDateCompleted, enrolToPayrollRemarks, certificateEmploymentDateCompleted, certificateEmploymentRemarks, birForm2316DateCompleted, birForm2316Remarks, returnIssuedAssetsDateCompleted, " +
                "returnIssuedAssetsRemarks, quitclaimFinalPayDateCompleted, quitclaimFinalPayRemarks, knowledgeTransferSheetDateCompleted, knowledgeTransferSheetRemarks, resignationDate, lastDay, finalPayReleaseDate) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set values for the prepared statement
            stmt.setString(2, firstName);
            stmt.setString(3, middleName);
            stmt.setString(4, lastName);
            stmt.setString(5, jobPosition);
            stmt.setDate(6, java.sql.Date.valueOf(dateHired));
            stmt.setString(7, address);
            stmt.setString(8, contactNumber);
            stmt.setDate(9, java.sql.Date.valueOf(birthdate));
            stmt.setString(10, sss);
            stmt.setString(11, tin);
            stmt.setString(12, philHealth);
            stmt.setString(13, pagIbig);
            stmt.setString(14, emergencyContactName);
            stmt.setString(15, emergencyContactNumber);
            stmt.setDate(16, java.sql.Date.valueOf(employeeContractDateCompleted));
            stmt.setString(17, employeeContractRemarks);
            stmt.setDate(18, java.sql.Date.valueOf(microsoftAccountDateCompleted));
            stmt.setString(19, microsoftAccountRemarks);
            stmt.setDate(20, java.sql.Date.valueOf(issuedAssetsDateCompleted));
            stmt.setString(21, issuedAssetsRemarks);
            stmt.setDate(22, java.sql.Date.valueOf(requiredLicensesDateCompleted));
            stmt.setString(23, requiredLicensesRemarks);
            stmt.setDate(24, java.sql.Date.valueOf(trelloInviteDateCompleted));
            stmt.setString(25, trelloInviteRemarks);
            stmt.setDate(26, java.sql.Date.valueOf(teamsShiftsDateCompleted));
            stmt.setString(27, teamsShiftsRemarks);
            stmt.setDate(28, java.sql.Date.valueOf(enrolToPayrollDateCompleted));
            stmt.setString(29, enrolToPayrollRemarks);
            stmt.setDate(30, java.sql.Date.valueOf(certificateEmploymentDateCompleted));
            stmt.setString(31, certificateEmploymentRemarks);
            stmt.setDate(32, java.sql.Date.valueOf(birForm2316DateCompleted));
            stmt.setString(33, birForm2316Remarks);
            stmt.setDate(34, java.sql.Date.valueOf(returnIssuedAssetsDateCompleted));
            stmt.setString(35, returnIssuedAssetsRemarks);
            stmt.setDate(36, java.sql.Date.valueOf(quitclaimFinalPayDateCompleted));
            stmt.setString(37, quitclaimFinalPayRemarks);
            stmt.setDate(38, java.sql.Date.valueOf(knowledgeTransferSheetDateCompleted));
            stmt.setString(39, knowledgeTransferSheetRemarks);
            stmt.setDate(40, java.sql.Date.valueOf(resignationDate));
            stmt.setDate(41, java.sql.Date.valueOf(lastDay));
            stmt.setDate(42, java.sql.Date.valueOf(finalPayReleaseDate));

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
            System.out.println("An error occurred while inserting the employee: " + ex.getMessage());
            ex.printStackTrace();
        }
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