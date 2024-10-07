<%-- 
    Document   : all_user
    Created on : Jul 15, 2024, 11:34:34 AM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDAOlmpl" %>
<%@ page import="model.user" %>
<%@ page import="dal.DBContext" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All User</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"/>
        </c:if>
        <c:if test="${not empty succMsg }">
            <p class="text-center text-success">${succMsg }</p>
            <c:remove var="succMsg" scope="session" />
        </c:if>

        <c:if test="${not empty failedMsg}">
            <p class="text-center text-danger">${failedMsg }</p>
            <c:remove var="failedMsg" scope="session" />
        </c:if> 
        <h3 class="text-center p-3">All User</h3>
        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Role</th>
                    <th scope="col">Money</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                UserDAOlmpl dao=new UserDAOlmpl(DBContext.getConnection());
                List<user> list=dao.getAllUser();
                for(user u : list){
            
                %>
                <tr>
                    <td><%=u.getId()%></td>
                    <td><%=u.getName() %></td>
                    <td><%=u.getEmail() %></td>
                    <td><%=u.getPhone() %></td>
                    <td><%= (u.getRole() == 0) ? "Admin" : "User" %>
                    </td>
                    <td><%=u.getMoney() %></td>

                    <td>
                        <a href="edit_user.jsp?id=<%=u.getId()%>" class="btn btn-sm btn-primary"><i class="far fa-edit"></i> Edit</a>
                        <a href="../deleteU?id=<%=u.getId()%>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a>
                    </td>
                </tr>
                <%
                }
                %>


            </tbody>
        </table>
    </body>
    <div style="margin-top: 100px"><%@include file="footer.jsp" %></div>
</html>
