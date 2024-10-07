<%-- 
    Document   : view_books
    Created on : Jul 15, 2024, 3:06:41 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.BookDAOlmpl" %>
<%@ page import="model.BookDtls" %>
<%@ page import="dal.DBContext" %>
<%@ page import="DAO.BookDAO" %>
<%@ page import="model.user" %>
<%@ page import="model.Comment" %>
<%@ page import="DAO.CommentDAO" %>
<%@ page import="DAO.UserDAOlmpl" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
        <style>
            .comments-container {
                background-color: #fff;
                max-width: 1140px;
                border: 1px solid #ddd;
                margin: 20px auto;
                padding: 20px;
                width: 90%;
            }
            
            .comments-container h2 {
                font-size: 22px;
                color: #333;
                margin-bottom: 10px;
            }

            .comment-form {
                display: flex;
                flex-direction: column;
                margin-bottom: 20px;
            }

            .comment-form textarea {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                resize: vertical;
                min-height: 100px;
                margin-bottom: 10px;
                font-size: 16px;
                font-family: Arial, sans-serif;
            }

            .comment-form button {
                align-self: flex-end;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                background-color: #007185;
                color: white;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .comment-form button:hover {
                background-color: #005f67;
            }

            .comment {
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
                position: relative;
            }

            .comment p {
                margin: 0;
                color: #666;
                word-wrap: break-word;
                overflow-wrap: break-word;
                white-space: normal;
                text-align: justify;
            }

            .comment .comment-header {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                margin-bottom: 5px;
            }

            .comment .comment-author {
                font-weight: bold;
                color: #333;
            }

            .comment .comment-time {
                margin-left: 5px;
                font-size: 12px;
                color: #999;
            }

            .comment .delete-button {
                position: absolute;
                top: 10px;
                right: 10px;
                background-color: #e74c3c;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 5px 10px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s;
            }

            .comment .delete-button:hover {
                background-color: #c0392b;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%
        user u=(user)session.getAttribute("userobj");
        %>
        <%@include file="all_component/navbar.jsp" %>
        <%
            int bid=Integer.parseInt(request.getParameter("bid"));
            BookDAOlmpl dao=new BookDAOlmpl(DBContext.getConnection());
            BookDtls b=dao.getBookById(bid);
        %>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="book/<%=b.getPhotoName() %>" style="height: 200px; width: 150px"><br>
                    <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName()%></span></h4>
                    <h4>Author Name: <span class="text-success"><%=b.getAuthor()%></span></h4>
                    <h4>Category: <span class="text-success"><%=b.getBookCategory()%></span></h4>
                    <h4>Status: <span class="text-success"><%=b.getStatus()%></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%=b.getBookName()%></h2>

                    <%
                    if("Old".equals(b.getBookCategory()))
                    {%>
                    <h5 class="text-primary">Contact To Seller</h5>
                    <h5 class="text-primary"><i class="fas fa-envelope"></i> EMail: <%=b.getEmail()%></h5>
                    <%}
                    %>
                    <div class="row">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-undo fa-2x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-truck fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>

                    </div>

                    <%--
                    if("Old".equals(b.getBookCategory())){
                    %>
                    <div class="text-center p-3">
                        <a href="" class="btn btn-primary ml-2 col-md-5"><i class="fas fa-cart-plus"></i> Continue Shopping</a>
                        <a href="" class="btn btn-danger ml-2 col-md-5">200$</a>
                    </div>
                    <%
                    }else{--%>
                    <div class="text-center p-3">
                        <% if ("Active".equals(b.getStatus())) { %>
                            <% if (u == null) { %>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2 col-md-5"><i class="fas fa-cart-plus"></i> Add Cart</a>
                            <% } else { %>
                                <a href="cart?bid=<%= b.getBookId() %>&&uid=<%= u.getId() %>" class="btn btn-danger btn-sm ml-2 col-md-5"><i class="fas fa-cart-plus"></i> Add Cart</a>
                            <% } %>
                        <% } else { %>
                            <p class="status-message">This comic is not available.</p>
                        <% } %>
                        <a href="" class="btn btn-danger btn-sm ml-2 col-md-5"><%= b.getPrice() %>$</a>
                    </div>
                    <%--
                    }--%>
                </div>
            </div>
        </div>
                
        <div class="comments-container">
            <h2>Bình luận</h2>
            <form action="comment" method="POST" class="comment-form">
                <input id="action" name="action" type="hidden" value="create">
                <input id="bid" name="bid" type="hidden" value="<%=b.getBookId()%>">
                <textarea id="commentText" name="commentText" placeholder="Viết bình luận của bạn..."></textarea>
                <button id="postComment">Gửi bình luận</button>
            </form>
            <div id="commentsList">
                <%
                    List<Comment> listC = new CommentDAO(DBContext.getConnection()).getCommentByProduct(b.getBookId());
                    if (listC != null && listC.size() > 0) {
                        for (int i = 0; i < listC.size(); i++) {
                            user commentU = new UserDAOlmpl(DBContext.getConnection()).getUserById(listC.get(i).getUserid());
                %>
                            <div class="comment">
                                <div class="comment-header">
                                    <span class="comment-author"><%=commentU.getName()%></span>
                                    <span class="comment-time"><%=listC.get(i).getCreated()%></span>
                                </div>
                                <p><%=listC.get(i).getComment()%></p>
                                <%
                                    if (u != null && u.getId() == listC.get(i).getUserid()) {
                                %>
                                <form action="comment" method="POST">
                                    <input id="action" name="action" type="hidden" value="delete">
                                    <input id="bid" name="bid" type="hidden" value="<%=b.getBookId()%>">
                                    <input id="commentId" name="commentId" type="hidden" value="<%=listC.get(i).getId()%>">
                                    <button id="deleteComment" class="delete-button">Xóa</button>
                                </form>
                                <%
                                    }
                                %>
                            </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>
