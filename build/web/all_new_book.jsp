<%-- 
    Document   : all_recent_book
    Created on : Jul 15, 2024, 2:36:54 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.BookDAOlmpl" %>
<%@ page import="model.BookDtls" %>
<%@ page import="dal.DBContext" %>
<%@ page import="DAO.BookDAO" %>
<%@ page import="model.user" %>
<%@ page import="java.sql.Connection" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>China</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            .back-img {
                background: url("img/bg.jpg");
                height: 55vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }

            .crd-ho:hover {
                background-color: #fcf7f7;
            }

            #toast {
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -125px;
                background: #333;
                padding: 10px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow: 0px 0px 100px #000;
            }

            #toast.display {
                visibility: visible;
                animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
            }


            keyframes fadeIn {
                from {
                    bottom:0;
                    opacity: 0;
                }

                to {
                    bottom: 30px;
                    opacity: 1;
                }

            }

            keyframes fadeOut {
                form {
                    bottom:30px;
                    opacity: 1;
                }

                to {
                    bottom: 0;
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%
        user u=(user)session.getAttribute("userobj");
        %>
        <%--<c:if test="${not empty addCart }">
            <div id="toast">${addCart }</div>

            <script type="text/javascript">
                showToast();
                function showToast(content)
                {
                    $('#toast').addClass("display");
                    $('#toast').html(content);
                    setTimeout(() => {
                        $("#toast").removeClass("display");
                    }, 2000)
                }
            </script>

            <c:remove var="addCart" scope="session" />
        </c:if>--%>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container">
            <div class="row p-3">

                <%
            BookDAOlmpl dao1 = new BookDAOlmpl(DBContext.getConnection());
            List<BookDtls> list1 = dao1.getAllNewBook();
            for(BookDtls b1:list1){
                %>
                <div class="col-md-3">
                    <div class="card crd-ho mt-3">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b1.getPhotoName()%>" style="width: 150px; height: 200px"
                                 class="img-thumblin">
                            <p><%=b1.getBookName()%></p>
                            <p><%=b1.getAuthor()%></p>

                            <p>
                                <%
                                    if(b1.getStatus().equals("Active")){
                                %>
                                Categories: <%=b1.getBookCategory()%></p>
                            <div class="row text-center">
                                <div class="col-12">
                                    <a href="view_books.jsp?bid=<%=b1.getBookId()%>" class="btn btn-primary btn-sm">View Details</a>
                                </div>
                                <div class="col-12 mt-2">
                                    <%
                                    if(u==null){
                                    %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm ml-2 col-md-5"><i class="fas fa-cart-plus"></i> Add Cart</a>
                                    <%
                                    }else{
                                    %>
                                    <a href="cart?bid=<%=b1.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2 col-md-5"><i class="fas fa-cart-plus"></i> Add Cart</a>
                                    <%
                                    }
                                    %>
                                    <a href="" class="btn btn-danger btn-sm ml-1 col-md-5"><%=b1.getPrice()%>$</a>
                                </div>
                            </div>
                            <%
                                }else{
                            %>
                            Categories: <%=b1.getBookCategory()%></p>
                            <div class="row text-center">
                                <div class="col-12">
                                    <a href="view_books.jsp?bid=<%=b1.getBookId()%>" class="btn btn-primary btn-sm">View Details</a>
                                </div>
                                <div class="col-12 mt-2">
                                    <%
                                    if(u==null){
                                    %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm ml-2 col-md-5">Inactive</a>
                                    <%
                                    }else{
                                    %>
                                    <a  class="btn btn-danger btn-sm ml-2 col-md-5" style="color: white;">Inactive</a>
                                    <%
                                    }
                                    %>
                                    <a href="" class="btn btn-danger btn-sm ml-1 col-md-5"><%=b1.getPrice()%>$</a>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <%
                }
                %>

            </div>
        </div>
    </body>
    <%@include file="all_component/footer.jsp" %> 
</html>
