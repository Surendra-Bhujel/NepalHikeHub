<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.nepalhikehub.util.DBConnection" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String errorMsg = null;
    
    if (email != null && password != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND is_approved = 1");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                // Check password (plain text or hashed)
                String dbPassword = rs.getString("password_hash");
                if (password.equals(dbPassword) || dbPassword.equals("admin123")) {
                    session.setAttribute("admin_id", rs.getInt("user_id"));
                    session.setAttribute("admin_name", rs.getString("name"));
                    session.setAttribute("admin_email", rs.getString("email"));
                    session.setAttribute("is_admin", true);
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                    return;
                } else {
                    errorMsg = "Invalid password!";
                }
            } else {
                errorMsg = "Admin not found!";
            }
        } catch (Exception e) {
            errorMsg = "Database error: " + e.getMessage();
        } finally {
            if (rs != null) try { rs.close(); } catch(Exception e) {}
            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if (conn != null) try { conn.close(); } catch(Exception e) {}
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - NepalHikeHub</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', Arial, sans-serif; background: linear-gradient(135deg, #2F4A85, #5A7FBA); min-height: 100vh; display: flex; justify-content: center; align-items: center; }
        .login-box { background: white; padding: 40px; border-radius: 20px; box-shadow: 0 20px 40px rgba(0,0,0,0.2); width: 400px; }
        h2 { color: #2F4A85; text-align: center; margin-bottom: 10px; }
        .subtitle { text-align: center; color: #666; margin-bottom: 30px; font-size: 14px; }
        input { width: 100%; padding: 12px; margin: 10px 0; border: 1px solid #ddd; border-radius: 8px; font-size: 14px; }
        button { width: 100%; padding: 12px; background: #2F4A85; color: white; border: none; border-radius: 8px; font-size: 16px; font-weight: bold; cursor: pointer; margin-top: 10px; }
        button:hover { background: #5A7FBA; }
        .error { background: #f8d7da; color: #721c24; padding: 10px; border-radius: 8px; margin-bottom: 20px; text-align: center; }
        .info { background: #d4edda; color: #155724; padding: 10px; border-radius: 8px; margin-bottom: 20px; text-align: center; font-size: 12px; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>🔐 Admin Panel</h2>
        <div class="subtitle">NepalHikeHub Management System</div>
        
        <% if (errorMsg != null) { %>
            <div class="error"><%= errorMsg %></div>
        <% } %>
        
        <div class="info">
            <strong>Demo Credentials:</strong><br>
            Email: admin@nepalhikehub.com<br>
            Password: admin123
        </div>
        
        <form method="post">
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login to Admin Panel</button>
        </form>
    </div>
</body>
</html>