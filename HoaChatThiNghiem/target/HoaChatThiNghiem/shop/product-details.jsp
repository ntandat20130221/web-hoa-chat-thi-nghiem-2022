<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lab Chemicals | Chi Tiết Sản Phẩm</title>
    <link rel="icon" type="image/png" href="images/labchemicals-logo-icon.png"/>

    <!-- ===== STYLESHEET ===== -->
    <jsp:include page="../common/shop-css.jsp" />
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
<jsp:include page="../common/shop-header.jsp"/>

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
                    <img src="../images/hoa_chat/acid_bazo/acid_acetic/acid_acetic_01.png" alt="#"/>
                </div>
                <div class="single-slider">
                    <img src="../images/hoa_chat/acid_bazo/acid_citric/acid_citric.jpg" alt="#"/>
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
                        <input type="text" name="quant" class="input-number" data-min="1" data-max="1000" value="1"/>
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
<jsp:include page="../common/shop-footer.jsp"/>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/shop-js.jsp"/>

</body>

</html>