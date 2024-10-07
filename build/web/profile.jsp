<%-- 
    Document   : edit_profile
    Created on : Jul 15, 2024, 11:21:21 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="dal.DBContext" %>
<%@ page import="java.util.List" %>
<%@ page import="model.user" %>
<%@ page import="model.Cart" %>
<%@ page import="DAO.CartDAOlmpl" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="all_component/navbar.jsp" %>
        <%
        user u = (user) session.getAttribute("userobj");
        %>
        <div class="container">
            <div class="row p-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1">Profile</h5>
                            <form action="register" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Full Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           value="<%=u.getName()%>" readonly="readonly">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           value="<%=u.getEmail()%>" readonly="readonly">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone Number</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           value="<%=u.getPhone()%>" readonly="readonly">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Money</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           value="<%=u.getMoney()%>" readonly="readonly">
                                  
                                </div>
                                    
                                    
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </body>
    <%@include file="all_component/footer.jsp" %>
</html>
