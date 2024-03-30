package com.example.empfilesrep;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ViewProfileServlet", value = "/viewProfile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the employee ID from the request parameters
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));


        // Retrieve the employee object from the database or service
        Employee employee = EmployeeService.getEmployeeById(employeeId);

        // Retrieve the files of the employee from the database
        List<EmployeeFile> files = EmployeeService.getAllEmployeeFilesFromDatabase(employeeId);

        // Check if the employee object is not null
        if (employee != null) {
            // Set the employee object as a request attribute
            request.setAttribute("employee", employee);
            request.setAttribute("files", files);

            // Forward the request to the JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/viewProfile.jsp");
            dispatcher.forward(request, response);
        } else {
            // Handle case where employee with given ID is not found
            // Redirect or display an error message
            response.sendRedirect("errorPage.jsp"); // Example redirection to an error page
        }
    }
}

