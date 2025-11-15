<%@ page import="java.util.*, com.Model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Check login
    String email = (String) session.getAttribute("email");
    String role = (String) session.getAttribute("role");
    Integer loginUserId = (Integer) session.getAttribute("userId");

    if (email == null || role == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Users> userList = (List<Users>) request.getAttribute("userList");
    if (userList == null) userList = new ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #eef1f5;
        margin: 0;
        padding: 0;
    }

    .content-wrapper {
        margin-left: 240px;
        padding: 20px;
       margin-top: 80px;  
        
    }

    .dashboard-box {
        width: 95%;
        background: #fff;
        border: 2px solid #007bff;
        border-radius: 10px;
        padding: 25px;
        margin: auto;
        box-shadow: 0 4px 12px rgba(0,0,0,0.10);
    }

    h2 {
        margin-bottom: 15px;
        color: #333;
    }
    h2 span {
        color: #007bff;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        margin-top: 20px;
    }

    th, td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
        text-align: left;
        font-size: 14px;
    }

    th {
        background: #007bff;
        color: white;
        text-transform: uppercase;
        font-size: 13px;
    }

    tr:hover {
        background-color: #f1f8ff;
    }

    a.btn {
        text-decoration: none;
        background: #28a745;
        color: white;
        padding: 6px 12px;
        border-radius: 5px;
        transition: 0.2s;
        font-size: 13px;
    }

    a.btn:hover {
        background: #218838;
    }

    a.btn-danger {
        background: #dc3545;
    }

    a.btn-danger:hover {
        background: #b52a38;
    }
</style>
</head>

<body>

<jsp:include page="Sidebar.jsp" />

<div class="content-wrapper">

    <div class="dashboard-box">

        <h2>Welcome, <span><%= email %></h2>

        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>State</th>
                    <th>City</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
            <%
                for (Users u : userList) {

                    if ("user".equalsIgnoreCase(role)) {
                        if (u.getUserId() != loginUserId) {
                            continue;
                        }
                    }
            %>
                <tr>
                    <td><%= u.getUserId() %></td>
                    <td><%= u.getName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getMobile() %></td>
                    <td><%= u.getStateName() != null ? u.getStateName() : "N/A" %></td>
                    <td><%= u.getCityName() != null ? u.getCityName() : "N/A" %></td>

                    <td>
                        <a href="ViewUserProfileServlet?userId=<%= u.getUserId() %>" class="btn">View</a>

                        <% if ("user".equalsIgnoreCase(role)) { %>
                            <a href="EditProfileServlet?userId=<%= u.getUserId() %>" class="btn">Edit</a>
                        <% } %>

                        <!-- SHOW DELETE FOR BOTH ADMIN AND USER -->
                         <a href="DeleteServlet?userId=<%= u.getUserId() %>" class="btn btn-danger">Delete</a>
                    </td>
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
