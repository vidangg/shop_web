/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.CommentDAO;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.user;

/**
 *
 * @author Hieu
 */
@WebServlet(name="CommentServlet", urlPatterns={"/comment"})
public class CommentServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CommentServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        user u = (user) session.getAttribute("userobj");
        if (u != null) {
            String action = request.getParameter("action");
            if (action.equals("create")) {
                int bid = Integer.parseInt(request.getParameter("bid"));
                String commentText = request.getParameter("commentText").trim();
                if (commentText != null) {
                    String commentFinal = commentText.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
                    new CommentDAO(DBContext.getConnection()).newComment(u.getId(), bid, commentFinal);
                    request.setAttribute("bid", bid);
                    request.getRequestDispatcher("view_books.jsp").forward(request, response);
                } else {
                    String err = "The comment is empty! Try again!";
                    request.setAttribute("bid", bid);
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("view_books.jsp").forward(request, response);
                }
            } else if (action.equals("delete")) {
                int commentId = Integer.parseInt(request.getParameter("commentId"));
                int bid = Integer.parseInt(request.getParameter("bid"));
                new CommentDAO(DBContext.getConnection()).deleteComment(commentId);
                request.setAttribute("bid", bid);
                request.getRequestDispatcher("view_books.jsp").forward(request, response);
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
