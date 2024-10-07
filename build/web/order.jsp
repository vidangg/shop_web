<%-- 
    Document   : order
    Created on : Jul 15, 2024, 11:39:36 PM
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
        <title>Order</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f7f7f7;">
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-1">
            <h5 class="text-center text-primary p-3">Your Order</h5>
            <table class="table table-striped mt-3">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    user u=(user)session.getAttribute("userobj");
                    BookOrderDAOlmpl dao=new BookOrderDAOlmpl(DBContext.getConnection());
                    List<bookorder> blist=dao.getBook(u.getEmail());
                    for(bookorder b : blist){
                    %>
                    <tr>
                        <th scope="row"><%=b.getOrderId()%></th>
                        <td><%=b.getUserName()%></td>
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
        </div>
    </body>
    <%@include file="all_component/footer.jsp" %>
</html>
