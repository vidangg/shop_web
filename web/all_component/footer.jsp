<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
        /* General Styling */
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
            background: url('img/b3.jpg') no-repeat center center; /* Replace with your image path */
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
    <!-- Footer Content -->
    <footer>
        <div class="container-fluid box-policy mt-3">
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
</html>
