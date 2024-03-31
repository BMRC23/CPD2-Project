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

        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "MySQL JDBC Driver not found", e);
            return employees;
        }

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "LBYCPD2project";

        // SQL query to select all employees
        String sql = "SELECT * FROM employee";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            // Iterate through the result set and create Employee objects
            while (rs.next()) {
                int employeeId = rs.getInt("id");
                List<EmployeeFile> employeeFiles = getAllEmployeeFilesFromDatabase(employeeId);
                Employee employee = new Employee(
                        rs.getInt("id"),
                        rs.getString("firstName"),
                        rs.getString("middleName"),
                        rs.getString("lastName"),
                        rs.getString("jobPosition"),
                        rs.getObject("dateHired", LocalDate.class),
                        rs.getString("address"),
                        rs.getString("contactNumber"),
                        rs.getObject("birthdate", LocalDate.class),
                        rs.getString("sss"),
                        rs.getString("tin"),
                        rs.getString("philHealth"),
                        rs.getString("pagIbig"),
                        rs.getString("emergencyContactName"),
                        rs.getString("emergencyContactNumber"),
                        rs.getBoolean("employeeContract"),
                        rs.getObject("employeeContractDateCompleted", LocalDate.class),
                        rs.getString("employeeContractRemarks"),
                        rs.getBoolean("microsoftAccount"),
                        rs.getObject("microsoftAccountDateCompleted", LocalDate.class),
                        rs.getString("microsoftAccountRemarks"),
                        rs.getBoolean("issuedAssets"),
                        rs.getObject("issuedAssetsDateCompleted", LocalDate.class),
                        rs.getString("issuedAssetsRemarks"),
                        rs.getBoolean("requiredLicenses"),
                        rs.getObject("requiredLicensesDateCompleted", LocalDate.class),
                        rs.getString("requiredLicensesRemarks"),
                        rs.getBoolean("trelloInvite"),
                        rs.getObject("trelloInviteDateCompleted", LocalDate.class),
                        rs.getString("trelloInviteRemarks"),
                        rs.getBoolean("teamsShifts"),
                        rs.getObject("teamsShiftsDateCompleted", LocalDate.class),
                        rs.getString("teamsShiftsRemarks"),
                        rs.getBoolean("enrolToPayroll"),
                        rs.getObject("enrolToPayrollDateCompleted", LocalDate.class),
                        rs.getString("enrolToPayrollRemarks"),
                        rs.getBoolean("certificateEmployment"),
                        rs.getObject("certificateEmploymentDateCompleted", LocalDate.class),
                        rs.getString("certificateEmploymentRemarks"),
                        rs.getBoolean("birForm2316"),
                        rs.getObject("birForm2316DateCompleted", LocalDate.class),
                        rs.getString("birForm2316Remarks"),
                        rs.getBoolean("returnIssuedAssets"),
                        rs.getObject("returnIssuedAssetsDateCompleted", LocalDate.class),
                        rs.getString("returnIssuedAssetsRemarks"),
                        rs.getBoolean("quitclaimFinalPay"),
                        rs.getObject("quitclaimFinalPayDateCompleted", LocalDate.class),
                        rs.getString("quitclaimFinalPayRemarks"),
                        rs.getBoolean("knowledgeTransferSheet"),
                        rs.getObject("knowledgeTransferSheetDateCompleted", LocalDate.class),
                        rs.getString("knowledgeTransferSheetRemarks"),
                        rs.getBoolean("resigned"),
                        rs.getObject("resignationDate", LocalDate.class),
                        rs.getObject("lastDay", LocalDate.class),
                        rs.getObject("finalPayReleaseDate", LocalDate.class),
                        employeeFiles
                );
                employees.add(employee);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving employees from the database", e);
        }

        return employees;
    }


    public static List<EmployeeFile> getAllEmployeeFilesFromDatabase(int id) {
        List<EmployeeFile> employeeFiles = new ArrayList<>();

        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "MySQL JDBC Driver not found", e);
            return employeeFiles;
        }

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "LBYCPD2project";

        // SQL query to select all employee files
        String sql = "SELECT * FROM employeefiles WHERE employee_id = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            // Iterate through the result set and create EmployeeFile objects
            while (rs.next()) {
                EmployeeFile employeeFile = new EmployeeFile(
                        rs.getInt("id"),
                        rs.getInt("employee_id"),
                        rs.getString("filename"),
                        rs.getString("filetype"),
                        rs.getBytes("filedata")
                );
                employeeFiles.add(employeeFile);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving employee files from the database", e);
        }

        return employeeFiles;
    }

    public static List<Employee> getResignedEmployeesFromDatabase() {
        List<Employee> resignedEmployees = new ArrayList<>();

        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "MySQL JDBC Driver not found", e);
            return resignedEmployees;
        }
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "LBYCPD2project";

        // SQL query to select resigned employees
        String sql = "SELECT * FROM employee WHERE resigned = true";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            // Iterate through the result set and create Employee objects
            while (rs.next()) {
                int employeeId = rs.getInt("id");
                List<EmployeeFile> employeeFiles = getAllEmployeeFilesFromDatabase(employeeId);
                Employee employee = new Employee(
                        rs.getInt("id"),
                        rs.getString("firstName"),
                        rs.getString("middleName"),
                        rs.getString("lastName"),
                        rs.getString("jobPosition"),
                        rs.getObject("dateHired", LocalDate.class),
                        rs.getString("address"),
                        rs.getString("contactNumber"),
                        rs.getObject("birthdate", LocalDate.class),
                        rs.getString("sss"),
                        rs.getString("tin"),
                        rs.getString("philHealth"),
                        rs.getString("pagIbig"),
                        rs.getString("emergencyContactName"),
                        rs.getString("emergencyContactNumber"),
                        rs.getBoolean("employeeContract"),
                        rs.getObject("employeeContractDateCompleted", LocalDate.class),
                        rs.getString("employeeContractRemarks"),
                        rs.getBoolean("microsoftAccount"),
                        rs.getObject("microsoftAccountDateCompleted", LocalDate.class),
                        rs.getString("microsoftAccountRemarks"),
                        rs.getBoolean("issuedAssets"),
                        rs.getObject("issuedAssetsDateCompleted", LocalDate.class),
                        rs.getString("issuedAssetsRemarks"),
                        rs.getBoolean("requiredLicenses"),
                        rs.getObject("requiredLicensesDateCompleted", LocalDate.class),
                        rs.getString("requiredLicensesRemarks"),
                        rs.getBoolean("trelloInvite"),
                        rs.getObject("trelloInviteDateCompleted", LocalDate.class),
                        rs.getString("trelloInviteRemarks"),
                        rs.getBoolean("teamsShifts"),
                        rs.getObject("teamsShiftsDateCompleted", LocalDate.class),
                        rs.getString("teamsShiftsRemarks"),
                        rs.getBoolean("enrolToPayroll"),
                        rs.getObject("enrolToPayrollDateCompleted", LocalDate.class),
                        rs.getString("enrolToPayrollRemarks"),
                        rs.getBoolean("certificateEmployment"),
                        rs.getObject("certificateEmploymentDateCompleted", LocalDate.class),
                        rs.getString("certificateEmploymentRemarks"),
                        rs.getBoolean("birForm2316"),
                        rs.getObject("birForm2316DateCompleted", LocalDate.class),
                        rs.getString("birForm2316Remarks"),
                        rs.getBoolean("returnIssuedAssets"),
                        rs.getObject("returnIssuedAssetsDateCompleted", LocalDate.class),
                        rs.getString("returnIssuedAssetsRemarks"),
                        rs.getBoolean("quitclaimFinalPay"),
                        rs.getObject("quitclaimFinalPayDateCompleted", LocalDate.class),
                        rs.getString("quitclaimFinalPayRemarks"),
                        rs.getBoolean("knowledgeTransferSheet"),
                        rs.getObject("knowledgeTransferSheetDateCompleted", LocalDate.class),
                        rs.getString("knowledgeTransferSheetRemarks"),
                        rs.getBoolean("resigned"),
                        rs.getObject("resignationDate", LocalDate.class),
                        rs.getObject("lastDay", LocalDate.class),
                        rs.getObject("finalPayReleaseDate", LocalDate.class),
                        employeeFiles
                );
                resignedEmployees.add(employee);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving resigned employees from the database", e);
        }

        return resignedEmployees;
    }
    
    public static Employee getEmployeeById(int employeeId) {
        Employee employee = null;

        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "MySQL JDBC Driver not found", e);
            return null;
        }

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "LBYCPD2project";

        // SQL query to select an employee by ID
        String sql = "SELECT * FROM employee WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, employeeId);
            ResultSet rs = pstmt.executeQuery();

            // If the result set contains a row, create the Employee object
            if (rs.next()) {
                List<EmployeeFile> employeeFiles = getAllEmployeeFilesFromDatabase(employeeId);
                employee = new Employee(
                        rs.getInt("id"),
                        rs.getString("firstName"),
                        rs.getString("middleName"),
                        rs.getString("lastName"),
                        rs.getString("jobPosition"),
                        rs.getObject("dateHired", LocalDate.class),
                        rs.getString("address"),
                        rs.getString("contactNumber"),
                        rs.getObject("birthdate", LocalDate.class),
                        rs.getString("sss"),
                        rs.getString("tin"),
                        rs.getString("philHealth"),
                        rs.getString("pagIbig"),
                        rs.getString("emergencyContactName"),
                        rs.getString("emergencyContactNumber"),
                        rs.getBoolean("employeeContract"),
                        rs.getObject("employeeContractDateCompleted", LocalDate.class),
                        rs.getString("employeeContractRemarks"),
                        rs.getBoolean("microsoftAccount"),
                        rs.getObject("microsoftAccountDateCompleted", LocalDate.class),
                        rs.getString("microsoftAccountRemarks"),
                        rs.getBoolean("issuedAssets"),
                        rs.getObject("issuedAssetsDateCompleted", LocalDate.class),
                        rs.getString("issuedAssetsRemarks"),
                        rs.getBoolean("requiredLicenses"),
                        rs.getObject("requiredLicensesDateCompleted", LocalDate.class),
                        rs.getString("requiredLicensesRemarks"),
                        rs.getBoolean("trelloInvite"),
                        rs.getObject("trelloInviteDateCompleted", LocalDate.class),
                        rs.getString("trelloInviteRemarks"),
                        rs.getBoolean("teamsShifts"),
                        rs.getObject("teamsShiftsDateCompleted", LocalDate.class),
                        rs.getString("teamsShiftsRemarks"),
                        rs.getBoolean("enrolToPayroll"),
                        rs.getObject("enrolToPayrollDateCompleted", LocalDate.class),
                        rs.getString("enrolToPayrollRemarks"),
                        rs.getBoolean("certificateEmployment"),
                        rs.getObject("certificateEmploymentDateCompleted", LocalDate.class),
                        rs.getString("certificateEmploymentRemarks"),
                        rs.getBoolean("birForm2316"),
                        rs.getObject("birForm2316DateCompleted", LocalDate.class),
                        rs.getString("birForm2316Remarks"),
                        rs.getBoolean("returnIssuedAssets"),
                        rs.getObject("returnIssuedAssetsDateCompleted", LocalDate.class),
                        rs.getString("returnIssuedAssetsRemarks"),
                        rs.getBoolean("quitclaimFinalPay"),
                        rs.getObject("quitclaimFinalPayDateCompleted", LocalDate.class),
                        rs.getString("quitclaimFinalPayRemarks"),
                        rs.getBoolean("knowledgeTransferSheet"),
                        rs.getObject("knowledgeTransferSheetDateCompleted", LocalDate.class),
                        rs.getString("knowledgeTransferSheetRemarks"),
                        rs.getBoolean("resigned"),
                        rs.getObject("resignationDate", LocalDate.class),
                        rs.getObject("lastDay", LocalDate.class),
                        rs.getObject("finalPayReleaseDate", LocalDate.class),
                        employeeFiles
                );
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving employee from the database", e);
        }

        return employee;
    }

}
