<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add State</title>
    <style>
        body { font-family: Arial; background: #f5f7fa; }
        .container { width: 400px; margin: 100px auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        input { width: 100%; padding: 10px; margin: 10px 0; border-radius: 5px; border: 1px solid #ccc; }
        button { width: 100%; padding: 10px; background: #28a745; color: white; border: none; border-radius: 5px; font-size: 16px; cursor: pointer; }
        button:hover { background: #218838; }
        a { display: block; text-align: center; margin-top: 10px; color: #007bff; text-decoration: none;
         width: 80%;  margin:25px; padding: 10px; background: #28a745; color: white; border: none; border-radius: 5px; font-size: 16px; cursor: pointer; }
        a:hover { text-decoration: underline; }
        h2 { text-align: center; margin-bottom: 20px; }
    </style>
</head>
<body>
<div class="container">
    <h2>Add New State</h2>
    <form action="AddStateServlet" method="post">
        <label>State Name:</label>
        <input type="text" name="sname" placeholder="Enter State Name" required>

        <button type="submit">Add State</button>
       
    </form>
    <a href="StateList.jsp">Back to State List</a>
</div>
</body>
</html>
