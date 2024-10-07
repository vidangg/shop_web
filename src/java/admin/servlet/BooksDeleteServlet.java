/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin.servlet;

import DAO.BookDAOlmpl;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Quan
 */
@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int id=Integer.parseInt(req.getParameter("id"));
            BookDAOlmpl dao = new BookDAOlmpl(DBContext.getConnection());

            boolean f = dao.deleteBooks(id);
            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "Book Delete Sucessfully");
                resp.sendRedirect("admin/all_book.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on Server");
                resp.sendRedirect("admin/all_book.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    
}
