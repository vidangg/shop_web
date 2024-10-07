<%-- 
    Document   : edit_user
    Created on : Jul 17, 2024, 9:39:28 AM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDAOlmpl" %>
<%@ page import="model.user" %>
<%@ page import="dal.DBContext" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Book</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #f0f2f2">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-2">
                        <div class="card-body ">
                            <h4 class="text-center">Edit User</h4>


                            <%
                                int id=Integer.parseInt(request.getParameter("id"));
                                UserDAOlmpl dao=new UserDAOlmpl(DBContext.getConnection());
                                user b=dao.getUserById(id);
                            %>

                            <form action="../edituser" method="post">
                                <input type="hidden" 
                                       value="<%=b.getId()%>" name="id">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Full Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           name="fname" value="<%=b.getName()%>">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           name="email" value="<%=b.getEmail()%>">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone Number</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           name="phone" value="<%=b.getPhone()%>">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Password</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" 
                                           name="password" value="<%=b.getPassword()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Money</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           name="money" value="<%=b.getMoney()%>">
                                </div>
                                <div class="form-group">
                                    <label for="role">Role</label>
                                    <select id="role" name="role" class="form-control">

                                        <%
                                        int role = b.getRole();
                                        if (role == 1) {
                                        %>
                                        <option value="1">User</option>
                                        <option value="0">Admin</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="0">Admin</option>
                                        <option value="1">User</option>
                                        <%
                                        }
                                        %>
                                    </select>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Update</button><br>


                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div ><%@include file="footer.jsp" %></div>
    </body>
</html>
