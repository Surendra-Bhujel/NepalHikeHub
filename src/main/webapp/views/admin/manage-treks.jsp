<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.nepalhikehub.util.DBConnection" %>
<%
    Boolean isAdmin = (Boolean) session.getAttribute("is_admin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
        return;
    }
    
    // Handle Add/Delete actions
    String action = request.getParameter("action");
    String trekId = request.getParameter("id");
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        conn = DBConnection.getConnection();
        
        if ("delete".equals(action) && trekId != null) {
            pstmt = conn.prepareStatement("DELETE FROM treks WHERE trek_id = ?");
            pstmt.setInt(1, Integer.parseInt(trekId));
            pstmt.executeUpdate();
            pstmt.close();
        } else if ("add".equals(action)) {
            String name = request.getParameter("name");
            String difficulty = request.getParameter("difficulty");
            int days = Integer.parseInt(request.getParameter("days"));
            double price = Double.parseDouble(request.getParameter("price"));
            String region = request.getParameter("region");
            String desc = request.getParameter("description");
            
            pstmt = conn.prepareStatement("INSERT INTO treks (trek_name, difficulty, duration_days, price, region, description, is_active) VALUES (?, ?, ?, ?, ?, ?, 1)");
            pstmt.setString(1, name);
            pstmt.setString(2, difficulty);
            pstmt.setInt(3, days);
            pstmt.setDouble(4, price);
            pstmt.setString(5, region);
            pstmt.setString(6, desc);
            pstmt.executeUpdate();
            pstmt.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if (conn != null) try { conn.close(); } catch(Exception e) {}
    }
    
    // Get all treks
    List<Map<String, Object>> treks = new ArrayList<>();
    try {
        conn = DBConnection.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM treks ORDER BY trek_id DESC");
        while (rs.next()) {
            Map<String, Object> trek = new HashMap<>();
            trek.put("id", rs.getInt("trek_id"));
            trek.put("name", rs.getString("trek_name"));
            trek.put("difficulty", rs.getString("difficulty"));
            trek.put("days", rs.getInt("duration_days"));
            trek.put("price", rs.getDouble("price"));
            trek.put("region", rs.getString("region"));
            trek.put("description", rs.getString("description"));
            treks.add(trek);
        }
        rs.close();
        stmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Treks - Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background: #f0f2f5; }
        .sidebar { position: fixed; left: 0; top: 0; width: 260px; height: 100%; background: #1D1E22; color: white; padding: 20px; }
        .sidebar h2 { font-size: 20px; margin-bottom: 30px; padding-bottom: 15px; border-bottom: 1px solid #333; }
        .sidebar h2 span { color: #5A7FBA; }
        .sidebar a { display: block; padding: 12px 15px; color: #ccc; text-decoration: none; margin: 5px 0; border-radius: 8px; }
        .sidebar a:hover, .sidebar a.active { background: #2F4A85; color: white; }
        .sidebar a i { margin-right: 10px; }
        .main-content { margin-left: 260px; padding: 20px; }
        .top-bar { background: white; padding: 15px 25px; border-radius: 12px; margin-bottom: 25px; display: flex; justify-content: space-between; align-items: center; }
        .top-bar h1 { font-size: 24px; color: #2F4A85; }
        .card { background: white; border-radius: 12px; padding: 20px; margin-bottom: 20px; }
        .card h3 { margin-bottom: 15px; color: #2F4A85; }
        input, select, textarea { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 8px; }
        button { background: #2F4A85; color: white; padding: 10px 20px; border: none; border-radius: 8px; cursor: pointer; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; }
        .form-row { display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; }
        .btn-delete { background: #dc3545; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; font-size: 12px; }
        .logout-btn { background: #dc3545; color: white; padding: 8px 20px; border-radius: 8px; text-decoration: none; }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Nepal<span>HikeHub</span></h2>
        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin/manage-treks.jsp" class="active"><i class="fas fa-hiking"></i> Manage Treks</a>
        <a href="${pageContext.request.contextPath}/admin/manage-users.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="${pageContext.request.contextPath}/admin/manage-bookings.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
        <a href="${pageContext.request.contextPath}/admin/reports.jsp"><i class="fas fa-chart-bar"></i> Reports</a>
    </div>
    
    <div class="main-content">
        <div class="top-bar">
            <h1><i class="fas fa-hiking"></i> Manage Treks</h1>
            <a href="${pageContext.request.contextPath}/admin/logout.jsp" class="logout-btn">Logout</a>
        </div>
        
        <!-- Add Trek Form -->
        <div class="card">
            <h3>➕ Add New Trek</h3>
            <form method="post" action="${pageContext.request.contextPath}/admin/manage-treks.jsp?action=add">
                <div class="form-row">
                    <input type="text" name="name" placeholder="Trek Name" required>
                    <select name="difficulty" required>
                        <option value="Easy">Easy</option>
                        <option value="Moderate">Moderate</option>
                        <option value="Hard">Hard</option>
                    </select>
                </div>
                <div class="form-row">
                    <input type="number" name="days" placeholder="Duration (Days)" required>
                    <input type="number" step="0.01" name="price" placeholder="Price ($)" required>
                </div>
                <div class="form-row">
                    <input type="text" name="region" placeholder="Region">
                    <textarea name="description" placeholder="Description" rows="3"></textarea>
                </div>
                <button type="submit">Add Trek</button>
            </form>
        </div>
        
        <!-- Treks List -->
        <div class="card">
            <h3>📋 All Treks</h3>
            <table>
                <thead>
                    <tr><th>ID</th><th>Name</th><th>Difficulty</th><th>Days</th><th>Price</th><th>Region</th><th>Action</th></tr>
                </thead>
                <tbody>
                    <% for (Map<String, Object> trek : treks) { %>
                        <tr>
                            <td><%= trek.get("id") %></td>
                            <td><%= trek.get("name") %></td>
                            <td><%= trek.get("difficulty") %></td>
                            <td><%= trek.get("days") %> days</td>
                            <td>$<%= trek.get("price") %></td>
                            <td><%= trek.get("region") %></td>
                            <td><a href="${pageContext.request.contextPath}/admin/manage-treks.jsp?action=delete&id=<%= trek.get("id") %>" class="btn-delete" onclick="return confirm('Delete this trek?')">Delete</a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>