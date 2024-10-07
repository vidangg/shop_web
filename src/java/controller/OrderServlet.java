/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.BookOrderDAOlmpl;
import DAO.CartDAOlmpl;
import DAO.UserDAOlmpl;
import DAO.UserDAO;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import model.Cart;
import model.bookorder;
import model.user;

/**
 *
 * @author Quan
 */
@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
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
            int id = Integer.parseInt(req.getParameter("id"));

            String name = req.getParameter("username");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pincode");
            String paymentType = req.getParameter("payment");

            String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;
            System.out.println(name);
            CartDAOlmpl dao = new CartDAOlmpl(DBContext.getConnection());
            
            UserDAOlmpl dao1 = new UserDAOlmpl(DBContext.getConnection());
            List<Cart> blist = dao.getBookByUser(id);
            HttpSession session = req.getSession();

            if (blist.isEmpty()) {
                resp.sendRedirect("checkout.jsp");
                session.setAttribute("failedMsg", "Add Items to Cart...");
            } else {
                user us = dao1.getUserById(id);
                double userMoney = Double.parseDouble(us.getMoney());
                double totalPrice = 0;
                for (Cart c : blist) {
                    totalPrice += c.getPrice();
                }
                if (userMoney < totalPrice) {
                    session.setAttribute("failedMsg", "Not enough money to complete the order...");
                    resp.sendRedirect("checkout.jsp");
                    return;
                } else {
                    BookOrderDAOlmpl dao2 = new BookOrderDAOlmpl(DBContext.getConnection());
                    Random random = new Random();

                    int i = random.nextInt(100);

                    bookorder o = null;
                    ArrayList<bookorder> orderList = new ArrayList<bookorder>();
                    for (Cart c : blist) {
                        o = new bookorder();
                        o.setOrderId("BOOK-ORD-00" + i);
                        o.setUserName(name);
                        o.setEmail(email);
                        o.setPhone(phone);
                        o.setFulladd(fullAdd);
                        o.setBookName(c.getBookName());
                        o.setAuthor(c.getAuthor());
                        o.setPrice(c.getPrice() + "");
                        o.setPaymentType(paymentType);
                        orderList.add(o);

                    }
                    if ("noselect".equals(paymentType)) {
                        session.setAttribute("failedMsg", "Please Select Payment Method...");
                        resp.sendRedirect("checkout.jsp");
                    } else {
                        boolean f = dao2.saveOrder(orderList);

                        if (f) {

                            us.setMoney(String.valueOf((int) userMoney - (int) totalPrice));
                            boolean moneyUpdated = dao1.updateUserMoney(us);
                            if (moneyUpdated) {
                                dao.clearCartByUser(id);
                                session.setAttribute("succMsg", "Please Select Payment Method...");
                                session.setAttribute("userobj", us);
                                resp.sendRedirect("order_success.jsp");
                            }
                        } else {
                            session.setAttribute("failedMsg", "Please Select Payment Method...");
                            resp.sendRedirect("checkout.jsp");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
