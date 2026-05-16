<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - NepalHikeHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: #f0f2f5;
        }
        
        :root {
            --primary-dark: #2F4A85;
            --primary: #5A7FBA;
            --dark: #1D1E22;
            --white: #ffffff;
            --shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        .admin-nav {
            background: var(--primary-dark);
            color: white;
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .admin-nav .logo {
            font-size: 1.3rem;
            font-weight: 700;
        }
        
        .admin-nav .logo span {
            color: var(--primary);
        }
        
        .admin-container {
            display: flex;
            min-height: calc(100vh - 60px);
        }
        
        .sidebar {
            width: 260px;
            background: var(--white);
            box-shadow: var(--shadow);
            padding: 1.5rem;
        }
        
        .sidebar-menu {
            list-style: none;
        }
        
        .sidebar-menu li {
            margin-bottom: 0.5rem;
        }
        
        .sidebar-menu li a {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            padding: 0.8rem 1rem;
            color: var(--dark);
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s;
        }
        
        .sidebar-menu li a:hover,
        .sidebar-menu li a.active {
            background: var(--primary);
            color: white;
        }
        
        .main-content {
            flex: 1;
            padding: 1.5rem;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: var(--white);
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: var(--shadow);
        }
        
        .stat-card h3 {
            font-size: 1.8rem;
            color: var(--primary-dark);
        }
        
        .data-table {
            background: var(--white);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow);
        }
        
        .data-table table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .data-table th,
        .data-table td {
            padding: 0.8rem;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        .data-table th {
            background: var(--primary-dark);
            color: white;
        }
        
        .btn {
            padding: 0.3rem 0.8rem;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.8rem;
        }
        
        .btn-edit {
            background: #ffc107;
            color: #333;
        }
        
        .btn-delete {
            background: #dc3545;
            color: white;
        }
        
        @media (max-width: 768px) {
            .admin-container {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="admin-nav">
        <div class="logo">Nepal<span>HikeHub</span> <span style="font-size: 0.8rem;">Admin Panel</span></div>
        <div>
            <span>Welcome, <%= currentUser.getName() %></span>
            <a href="${pageContext.request.contextPath}/home.jsp" style="color: white; margin-left: 1rem;">View Site</a>
            <a href="${pageContext.request.contextPath}/signout" style="color: white; margin-left: 1rem;">Logout</a>
        </div>
    </div>
    
    <div class="admin-container">
        <div class="sidebar">
            <ul class="sidebar-menu">
                <li><a href="#" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="#"><i class="fas fa-hiking"></i> Manage Trek</a></li>
                <li><a href="#"><i class="fas fa-calendar-check"></i> Booking</a></li>
                <li><a href="#"><i class="fas fa-users"></i> Users</a></li>
                <li><a href="#"><i class="fas fa-envelope"></i> Messages</a></li>
                <li><a href="#"><i class="fas fa-credit-card"></i> Payment</a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <h2 style="margin-bottom: 1.5rem;">Dashboard</h2>
            
            <div class="stats-grid">
                <div class="stat-card">
                    <h3>156</h3>
                    <p>Total Bookings</p>
                </div>
                <div class="stat-card">
                    <h3>2,450</h3>
                    <p>Total Users</p>
                </div>
                <div class="stat-card">
                    <h3>12</h3>
                    <p>Pending Payments</p>
                </div>
                <div class="stat-card">
                    <h3>$85,230</h3>
                    <p>Total Revenue</p>
                </div>
            </div>
            
            <div class="data-table">
                <h3 style="padding: 1rem; border-bottom: 1px solid #eee;">Recent Bookings</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Customer</th>
                            <th>Trek</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Jack</td>
                            <td>Everest Base Camp Trek</td>
                            <td>2026-08-14</td>
                            <td>Confirmed</td>
                            <td><a href="#" class="btn btn-edit">Edit</a> <a href="#" class="btn btn-delete">Delete</a></td>
                        </tr>
                        <tr>
                            <td>Ram Gurung</td>
                            <td>Annapurna Circuit</td>
                            <td>2026-08-20</td>
                            <td>Pending</td>
                            <td><a href="#" class="btn btn-edit">Edit</a> <a href="#" class="btn btn-delete">Delete</a></td>
                        </tr>
                        <tr>
                            <td>Sita Rai</td>
                            <td>Langtang Valley</td>
                            <td>2026-09-01</td>
                            <td>Confirmed</td>
                            <td><a href="#" class="btn btn-edit">Edit</a> <a href="#" class="btn btn-delete">Delete</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>