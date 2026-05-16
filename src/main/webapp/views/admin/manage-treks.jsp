<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.service.TrekService" %>
<%@ page import="com.nepalhikehub.model.Trek" %>
<%@ page import="java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
    TrekService trekService = new TrekService();
    List<Trek> treks = trekService.getAllTreks();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Treks</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <h1>Manage Treks</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Difficulty</th>
            <th>Price</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <% for (Trek trek : treks) { %>
        <tr>
            <td><%= trek.getTrekId() %></td>
            <td><%= trek.getTrekName() %></td>
            <td><%= trek.getDifficulty() %></td>
            <td>$<%= trek.getPrice() %></td>
            <td><%= trek.isActive() ? "Active" : "Inactive" %></td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/manage-treks?action=edit&id=<%= trek.getTrekId() %>">Edit</a>
                <a href="${pageContext.request.contextPath}/admin/manage-treks?action=delete&id=<%= trek.getTrekId() %>" onclick="return confirm('Delete?')">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>