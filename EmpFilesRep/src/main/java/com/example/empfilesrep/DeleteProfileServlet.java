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

/**
 * Servlet implementation class for deleting a profile.
 * This servlet handles the POST request to delete a profile.
 */
@WebServlet(name = "DeleteProfileServlet", value = "/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {

    /**
     * Handles the HTTP POST method used to delete a profile.
     * This method retrieves the employee ID from the request, deletes the employee's files and record from the database,
     * and redirects the client to the dashboard.jsp page if deletion is successful, else to error.jsp.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws IOException if an input or output error is detected when the servlet handles the POST request
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve employee ID from request parameters
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));

        // Establish Database connection
        DatabaseConnection db = new DatabaseConnection();

        // SQL queries to delete employee files and employee record
        String deleteFilesSql = "DELETE FROM employeefiles WHERE employee_id = ?";
        String deleteEmployeeSql = "DELETE FROM employee WHERE id = ?";

        try (Connection conn = db.getConnection()) {
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
                    // Deletion successful, redirect to dashboard
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