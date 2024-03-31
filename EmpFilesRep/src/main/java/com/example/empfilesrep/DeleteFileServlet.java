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

@WebServlet("/deleteFile")
public class DeleteFileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the file ID parameter from the request
        int fileId = Integer.parseInt(request.getParameter("fileId"));

        // Delete the file from the database
        deleteFile(fileId);

        response.sendRedirect("viewProfile.jsp");
    }

    // Method to delete an uploaded file from the database
    private void deleteFile(int fileId) {
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "LBYCPD2project";

        String deleteSqlFile = "DELETE FROM EmployeeFiles WHERE id=?";
        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmtDeleteFile = conn.prepareStatement(deleteSqlFile)) {
            stmtDeleteFile.setInt(1, fileId);
            stmtDeleteFile.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
