package com.nepalhikehub.controller;

import com.nepalhikehub.dao.UserDAO;
import com.nepalhikehub.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin-access")
public class AdminAccessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Redirect unauthenticated users to the admin login page
        resp.sendRedirect(req.getContextPath() + "/admin/admin-login.jsp");
    }
}