/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.DBContext;
import DAO.UserDAOlmpl;
import jakarta.servlet.http.HttpSession;
import model.user;

/**
 *
 * @author Quan
 */
@WebServlet("/add_users")
public class UserAdd extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserAdd</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserAdd at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String name = req.getParameter("1name");
            String email = req.getParameter("1email");
            String phone = req.getParameter("1phone");
            String password = req.getParameter("1password");
            int role = Integer.parseInt(req.getParameter("1role"));

            //System.out.println(name+" "+email+" "+phone+" "+password+" "+check);
            user us = new user();
            us.setName(name);
            us.setEmail(email);
            us.setPhone(phone);
            us.setPassword(password);
            us.setRole(role);
            HttpSession session = req.getSession();

            UserDAOlmpl dao = new UserDAOlmpl(DBContext.getConnection());
            boolean f2 = dao.checkUser(email);
            if (f2) {
                boolean f = dao.userRegister(us);
                if (f) {
                    //System.out.println("User Register Success...");
                    session.setAttribute("succMsg", "User Add Successfully...");
                    resp.sendRedirect("admin/add_user.jsp");
                } else {
                    //System.out.println("Something wrong on server...");
                    session.setAttribute("failedMsg", "Something wrong on server...");
                    resp.sendRedirect("admin/add_user.jsp");
                }

            } else {
                session.setAttribute("failedMsg", "User Already Exit");
                resp.sendRedirect("admin/add_user.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
