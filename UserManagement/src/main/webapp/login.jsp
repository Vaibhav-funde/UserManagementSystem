<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #f0f0f0, #d9e2f3);
        margin: 0;
        padding: 0;
    }
    .container {
        width: 400px;
        margin: 100px auto;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
        padding: 30px;
    }
    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }
    input {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
    }
    button {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #45a049;
    }
    .register-link {
        text-align: center;
        margin-top: 15px;
    }
    .register-link a {
        color: #007bff;
        text-decoration: none;
    }
    .error {
        color: red;
        text-align: center;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
<jsp:include page="Header.jsp" />

<div class="container">
    <h2>Login</h2>

    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        <div class="error"><%= errorMessage %></div>
    <% } %>

    <form action="LoginServlet" method="post">
        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>
    </form>

    <div class="register-link">
        New User? <a href="Register.jsp">Register Here</a>
    </div>
</div>
<jsp:include page="Footer.jsp" />
</body>
</html>
