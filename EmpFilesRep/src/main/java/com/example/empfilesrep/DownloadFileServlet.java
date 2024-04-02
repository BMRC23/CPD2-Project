package com.example.empfilesrep;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class for downloading a file.
 * This servlet handles the GET request to download a file.
 */
@WebServlet(name = "DownloadFileServlet", value = "/downloadFile")
public class DownloadFileServlet extends HttpServlet {

    /**
     * Handles the HTTP GET method used to download a file.
     * This method retrieves the file ID from the request, fetches the file data from the database,
     * and sends the file data as a response to the client.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if the request for the GET could not be handled
     * @throws IOException if an input or output error is detected when the servlet handles the GET request
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve file ID from request parameters
        int fileId = Integer.parseInt(request.getParameter("fileId"));

        // Establish Database connection
        DatabaseConnection db = new DatabaseConnection();

        // SQL query to fetch file data
        String sql = "SELECT filename, filedata FROM EmployeeFiles WHERE id = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set file ID parameter in the SQL query
            stmt.setInt(1, fileId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                // Retrieve file name and data from the result set
                String fileName = rs.getString("filename");
                InputStream fileData = rs.getBinaryStream("filedata");

                // Set response headers to initiate file download
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

                // Write file data to response output stream
                OutputStream outputStream = response.getOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = fileData.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                // Close input and output streams
                fileData.close();
                outputStream.close();
            } else {
                // Handle case where file is not found
                response.getWriter().println("File not found.");
            }

        } catch (SQLException ex) {
            // Handle database errors
            ex.printStackTrace();
            response.getWriter().println("Error downloading file.");
        }
    }
}