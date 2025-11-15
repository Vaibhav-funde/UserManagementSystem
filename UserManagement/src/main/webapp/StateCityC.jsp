<%@ page import="java.util.*, com.Model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if user is logged in
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>State & City CRUD</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
    }

    .container {
        text-align: center;
        border: 2px solid black;
        border-radius: 10px;
        padding: 40px;
        width: 400px;
        margin: 100px auto;
        background-color: #ffffff;
        box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
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

    h2 {
        color: #333;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
<jsp:include page="Sidebar.jsp" />
<div class="container">
    <h2>State & City CRUD</h2>
    <a href="AddState.jsp" class="btn-link">Add State</a><br>
    <a href="StateList.jsp" class="btn-link">State List</a><br>
   
    
    
</div>

</body>
</html>
