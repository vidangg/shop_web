<%-- 
    Document   : home
    Created on : Jul 9, 2024, 11:09:45 AM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <%@include file="allCss.jsp" %>
        <style >
            
            .policy-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .policy-list-item {
                flex: 1;
                margin: 10px;
            }

            .policy-list-item ul {
                list-style: none;
                padding: 0;
            }

            .policy-list-item ul li {
                padding: 5px 0;
            }

            .headline-policy {
                font-weight: bold;
                margin-bottom: 10px;
                color: black;
            }

            .contact-number {
                color: inherit;
            }

            .coppy-right {
                padding: 5px 0;
                font-size: 12px;

            }

            .box-policy, .box-security {
                padding: 20px 0;
                background: url('b3.jpg') no-repeat center center; /* Replace with your image path */
                background-size: cover;
            }

            .box-policy a {
                text-decoration: none;
                color: #007bff;
            }

            .max-width {
                width: 100%;
                max-width: 150px;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"/>
        </c:if>
        <h3 class="text-center mt-5">Hello, Admin</h3>
        <div class="container mt-2">
            <div class="row p-5">
                <div class="col-md-2.1 ">
                    <a href="add_books.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                                <h4 style="color: black;">Add Book</h4>
                                ----------
                            </div> 
                        </div>
                    </a>
                </div>
                <div class="col-md-2 ml-5">
                    <a href="add_user.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                            <h4 style="color: black;">Add User</h4>
                            ----------
                        </div> 
                    </div>
                    </a>
                </div>
                <div class="col-md-2 ml-5">
                    <a href="all_book.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-book-open fa-3x text-danger"></i><br>
                            <h4 style="color: black;">All Book</h4>
                            ----------
                        </div> 
                    </div>
                    </a>
                </div>
                <div class="col-md-2 ml-5">
                    <a href="all_user.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-users fa-3x text-success"></i><br>
                            <h4 style="color: black;">All User</h4>
                            ----------
                        </div> 
                    </div>
                    </a>
                </div>
                <div class="col-md-2 ml-5">
                    <a href="orders.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-box-tissue fa-3x text-warning"></i><br>
                            <h4 style="color: black;">Orders</h4>
                            ----------
                        </div> 
                    </div>
                    </a>
                </div>
                
            </div>
        </div>
        <footer>
        <div class="container-fluid box-policy mt-5">
            <div class="row">
                <div class="container">
                    <div class="row">
                        <div class="policy-list">
                            <div class="policy-list-item">
                                <ul class="list-inline">
                                    <li class="headline-policy">Tư Vấn Và Đặt Hàng</li>
                                    <p>Phương thức thanh toán</p>
                                    <p>Hướng dẫn đặt hàng</p>
                                    <p>Góp ý, khiếu nại</p>
                                </ul>
                            </div>
                            <div class="policy-list-item">
                                <ul class="list-inline">
                                    <li class="headline-policy">Chính Sách</li>
                                    <p>Chính sách bảo hành</p>
                                    <p>Chính sách đổi trả</p>
                                    <p>Chính sách giao hàng</p>
                                    <p>Chính sách bảo vệ dữ liệu cá nhân</p>
                                </ul>
                            </div>
                            <div class="policy-list-item">
                                <ul class="list-inline">
                                    <li class="headline-policy">Tra Cứu Thông Tin</li>
                                    <p>Tra cứu hóa đơn điện tử</p>
                                    <p>Tra cứu ưu đãi của bạn</p>
                                    
                                </ul>
                            </div>
                            <div class="policy-list-item">
                                <ul class="list-inline">
                                    <li class="headline-policy">Hệ Thống</li>
                                    <p>Quy chế hoạt động website</p>
                                    <p>Chuyên trang Cộng tác viên</p>
                                </ul>
                            </div>
                            <div class="policy-list-item">
                                <ul class="list-inline">
                                    <li class="headline-policy">Tổng đài hỗ trợ (8h00 - 22h00)</li>
                                    <li>Tư vấn bán hàng: <a class="contact-number" href="tel:18008123">1234 5678</a> (Miễn phí)</li>
                                    <li>CSKH &amp; bảo hành: <a class="contact-number" href="tel:19008096">1234 5678</a></li>
                                    <p>Khảo sát mua hàng</p>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="container">
                    
                    <div class="row mt-20">
                        <div class="col-md-12 col-sm-12 col-xs-12 coppy-right">
                            © 2024 Công ty an ninh mạng thông minh SCS. Địa chỉ: Trung tâm Đổi mới sáng tạo Quốc gia - NIC - Số 6 Ngõ 7 Tôn Thất Thuyết, Dịch Vọng Hậu, Cầu Giấy, Hà Nội.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
    </footer>
    </body>
    
</html><%--@include file="footer.jsp" --%>
