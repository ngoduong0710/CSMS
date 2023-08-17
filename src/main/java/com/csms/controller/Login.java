package com.csms.controller;

import com.csms.dal.AccountDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    private static final String USER_NAME = "username";
    private static final String USER_PASS = "password";
    private static final String USER_ROLE = "roll";
    private static final Logger logger = LogManager.getLogger();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String uname = request.getParameter(USER_NAME);
        String upass = request.getParameter(USER_PASS);
        AccountDAO adb = new AccountDAO();
        try {
            if (adb.checkLogin(uname, upass)) {
                logger.info("Login success");
                HttpSession session = request.getSession();
                session.setAttribute(USER_NAME, uname);
                session.setAttribute(USER_ROLE, adb.getRollId(uname));
                Cookie usernameCookie = new Cookie(USER_NAME, uname);
                usernameCookie.setMaxAge(86400);
                response.addCookie(usernameCookie);
                response.sendRedirect("home.jsp");
            } else {
                logger.info("Login failed");
                request.setAttribute("errorMessage", "Sai tên đăng nhập hoặc mật khẩu.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (IOException e) {
            logger.error("Error at Login", e);
        }
    }
}
