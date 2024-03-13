/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAO;
import Model.blog;
import Model.comment;
import Model.user;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author hello
 */
public class DetailBlog extends HttpServlet {

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
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        DAO d = new DAO();
        if (service == null) {
            String id = request.getParameter("id");
            if(id == null) id = (String) session.getAttribute("id");
            session.setAttribute("id", id);
            blog b = d.getBlogPostByID(Integer.parseInt(id));
            ArrayList<comment> comments = d.getCommentsForPost(Integer.parseInt(id));
            ArrayList<blog> newestBlogPosts = d.getNewestBlogPosts(3);
            request.setAttribute("newestBlogPosts", newestBlogPosts);
            request.setAttribute("comments", comments);
            request.setAttribute("b", b);
            request.getRequestDispatcher("post.jsp").forward(request, response);
        } else if (service.equals("createcomment")) {
            String content = request.getParameter("text");
            user u = (user) session.getAttribute("u");
            String postid = (String) session.getAttribute("id");

// Create a SimpleDateFormat object to format the date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
            
            Date now = new Date();
            
            String formattedDate = dateFormat.format(now);
            d.insertComment(Integer.parseInt(postid), u.getId(), content, formattedDate);
           response.sendRedirect("DetailBlog");
            
        } else if (service.equalsIgnoreCase("deletecomment")) {
            String id = request.getParameter("commentId");
            d.deleteCommentByDatePostIDUserID(id);
         response.sendRedirect("DetailBlog");
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
