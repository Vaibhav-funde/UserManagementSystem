package com.Servlet;

import java.io.*;
import java.nio.file.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.Db.DbConnection;

@WebServlet("/EditProfileServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1MB
    maxFileSize = 10 * 1024 * 1024,   // 10MB
    maxRequestSize = 20 * 1024 * 1024 // 20MB
)
public class EditProfileServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "E:/UserManagement/uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String userIdStr = req.getParameter("userId");
        if(userIdStr == null || userIdStr.isEmpty()) {
            resp.sendRedirect("DashboardServlet");
            return;
        }

        int userId = Integer.parseInt(userIdStr);

        String sql = "SELECT u.USER_ID, u.NAME, u.EMAIL, u.MOBILE, u.SID, u.CID, "
                   + "p.ADDRESS, p.PROFILE_IMAGE, p.AADHAAR_NO, p.PAN_NO, "
                   + "p.AADHAAR_DOC, p.PAN_DOC "
                   + "FROM USERS u LEFT JOIN USER_PROFILE p ON u.USER_ID = p.USER_ID "
                   + "WHERE u.USER_ID = ?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.setAttribute("userId", rs.getInt("USER_ID"));
                req.setAttribute("name", rs.getString("NAME"));
                req.setAttribute("email", rs.getString("EMAIL"));
                req.setAttribute("mobile", rs.getString("MOBILE"));
                req.setAttribute("address", rs.getString("ADDRESS"));
                req.setAttribute("stateId", rs.getInt("SID"));
                req.setAttribute("cityId", rs.getInt("CID"));
                req.setAttribute("profileImage", rs.getString("PROFILE_IMAGE"));
                req.setAttribute("aadharNo", rs.getString("AADHAAR_NO"));
                req.setAttribute("panNo", rs.getString("PAN_NO"));
                req.setAttribute("aadharDoc", rs.getString("AADHAAR_DOC"));
                req.setAttribute("panDoc", rs.getString("PAN_DOC"));
            }

            req.getRequestDispatcher("EditProfile.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(500, "Database Error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String userIdStr = req.getParameter("userId");
        String name = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String stateIdStr = req.getParameter("state_id");
        String cityIdStr = req.getParameter("city_id");
        String aadhar = req.getParameter("aadhar_no");
        String pan = req.getParameter("pan_no");

        if(userIdStr == null || userIdStr.isEmpty()) {
            throw new ServletException("User ID is missing!");
        }
        int userId = Integer.parseInt(userIdStr);

        int stateId = (stateIdStr != null && !stateIdStr.isEmpty()) ? Integer.parseInt(stateIdStr) : 0;
        int cityId = (cityIdStr != null && !cityIdStr.isEmpty()) ? Integer.parseInt(cityIdStr) : 0;

        Part profilePart = req.getPart("profile_image");
        Part aadharPart = req.getPart("aadhar_doc");
        Part panPart = req.getPart("pan_doc");

        String oldProfile = req.getParameter("old_profile");
        String oldAadhar = req.getParameter("old_aadhar");
        String oldPan = req.getParameter("old_pan");

        String profileFile = saveFile(profilePart, oldProfile);
        String aadharFile = saveFile(aadharPart, oldAadhar);
        String panFile = saveFile(panPart, oldPan);

        try (Connection con = DbConnection.getConnection()) {

            // Update USERS table
            String sqlUser = "UPDATE USERS SET NAME=?, MOBILE=?, SID=?, CID=? WHERE USER_ID=?";
            try (PreparedStatement ps1 = con.prepareStatement(sqlUser)) {
                ps1.setString(1, name);
                ps1.setString(2, mobile);

                if(stateId > 0) ps1.setInt(3, stateId);
                else ps1.setNull(3, java.sql.Types.INTEGER);

                if(cityId > 0) ps1.setInt(4, cityId);
                else ps1.setNull(4, java.sql.Types.INTEGER);

                ps1.setInt(5, userId);
                ps1.executeUpdate();
            }

            // Update or Insert USER_PROFILE
            String checkSql = "SELECT COUNT(*) FROM USER_PROFILE WHERE USER_ID=?";
            try (PreparedStatement check = con.prepareStatement(checkSql)) {
                check.setInt(1, userId);
                ResultSet rs = check.executeQuery();
                rs.next();
                int count = rs.getInt(1);

                if (count > 0) {
                    // Update existing profile
                    String updateProfile = "UPDATE USER_PROFILE SET ADDRESS=?, PROFILE_IMAGE=?, "
                            + "AADHAAR_NO=?, PAN_NO=?, AADHAAR_DOC=?, PAN_DOC=? WHERE USER_ID=?";
                    try (PreparedStatement ps2 = con.prepareStatement(updateProfile)) {
                        ps2.setString(1, address);
                        ps2.setString(2, profileFile);
                        ps2.setString(3, aadhar);
                        ps2.setString(4, pan);
                        ps2.setString(5, aadharFile);
                        ps2.setString(6, panFile);
                        ps2.setInt(7, userId);
                        ps2.executeUpdate();
                    }
                } else {
                    // Insert new profile if not exists
                    String insertProfile = "INSERT INTO USER_PROFILE "
                            + "(PROFILE_ID, USER_ID, ADDRESS, PROFILE_IMAGE, AADHAAR_NO, PAN_NO, AADHAAR_DOC, PAN_DOC) "
                            + "VALUES (USER_PROFILE_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement ps3 = con.prepareStatement(insertProfile)) {
                        ps3.setInt(1, userId);
                        ps3.setString(2, address);
                        ps3.setString(3, profileFile);
                        ps3.setString(4, aadhar);
                        ps3.setString(5, pan);
                        ps3.setString(6, aadharFile);
                        ps3.setString(7, panFile);
                        ps3.executeUpdate();
                    }
                }
            }

            resp.sendRedirect("DashboardServlet");

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database update failed", e);
        }
    }

    private String saveFile(Part part, String oldFile) throws IOException {
        if (part == null || part.getSize() == 0) {
            return oldFile; 
        }
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String uniqueName = System.currentTimeMillis() + "_" + fileName;

        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        File file = new File(uploadDir, uniqueName);
        try (InputStream in = part.getInputStream()) {
            Files.copy(in, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        return uniqueName;
    }
}
