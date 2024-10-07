<%-- 
    Document   : home
    Created on : Jul 9, 2024, 11:08:41 AM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Home</h1>
        <c:if test="${not empty userobj}">
            <h1>Name:${userobj.name }</h1>
            <h1>Email:${userobj.email }</h1>
        </c:if>
    </body>
</html>
