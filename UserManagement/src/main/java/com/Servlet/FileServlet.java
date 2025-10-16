package com.Servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/uploads/*")
public class FileServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "E:/UserManagement/uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = req.getPathInfo(); // gets /1760457002961_Pancard.jpg
        if (fileName == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "File name missing");
            return;
        }

        File file = new File(UPLOAD_DIR, fileName.substring(1)); // remove leading "/"
        if (!file.exists()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            return;
        }

        // Set content type
        String contentType = getServletContext().getMimeType(file.getName());
        if (contentType == null) contentType = "application/octet-stream";
        resp.setContentType(contentType);
        resp.setContentLengthLong(file.length());

        try (FileInputStream in = new FileInputStream(file);
             OutputStream out = resp.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while((bytesRead = in.read(buffer)) != -1){
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
