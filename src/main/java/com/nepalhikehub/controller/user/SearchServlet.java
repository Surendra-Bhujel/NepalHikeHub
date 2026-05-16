package com.nepalhikehub.controller.user;

import com.nepalhikehub.model.Trek;
import com.nepalhikehub.service.TrekService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/search")
public class SearchServlet extends HttpServlet {
    
    private TrekService trekService;
    
    @Override
    public void init() throws ServletException {
        trekService = new TrekService();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String keyword = req.getParameter("keyword");
        String difficulty = req.getParameter("difficulty");
        String region = req.getParameter("region");
        String minPrice = req.getParameter("minPrice");
        String maxPrice = req.getParameter("maxPrice");
        
        List<Trek> treks;
        
        if ((keyword != null && !keyword.isEmpty())) {
            treks = trekService.searchTreks(keyword);
        } else if (difficulty != null || region != null || minPrice != null || maxPrice != null) {
            treks = trekService.filterTreks(difficulty, region, minPrice, maxPrice);
        } else {
            treks = trekService.getActiveTreks();
        }
        
        req.setAttribute("treks", treks);
        req.setAttribute("keyword", keyword);
        req.setAttribute("difficulty", difficulty);
        req.setAttribute("region", region);
        req.setAttribute("minPrice", minPrice);
        req.setAttribute("maxPrice", maxPrice);
        req.getRequestDispatcher("/views/user/treks.jsp").forward(req, resp);
    }
}