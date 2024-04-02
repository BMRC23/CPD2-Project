package com.example.empfilesrep;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class for user login.
 * This servlet handles the POST request for user authentication and GET request to display the login page.
 */
@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    /**
     * Handles the HTTP POST method used for user authentication.
     * This method retrieves the username and password from the request, authenticates the user,
     * and redirects the client to the dashboard if authentication is successful, else to the error page.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if the request for the POST could not be handled
     * @throws IOException if an input or output error is detected when the servlet handles the POST request
     */
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

    /**
     * Handles the HTTP GET method used to display the login page.
     * This method forwards the client to the login page.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if the request for the GET could not be handled
     * @throws IOException if an input or output error is detected when the servlet handles the GET request
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests, for example, forward to the login page
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}