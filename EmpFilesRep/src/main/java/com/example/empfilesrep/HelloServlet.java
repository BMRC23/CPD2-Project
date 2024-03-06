package com.example.empfilesrep;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HelloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        redirectToLoginPage(response, request);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        redirectToLoginPage(response, request);
    }

    private void redirectToLoginPage(HttpServletResponse response, HttpServletRequest request) throws IOException {
        String contextPath = (request != null) ? request.getContextPath() : "";
        response.sendRedirect(contextPath + "/login");
    }
}
