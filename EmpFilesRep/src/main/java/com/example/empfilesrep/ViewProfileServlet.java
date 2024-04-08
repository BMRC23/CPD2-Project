package com.example.empfilesrep;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class for viewing an employee profile.
 * This servlet handles the GET request to display the profile of a specific employee.
 */
@WebServlet(name = "ViewProfileServlet", value = "/viewProfile")
public class ViewProfileServlet extends HttpServlet {
    /**
     * Handles the HTTP GET method used to display an employee profile.
     * This method retrieves the employee ID from the request parameters, fetches the corresponding employee and their files from the database,
     * and forwards the request to the profile view page for rendering.
     * If the employee does not exist, it redirects the client to an error page.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if the request for the GET could not be handled
     * @throws IOException if an input or output error is detected when the servlet handles the GET request
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the employee ID from the request parameters
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));

        // Retrieve the employee object from the database or service
        Employee employee = EmployeeService.getEmployeeById(employeeId);

        // Retrieve the files of the employee from the database
        List<EmployeeFile> additionalFiles = EmployeeService.getAdditionalEmployeeFilesFromDatabase(employeeId);
        List<EmployeeFile> checklistFiles = EmployeeService.getEmployeeChecklistFilesFromDatabase(employeeId);

        // Check if the employee object is not null
        if (employee != null) {
            // Set the employee object and their files as request attributes
            request.setAttribute("employee", employee);
            request.setAttribute("additionalFiles", additionalFiles);
            request.setAttribute("checklistFiles", checklistFiles);

            // Forward the request to the profile view page for rendering
            RequestDispatcher dispatcher = request.getRequestDispatcher("/viewProfile.jsp");
            dispatcher.forward(request, response);
        } else {
            // Handle case where employee with given ID is not found
            // Redirect to an error page
            response.sendRedirect("errorPage.jsp");
        }
    }
}