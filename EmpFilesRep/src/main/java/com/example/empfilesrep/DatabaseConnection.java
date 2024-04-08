package com.example.empfilesrep;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.io.InputStream;

/**
 * This class is responsible for establishing a connection to the database and creating the necessary tables if they do not exist.
 */
public class DatabaseConnection {

    private final Connection connection;

    /**
     * The constructor loads the database properties from a properties file, establishes a connection to the database, and creates the necessary tables.
     */
    public DatabaseConnection() {
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("db.properties")) {
            Properties prop = new Properties();
            prop.load(input);

            String url = prop.getProperty("db.url");
            String user = prop.getProperty("db.user");
            String password = prop.getProperty("db.password");

            Class.forName("org.h2.Driver");

            connection = DriverManager.getConnection(url, user, password);
            createDatabaseTables();
        } catch (IOException | SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading database properties", e);
        }
    }

    /**
     * This method returns the established database connection.
     * @return the established database connection.
     */
    public Connection getConnection() {
        return connection;
    }

    /**
     * This method creates the necessary tables in the database if they do not exist.
     */
    private void createDatabaseTables() {
        try (Statement stmt = connection.createStatement()) {
            String sql = "CREATE TABLE IF NOT EXISTS Employee " +
                    "(id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "firstName VARCHAR(255) NOT NULL, " +
                    "middleName VARCHAR(255) NOT NULL, " +
                    "lastName VARCHAR(255) NOT NULL, " +
                    "jobPosition VARCHAR(255) NOT NULL, " +
                    "dateHired DATE NOT NULL, " +
                    "address VARCHAR(255) NOT NULL, " +
                    "contactNumber VARCHAR(20) NOT NULL, " +
                    "birthdate DATE NOT NULL, " +
                    "sss VARCHAR(20), " +
                    "tin VARCHAR(20), " +
                    "philHealth VARCHAR(20), " +
                    "pagIbig VARCHAR(20), " +
                    "emergencyContactName VARCHAR(255) NOT NULL, " +
                    "emergencyContactNumber VARCHAR(20) NOT NULL, " +
                    "employeeContractDateCompleted DATE, " +
                    "employeeContractRemarks TEXT, " +
                    "microsoftAccountDateCompleted DATE, " +
                    "microsoftAccountRemarks TEXT, " +
                    "issuedAssetsDateCompleted DATE, " +
                    "issuedAssetsRemarks TEXT, " +
                    "requiredLicensesDateCompleted DATE, " +
                    "requiredLicensesRemarks TEXT, " +
                    "trelloInviteDateCompleted DATE, " +
                    "trelloInviteRemarks TEXT, " +
                    "teamsShiftsDateCompleted DATE, " +
                    "teamsShiftsRemarks TEXT, " +
                    "enrolToPayrollDateCompleted DATE, " +
                    "enrolToPayrollRemarks TEXT, " +
                    "certificateEmploymentDateCompleted DATE, " +
                    "certificateEmploymentRemarks TEXT, " +
                    "birForm2316DateCompleted DATE, " +
                    "birForm2316Remarks TEXT, " +
                    "returnIssuedAssetsDateCompleted DATE, " +
                    "returnIssuedAssetsRemarks TEXT, " +
                    "quitclaimFinalPayDateCompleted DATE, " +
                    "quitclaimFinalPayRemarks TEXT, " +
                    "knowledgeTransferSheetDateCompleted DATE, " +
                    "knowledgeTransferSheetRemarks TEXT, " +
                    "resigned BOOLEAN DEFAULT FALSE, " +
                    "resignationDate DATE, " +
                    "lastDay DATE, " +
                    "finalPayReleaseDate DATE, " +
                    "employeeContract boolean, " +
                    "microsoftAccount boolean, " +
                    "issuedAssets boolean, " +
                    "requiredLicenses boolean, " +
                    "trelloInvite boolean, " +
                    "teamsShifts boolean, " +
                    "enrolToPayroll boolean, " +
                    "certificateEmployment boolean, " +
                    "birForm2316 boolean, " +
                    "returnIssuedAssets boolean, " +
                    "quitclaimFinalPay boolean, " +
                    "knowledgeTransferSheet boolean); " +
                    "CREATE TABLE IF NOT EXISTS EmployeeFiles " +
                    "(id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "employee_id INT, " +
                    "isChecklistFile BOOLEAN DEFAULT FALSE NOT NULL, " +
                    "checklistName VARCHAR(255), " +
                    "filename VARCHAR(255) NOT NULL, " +
                    "filetype VARCHAR(100) NOT NULL, " +
                    "filedata BLOB NOT NULL, " +
                    "FOREIGN KEY (employee_id) REFERENCES Employee(id));";

            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating database tables", e);
        }
    }
}