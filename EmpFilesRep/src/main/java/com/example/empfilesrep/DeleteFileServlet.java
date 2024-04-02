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
 * Servlet implementation class for deleting a file.
 * This servlet handles the POST request to delete a file.
 */
@WebServlet(name = "DeleteFileServlet", value = "/deleteFile")
public class DeleteFileServlet extends HttpServlet {

    /**
     * Handles the HTTP POST method used to delete a file.
     * This method retrieves the file ID from the request, deletes the file from the database, and redirects the client to the viewProfile.jsp page.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws IOException if an input or output error is detected when the servlet handles the POST request
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get the file ID parameter from the request
        int fileId = Integer.parseInt(request.getParameter("fileId"));

        // Delete the file from the database
        deleteFile(fileId);

        // Redirect the client to the viewProfile.jsp page
        response.sendRedirect("viewProfile.jsp");
    }

    /**
     * Deletes a file from the database.
     * This method establishes a connection to the database and executes a DELETE SQL statement to delete the file with the provided ID.
     * @param fileId the ID of the file to delete
     */
    private void deleteFile(int fileId) {
        // Establish Database connection
        DatabaseConnection db = new DatabaseConnection();

        // SQL query to delete a file by ID
        String deleteSqlFile = "DELETE FROM EmployeeFiles WHERE id=?";
        try (Connection conn = db.getConnection();
             PreparedStatement stmtDeleteFile = conn.prepareStatement(deleteSqlFile)) {
            // Set the file ID parameter in the DELETE SQL statement
            stmtDeleteFile.setInt(1, fileId);
            // Execute the DELETE SQL statement
            stmtDeleteFile.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}