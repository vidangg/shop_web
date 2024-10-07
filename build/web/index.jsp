<%-- 
    Document   : index
    Created on : Jul 5, 2024, 10:58:18?AM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HUHU</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            .slideshow {
                height: 60vh;
                width: 100%;
                overflow: hidden;
                position: relative;
            }

            .slideshow img {
                width: 100%;
                height: 100%;
                position: absolute;
                left: 0px;
                top: 0;
                opacity: 0;
                transition: opacity 1s ease-in-out;
            }

            .slideshow img.active {
                opacity: 1;
            }

            .crd-ho:hover {
                background-color: #fcf7f7;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%
        user u=(user)session.getAttribute("userobj");
        %>
        <%@include file="all_component/navbar.jsp" %>
        <div class="slideshow">
            <img src="img/a1.jpg" class="active" />
            <img src="img/a2.jpeg" />
            <img src="img/a5.jpg" />
            <img src="img/a6.jpg" />
            <img src="img/a3.jpg" />
            <img src="img/a4.jpg" />
            <img src="img/a7.jpg" />
        </div>
        <div class="container p-3" >
            <h3 class="text-center">Vietnamese Comics</h3>
            <div class="row">
                <%
                BookDAOlmpl dao1 = new BookDAOlmpl(DBContext.getConnection());
                List<BookDtls> list1 = dao1.getRecentBooks();
                for(BookDtls b1:list1){
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
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
                                    <a class="btn btn-danger btn-sm ml-2 col-md-5"style="color: white;">Inactive</a>
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
            <div class="text-center mt-3">
                <a href="all_recent_book.jsp" class="btn btn-primary btn-sm text-white">View All</a>
            </div>

        </div>

        <hr>

        <div class="container" >
            <h3 class="text-center">Chinese Comics</h3>
            <div class="row">
                <%
                BookDAOlmpl dao = new BookDAOlmpl(DBContext.getConnection());
                List<BookDtls> list = dao.getNewBook();
                for(BookDtls b:list){
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px"
                                 class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>

                            <p>
                                <%
                                    if(b.getStatus().equals("Active")){
                                %>
                                Categories: <%=b.getBookCategory()%></p>
                            <div class="row text-center">
                                <div class="col-12">
                                    <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm">View Details</a>
                                </div>
                                <div class="col-12 mt-2">
                                    <%
                                    if(u==null){
                                    %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm ml-2 col-md-5"><i class="fas fa-cart-plus"></i> Add Cart</a>
                                    <%
                                    }else{
                                    %>
                                    <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2 col-md-5"><i class="fas fa-cart-plus"></i> Add Cart</a>
                                    <%
                                    }
                                    %>
                                    <a href="" class="btn btn-danger btn-sm ml-1 col-md-5"><%=b.getPrice()%>$</a>
                                </div>
                            </div>
                            <%
                                }else{
                            %>
                            Categories: <%=b.getBookCategory()%></p>
                            <div class="row text-center">
                                <div class="col-12">
                                    <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm">View Details</a>
                                </div>
                                <div class="col-12 mt-2">
                                    <%
                                    if(u==null){
                                    %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm ml-2 col-md-5">Inactive</a>
                                    <%
                                    }else{
                                    %>
                                    <a class="btn btn-danger btn-sm ml-2 col-md-5"style="color: white;">Inactive</a>
                                    <%
                                    }
                                    %>
                                    <a href="" class="btn btn-danger btn-sm ml-1 col-md-5"><%=b.getPrice()%>$</a>
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
        <div class="text-center mt-3">
            <a href="all_new_book.jsp" class="btn btn-primary btn-sm text-white">View All</a>
        </div>
    </div>

    <hr>

    <div class="container" >
        <h3 class="text-center">Japanese Comics</h3>
        <div class="row">
                <%
                BookDAOlmpl dao2 = new BookDAOlmpl(DBContext.getConnection());
                List<BookDtls> list2 = dao2.getOldBook();
                for(BookDtls b2:list2){
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b2.getPhotoName()%>" style="width: 150px; height: 200px"
                                 class="img-thumblin">
                            <p><%=b2.getBookName()%></p>
                            <p><%=b2.getAuthor()%></p>

                            <p>
                                <%
                                    if(b2.getStatus().equals("Active")){
                                %>
                                Categories: <%=b2.getBookCategory()%></p>
                            <div class="row text-center">
                                <div class="col-12">
                                    <a href="view_books.jsp?bid=<%=b2.getBookId()%>" class="btn btn-primary btn-sm">View Details</a>
                                </div>
                                <div class="col-12 mt-2">
                                    <%
                                    if(u==null){
                                    %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm ml-2 col-md-5"><i class="fas fa-cart-plus"></i> Add Cart</a>
                                    <%
                                    }else{
                                    %>
                                    <a href="cart?bid=<%=b2.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2 col-md-5"><i class="fas fa-cart-plus"></i> Add Cart</a>
                                    <%
                                    }
                                    %>
                                    <a href="" class="btn btn-danger btn-sm ml-1 col-md-5"><%=b2.getPrice()%>$</a>
                                </div>
                            </div>
                            <%
                                }else{
                            %>
                            Categories: <%=b2.getBookCategory()%></p>
                            <div class="row text-center">
                                <div class="col-12">
                                    <a href="view_books.jsp?bid=<%=b2.getBookId()%>" class="btn btn-primary btn-sm">View Details</a>
                                </div>
                                <div class="col-12 mt-2">
                                    <%
                                    if(u==null){
                                    %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm ml-2 col-md-5">Inactive</a>
                                    <%
                                    }else{
                                    %>
                                    <a class="btn btn-danger btn-sm ml-2 col-md-5"style="color: white;">Inactive</a>
                                    <%
                                    }
                                    %>
                                    <a href="" class="btn btn-danger btn-sm ml-1 col-md-5"><%=b2.getPrice()%>$</a>
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
        <div class="text-center mt-3">
            <a href="all_old_book.jsp" class="btn btn-primary btn-sm text-white">View All</a>
        </div>
    </div>
    <script>
        // JavaScript to handle slideshow effect
        var slides = document.querySelectorAll('.slideshow img');
        var currentSlide = 0;
        var slideInterval = setInterval(nextSlide, 5000); // Change slide every 5 seconds

        function nextSlide() {
            slides[currentSlide].classList.remove('active');
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].classList.add('active');
        }
    </script>

    <%--    <%@include file="all_component/footer.jsp" %> --%> 
</body>
<%@include file="all_component/footer.jsp" %> 
</html>
