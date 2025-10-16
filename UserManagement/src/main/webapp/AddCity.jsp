<%@ page import="com.Dbo.StateDbo, com.Model.State, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Fetch list of states for dropdown
    StateDbo sdb = new StateDbo();
    List<State> stateList = sdb.getAllStates();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add City</title>
<style>
    body { font-family: Arial; background: #f5f7fa; }
    .container { width: 400px; margin: 80px auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    h2 { text-align: center; }
    label { display: block; margin-top: 10px; }
    input, select { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 5px; }
    input[type=submit] { background: #007bff; color: white; border: none; margin-top: 15px; cursor: pointer; }
    input[type=submit]:hover { background: #0056b3; }
    a { display: block; margin-top: 10px; text-align: center; text-decoration: none; color: #007bff; }
</style>
</head>
<body>
<div class="container">
    <h2>Add City</h2>
    <form action="AddCityServlet" method="post">
        <label>City Name:</label>
        <input type="text" name="cname" required>

        <label>Select State:</label>
        <select name="sid" required>
            <option value="">-- Select State --</option>
            <%
                for (State s : stateList) {
            %>
                <option value="<%= s.getSid() %>"><%= s.getSname() %></option>
            <%
                }
            %>
        </select>

        <input type="submit" value="Add City">
    </form>

    <a href="StateCityC.jsp">Back to Menu</a>
</div>
</body>
</html>
