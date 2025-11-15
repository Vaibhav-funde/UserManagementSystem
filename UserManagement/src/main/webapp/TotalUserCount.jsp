<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Integer totalUsersObj = (Integer) request.getAttribute("totalUsers");
    int totalUsers = (totalUsersObj != null) ? totalUsersObj : 0;

    String email = (String) session.getAttribute("email");
    String role  = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html>
<head>
<title>Total User Count</title>

<style>
    body {
        font-family: Arial;
        background: #eef1f5;
        margin: 0;
        padding: 0;
    }

    .content {
    margin-left: 240px;
    padding: 30px;
    margin-top: 80px;   /* NEW - pushes content below header */
}


    .box {
        background: white;
        padding: 25px;
        border-radius: 10px;
        width: 350px;
        font-size: 22px;
        border-left: 6px solid #007bff;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        margin-top: 30px;
    }
</style>

</head>

<body>

<jsp:include page="Sidebar.jsp" />

<div class="content">
    <h2>Welcome, <%= email %> (<%= role %>)</h2>

    <div class="box">
        Total Registered Users: <strong><%= totalUsers %></strong>
    </div>
</div>

</body>
</html>
