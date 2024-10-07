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
<%@ page import="DAO.UserDAOlmpl" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="all_component/navbar.jsp" %>
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="container">
            <div class="row p-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1">Edit Profile</h5>
                            <c:if test="${not empty succMsg }">
                                <p class="text-center text-success">${succMsg }</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>
                            
                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg }</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                            <form action="update_profile" method="post">
                                <input type="hidden" 
                                               value="${userobj.id}" name="id">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Full Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required = "required"
                                           name="fname" value="${userobj.name}">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required = "required"
                                           name="email" value="${userobj.email}">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone Number</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required = "required"
                                           name="phone" value="${userobj.phone}">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" 
                                           required = "required" name="password" value="${userobj.password}">
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
    </body>
    <%@include file="all_component/footer.jsp" %>
</html>
