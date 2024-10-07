<%-- 
    Document   : setting
    Created on : Jul 15, 2024, 10:49:24 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Settings</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            a {
                text-decoration: none;
                color: black;
            }

            a:hover {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <c:if test="${empty userobj }">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-3">

           <h1 class="text-center">Hello, ${userobj.name} </h1>

            <div class="row p-5">
                <div class="col-md-6">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-book-open fa-3x"></i>
                                </div>
                                <h3>Sell Old Book..</h3>

                            </div>
                        </div>
                    </a>
                </div>


                <div class="col-md-6">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-edit fa-3x"></i>
                                </div>
                                <h3>Edit Profile</h3>

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-4">
                    <a href="user_address.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-warning">
                                    <i class="fas fa-map-marker-alt fa-3x"></i>
                                </div>
                                <h4>Your Address</h4>
                                <p>Edit Address</p>
                            </div>
                        </div>
                    </a>
                </div>


                <div class="col-md-4 mt-4">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                    <i class="fas fa-box-tissue fa-3x"></i>
                                </div>
                                <h4>My Orders</h4>
                                <p>Track Your Order</p>

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-4">
                    <a href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-success">
                                    <i class="fas fa-user-circle fa-3x"></i>
                                </div>
                                <h4>Help Center</h4>
                                <p>24/7 Service</p>

                            </div>
                        </div>
                    </a>
                </div>

                <!-- <div class="col-md-4 mt-3">
                        <a href="user_address.jsp">
                                <div class="card">
                                        <div class="card-body text-center">
                                                <div class="text-warning">
                                                        <i class="fa-solid fa-location-dot fa-3x"></i>
                                                </div>
                                                <h4>Your Address</h4>
                                                <p>Edit Address</p>

                                        </div>
                                </div>
                        </a>
                </div> -->

            </div>

        </div>

        
    </body>
    <%@include file="all_component/footer.jsp" %>
</html>
