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

@WebServlet(name = "DownloadFileServlet", value = "/downloadFile")
public class DownloadFileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int fileId = Integer.parseInt(request.getParameter("fileId"));

        String url = "jdbc:mysql://localhost:3306/employeelist";
        String username = "root";
        String password = "LBYCPD2project";


        String sql = "SELECT filename, filedata FROM EmployeeFiles WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, fileId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                String fileName = rs.getString("filename");
                InputStream fileData = rs.getBinaryStream("filedata");
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                OutputStream outputStream = response.getOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = fileData.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                fileData.close();
                outputStream.close();
            } else {
                response.getWriter().println("File not found.");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().println("Error downloading file.");
        }
    }
}
