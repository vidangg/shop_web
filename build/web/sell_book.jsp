<%-- 
    Document   : sell_book
    Created on : Jul 15, 2024, 11:08:05 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELL</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="all_component/navbar.jsp" %>
        
        <div class="container">
            <div class="row p-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1">Sell Old Book</h5>
                            <form action="" method="post"
                                  enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           name="bname">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           name="author">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price</label>
                                    <input type="number" class="form-control" id="exampleInputPassword1"
                                           name="price">
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleFromControlFile1">Add Photo</label>
                                    <input type="file" class="form-control-file" id="exampleFromControlFile1"
                                           name="bimg">
                                </div>
                                <button type="submit" class="btn btn-primary">Sell</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file="all_component/footer.jsp" %>
</html>
