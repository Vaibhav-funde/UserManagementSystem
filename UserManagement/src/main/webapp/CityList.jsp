<%@ page import="java.util.*, com.Dbo.Citydbo, com.Model.City" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String sidParam = request.getParameter("sid");
    int sid = 0;
    if (sidParam != null && !sidParam.isEmpty()) {
        sid = Integer.parseInt(sidParam);
    }

    List<City> cities = new ArrayList<>();
    String errorMessage = null;

    try {
        Citydbo cdb = new Citydbo();
        cities = cdb.getCitiesByStateId(sid);
    } catch (Exception e) {
        errorMessage = "Error fetching cities: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>City List</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #eef1f5;
        margin: 0;
        padding: 0;
    }

    /* EXACT SAME MARGIN & CONTENT BOX AS STATELIST */
    .content-box {
        margin-left: 260px;
        margin-top: 60px;
        padding: 25px;
    }

    /* SAME CARD BOX */
    .card {
        background: #fff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 3px 12px rgba(0,0,0,0.15);
        border: 2px solid #cce0ff; 
    }

    /* PAGE TITLE BAR */
    .title-bar {
        background: #007bff;
        color: white;
        text-align: center;
        padding: 12px;
        font-size: 22px;
        border-radius: 8px;
        margin-bottom: 25px;
        letter-spacing: 1px;
        font-weight: bold;
    }

    /* TOP BUTTONS */
    .btn-top {
        background-color: #007bff;
        padding: 10px 18px;
        border-radius: 6px;
        color: white;
        text-decoration: none;
        font-size: 15px;
        margin-right: 10px;
        display: inline-block;
    }

    .btn-top:hover { background-color: #0056b3; }

    .back {
        background-color: #6c757d;
    }
    .back:hover {
        background-color: #565e64;
    }

    /* TABLE STYLE – EXACT MATCH TO STATE LIST */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 18px;
        border-radius: 6px;
        overflow: hidden;
    }

    th {
        background-color: #007bff;
        color: white;
        padding: 12px;
        text-transform: uppercase;
        font-size: 14px;
        letter-spacing: 0.5px;
    }

    td {
        padding: 12px;
        text-align: center;
        background: white;
        border-bottom: 1px solid #e0e0e0;
        font-size: 15px;
    }

    tr:hover td {
        background-color: #f1f9ff;
    }

    /* ACTION BUTTONS */
    .btn {
        padding: 8px 14px;
        border-radius: 6px;
        color: white;
        text-decoration: none;
        font-size: 14px;
        margin: 2px;
        display: inline-block;
    }

    .edit { background-color: #28a745; }
    .edit:hover { background-color: #1d7e33; }

    .delete { background-color: #dc3545; }
    .delete:hover { background-color: #b42533; }

    .error-message {
        color: red;
        font-weight: bold;
        text-align: center;
        margin-bottom: 15px;
    }
</style>
</head>

<body>

<jsp:include page="Sidebar.jsp" />

<div class="content-box">
    <div class="card">

        <div class="title-bar">
            Cities for State ID: <%= sid %>
        </div>

        <% if (errorMessage != null) { %>
            <div class="error-message"><%= errorMessage %></div>
        <% } %>

        <a href="AddCity.jsp?sid=<%= sid %>" class="btn-top">➕ Add New City</a>
        <a href="StateList.jsp" class="btn-top back">⬅ Back to States</a>

        <table>
            <thead>
                <tr>
                    <th>CID</th>
                    <th>City Name</th>
                    <th>State ID</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>
            <%
                if (cities != null && !cities.isEmpty()) {
                    for (City c : cities) {
            %>
                <tr>
                    <td><%= c.getCid() %></td>
                    <td><%= c.getCname() %></td>
                    <td><%= c.getSid() %></td>
                    <td>
                        <a href="UpdateCity.jsp?cid=<%= c.getCid() %>&sid=<%= sid %>" class="btn edit">Edit</a>
                        <a href="DeleteCityServlet?cid=<%= c.getCid() %>&sid=<%= sid %>" 
                           class="btn delete"
                           onclick="return confirm('Are you sure you want to delete this city?');">
                           Delete
                        </a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="4">No cities found for this state.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>

    </div>
</div>

</body>
</html>
