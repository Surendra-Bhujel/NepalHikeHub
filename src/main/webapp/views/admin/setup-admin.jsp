<%@ page import="java.sql.*" %>
<%@ page import="com.nepalhikehub.util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Setup Admin</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f0f2f5; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 20px; border-radius: 10px; }
        .success { color: green; }
        .error { color: red; }
        pre { background: #f4f4f4; padding: 10px; overflow-x: auto; }
    </style>
</head>
<body>
<div class="container">
    <h1>Admin Setup</h1>
    
    <%
        String action = request.getParameter("action");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            
            if ("create".equals(action)) {
                // Delete existing
                pstmt = conn.prepareStatement("DELETE FROM users WHERE email = 'admin@nepalhikehub.com'");
                pstmt.executeUpdate();
                pstmt.close();
                
                // Insert admin
                pstmt = conn.prepareStatement(
                    "INSERT INTO users (role_id, name, email, password_hash, phone, is_approved) VALUES (1, 'Admin User', 'admin@nepalhikehub.com', 'admin123', '9800000000', 1)"
                );
                int result = pstmt.executeUpdate();
                if (result > 0) {
                    out.println("<p class='success'>✅ Admin user created successfully!</p>");
                }
                pstmt.close();
            }
            
            // Show current admin
            pstmt = conn.prepareStatement("SELECT * FROM users WHERE email = 'admin@nepalhikehub.com'");
            rs = pstmt.executeQuery();
            if (rs.next()) {
                out.println("<h3>Current Admin:</h3>");
                out.println("<pre>");
                out.println("ID: " + rs.getInt("user_id"));
                out.println("Name: " + rs.getString("name"));
                out.println("Email: " + rs.getString("email"));
                out.println("Role ID: " + rs.getInt("role_id"));
                out.println("Password Hash: " + rs.getString("password_hash"));
                out.println("Approved: " + rs.getBoolean("is_approved"));
                out.println("</pre>");
            } else {
                out.println("<p class='error'>No admin found. Click Create Admin button.</p>");
            }
            rs.close();
            pstmt.close();
            
        } catch (Exception e) {
            out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(Exception e) {}
            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if (conn != null) try { conn.close(); } catch(Exception e) {}
        }
    %>
    
    <form method="get">
        <input type="hidden" name="action" value="create">
        <button type="submit">Create Admin User</button>
    </form>
    
    <hr>
    <h3>Login Credentials:</h3>
    <pre>
    	Email: admin@nepalhikehub.com
    	Password: admin123
    </pre>
    
    <p>
        <a href="${pageContext.request.contextPath}/admin-login.jsp">Go to Admin Login →</a>
    </p>
</div>
</body>
</html>