package com.example.empfilesrep;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class for a simple hello servlet.
 * This servlet handles the GET and POST requests and redirects to the login page.
 */
@WebServlet(name = "HelloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    /**
     * Handles the HTTP GET method.
     * This method redirects the client to the login page.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if the request for the GET could not be handled
     * @throws IOException if an input or output error is detected when the servlet handles the GET request
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        redirectToLoginPage(response, request);
    }

    /**
     * Handles the HTTP POST method.
     * This method redirects the client to the login page.
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if the request for the POST could not be handled
     * @throws IOException if an input or output error is detected when the servlet handles the POST request
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        redirectToLoginPage(response, request);
    }

    /**
     * Redirects the client to the login page.
     * This method retrieves the context path from the request and sends a redirect response to the client.
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @param request  the HttpServletRequest object that contains the request the client made of the servlet
     * @throws IOException if an input or output error is detected when the servlet handles the redirect
     */
    private void redirectToLoginPage(HttpServletResponse response, HttpServletRequest request) throws IOException {
        String contextPath = (request != null) ? request.getContextPath() : "";
        response.sendRedirect(contextPath + "/login");
    }
}