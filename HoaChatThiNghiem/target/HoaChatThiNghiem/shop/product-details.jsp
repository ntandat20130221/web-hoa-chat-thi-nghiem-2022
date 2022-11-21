<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lab Chemicals | Chi Tiết Sản Phẩm</title>
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
                <li class="d-inline-block text-capitalize"><a href="product-details.jsp">Chi tiết sản phẩm</a></li>
            </ul>
        </div>
    </div>

    <!-- ===== PRODUCT DETAIL ===== -->
    <section class="product-detail">
        <div class="row no-gutters">
            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="product-slider-active">
                    <div class="single-slider">
                        <img src="../images/hoa_chat/acid_bazo/acid_acetic/acid_acetic_01.png" alt="#" />
                    </div>
                    <div class="single-slider">
                        <img src="../images/hoa_chat/acid_bazo/acid_citric/acid_citric.jpg" alt="#" />
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="product-content p-5">
                    <h2>Axit sunfuric loãng</h2>
                    <div class="product-rating d-flex">
                        <div class="rating">
                            <i class="yellow fa fa-star"></i>
                            <i class="yellow fa fa-star"></i>
                            <i class="yellow fa fa-star"></i>
                            <i class="yellow fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <a href="#"> (33 Đánh giá)</a>
                    </div>
                    <h3><span>1,490,000đ</span> 1,000,000đ</h3>
                    <div class="product-peragraph">
                        <p>
                            Axit sunfuric - H2SO4 là một axit vô cơ mạnh, hóa chất này có đầy đủ các
                            tính chất hóa học chung của một axit.
                        </p>
                    </div>
                    <div class="quantity d-inline-block mr-3">
                        <div class="input-group">
                            <div class="button minus">
                                <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant">
                                    <i class="ti-minus"></i>
                                </button>
                            </div>
                            <input type="text" name="quant" class="input-number" data-min="1" data-max="1000" value="1" />
                            <div class="button plus">
                                <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant">
                                    <i class="ti-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="add-to-cart d-inline-block">
                        <a href="#" class="btn">Thêm vào giỏ hàng</a>
                    </div>
                    <div class="product-stock">
                        <span>22 sản phẩm có sẵn</span>
                    </div>
                    <div class="default-social mt-3">
                        <h4 class="share-now">Chia sẻ:</h4>
                        <ul class="d-inline-block">
                            <li class="d-inline-block mr-3"><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                            <li class="d-inline-block mr-3"><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            <li class="d-inline-block mr-3"><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
                            <li class="d-inline-block"><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
    <script src="js/facnybox.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery-counterup.min.js"></script>
    <script src="js/finalcountdown.min.js"></script>
    <script src="js/nicesellect.js"></script>
    <script src="js/ytplayer.min.js"></script>
    <script src="js/flex-slider.js"></script>
    <script src="js/scrollup.js"></script>
    <script src="js/onepage-nav.min.js"></script>
    <script src="js/easing.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnhgNBg6jrSuqhTeKKEFDWI0_5fZLx0vM"></script>
    <script src="js/gmap.min.js"></script>
    <script src="js/map-script.js"></script>
    <script src="js/active.js"></script>
</body>

</html>