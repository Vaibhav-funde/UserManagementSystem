<%@ page import="java.util.*, com.Dbo.StateDbo, com.Model.State" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    StateDbo sdb = new StateDbo();
    List<State> stateList = sdb.getAllStates();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>State List</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #eef1f5;
        margin: 0;
        padding: 0;
    }

    /* PAGE CONTENT (RIGHT SIDE) */
    .content-box {
        margin-left: 260px;
        margin-top: 60px;
        padding: 25px;
    }

    /* OUTER CARD BOX LIKE DASHBOARD */
    .card {
        background: #fff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 3px 12px rgba(0,0,0,0.15);
        border: 2px solid #cce0ff; 
    }

    /* PAGE TITLE BAR */
    .title-bar {
        background: green;
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

    /* TABLE STYLE */
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

    .city { background-color: #17a2b8; }
    .city:hover { background-color: #0f7282; }

</style>
</head>

<body>

<jsp:include page="Sidebar.jsp" />

<div class="content-box">
    <div class="card">
        
        <div class="title-bar">State List</div>

        <!-- BUTTONS -->
        <a href="AddState.jsp" class="btn-top">➕ Add New State</a>
        <a href="Index.jsp" class="btn-top">🏠 Menu</a>

        <!-- TABLE -->
        <table>
            <thead>
                <tr>
                    <th>SR NO</th>
                    <th>STATE ID</th>
                    <th>STATE NAME</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>

            <tbody>
            <%
                int sr = 1;
                if (stateList != null && !stateList.isEmpty()) {
                    for (State s : stateList) {
            %>
                <tr>
                    <td><%= sr++ %></td>
                    <td><%= s.getSid() %></td>
                    <td><%= s.getSname() %></td>
                    <td>
                        <a href="UpdateState.jsp?sid=<%= s.getSid() %>" class="btn edit">State Edit</a>
                        <a href="DeleteStateServlet?sid=<%= s.getSid() %>" class="btn delete" onclick="return confirm('Delete this state?');">State Delete</a>
                        <a href="CityList.jsp?sid=<%= s.getSid() %>" class="btn city">View Cities</a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="4">No State Found</td>
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
