/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAOlmpl;
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
 * @author Quan
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            UserDAOlmpl dao=new UserDAOlmpl(DBContext.getConnection());
            
            HttpSession session=req.getSession();
            
            String email=req.getParameter("email");
            String password=req.getParameter("password");
            user us = dao.login(email, password);
            if (us != null) {
                session.setAttribute("userobj", us);
                
                if (us.getRole() == 0) {
                    // Admin role
                    resp.sendRedirect("admin/home.jsp");
                } else if (us.getRole() == 1) {
                    // Normal user role
                    resp.sendRedirect("index.jsp");
                } else {
                    // Unknown role
                    session.setAttribute("failedMsg", "Invalid user role.");
                    resp.sendRedirect("login.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Email or Password Invalid");
                resp.sendRedirect("login.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    

}
