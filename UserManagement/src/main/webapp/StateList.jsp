<%@ page import="java.util.*, com.Dbo.StateDbo, com.Model.State" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 🧠 Check login session
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 🔹 Fetch all states
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
        background-color: #f5f7fa; 
    }

    .container { 
        width: 80%; 
        margin: 50px auto; 
        background-color: #fff; 
        padding: 20px; 
        border-radius: 10px; 
        box-shadow: 0 0 10px rgba(0,0,0,0.1); 
    }

    h2 { 
        text-align: center; 
        color: #333; 
        margin-bottom: 20px; 
    }

    table { 
        width: 100%; 
        border-collapse: collapse; 
    }

    th, td { 
        padding: 10px; 
        border-bottom: 1px solid #ddd; 
        text-align: center; 
    }

    th { 
        background-color: #007bff; 
        color: white; 
    }

    a.btn { 
        text-decoration: none; 
        padding: 6px 12px; 
        border-radius: 5px; 
        color: white; 
        margin: 2px; 
        display: inline-block; 
    }

    a.edit { background-color: #28a745; }
    a.delete { background-color: #dc3545; }
    a.city { background-color: #17a2b8; }
    a.add { 
        background-color: #007bff; 
        padding: 8px 15px; 
        display: inline-block; 
        margin-bottom: 15px; 
        border-radius: 5px;
        color: white;
        text-decoration: none;
    }
    .state{
    color:White;
    background-color: green; 
    padding:5px;
    }

    a.add:hover, a.btn:hover { opacity: 0.8; }
</style>
</head>
<body>
<div class="container">
    <h2 class="state">State List</h2>

    <!-- Top buttons -->
    <a href="AddState.jsp" class="add">➕ Add New State</a>
    <a href="Index.html" class="add">🏠 Menu</a>

    <table>
        <thead>
            <tr>
                <th>Sr No</th>
                <th>State ID</th>
                <th>State Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            int serial = 1;
            if (stateList != null && !stateList.isEmpty()) {
                for (State s : stateList) {
        %>
            <tr>
                <td><%= serial++ %></td>
                <td><%= s.getSid() %></td>
                <td><%= s.getSname() %></td>
                <td>
                    <a href="UpdateState.jsp?sid=<%= s.getSid() %>" class="btn edit">State Edit</a>
                    <a href="DeleteStateServlet?sid=<%= s.getSid() %>" class="btn delete" onclick="return confirm('Are you sure you want to delete this state?');"> State Delete</a>
                    <a href="CityList.jsp?sid=<%= s.getSid() %>" class="btn city">View Cities</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="4" style="text-align:center;">No State Found</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
