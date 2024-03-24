package com.example.empfilesrep;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the list of employees from the database
        List<Employee> employees = EmployeeService.getAllEmployeesFromDatabase();

        // Set the list of employees as an attribute in the request
        request.setAttribute("employees", employees);

        // Forward the request to the dashboard.jsp file for rendering
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
