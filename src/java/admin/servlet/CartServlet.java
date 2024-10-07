/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin.servlet;

import DAO.BookDAOlmpl;
import DAO.CartDAOlmpl;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BookDtls;
import model.Cart;

/**
 *
 * @author Quan
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int bid=Integer.parseInt(req.getParameter("bid"));
            int uid=Integer.parseInt(req.getParameter("uid"));
            
            BookDAOlmpl dao=new BookDAOlmpl(DBContext.getConnection());
            BookDtls b=dao.getBookById(bid);
            
            Cart c=new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookName());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));
            
            CartDAOlmpl dao2=new CartDAOlmpl(DBContext.getConnection());
            boolean f=dao2.addCart(c);
            
            HttpSession session=req.getSession();
            if(f){
                session.setAttribute("addCart","Book Added to Cart");
                resp.sendRedirect("index.jsp");
            }else{
                session.setAttribute("failed","Something Wrong on Server");
                resp.sendRedirect("index.jsp");
            }
            
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    

}
