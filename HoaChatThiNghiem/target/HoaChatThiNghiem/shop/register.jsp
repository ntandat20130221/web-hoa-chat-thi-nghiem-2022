<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lab Chemicals | Đăng Ký Ngay</title>
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
    <!-- ===== HEADER ===== -->
    <header class="header-account">
        <div class="container">
            <div class="row py-3">
                <div class="col-lg-7 col-md-7 col-12">
                    <div class="title-left d-flex justify-content-start h-100 align-items-center">
                        <a class="w-25 mr-4"  href="index.jsp"><img src="images/labchemicals-logo.png" alt="" /></a>
                        <span class="d-inline-block">Đăng Ký</span>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5 col-12">
                    <div class="title-right d-flex h-100 justify-content-end align-items-center">
                        <a href="#0">Bạn cần giúp đỡ?</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- ===== BREADCRUMBS ===== -->
    <div class="breadcrumbs py-4">
        <div class="container text-left">
            <ul class="bread-list d-inline-block">
                <li class="d-inline-block text-capitalize"><a href="index.jsp">Trang chủ<i class="ti-arrow-right mx-2 mx-2"></i></a></li>
                <li class="d-inline-block text-capitalize"><a href="register.jsp">Đăng ký</a></li>
            </ul>
        </div>
    </div>

    <!-- ===== FORM INPUT ===== -->
    <section class="form-input py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-7 col-12 text-center">
                    <img width="80%" src="images/labs/login_start.jpg" alt="" />
                </div>
                <div class="col-lg-5 col-md-5 col-12">
                    <div class="h-100 d-flex align-items-center">
                        <form class="m-0 p-5 text-center">
                            <h5 class="mb-4">Đăng Ký</h5>
                            <input class="w-100 mb-3" type="text" placeholder="Email" />
                            <input class="w-100 mb-3" type="password" placeholder="Mật khẩu" />
                            <input class="w-100 mb-4" type="password" placeholder="Nhập lại mật khẩu" />
                            <button class="next w-100 mb-3">Tiếp theo</button>
                            <span class="shotcut">Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập</a></span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== SHOP SERVICES ===== -->
    <jsp:include page="../common/shop-services.jsp" />

    <!-- ===== FOOTER ===== -->
    <jsp:include page="../common/shop-footer.jsp" />

    <!-- ===== JAVASCRIPT ===== -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-migrate-3.0.0.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slicknav.min.js"></script>
    <script src="js/owl-carousel.js"></script>
    <script src="js/magnific-popup.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/finalcountdown.min.js"></script>
    <script src="js/nicesellect.js"></script>
    <script src="js/flex-slider.js"></script>
    <script src="js/scrollup.js"></script>
    <script src="js/onepage-nav.min.js"></script>
    <script src="js/easing.js"></script>
    <script src="js/active.js"></script>
</body>

</html>