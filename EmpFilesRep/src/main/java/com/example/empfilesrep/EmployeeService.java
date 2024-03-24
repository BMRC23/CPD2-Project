package com.example.empfilesrep;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.time.LocalDate;

public class EmployeeService {
    private static final Logger LOGGER = Logger.getLogger(EmployeeService.class.getName());

    public static List<Employee> getAllEmployeesFromDatabase() {
        List<Employee> employees = new ArrayList<>();

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/EmployeeList";
        String username = "root";
        String password = "LBYCPD2project";

        // SQL query to select all employees
        String sql = "SELECT * FROM employees";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            // Iterate through the result set and create Employee objects
            while (rs.next()) {
                Employee employee = new Employee(
                        rs.getString("firstName"),
                        rs.getString("middleName"),
                        rs.getString("lastName"),
                        rs.getString("jobPosition"),
                        rs.getObject("dateHired", LocalDate.class),
                        rs.getString("address"),
                        rs.getString("contactNumber"),
                        rs.getObject("birthdate", LocalDate.class),
                        rs.getString("sss"), // Optional, may be null
                        rs.getString("tin"), // Optional, may be null
                        rs.getString("philHealth"), // Optional, may be null
                        rs.getString("pagIbig"), // Optional, may be null
                        rs.getString("emergencyContactName"),
                        rs.getString("emergencyContactNumber"),
                        rs.getObject("employeeContractDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("employeeContractRemarks"), // Optional, may be null
                        rs.getObject("microsoftAccountDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("microsoftAccountRemarks"), // Optional, may be null
                        rs.getObject("issuedAssetsDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("issuedAssetsRemarks"), // Optional, may be null
                        rs.getObject("requiredLicensesDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("requiredLicensesRemarks"), // Optional, may be null
                        rs.getObject("trelloInviteDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("trelloInviteRemarks"), // Optional, may be null
                        rs.getObject("teamsShiftsDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("teamsShiftsRemarks"), // Optional, may be null
                        rs.getObject("enrolToPayrollDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("enrolToPayrollRemarks"), // Optional, may be null
                        rs.getObject("certificateEmploymentDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("certificateEmploymentRemarks"), // Optional, may be null
                        rs.getObject("birForm2316DateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("birForm2316Remarks"), // Optional, may be null
                        rs.getObject("returnIssuedAssetsDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("returnIssuedAssetsRemarks"), // Optional, may be null
                        rs.getObject("quitclaimFinalPayDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("quitclaimFinalPayRemarks"), // Optional, may be null
                        rs.getObject("knowledgeTransferSheetDateCompleted", LocalDate.class), // Optional, may be null
                        rs.getString("knowledgeTransferSheetRemarks"), // Optional, may be null
                        rs.getObject("resignationDate", LocalDate.class), // Optional, may be null
                        rs.getObject("lastDay", LocalDate.class), // Optional, may be null
                        rs.getObject("finalPayReleaseDate", LocalDate.class) // Optional, may be null
                );
                employees.add(employee);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving employees from the database", e);
        }

        return employees;
    }
}
