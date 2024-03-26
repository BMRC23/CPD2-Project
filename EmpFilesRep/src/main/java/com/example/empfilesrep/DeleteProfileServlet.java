package com.example.empfilesrep;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteProfileServlet", value = "/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve employee ID from request parameters
        int employeeId = Integer.parseInt(request.getParameter("id"));

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "your_database_password";

        // SQL query to delete employee record by ID
        String sql = "DELETE FROM employee WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            // Set employee ID parameter
            stmt.setInt(1, employeeId);

            // Execute the delete query
            int rowsDeleted = stmt.executeUpdate();

            if (rowsDeleted > 0) {
                // Deletion successful, redirect to dashboard or any other appropriate page
                response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
            } else {
                // Handle deletion failure
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException ex) {
            // Handle database errors
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
