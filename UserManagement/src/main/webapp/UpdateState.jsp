<%@ page import="com.Model.State, com.Dbo.StateDbo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String sidParam = request.getParameter("sid");
    if (sidParam == null) {
        response.sendRedirect("StateList.jsp");
        return;
    }

    int sid = Integer.parseInt(sidParam);
    StateDbo sdb = new StateDbo();
    State state = sdb.getStateById(sid);
    if(state == null) {
        response.sendRedirect("StateList.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit State</title>
    <style>
        body { 
        font-family: Arial;
        background: #f5f7fa; 
        }
        .container { 
        width: 400px; 
        margin: 50px auto;
         background: white; 
         padding: 20px; 
         border-radius: 10px;
         box-shadow: 0 0 10px rgba(0,0,0,0.1); 
         margin-top:100px;
         }
        input { 
        width: 100%;
        padding: 8px;
        margin: 8px 0;
         }
        button { 
        background: #28a745;
         color: white; 
         border: none; 
         
         padding: 10px; 
         width: 100%; 
         border-radius: 5px;
          }
        h2 { 
        text-align: center; 
        }
        .edit{
        background: green;
         padding:5px;
         color: white;
        }
        a.back { 
        width:150px;
       padding:5px;
        background: blue;
        display: block; margin-bottom: 10px; text-decoration: none; color: white; }
    </style>
</head>
<body>
<jsp:include page="Sidebar.jsp" />
<div class="container">
    <h2 class="edit">Edit State</h2> 
    <a href="StateList.jsp" class="back">← Back to List</a>
    
    <form action="UpdateStateServlet" method="post">
        <input type="hidden" name="sid" value="<%= state.getSid() %>">
        <label>State Name:</label>
        <input type="text" name="sname" value="<%= state.getSname() %>" required>
        <button type="submit">Update State</button>
    </form>
</div>
</body>
</html>
