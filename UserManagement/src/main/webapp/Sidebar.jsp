<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Model.Users, com.Model.User_Profile" %>

<%
    String email = (String) session.getAttribute("email");
    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("userName");
    User_Profile profile = (User_Profile) request.getAttribute("profile");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background: #f6f9ff;
            font-family: Arial, sans-serif;
        }

        /* HEADER */
        .header {
            height: 60px;
            width: 100%;
            background: #4154f1;
            color: white;
            display: flex;
            align-items: center;
            padding: 0 20px;
            font-size: 20px;
            font-weight: bold;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 20;
        }

        /* Toggle Button */
        .toggle-btn {
            font-size: 26px;
            margin-right: 15px;
            cursor: pointer;
        }

        .welcome-area {
            margin-left: auto;
            font-size: 15px;
            font-weight: normal;
            margin-right:40px;
        }

        /* SIDEBAR */
        .sidebar {
            width: 250px;
            height: 100vh;
            background: #fff;
            position: fixed;
            top: 60px;
            left: 0;
            border-right: 1px solid #ddd;
            overflow-y: auto;
            transition: transform 0.3s ease;
            box-shadow: 2px 0 8px rgba(0,0,0,0.1);
        }

        /* Hidden Sidebar */
        .sidebar.hide {
            transform: translateX(-260px);
        }

        .sidebar h3 {
            text-align: center;
            padding: 10px 0;
            color: #012970;
            margin-bottom: 10px;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 20px;
            font-size: 16px;
            color: #012970;
            text-decoration: none;
            border-bottom: 1px solid #eee;
            transition: 0.2s ease;
        }

        .sidebar a:hover {
            background: #eef2ff;
            padding-left: 30px;
            font-weight: bold;
        }

        .sidebar i {
            font-size: 20px;
            color: #4154f1;
        }

        /* MAIN CONTENT */
        .main-content {
            margin-top: 80px;
            margin-left: 270px;
            padding: 20px;
            transition: 0.3s ease;
        }

        /* MAIN CONTENT moves when sidebar hidden */
        .main-content.expand {
            margin-left: 20px;
        }
    </style>

</head>
<body>

<!-- HEADER -->
<div class="header">

    <!-- Sidebar Toggle Button -->
    <div class="toggle-btn" onclick="toggleSidebar()">
        <i class="bi bi-list"></i>
    </div>

    User Management System

    <div class="welcome-area">
         Welcome,<i class="bi bi-person-circle"></i> <%= name %>
    </div>
</div>

<!-- SIDEBAR -->
<div class="sidebar" id="sidebar">

    <h3>
        <% if ("admin".equalsIgnoreCase(role)) { %>
           Admin Dashboard
        <% } else { %>
            User Dashboard
        <% } %>
    </h3>

    <% if ("user".equalsIgnoreCase(role)) { %>

        <a href="DashboardServlet">
            <i class="bi bi-speedometer2"></i> Dashboard
        </a>

        <a href="ViewUserProfileServlet?userId=<%= session.getAttribute("userId") %>">
            <i class="bi bi-person-circle"></i> My Profile
        </a>

        <a href="LogoutServlet">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>

    <% } else if ("admin".equalsIgnoreCase(role)) { %>

        <a href="DashboardServlet">
            <i class="bi bi-table"></i> All Users List
        </a>

        <a href="TotalUsersServlet">
            <i class="bi bi-people"></i> Total Users
        </a>


        <a href="StateCityC.jsp">
            <i class="bi bi-geo-alt"></i> State & City Master
        </a>

        <a href="LogoutServlet">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>

    <% } %>

</div>



<!-- JS FOR TOGGLE SIDEBAR -->
<script>
    function toggleSidebar() {
        const sidebar = document.getElementById("sidebar");
        const content = document.getElementById("mainContent");

        sidebar.classList.toggle("hide");
        content.classList.toggle("expand");
    }
</script>

</body>
</html>
