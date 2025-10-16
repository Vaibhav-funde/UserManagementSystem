<%@ page import="com.Dbo.Citydbo, com.Model.City, com.Dbo.StateDbo, com.Model.State, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int cid = Integer.parseInt(request.getParameter("cid"));
    int sid = Integer.parseInt(request.getParameter("sid"));

    Citydbo cdb = new Citydbo();
    StateDbo sdb = new StateDbo();

    // Fetch city details
    City city = cdb.getCityById(cid);
    List<State> stateList = sdb.getAllStates();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update City</title>
<style>
    body { font-family: Arial; background: #f5f7fa; }
    .container { width: 400px; margin: 80px auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    h2 { text-align: center; }
    label { display: block; margin-top: 10px; }
    input, select { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 5px; }
    input[type=submit] { background: #28a745; color: white; border: none; margin-top: 15px; cursor: pointer; }
    input[type=submit]:hover { background: #218838; }
    a { display: block; margin-top: 10px; text-align: center; text-decoration: none; color: #007bff; }
    .back{
    background: blue;
    color:white;
    padding:8px; 
    }
    .update{
     background: green;
    color:white;
    padding:8px; }
</style>
</head>
<body>
<div class="container">
    <h2  class="update">Update City</h2>
    <form action="UpdateCityServlet" method="post">
        <input type="hidden" name="cid" value="<%= city.getCid() %>">

        <label>City Name:</label>
        <input type="text" name="cname" value="<%= city.getCname() %>" required>

        <label>Select State:</label>
        <select name="sid" required>
            <%
                for (State s : stateList) {
                    String selected = (s.getSid() == city.getSid()) ? "selected" : "";
            %>
                <option value="<%= s.getSid() %>" <%= selected %>><%= s.getSname() %></option>
            <%
                }
            %>
        </select>

        <input type="submit" value="Update City">
    </form>

    <a href="CityList.jsp?sid=<%= sid %>" class="back">Back to City List</a>
</div>
</body>
</html>
