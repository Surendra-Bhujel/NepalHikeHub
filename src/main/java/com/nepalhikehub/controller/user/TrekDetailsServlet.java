package com.nepalhikehub.controller.user;

import com.nepalhikehub.dao.TrekDAO;
import com.nepalhikehub.model.Trek;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Handles: GET /trek/detail?trekId=3
 * PUBLIC — no login needed to view trek details.
 * AuthenticationFilter must allow /trek/detail (see AuthenticationFilter.java)
 */
@WebServlet("/trek/detail")
public class TrekDetailsServlet extends HttpServlet {

    private TrekDAO trekDAO;

    @Override
    public void init() throws ServletException {
        trekDAO = new TrekDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String trekIdParam = req.getParameter("trekId");

        if (trekIdParam == null || trekIdParam.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/views/trekking.jsp");
            return;
        }

        try {
            int trekId = Integer.parseInt(trekIdParam);
            Trek trek = trekDAO.getTrekById(trekId);

            if (trek == null || !trek.isActive()) {
                resp.sendRedirect(req.getContextPath() + "/views/trekking.jsp?error=Trek+not+found");
                return;
            }

            req.setAttribute("trek", trek);
            req.getRequestDispatcher("/views/trek-detail.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/views/trekking.jsp");
        }
    }
}
