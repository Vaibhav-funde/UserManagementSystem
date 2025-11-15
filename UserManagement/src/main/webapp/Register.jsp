<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="com.Dbo.StateDbo, com.Dbo.Citydbo" %>
<%@ page import="com.Model.State, com.Model.City" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #e0eafc, #cfdef3);
        margin: 0;
        padding: 0;
    }
    .container {
        width: 400px;
        margin: 70px auto;
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
    input, select {
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
    .login-link {
        text-align: center;
        margin-top: 15px;
    }
    .login-link a {
        color: #007bff;
        text-decoration: none;
    }
</style>
</head>
<body>
<jsp:include page="Header.jsp" />

<%
    // Instantiate DAO classes
    StateDbo stateDbo = new StateDbo();
    Citydbo cityDbo = new Citydbo();

    // Get all states
    List<State> states = stateDbo.getAllStates();

    // Get selected state from previous submit (if any)
    String selectedStateId = request.getParameter("state");
    List<City> cities = new ArrayList<>();

    if (selectedStateId != null && !selectedStateId.isEmpty()) {
        cities = cityDbo.getCitiesByState(Integer.parseInt(selectedStateId));
    }
    
    
%>

<div class="container">
    <h2>Register</h2>

<% String error = (String) request.getAttribute("error");
       if(error != null) { %>
       <div class="error"><%= error %></div>
    <% } %>
    
    <form action="RegisterServlet" method="post">
        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
      <input type="email" name="email" required
       pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|net|org)$"
       title="Enter a valid email like user@gmail.com, user@yahoo.com">

        <label>Mobile</label>
        <input type="text" name="mobile" required pattern="[0-9]{10}" title="Enter valid 10-digit mobile">

        <label>Password</label>
        <input type="password" name="password"
       pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
       title="Password must be at least 8 characters long, include one uppercase letter, one number, and one special symbol."
       required>

        <label>State</label>
        <select name="state" onchange="this.form.submit()" required>
            <option value="">-- Select State --</option>
            <% for (State s : states) { 
            %>
                <option value="<%= s.getSid() %>" <%= (selectedStateId != null && s.getSid() == Integer.parseInt(selectedStateId)) ? "selected" : "" %>>
                    <%= s.getSname() %>
                </option>
            <%
            } %>
        </select>

        <label>City</label>
        <select name="city" required>
            <option value="">-- Select City --</option>
            <% for (City c : cities) { %>
                <option value="<%= c.getCid() %>"><%= c.getCname() %></option>
            <% } %>
        </select>

        <button type="submit">Register</button>
    </form>

    <div class="login-link">
        Already registered? <a href="login.jsp">Login</a>
    </div>
</div>

<jsp:include page="Footer.jsp" />
</body>
</html>
