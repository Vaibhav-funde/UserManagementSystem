<%@ page import="java.util.*, com.Dbo.Citydbo, com.Model.City" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Get the state ID from request
    String sidParam = request.getParameter("sid");
    int sid = 0;
    if (sidParam != null && !sidParam.isEmpty()) {
        sid = Integer.parseInt(sidParam);
    }

    Citydbo cdb = new Citydbo();
    List<City> cities = cdb.getCitiesByStateId(sid);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>City List</title>
<style>
    body { font-family: Arial; background: #f7f9fb; }
    .container { width: 80%; margin: 40px auto; background: white; padding: 20px; border-radius: 10px;
                 box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { padding: 10px; text-align: center; border: 1px solid #ccc; }
    th { background: #007bff; color: white; }
    tr:nth-child(even) { background: #f2f2f2; }
    a.btn { padding: 6px 12px; border-radius: 5px; text-decoration: none; }
    .edit { background: #28a745; color: white; }
    .delete { background: #dc3545; color: white; }
    .add { background: #007bff; color: white; padding: 8px 16px; display: inline-block; }
    .back { background: #007bff; color: white; padding: 8px 16px; display: inline-block;  margin-top: 10px; text-decoration: none;  }
  .citylist{
  background: green; color: white; padding: 8px 16px; width:300px;
  }
</style>
</head>
<body>
<div class="container">
    <h2 class="citylist">City List (State ID: <%= sid %>)</h2>

    <a href="AddCity.jsp?sid=<%= sid %>" class="add">Add New City</a>
    <a href="StateList.jsp" class="back">Back to States</a>

    <table>
        <tr>
            <th>Cid</th>
            <th>City Name</th>
            <th>State ID</th>
            <th>Actions</th>
        </tr>

        <%
            if (cities != null && !cities.isEmpty()) {
                for (City c : cities) {
        %>
        <tr>
            <td><%= c.getCid() %></td>
            <td><%= c.getCname() %></td>
            <td><%= c.getSid() %></td>
            <td>
                <a href="UpdateCity.jsp?cid=<%= c.getCid() %>&sid=<%= sid %>" class="btn edit">City Edit</a>
                <a href="DeleteCityServlet?cid=<%= c.getCid() %>&sid=<%= sid %>" class="btn delete"
                   onclick="return confirm('Are you sure you want to delete this city?');">City Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="4">No City Found</td></tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
