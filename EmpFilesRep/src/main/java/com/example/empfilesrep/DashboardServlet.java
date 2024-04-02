package com.example.empfilesrep;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class for the dashboard.
 * This servlet handles the GET request to display the dashboard.
 */
@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet {

    /**
     * Handles the HTTP GET method used to display the dashboard.
     * This method retrieves the list of employees from the database, sets it as an attribute in the request,
     * and forwards the request to the dashboard.jsp file for rendering.
     * If an error occurs while retrieving the list of employees, it sends an alert script back to the client.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if the request for the GET could not be handled
     * @throws IOException if an input or output error is detected when the servlet handles the GET request
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve the list of employees from the database
            List<Employee> employees = EmployeeService.getCurrentEmployeesFromDatabase();

            // Set the list of employees as an attribute in the request
            request.setAttribute("employees", employees);

            // Forward the request to the dashboard.jsp file for rendering
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (RuntimeException e) {
            String errorMessage = e.getMessage();
            String script = "alert('" + errorMessage + "');";
            // Generate the script tag to display the alert message
            String alertScript = "<script>" + script + "</script>";
            // Send the alert script back to the client
            response.getWriter().println(alertScript);
        }
    }
}

