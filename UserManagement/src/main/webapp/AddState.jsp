<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add State</title>
    <style>
        body {
            font-family: Arial;
            background: #f5f7fa; 
        }
        .container { 
            width: 400px;
            margin: 100px auto; 
            background: white; 
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1); 
        }
        input {
            width: 100%; 
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 15px;
        }
        input.error {
            border-color: red;
            background-color: #ffe6e6;
        }
        button { 
            width: 100%;
            padding: 10px;
            background: #28a745;
            color: white; 
            border: none;
            border-radius: 5px;
            font-size: 16px; 
            cursor: pointer;
        }
        button:hover {
            background: #218838;
        }
        a { 
            display: block; 
            text-align: center;
            margin: 25px;
            padding: 10px; 
            background: #28a745;
            color: white; 
            border: none; 
            border-radius: 5px; 
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }
        a:hover {
            background: #218838;
        }
        h2 {
            text-align: center; 
            margin-bottom: 20px;
        }
        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="Sidebar.jsp" />
<div class="container">
    <h2>Add New State</h2>

    <!-- Display error message if exists -->
    <%
        String error = (String) request.getAttribute("error");
        boolean hasError = error != null && !error.isEmpty();
        if (hasError) {
    %>
        <div class="error-message"><%= error %></div>
    <%
        }
    %>

    <form action="AddStateServlet" method="post">
        <label>State Name:</label>
        <input type="text" name="sname" placeholder="Enter State Name" required
               class="<%= hasError ? "error" : "" %>">

        <button type="submit">Add State</button>
    </form>

    <a href="StateList.jsp">Back to State List</a>
</div>
</body>
</html>
