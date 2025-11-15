<%@ page import="java.util.*, com.Model.State, com.Model.City, com.Dbo.StateDbo, com.Dbo.Citydbo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
         font-family: Arial;
         background: #f5f7fa;
         }
        .container { 
        width: 600px; 
        margin: 40px auto;
        background: white;
         padding: 20px;
         border-radius: 10px;
         margin-top:80px;
         }
        input, select {
         width: 100%; 
         padding: 8px;
          margin: 8px 0;
           }
        img {
         max-width: 100px;
         margin-top: 8px;
          display: block;
           }
        a.view-doc { 
        display: block;
         margin-top: 4px;
          color: blue; 
          text-decoration: underline; 
          }
        button, .btn { 
        background: #28a745;
         color: white;
          border: none;
           padding: 10px; 
           width: 100%; 
           border-radius: 5px;
            text-align: center;
           text-decoration: none;
            display: inline-block;
            margin-top: 10px;
             }
        .top-menu {
         display: flex;
          justify-content: space-between;
           align-items: center;
           margin-bottom: 20px;
            }
        .top-menu h2 { 
        margin: 0;
}
    </style>
</head>
<body>
<jsp:include page="Sidebar.jsp" />
<div class="container">
    <div class="top-menu">
        <h2>Edit Profile</h2>
       
    </div>

    <form action="EditProfileServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= request.getAttribute("name") %>">

        <label>Mobile:</label>
        <input type="text" name="mobile" value="<%= request.getAttribute("mobile") %>">

        <label>Address:</label>
        <input type="text" name="address" value="<%= request.getAttribute("address") %>">

        <label>State:</label>
        <select name="state_id" id="stateSelect">
            <option value="">Select State</option>
            <%
                StateDbo sdb = new StateDbo();
                int selectedState = (request.getAttribute("stateId") != null) ? (Integer)request.getAttribute("stateId") : 0;
                for (State s : sdb.getAllStates()) {
            %>
                <option value="<%= s.getSid() %>" <%= (s.getSid() == selectedState) ? "selected" : "" %>><%= s.getSname() %></option>
            <% } %>
        </select>

        <label>City:</label>
        <select name="city_id" id="citySelect">
            <option value="">Select City</option>
            <%
                Citydbo cdb = new Citydbo();
                int selectedCity = (request.getAttribute("cityId") != null) ? (Integer)request.getAttribute("cityId") : 0;
                if(selectedState > 0) {
                    for(City c : cdb.getCitiesByState(selectedState)) {
            %>
                        <option value="<%= c.getCid() %>" <%= (c.getCid() == selectedCity) ? "selected" : "" %>><%= c.getCname() %></option>
            <%      }
                }
            %>
        </select>

        <label>Profile Image:</label>
        <input type="file" name="profile_image">
        <%
            String profileImage = (String)request.getAttribute("profileImage");
            if(profileImage != null && !profileImage.isEmpty()) {
        %>
           <img src="uploads/<%= profileImage %>" alt="Profile">
        <% } %>
        <input type="hidden" name="old_profile" value="<%= profileImage %>">

        <label>Aadhar Document:</label>
        <input type="file" name="aadhar_doc">
        <%
            String aadharDoc = (String)request.getAttribute("aadharDoc");
            if(aadharDoc != null && !aadharDoc.isEmpty()) {
        %>
           <a href="uploads/<%= aadharDoc %>" target="_blank" class="view-doc">View Existing Aadhar</a>
        <% } %>
        <input type="hidden" name="old_aadhar" value="<%= aadharDoc %>">

        <label>PAN Document:</label>
        <input type="file" name="pan_doc">
        <%
            String panDoc = (String)request.getAttribute("panDoc");
            if(panDoc != null && !panDoc.isEmpty()) {
        %>
           <a href="uploads/<%= panDoc %>" target="_blank" class="view-doc">View Existing PAN</a>
        <% } %>
        <input type="hidden" name="old_pan" value="<%= panDoc %>">

        <button type="submit">Update Profile</button>
        
    </form>
</div>
</body>
</html>
