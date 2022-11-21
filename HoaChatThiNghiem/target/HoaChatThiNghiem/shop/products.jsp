<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lab Chemicals | Danh Mục Sản Phẩm</title>
    <link rel="icon" type="image/png" href="images/labchemicals-logo-icon.png" />

    <!-- ===== STYLESHEET ===== -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/magnific-popup.min.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/jquery.fancybox.min.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="css/jquery-ui.css" />
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
                <li class="d-inline-block text-capitalize"><a href="blog-single.html">Danh sách sản phẩm</a></li>
            </ul>
        </div>
    </div>

    <!-- ===== PRODUCTS ===== -->
    <section class="products">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-12">
                    <div class="shop-sidebar">
                        <!-- Category -->
                        <div class="single-widget category">
                            <h3 class="title">Phân loại</h3>
                            <ul class="category-list">
                                <li class="mb-2"><a href="#">Acid và Bazo</a></li>
                                <li class="mb-2"><a href="#">Oxit</a></li>
                                <li class="mb-2"><a href="#">Thuốc thử</a></li>
                                <li class="mb-2"><a href="#">Chất chỉ thị</a></li>
                                <li class="mb-2"><a href="#">Giấy lọc</a></li>
                                <li class="mb-2"><a href="#">Kim loại</a></li>
                                <li><a href="#">Khí hiếm</a></li>
                            </ul>
                        </div>

                        <!-- Price Filter -->
                        <div class="single-widget range mt-4">
                            <h3 class="title">Lọc theo giá</h3>
                            <div class="price-filter d-block">
                                <div class="price-filter-inner">
                                    <div id="slider-range"></div>
                                    <div class="price_slider_amount">
                                        <div class="label-input mt-3">
                                            <span>Khoảng:</span>
                                            <input type="text" id="amount" name="price" placeholder="Nhập giá" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ul class="check-box-list mt-3">
                                <li class="mb-1">
                                    <label for="1">
                                        <input id="1" type="checkbox" />200,000đ - 500,000đ<span class="count">(13)</span>
                                    </label>
                                </li>
                                <li class="mb-1">
                                    <label for="2">
                                        <input id="2" type="checkbox" />500,000đ - 1,000,000đ<span class="count">(5)</span>
                                    </label>
                                </li>
                                <li>
                                    <label for="3">
                                        <input id="3" type="checkbox" />1,000,000đ - 2,500,000đ<span class="count">(8)</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-12">
                    <!-- Shop Top -->
                    <div class="shop-top">
                        <div class="shop-shorter float-left">
                            <div class="single-shorter d-inline-block">
                                <label>Sắp xếp theo: </label>
                                <select>
                                    <option selected="selected">Tên</option>
                                    <option>Giá</option>
                                    <option>Kích thước</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.jsp">
                                        <img class="default-img" src="../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acetic-acid.jpg" alt="#" />
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="product-details.jsp">Acid Acetic 97 - 99%</a>
                                    <div class="rating">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>2,900,000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.jsp">
                                        <img class="default-img" src="../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg" alt="#" />
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="product-details.jsp">Bazo nguyên chất 100%</a>
                                    <div class="rating">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>3,600,000đ/ống</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.jsp">
                                        <img class="default-img" src="../images/hoa_chat/acid_bazo/acid_vo_co/550x750/axit-sunfuric.jpg" alt="#" />
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="product-details.jsp">Acid Sulfuic 100%</a>
                                    <div class="rating">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>3,300,000đ/lọ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.jsp">
                                        <img class="default-img" src="../images/hoa_chat/dd_dem/550x750/dung-dich-dem-1.png" alt="#" />
                                        <span class="new">Mới</span>
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="product-details.jsp">Dung dịch đệm</a>
                                    <div class="rating">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>135,000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.jsp">
                                        <img class="default-img" src="../images/hoa_chat/chi_thi/550x750/chi-thi-1.jpg" alt="#" />
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="product-details.jsp">Chất chỉ thị đo độ acid</a>
                                    <div class="rating">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>1,500,000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.jsp">
                                        <img class="default-img" src="../images/thiet_bi/kinh_hien_vi/huynh_quang/550x750/kinh-huynh-quang-1.jpg" alt="#" />
                                        <span class="price-dec">Giảm 30%</span>
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="product-details.jsp">Kính hiển vi điện tử</a>
                                    <div class="rating">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>2,000,000,000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.jsp">
                                        <img class="default-img" src="../images/hoa_chat/dung_moi/dung_moi_may_gc/550x750/dung-moi-gc-1.jpg" alt="#" />
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="product-details.jsp">Dung môi dùng cho máy GC</a>
                                    <div class="rating">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>2,900,000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.jsp">
                                        <img class="default-img" src="../images/hoa_chat/chi_thi/550x750/chi-thi-2.jpg" alt="#" />
                                        <span class="hot">Nóng</span>
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="product-details.jsp">Chất chỉ thị màu</a>
                                    <div class="rating">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-price">
                                        <span class="old">600,000đ</span>
                                        <span>490,000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.jsp">
                                        <img class="default-img" src="../images/hoa_chat/hoa_chat_moi_truong/550x750/hoa-chat-moi-truong-1.jpg" alt="#" />
                                        <span class="new">Mới</span>
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="product-details.jsp">Hóa chất môi trường</a>
                                    <div class="rating">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-price">
                                        <span>290,000đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pagination -->
                    <div class="pagination d-flex justify-content-center mt-5">
                        <div class="pagination-container">
                            <a class="control" href="#"><i class="bi-chevron-left"></i></a>
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a class="active" href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">137</a>
                            <a class="control" href="#"><i class="bi-chevron-right"></i></a>
                        </div>
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