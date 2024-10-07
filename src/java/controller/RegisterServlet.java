/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAO.UserDAOlmpl;
import dal.DBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import model.user;

/**
 *
 * @author Quan
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

            //System.out.println(name+" "+email+" "+phone+" "+password+" "+check);
            user us = new user();
            us.setName(name);
            us.setEmail(email);
            us.setPhone(phone);
            us.setPassword(password);
            us.setRole(1);
            HttpSession session = req.getSession();

            if (check != null) {
                UserDAOlmpl dao = new UserDAOlmpl(DBContext.getConnection());
                boolean f2 = dao.checkUser(email);
                if (f2) {
                    boolean f = dao.userRegister(us);
                    if (f) {
                        //System.out.println("User Register Success...");
                        session.setAttribute("succMsg", "Registration Successfully...");
                        resp.sendRedirect("register.jsp");
                    } else {
                        //System.out.println("Something wrong on server...");
                        session.setAttribute("failedMsg", "Something wrong on server...");
                        resp.sendRedirect("register.jsp");
                    }
                
                }else{
                    session.setAttribute("failedMsg", "User Already Exit");
                    resp.sendRedirect("register.jsp");
                }
            } else {
                //System.out.println("Please Check Agree Terms & Condition");
                session.setAttribute("failedMsg", "Please Check Agree Terms & Condition");
                resp.sendRedirect("register.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
