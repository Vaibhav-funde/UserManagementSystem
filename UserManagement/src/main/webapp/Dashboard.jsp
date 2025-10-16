<%@ page import="java.util.*, com.Model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if user is logged in
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get total users and user list from request attributes
    Integer totalUsersObj = (Integer) request.getAttribute("totalUsers");
    int totalUsers = (totalUsersObj != null) ? totalUsersObj : 0;

    List<Users> userList = (List<Users>) request.getAttribute("userList");
    if (userList == null) userList = new ArrayList<>();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f5f7fa; margin:0; padding:0; }
        .container { width: 90%; margin: 40px auto; }
        .header-links { display: flex; justify-content: flex-end; gap: 10px; margin-bottom: 20px; }
        .header-links a { background: #007bff; color: white; padding: 8px 15px; border-radius: 5px; text-decoration: none; }
        .header-links a.logout { background: #dc3545; }
        .count-box { background: #007bff; color: white; padding: 15px; border-radius: 10px; width: fit-content; margin-bottom: 25px; }
        table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; }
        th, td { padding: 12px; border-bottom: 1px solid #ddd; text-align: left; }
        th { background: #007bff; color: white; }
        a.btn { text-decoration: none; background: #28a745; color: white; padding: 6px 12px; border-radius: 5px; }
        a.btn-danger { background: #dc3545; }
    </style>
</head>
<body>
<div class="container">
    <div class="header-links">
        <a href="LogoutServlet" class="logout">Logout</a>
        <a href="Index.html">Menu</a>
    </div>

    <h2>Welcome, <%= email %></h2>

    <div class="count-box">
        <h3>Total Registered Users: <%= totalUsers %></h3>
    </div>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>State</th>
                <th>City</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Users u : userList) {
        %>
            <tr>
                <td><%= u.getUserId() %></td>
                <td><%= u.getName() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getMobile() %></td>
                <td><%= u.getStateName() != null ? u.getStateName() : "N/A" %></td>
                <td><%= u.getCityName() != null ? u.getCityName() : "N/A" %></td>
                <td>
                    <a href="EditProfileServlet?userId=<%= u.getUserId() %>" class="btn">Edit</a>
                    <a href="DeleteServlet?userId=<%= u.getUserId() %>" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
