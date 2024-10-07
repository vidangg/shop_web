<%-- 
    Document   : user_address
    Created on : Jul 15, 2024, 11:27:53 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Address</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container">
            <div class="row p-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-success">Add Address</h5>
                            <form action="">
                                <div class="form-row">
                                    
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input type="text" class="form-control" id="inputPassword4"
                                               required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Landmark</label>
                                        <input type="text" class="form-control" id="inputPassword4"
                                               required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    
                                    <div class="form-group col-md-4">
                                        <label for="inputPassword4">City</label>
                                        <input type="text" class="form-control" id="inputPassword4" required>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputPassword4">State</label>
                                        <input type="text" class="form-control" id="inputPassword4" required>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputPassword4">Pin</label>
                                        <input type="text" class="form-control" id="inputPassword4" required>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-warning text-white">Add Address</button>
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
