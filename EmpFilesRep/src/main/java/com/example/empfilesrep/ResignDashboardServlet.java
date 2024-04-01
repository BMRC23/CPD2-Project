package com.example.empfilesrep;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ResignDashboardServlet", value = "/resigndashboard")
public class ResignDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Retrieve only resigned employees from the database
            List<Employee> resignedEmployees = EmployeeService.getResignedEmployeesFromDatabase();

            // Set the list of resigned employees as an attribute in the request
            request.setAttribute("resignedEmployees", resignedEmployees);

            // Forward the request to the dashboard.jsp file for rendering
            request.getRequestDispatcher("/resigndashboard.jsp").forward(request, response);
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
