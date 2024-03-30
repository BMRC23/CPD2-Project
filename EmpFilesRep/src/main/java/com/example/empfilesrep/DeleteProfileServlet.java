package com.example.empfilesrep;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteProfileServlet", value = "/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve employee ID from request parameters
        int employeeId = Integer.parseInt(request.getParameter("id"));

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "LBYCPD2project";

        // SQL queries to delete employee files and employee record
        String deleteFilesSql = "DELETE FROM employeefiles WHERE employee_id = ?";
        String deleteEmployeeSql = "DELETE FROM employee WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            // Delete employee files associated with the employee
            try (PreparedStatement deleteFilesStmt = conn.prepareStatement(deleteFilesSql)) {
                deleteFilesStmt.setInt(1, employeeId);
                deleteFilesStmt.executeUpdate();
            }

            // Delete employee record
            try (PreparedStatement deleteEmployeeStmt = conn.prepareStatement(deleteEmployeeSql)) {
                deleteEmployeeStmt.setInt(1, employeeId);
                int rowsDeleted = deleteEmployeeStmt.executeUpdate();

                if (rowsDeleted > 0) {
                    // Deletion successful, redirect to dashboard or any other appropriate page
                    response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
                } else {
                    // Handle deletion failure
                    response.sendRedirect("error.jsp");
                }
            }
        } catch (SQLException ex) {
            // Handle database errors
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
