<%-- 
    Document   : all_book
    Created on : Jul 12, 2024, 3:19:21 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.BookOrderDAOlmpl" %>
<%@ page import="model.bookorder" %>
<%@ page import="dal.DBContext" %>

<%@ page import="model.user" %>
<%@ page import="java.sql.Connection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Orders</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #f0f2f2">
        <%@include file="navbar.jsp" %>
        <h3 class="text-center p-3">All Orders</h3>
        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone No</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment type</th>
                </tr>
            </thead>
            <tbody>
                <%
                BookOrderDAOlmpl dao=new BookOrderDAOlmpl(DBContext.getConnection());
                List<bookorder> blist=dao.getAllOrderBook();
                for(bookorder b : blist){
                %>
                <tr>
                    <th scope="row"><%=b.getOrderId()%></th>
                    <td><%=b.getUserName()%></td>
                    <td><%=b.getEmail()%></td>
                    <td><%=b.getFulladd()%></td>
                    <td><%=b.getPhone()%></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getPaymentType()%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div style="margin-top: 100px"><%@include file="footer.jsp" %></div>
    </body>
</html>
