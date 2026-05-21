<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.nepalhikehub.util.DBConnection" %>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
        return;
    }
    
    // Handle Add/Delete actions
    String action = request.getParameter("action");
    String trekId = request.getParameter("id");
    String successMsg = null;
    String errorMsg = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        conn = DBConnection.getConnection();
        
        if ("delete".equals(action) && trekId != null) {
            pstmt = conn.prepareStatement("DELETE FROM treks WHERE trek_id = ?");
            pstmt.setInt(1, Integer.parseInt(trekId));
            int deleted = pstmt.executeUpdate();
            if (deleted > 0) {
                successMsg = "Trek deleted successfully!";
            } else {
                errorMsg = "Failed to delete trek!";
            }
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
            int inserted = pstmt.executeUpdate();
            if (inserted > 0) {
                successMsg = "Trek added successfully!";
            } else {
                errorMsg = "Failed to add trek!";
            }
            pstmt.close();
        }
    } catch (Exception e) {
        errorMsg = "Error: " + e.getMessage();
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
        
        /* Sidebar */
        .sidebar { position: fixed; left: 0; top: 0; width: 260px; height: 100%; background: #1D1E22; color: white; padding: 20px; overflow-y: auto; }
        .sidebar h2 { font-size: 20px; margin-bottom: 30px; padding-bottom: 15px; border-bottom: 1px solid #333; }
        .sidebar h2 span { color: #5A7FBA; }
        .sidebar a { display: block; padding: 12px 15px; color: #ccc; text-decoration: none; margin: 5px 0; border-radius: 8px; transition: all 0.3s; }
        .sidebar a:hover, .sidebar a.active { background: #2F4A85; color: white; }
        .sidebar a i { margin-right: 10px; width: 20px; }
        
        /* Main Content */
        .main-content { margin-left: 260px; padding: 20px; }
        .top-bar { background: white; padding: 15px 25px; border-radius: 12px; margin-bottom: 25px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .top-bar h1 { font-size: 24px; color: #2F4A85; }
        .top-bar h1 i { margin-right: 10px; }
        
        /* Cards */
        .card { background: white; border-radius: 12px; padding: 20px; margin-bottom: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .card h3 { margin-bottom: 15px; color: #2F4A85; font-size: 18px; }
        .card h3 i { margin-right: 8px; }
        
        /* Form Styles */
        .form-row { display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; margin-bottom: 10px; }
        input, select, textarea { width: 100%; padding: 10px 12px; margin: 5px 0; border: 1px solid #ddd; border-radius: 8px; font-size: 14px; font-family: inherit; }
        input:focus, select:focus, textarea:focus { outline: none; border-color: #5A7FBA; }
        button { background: #2F4A85; color: white; padding: 10px 20px; border: none; border-radius: 8px; cursor: pointer; font-size: 14px; font-weight: 600; transition: all 0.3s; }
        button:hover { background: #5A7FBA; transform: translateY(-2px); }
        
        /* Table Styles */
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; font-weight: 600; color: #333; }
        tr:hover { background: #f8f9fa; }
        
        /* Alert Messages */
        .alert-success { background: #d4edda; color: #155724; padding: 12px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #28a745; }
        .alert-error { background: #f8d7da; color: #721c24; padding: 12px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #dc3545; }
        
        /* Buttons */
        .btn-delete { background: #dc3545; color: white; padding: 5px 12px; border-radius: 5px; text-decoration: none; font-size: 12px; transition: all 0.3s; }
        .btn-delete:hover { background: #c82333; }
        .btn-back { background: #6c757d; color: white; padding: 8px 20px; border-radius: 8px; text-decoration: none; font-size: 14px; transition: all 0.3s; }
        .btn-back:hover { background: #5a6268; }
        
        /* Responsive */
        @media (max-width: 768px) {
            .sidebar { width: 100%; height: auto; position: relative; }
            .main-content { margin-left: 0; }
            .form-row { grid-template-columns: 1fr; }
            table { display: block; overflow-x: auto; }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Nepal<span>HikeHub</span></h2>
        <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-treks.jsp" class="active"><i class="fas fa-hiking"></i> Manage Treks</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-users.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
        <a href="${pageContext.request.contextPath}/views/admin/reports.jsp"><i class="fas fa-chart-bar"></i> Reports & Analytics</a>
    </div>
    
    <div class="main-content">
        <div class="top-bar">
            <h1><i class="fas fa-hiking"></i> Manage Treks</h1>
            <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
        
        <!-- Success/Error Messages -->
        <% if (successMsg != null) { %>
            <div class="alert-success"><i class="fas fa-check-circle"></i> <%= successMsg %></div>
        <% } %>
        <% if (errorMsg != null) { %>
            <div class="alert-error"><i class="fas fa-exclamation-circle"></i> <%= errorMsg %></div>
        <% } %>
        
        <!-- Add Trek Form -->
        <div class="card">
            <h3><i class="fas fa-plus-circle"></i> Add New Trek</h3>
            <form method="post" action="${pageContext.request.contextPath}/views/admin/manage-treks.jsp?action=add">
                <div class="form-row">
                    <div>
                        <input type="text" name="name" placeholder="Trek Name" required>
                    </div>
                    <div>
                        <select name="difficulty" required>
                            <option value="">Select Difficulty</option>
                            <option value="Easy">Easy</option>
                            <option value="Moderate">Moderate</option>
                            <option value="Hard">Hard</option>
                            <option value="Extreme">Extreme</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div>
                        <input type="number" name="days" placeholder="Duration (Days)" required>
                    </div>
                    <div>
                        <input type="number" step="0.01" name="price" placeholder="Price ($)" required>
                    </div>
                </div>
                <div class="form-row">
                    <div>
                        <input type="text" name="region" placeholder="Region (e.g., Everest, Annapurna)">
                    </div>
                    <div>
                        <textarea name="description" placeholder="Trek Description" rows="3"></textarea>
                    </div>
                </div>
                <button type="submit"><i class="fas fa-save"></i> Add Trek</button>
            </form>
        </div>
        
        <!-- Treks List -->
        <div class="card">
            <h3><i class="fas fa-list"></i> All Treks</h3>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Trek Name</th>
                            <th>Difficulty</th>
                            <th>Days</th>
                            <th>Price</th>
                            <th>Region</th>
                            <th>Description</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (treks.isEmpty()) { %>
                            <tr>
                                <td colspan="8" style="text-align: center;">No treks found. Add your first trek!</td>
                            </tr>
                        <% } else { %>
                            <% for (Map<String, Object> trek : treks) { %>
                                <tr>
                                    <td><%= trek.get("id") %></td>
                                    <td><strong><%= trek.get("name") %></strong></td>
                                    <td>
                                        <span style="background: <%= 
                                            "Easy".equals(trek.get("difficulty")) ? "#28a745" : 
                                            "Moderate".equals(trek.get("difficulty")) ? "#ffc107" : 
                                            "Hard".equals(trek.get("difficulty")) ? "#fd7e14" : "#dc3545" %>; 
                                            color: white; padding: 3px 8px; border-radius: 12px; font-size: 11px;">
                                            <%= trek.get("difficulty") %>
                                        </span>
                                    </td>
                                    <td><%= trek.get("days") %> days</td>
                                    <td>$<%= trek.get("price") %></td>
                                    <td><%= trek.get("region") != null ? trek.get("region") : "-" %></td>
                                    <td style="max-width: 250px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                        <%= trek.get("description") != null ? trek.get("description") : "-" %>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/views/admin/manage-treks.jsp?action=delete&id=<%= trek.get("id") %>" 
                                           class="btn-delete" 
                                           onclick="return confirm('Are you sure you want to delete "<%= trek.get("name") %>"? This action cannot be undone.')">
                                            <i class="fas fa-trash"></i> Delete
                                        </a>
                                    </td>
                                </td>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>