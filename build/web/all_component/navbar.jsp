<%-- 
    Document   : navbar
    Created on : Jul 5, 2024, 11:17:30?AM
    Author     : Quan
--%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-4 text-primary">
            <h3><i class="fas fa-book"></i> ComicShop</h3>
        </div>
        <div class="col-md-5 ">
            <form class="form-inline my-2 my-lg-0"  action="search.jsp" method="post">
                <input class="form-control mr-sm-2" type="search" name="ch"
                       placeholder="Search" aria-label="Search" style="width: 333px;">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>

        <c:if test="${not empty userobj}">
            <div class="col-md-3 text-right d-flex align-items-center justify-content-start ">
                <a href="checkout.jsp" class="ml-1"><i class="fas fa-cart-plus fa-2x"></i></a>
                
                <a href="profile.jsp" class="btn btn-primary ml-4"style="width: 200px;"><i class="far fa-user"></i> ${userobj.name} - ${userobj.money}$</a>
                <a href="logout" class="btn btn-primary ml-2"style="width: 107px;"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </c:if>
        
        <c:if test="${empty userobj}">
            <div class="col-md-3 text-right">
                <a href="login.jsp" class="btn btn-primary ml-8 "style="width: 107px;"><i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="register.jsp" class="btn btn-primary ml-1"style="width: 107px;"><i class="fas fa-user-plus"></i> Register</a>
            </div>
        </c:if>
    </div>

</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

    <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarSupportedContent" 
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_recent_book.jsp"><i class="fas fa-ellipsis-v"></i> VietNam</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_new_book.jsp"><i class="fas fa-ellipsis-v"></i> China</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link disabled" href="all_old_book.jsp"><i class="fas fa-ellipsis-v"></i> Japan</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"style="width: 120px;"><i class="fas fa-cog"></i> Setting</a>
            <a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-2" type="submit"style="width: 120px;"><i class="fas fa-phone-square-alt"></i> Contact Us</a>
        </form>
    </div>
</nav>