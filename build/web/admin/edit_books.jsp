<%-- 
    Document   : add_books
    Created on : Jul 12, 2024, 3:07:23 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.BookDAOlmpl" %>
<%@ page import="model.BookDtls" %>
<%@ page import="dal.DBContext" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Edit Book</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #f0f2f2">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-2">
                        <div class="card-body ">
                            <h4 class="text-center">Edit Books</h4>
                             

                            <%
                                int id=Integer.parseInt(request.getParameter("id"));
                                BookDAOlmpl dao=new BookDAOlmpl(DBContext.getConnection());
                                BookDtls b=dao.getBookById(id);
                            %>

                            <form action="../editbooks" method="post"
                                  >
                                <input type="hidden" name="id" value="<%=b.getBookId()%>">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           name="bname" value="<%=b.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           name="author" value="<%=b.getAuthor()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price</label>
                                    <input type="number" class="form-control" id="exampleInputPassword1"
                                           name="price" value="<%=b.getPrice()%>">
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Book Categories</label>
                                    <select id="inputState" name="categories" class="form-control">
                                        
                                        <%
                                        if("VietNam".equals(b.getBookCategory())){
                                        %>
                                        <option value="VietNam">VietNam</option>
                                        <option value="China">China</option>
                                        <option value="Japan">Japan</option>
                                        <%
                                            }else if("China".equals(b.getBookCategory())){
                                        %>
                                        <option value="China">China</option>
                                        <option value="VietNam">VietNam</option>
                                        
                                        <option value="Japan">Japan</option>
                                        <%
                                            }else{
                                        %>
                                        <option value="Japan">Japan</option>
                                        <option value="VietNam">VietNam</option>
                                        <option value="China">China</option>
                                        
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Book Status</label>
                                    <select id="inputState" name="status" class="form-control">
                                        
                                        <%
                                        if("Active".equals(b.getStatus())){
                                        %>

                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                            }else{
                                        %>
                                        
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active">Active</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div ><%@include file="footer.jsp" %></div>
    </body>
</html>
