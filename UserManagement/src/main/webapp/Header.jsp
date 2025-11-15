<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= request.getAttribute("title") != null ? request.getAttribute("title") : "My App" %></title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }
    .header {
        background-color: #4CAF50;
        color: white;
        padding: 15px;
        text-align: center;
        font-size: 24px;
    }
    .nav {
        text-align: center;
        margin: 10px 0;
    }
    .nav a {
        display: inline-block;
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        margin: 5px;
        text-decoration: none;
        border-radius: 5px;
        transition: 0.3s;
        border: 1px solid #388E3C;
    }
    .nav a:hover {
        background-color: #45a049;
        transform: scale(1.05);
    }
    .container {
        width: 400px;
        margin: 50px auto;
        padding: 30px;
        background-color: #ffffff;
        box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
        border-radius: 10px;
    }
    input, select, button {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 15px;
    }
    button {
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        cursor: pointer;
        border: none;
    }
    button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<div class="header">User Management System</div>
<div class="nav">
    <a href="Register.jsp">Register</a>
    <a href="login.jsp">Login</a>
    <a href="DashboardServlet">Dashboard</a>

   

    <% 
        if (session.getAttribute("email") != null) { 
    %>
        <a href="LogoutServlet">Logout</a>
    <% 
        } 
    %>
</div>

