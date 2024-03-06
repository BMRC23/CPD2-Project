package com.example.empfilesrep;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);

        if (AuthenticationService.authenticate(user)) {
            // Authentication successful, redirect to success page
            response.sendRedirect("dashboard");
        } else {
            // Authentication failed, redirect to error page with an error message
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests, for example, forward to the login page
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}