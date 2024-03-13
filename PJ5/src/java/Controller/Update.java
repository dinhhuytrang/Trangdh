/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAO;
import Model.blog;
import Model.user;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author hello
 */
@MultipartConfig
public class Update extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("postID");
        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        String service = request.getParameter("service");
        DAO d = new DAO();
        blog b = d.getBlogPostByID(Integer.parseInt(id));
        request.setAttribute("b", b);
        request.getRequestDispatcher("Update.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO d = new DAO();
        String id = (String) session.getAttribute("id");
// Get the form fields
        String desiredFileName = "";
        String blogTitle = request.getParameter("blogtitle");
        String content = request.getParameter("content");
        String Summary = request.getParameter("Summary");

// Get the uploaded image
        if (request.getPart("coverimage") != null && !request.getPart("coverimage").getSubmittedFileName().isEmpty()) {
            Part filePart = request.getPart("coverimage");

// Verify that the uploaded file is an image
            String contentType = filePart.getContentType();
            if (!contentType.startsWith("image/")) {
                // The uploaded file is not an image, handle the error
                request.setAttribute("ERR", "This is not an image");
                request.getRequestDispatcher("CreateBlog.jsp").forward(request, response);
                return;
            }

// Check the file size (limit to 5MB)
            long fileSize = filePart.getSize();
            if (fileSize > 5 * 1024 * 1024) { // 5MB in bytes
                // The file size exceeds the limit, handle the error
                request.setAttribute("ERR", "File must be less than 5MB");
                request.getRequestDispatcher("CreateBlog.jsp").forward(request, response);
                return;
            }

// Extract the original file name and file extension
            String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'));

// Define the desired file name (you can modify this as needed)
            desiredFileName = id + fileExtension;

// Specify the directory to store images within your web application
            String imageDirectory = getServletContext().getRealPath("/images");

// Create the directory if it doesn't exist
            File uploadDir = new File(imageDirectory);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

// Check if a file with the same name already exists and delete it
            File existingFile = new File(uploadDir, desiredFileName);
            if (existingFile.exists()) {
                existingFile.delete();
            }

// Save the uploaded image with the desired file name to the directory
            try ( InputStream fileInput = filePart.getInputStream()) {
                Path imagePath = Paths.get(uploadDir.getAbsolutePath(), desiredFileName);
                Files.copy(fileInput, imagePath);
            }
        } else {
            desiredFileName = d.getBlogPostByID(Integer.parseInt(id)).getImageURL();

        }
        d.updateBlogPost(Integer.parseInt(id), blogTitle, content, desiredFileName, Summary);
        response.sendRedirect("Home"); // Change this to the actual success page

    }



/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
@Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
