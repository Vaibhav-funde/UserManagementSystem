<%@ page import="com.Model.Users, com.Model.User_Profile" %>
<%
    Users user = (Users) request.getAttribute("user");
    User_Profile profile = (User_Profile) request.getAttribute("profile");

    if (user == null) {
        response.sendRedirect("DashboardServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<style>
body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #eef1f5;
    margin: 0;
    padding: 0;
}

.container {
    width: 75%;
    background: #ffffff;
    padding: 35px 40px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    margin-left: 240px;      /* Sidebar gap */
    margin-top: 70px;        /* Header gap */
    margin-right: 90px;
    margin-bottom: 50px;     /* Bottom gap */
}



/* On hover slight glow */
.container:hover {
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.22);
}

/* Top Section */
.top-menu {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.top-menu h2 {
    margin: 0;
    font-size: 26px;
    color: #007bff;
    font-weight: bold;
}

/* Profile Header Section */
.profile-header {
    display: flex;
    align-items: center;
    gap: 35px;
    margin-bottom: 30px;
}

/* Profile Image */
.profile-header img {
    width: 220px;
    height: 260px;
    border-radius: 10px;
    border: 4px solid #007bff;
    object-fit: cover;
    box-shadow: 0 5px 14px rgba(0, 0, 0, 0.25);
    transition: 0.25s;
}

.profile-header img:hover {
    transform: scale(1.03);
}

/* Profile Info Text */
.profile-info {
    line-height: 1.9;
    font-size: 17px;
    color: #333;
}

/* Section Titles */
.section {
    margin-top: 30px;
}

.section h3 {
    border-left: 4px solid #007bff;
    padding-left: 10px;
    color: #007bff;
    font-size: 22px;
    margin-bottom: 15px;
}

/* Buttons */
a.btn {
    background: #007bff;
    color: white;
    text-decoration: none;
    padding: 10px 18px;
    border-radius: 6px;
    font-size: 15px;
    transition: 0.25s;
    box-shadow: 0 3px 6px rgba(0,0,0,0.15);
}

a.btn:hover {
    background: #0056b3;
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.22);
}

a.btn-back {
    background: #6c757d;
}

a.btn-back:hover {
    background: #5a6268;
}

/* Document Links */
.view-doc {
    color: #007bff;
    text-decoration: underline;
    font-weight: 500;
}

.view-doc:hover {
    color: #0056b3;
}

/* Paragraph Styling */
p {
    margin: 10px 0;
}

</style>
</head>
<body>
<jsp:include page="Sidebar.jsp" />
<div class="container">
    <div class="top-menu">
        <h2>User Profile</h2>
       
    </div>

    <div class="profile-header">
        <img src="<%= (profile != null && profile.getProfileImage() != null && !profile.getProfileImage().isEmpty()) 
                     ? "uploads/" + profile.getProfileImage() 
                     : "images/default-avatar.png" %>" 
             alt="Profile Image">
        <div class="profile-info">
            <p><strong>User ID:</strong> <%= user.getUserId() %></p>
            <p><strong>Name:</strong> <%= user.getName() %></p>
            <p><strong>Email:</strong> <%= user.getEmail() %></p>
            <p><strong>Mobile:</strong> <%= user.getMobile() %></p>
            <p><strong>Address:</strong> <%= (profile != null && profile.getAddress() != null) ? profile.getAddress() : "N/A" %></p>
            <p><strong>Role:</strong> <%= user.getRole() != null ? user.getRole() : "User" %></p>
        </div>
    </div>

    <div class="section">
        <h3>Documents</h3>

        <p><strong>Aadhaar Document:</strong> 
            <% if (profile != null && profile.getAadhaarDoc() != null && !profile.getAadhaarDoc().isEmpty()) { %>
                <a href="uploads/<%= profile.getAadhaarDoc() %>" target="_blank" class="view-doc">View Aadhaar</a>
            <% } else { %>
                Not Uploaded
            <% } %>
        </p>

        <p><strong>PAN Document:</strong> 
            <% if (profile != null && profile.getPanDoc() != null && !profile.getPanDoc().isEmpty()) { %>
                <a href="uploads/<%= profile.getPanDoc() %>" target="_blank" class="view-doc">View PAN</a>
            <% } else { %>
                Not Uploaded
            <% } %>
        </p>
    </div>
</div>
</body>
</html>
