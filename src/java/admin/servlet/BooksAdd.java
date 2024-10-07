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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import model.BookDtls;

/**
 *
 * @author Quan
 */
@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddServelet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddServelet at " + req.getContextPath() + "</h1>");
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
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = req.getParameter("categories");
            String status = req.getParameter("status");
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();

            // Đường dẫn lưu trữ ảnh
            String uploadDir = getServletContext().getRealPath("/huhu/web/book");
            Files.createDirectories(Paths.get(uploadDir));

            String uploadPath = uploadDir + File.separator + fileName;
            while (Files.exists(Paths.get(uploadPath))) {
                fileName = System.currentTimeMillis() + "_" + fileName;
                uploadPath = uploadDir + File.separator + fileName;
            }

            // Lưu file ảnh
            try (InputStream inputStream = part.getInputStream()) {
                Files.copy(inputStream, Paths.get(uploadPath));
            }

            BookDtls b = new BookDtls(bookName, author, price, categories, status, fileName, "admin");

            BookDAOlmpl dao = new BookDAOlmpl(DBContext.getConnection());

            boolean f = dao.addBooks(b);

            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "Book Add Sucessfully");
            } else {
                session.setAttribute("failedMsg", "Something wrong on Server");
            }
        } catch (Exception e) {
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Exception: " + e.getMessage());
            e.printStackTrace();
        } finally {
            resp.sendRedirect("admin/add_books.jsp");
        }
    }
}


