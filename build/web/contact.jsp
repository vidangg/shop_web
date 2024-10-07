<%-- 
    Document   : contact
    Created on : Jul 17, 2024, 9:07:37 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <%@include file="all_component/allCss.jsp" %>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .social-media-icons {
                color: #000; /* Change to your preferred color */
                margin: 0 15px;
                transition: color 0.3s;
            }
            .social-media-icons:hover {
                color: #007bff; /* Change to your preferred hover color */
            }
            .full-height {
                height: 50vh;
            }
        </style>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>

        <!-- Social media icons -->
        <div class="container-fluid full-height d-flex justify-content-center align-items-center">
            <div>
                <a href="https://www.facebook.com/" target="_blank" class="text-dark social-media-icons">
                    <i class="fab fa-facebook-f fa-4x"></i>
                </a>
                <a href="https://www.instagram.com/" target="_blank" class="text-dark social-media-icons">
                    <i class="fab fa-instagram fa-4x ml-5"></i>
                </a>
            </div>
        </div>

        <%@include file="all_component/footer.jsp" %>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
