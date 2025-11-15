<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management System</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 600px;
        margin: 50px auto;
        padding: 30px;
        background-color: #ffffff;
        box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
        border-radius: 10px;
        text-align: center;
    }
    .container img {
        width: 150px;
        height: 150px;
        object-fit: cover;
        border-radius: 50%;
        margin-bottom: 20px;
        border: 3px solid #4CAF50;
    }
    .btn-link {
        display: inline-block;
        background-color: #4CAF50;
        color: white;
        padding: 12px 25px;
        margin: 10px;
        text-align: center;
        text-decoration: none;
        border-radius: 8px;
        font-size: 16px;
        transition: 0.3s;
        border: 1px solid #388E3C;
    }
    .btn-link:hover {
        background-color: #45a049;
        transform: scale(1.05);
    }
</style>
</head>
<body>

<!-- Include Header -->
<jsp:include page="Header.jsp" />

<!-- Main Content -->
<div class="container">
    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="User Management">
    <h2>Manage Your Users</h2>
    <p>Click below to access different user management actions:</p>
    
   
</div>

<!-- Include Footer -->
<jsp:include page="Footer.jsp" />


</body>
</html>
