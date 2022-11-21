<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lab Chemicals | Giỏ Hàng</title>
    <link rel="icon" type="image/png" href="images/labchemicals-logo-icon.png" />

    <!-- ===== STYLESHEET ===== -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/magnific-popup.min.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/jquery.fancybox.min.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="css/niceselect.css" />
    <link rel="stylesheet" href="css/animate.css" />
    <link rel="stylesheet" href="css/flex-slider.min.css" />
    <link rel="stylesheet" href="css/owl-carousel.css" />
    <link rel="stylesheet" href="css/slicknav.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/responsive.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
</head>

<body>
    <!-- ===== PRELOADER ===== -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>

    <!-- ===== HEADER ===== -->
    <jsp:include page="../common/shop-header.jsp" />

    <!-- ===== BREADCRUMBS ===== -->
    <div class="breadcrumbs py-4">
        <div class="container text-left">
            <ul class="bread-list d-inline-block">
                <li class="d-inline-block text-capitalize"><a href="index.jsp">Trang chủ<i class="ti-arrow-right mx-2"></i></a></li>
                <li class="d-inline-block text-capitalize"><a href="cart.jsjp">Giỏ hàng</a></li>
            </ul>
        </div>
    </div>

    <!-- ===== SHOPPING CART ===== -->
    <div class="shopping-cart">
        <div class="container">
            <!-- Shopping Sumary -->
            <table class="table shopping-summery bg-white">
                <thead>
                    <tr class="main-hading">
                        <th>SẢN PHẨM</th>
                        <th>TÊN SẢN PHẨM</th>
                        <th class="text-center">GIÁ</th>
                        <th class="text-center">SỐ LƯỢNG</th>
                        <th class="text-center">TỔNG</th>
                        <th class="text-center">
                            <i class="ti-trash remove-icon"></i>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="image" data-title="No">
                            <img src="https://via.placeholder.com/100x100" alt="#" />
                        </td>
                        <td class="product-des" data-title="Description">
                            <p class="product-name">
                                <a href="product-details.jsp">Axit Sunfuric loãng</a>
                            </p>
                            <p class="product-des">
                                Axit sunfuric là một axit mạnh, hóa chất này có đầy đủ các
                                tính chất hóa học chung của axit.
                            </p>
                        </td>
                        <td class="price text-center" data-title="Price">
                            <span>1,000,000đ</span>
                        </td>
                        <td class="qty" data-title="Qty">
                            <!-- Input Order -->
                            <div class="input-group">
                                <div class="button minus">
                                    <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                        <i class="ti-minus"></i>
                                    </button>
                                </div>
                                <input type="text" name="quant[1]" class="input-number" data-min="1" data-max="100" value="1" />
                                <div class="button plus">
                                    <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                        <i class="ti-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td class="total-amount text-center" data-title="Total">
                            <span>1,000,000đ</span>
                        </td>
                        <td class="action text-center" data-title="Remove">
                            <a href="#"><i class="ti-trash remove-icon"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="image" data-title="No">
                            <img src="https://via.placeholder.com/100x100" alt="#" />
                        </td>
                        <td class="product-des" data-title="Description">
                            <p class="product-name">
                                <a href="product-details.jsp">Axit Sunfuric loãng</a>
                            </p>
                            <p class="product-des">
                                Axit sunfuric là một axit mạnh, hóa chất này có đầy đủ các
                                tính chất hóa học chung của axit.
                            </p>
                        </td>
                        <td class="price text-center" data-title="Price">
                            <span>1,000,000đ</span>
                        </td>
                        <td class="qty" data-title="Qty">
                            <!-- Input Order -->
                            <div class="input-group">
                                <div class="button minus">
                                    <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                        <i class="ti-minus"></i>
                                    </button>
                                </div>
                                <input type="text" name="quant[1]" class="input-number" data-min="1" data-max="100" value="1" />
                                <div class="button plus">
                                    <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                        <i class="ti-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td class="total-amount text-center" data-title="Total">
                            <span>1,000,000đ</span>
                        </td>
                        <td class="action text-center" data-title="Remove">
                            <a href="#"><i class="ti-trash remove-icon"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="image" data-title="No">
                            <img src="https://via.placeholder.com/100x100" alt="#" />
                        </td>
                        <td class="product-des" data-title="Description">
                            <p class="product-name">
                                <a href="product-details.jsp">Axit Sunfuric loãng</a>
                            </p>
                            <p class="product-des">
                                Axit sunfuric là một axit mạnh, hóa chất này có đầy đủ các
                                tính chất hóa học chung của axit.
                            </p>
                        </td>
                        <td class="price text-center" data-title="Price">
                            <span>1,000,000đ</span>
                        </td>
                        <td class="qty" data-title="Qty">
                            <!-- Input Order -->
                            <div class="input-group">
                                <div class="button minus">
                                    <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                        <i class="ti-minus"></i>
                                    </button>
                                </div>
                                <input type="text" name="quant[1]" class="input-number" data-min="1" data-max="100" value="1" />
                                <div class="button plus">
                                    <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                        <i class="ti-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td class="total-amount text-center" data-title="Total">
                            <span>1,000,000đ</span>
                        </td>
                        <td class="action text-center" data-title="Remove">
                            <a href="#"><i class="ti-trash remove-icon"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- Total Amount -->
            <div class="total-amount">
                <div class="row">
                    <div class="col-lg-6 col-md-4 col-12">
                        <p class="last">Tổng trị giá<span>3,000,000đ</span></p>
                    </div>
                    <div class="col-lg-3 col-md-4 col-12">
                        <a href="index.jsp" class="btn cont">Tiếp tục mua</a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-12">
                        <a href="checkout.jsp" class="btn buy">Mua hàng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== SHOP SERVICES ===== -->
    <jsp:include page="../common/shop-services.jsp" />

    <!-- ===== FOOTER ===== -->
    <footer class="footer">
        <!-- Footer Top -->
        <div class="footer-top pt-5 pb-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-6 col-12">
                        <div class="single-footer about pr-5">
                            <div class="logo mb-4">
                                <a href="index.jsp"><img src="images/labchemicals-logo-non-bg.png" alt="#" /></a>
                            </div>
                            <p class="text">
                                Lab Chemicals là trang web mua sắm trực tuyến với sản phẩm chính là
                                hóa chất dùng cho thí nghiệm. Chúng tôi cam kết đem đến những
                                sản phẩm chất lượng với mức giá TỐT NHẤT trên thị trường.
                            </p>
                            <p class="call">Có bất kỳ câu hỏi nào vui lòng liên hệ:<span class="d-block"><a href="tel:123456789">0983 803 100</a></span></p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-12">
                        <div class="single-footer links">
                            <h4>Thông tin</h4>
                            <ul>
                                <li class="d-block mb-2"><a href="#0">Về chúng tôi</a></li>
                                <li class="d-block mb-2"><a href="#0">Câu hỏi thường gặp</a></li>
                                <li class="d-block mb-2"><a href="#0">Điều khoản dịch vụ</a></li>
                                <li class="d-block mb-2"><a href="#0">Liên hệ</a></li>
                                <li class="d-block"><a href="#0">Giúp đỡ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-12">
                        <div class="single-footer links">
                            <h4>Khách hàng</h4>
                            <ul>
                                <li class="d-block mb-2"><a href="#0">Thanh toán</a></li>
                                <li class="d-block mb-2"><a href="#0">Hoàn tiền</a></li>
                                <li class="d-block mb-2"><a href="#0">Lợi nhuận</a></li>
                                <li class="d-block mb-2"><a href="#0">Vận chuyển</a></li>
                                <li class="d-block"><a href="#0">Chính sách bảo mật</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="single-footer social">
                            <h4>Liên lạc</h4>
                            <div class="contact">
                                <ul>
                                    <li class="mb-2">123, phương Linh Trung, Tp. Thủ Đức, Tp. Hồ Chí Minh</li>
                                    <li class="mb-2">35 Đinh Tiên Hoàng, phường 5, quận 5, Tp. Hồ Chí Minh</li>
                                    <li class="mb-2">info@lachemicals.com</li>
                                    <li>0983 803 100</li>
                                </ul>
                            </div>
                            <ul class="icon mt-3">
                                <li class="d-inline-block mr-4"><a href="#"><i class="ti-facebook"></i></a></li>
                                <li class="d-inline-block mr-4"><a href="#"><i class="ti-twitter"></i></a></li>
                                <li class="d-inline-block mr-4"><a href="#"><i class="ti-youtube"></i></a></li>
                                <li class="d-inline-block"><a href="#"><i class="ti-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Copyright -->
        <div class="copyright">
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-lg-6 col-12">
                            <div class="left">
                                <p class="text-white">
                                    © 2022 - Bản quyền thuộc về Lab Chemicals &#8722; Đã đăng ký bản quyền.
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-12">
                            <div class="float-right">
                                <img src="images/payments.png" alt="#" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- ===== JAVASCRIPT ===== -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-migrate-3.0.0.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slicknav.min.js"></script>
    <script src="js/owl-carousel.js"></script>
    <script src="js/magnific-popup.js"></script>
    <script src="js/facnybox.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/finalcountdown.min.js"></script>
    <script src="js/nicesellect.js"></script>
    <script src="js/ytplayer.min.js"></script>
    <script src="js/flex-slider.js"></script>
    <script src="js/scrollup.js"></script>
    <script src="js/onepage-nav.min.js"></script>
    <script src="js/easing.js"></script>
    <script src="js/active.js"></script>
</body>

</html>