<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pf" uri="https://com.labchemicals.functions" %>

<%-- Global variables declaration --%>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lab Chemicals | Chi Tiết Sản Phẩm</title>
    <link rel="icon" type="image/png" href="images/labchemicals-logo-icon.png"/>

    <!-- ===== STYLESHEET ===== -->
    <jsp:include page="../common/shop-css.jsp"/>
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
    <c:set var="p" value="${requestScope['product']}"/>
    <div class="container">
        <div class="row no-gutters main-detail p-5">
            <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                <div class="product-slider">
                    <div class="product-image">
                        <img class="active" src="../images/hoa_chat/acid_bazo/acid_vo_co/550x750/axit-sunfuric.jpg" alt="">
                    </div>
                    <ul class="image-list">
                        <li><img src="../images/hoa_chat/dd_dem/550x750/dung-dich-dem-1.png" alt=""></li>
                        <li><img src="../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acetic-acid.jpg" alt=""></li>
                        <li><img src="../images/hoa_chat/dung_moi/dung_moi_may_gc/550x750/dung-moi-gc-1.jpg" alt=""></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
                <div class="product-content pl-5">
                    <span class="supplier"><i class="bi bi-patch-check-fill"></i> Nhà cung cấp: ${p.supply}</span>
                    <h2>${p.name}</h2>
                    <div class="product-rating d-flex">
                        <div class="rating">
                            <c:forEach begin="1" end="5" varStatus="i">
                                <i class="fa fa-star <c:if test="${i.index <= p.star}">yellow</c:if>"></i>
                            </c:forEach>
                        </div>
                        <a href="#"> (33 Đánh giá)</a>
                    </div>
                    <div class="ps d-flex justify-content-between align-items-center">
                        <h3>${pf:format(p.newPrice)}đ<c:if test="${p.oldPrice != 0}"><span>${pf:format(p.oldPrice)}đ</span></c:if></h3>
                        <c:choose>
                            <c:when test="${p.quantity > 0}">
                                <span class="label label-in-stock">Còn hàng</span>
                            </c:when>
                            <c:when test="${p.quantity == 0}">
                                <span class="label label-out-stock">Hết hàng</span>
                            </c:when>
                            <c:otherwise>
                                <span class="label label-forbidden">Cấm bán</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="product-paragraph">
                        <p>${p.desc}</p>
                    </div>
                    <div class="quantity d-inline-block mr-3">
                        <div class="input-group mt-3">
                            <div class="button minus">
                                <button type="button" class="btn btn-primary btn-number"><i class="ti-minus"></i></button>
                            </div>
                            <input type="text" class="input-number" value="1"/>
                            <div class="button plus">
                                <button type="button" class="btn btn-primary btn-number"><i class="ti-plus"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="add-to-cart d-inline-block mt-3">
                        <a href="#" class="btn"><i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</a>
                    </div>
                    <div class="product-stock">
                        <span>${p.quantity} sản phẩm có sẵn</span>
                    </div>
                    <div class="default-social mt-3">
                        <h4 class="share-now">Chia sẻ:</h4>
                        <ul class="d-inline-block">
                            <li class="mr-1"><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                            <li class="mr-1"><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            <li class="mr-1"><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
                            <li class=""><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== LATEST PRODUCTS ===== -->
<section class="newest-products mb-5">
    <div class="container">
        <div class="section-title">
            <h2>Sản Phẩm Liên Quan</h2>
        </div>
        <div class="owl-carousel newest-slider">
            <c:forEach var="p" items="${requestScope.related_products}">
                <div class="single-product mt-0 mb-0 mr-3 ml-3">
                    <div class="product-img">
                        <a href="${context}/shop/product-details?product_id=${p.idProduct}">
                            <img class="default-img" src="${p.imgPath}" alt="#"/>
                            <span class="hot">${p.status}</span>
                        </a>
                        <div class="cart-container">
                            <button class="btn-cart"><i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</button>
                        </div>
                    </div>
                    <div class="product-content">
                        <a href="${context}/shop/product-details?product_id=${p.idProduct}">${p.name}</a>
                        <div class="rating">
                            <c:forEach begin="1" end="5" varStatus="i">
                                <i class="fa fa-star <c:if test="${i.index <= p.star}">yellow</c:if>"></i>
                            </c:forEach>
                        </div>
                        <div class="product-price">
                            <c:if test="${p.oldPrice != 0}">
                                <span class="old">${pf:format(p.oldPrice)}đ</span>
                            </c:if>
                            <span>${pf:format(p.newPrice)}đ</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- ===== SHOP SERVICES -->
<jsp:include page="../common/shop-services.jsp"/>

<!-- ===== FOOTER ===== -->
<jsp:include page="../common/shop-footer.jsp"/>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/shop-js.jsp"/>

<script>
    $('.image-list img').on('mouseover', function () {
        $('.product-image .active').attr('src', $(this).attr('src'))
    })

    $('.minus').on('click', function () {
        const input = $('.input-number')
        if (input.val() > 1)
            input.val(input.val() - 1)
    })

    $('.plus').on('click', function () {
        const input = $('.input-number')
        input.val(Number(input.val()) + 1)
    })
</script>
</body>

</html>