<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pu" uri="https://com.labchemicals.functions" %>

<%-- Global variables declaration --%>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lab Chemicals | Hóa Chất Thí Nghiệm Uy Tín Chất Lượng</title>
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

<!-- ===== SLIDER ===== -->
<section class="hero-slider">
    <div class="single-slider">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-lg-8 col-12">
                    <div class="row">
                        <div class="hero-text">
                            <h1>
                                <span>GIẢM ĐẾN 50% </span>Isoamyl acetate Emplura Merck Đức
                            </h1>
                            <p>
                                Isoamyl acetate Emplura Là chất lỏng không màu. Được tạo mùi
                                chuối trong thực phẩm, dùng làm dung môi vecni và sơn mài,
                                dùng để kiểm tra hiệu quả của mặt nạ chống độc và mặt nạ
                                khí. Độ tinh khiết: ≥ 99.0 % (a/a). Quy cách: Chai thủy tinh
                                1000ml.
                            </p>
                            <div class="button">
                                <a href="product-details.jsp" class="btn">Mua Ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== LATEST PRODUCTS ===== -->
<section class="newest-products">
    <div class="container">
        <div class="section-title">
            <h2>Sản phẩm mới nhất</h2>
        </div>
        <div class="owl-carousel newest-slider">
            <c:forEach var="p" items="${requestScope.new_products}">
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
                                <i class="fa fa-star <c:if test="${i.index <= p.review.totals}">yellow</c:if>"></i>
                            </c:forEach>
                        </div>
                        <div class="product-price">
                            <c:if test="${p.oldPrice != p.newPrice}">
                                <span class="old">${pu:format(p.oldPrice)}đ</span>
                            </c:if>
                            <span>${pu:format(p.newPrice)}đ</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- ===== TRENDING PRODUCTS ===== -->
<div class="product-area">
    <div class="container">
        <!-- Title -->
        <div class="section-title">
            <h2>Sản phẩm tiêu biểu</h2>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="product-info">
                    <div class="nav-main">
                        <!-- Tab Nav -->
                        <ul class="nav nav-tabs" role="tablist">
                            <c:set var="nav_hc" value="hoa-chat"/><c:set var="nav_dc" value="dung-cu"/><c:set var="nav_tb" value="thiet-bi"/>
                            <li class="nav-item d-inline-block">
                                <a class="nav-link active" data-toggle="tab" href="#${nav_hc}" role="tab">Hóa chất</a>
                            </li>
                            <li class="nav-item d-inline-block">
                                <a class="nav-link" data-toggle="tab" href="#${nav_dc}" role="tab">Dụng cụ</a>
                            </li>
                            <li class="nav-item d-inline-block">
                                <a class="nav-link" data-toggle="tab" href="#${nav_tb}" role="tab">Thiết bị</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <c:forEach begin="1" end="3" varStatus="i">
                            <c:choose>
                                <c:when test="${i.count == 1}"><c:set var="tab_id" value="${nav_hc}"/></c:when>
                                <c:when test="${i.count == 2}"><c:set var="tab_id" value="${nav_dc}"/></c:when>
                                <c:when test="${i.count == 3}"><c:set var="tab_id" value="${nav_tb}"/></c:when>
                            </c:choose>
                            <div class="tab-pane fade <c:if test="${i.count == 1}">show active</c:if>" id="${tab_id}" role="tabpanel">
                                <div class="tab-single">
                                    <div class="row">
                                        <c:forEach var="p" begin="0" end="7" items="${requestScope.typical_products}">
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                <div class="single-product">
                                                    <div class="product-img">
                                                        <a href="${context}/shop/product-details?product_id=${p.idProduct}">
                                                            <img class="default-img" src="${p.imgPath}" alt="#"/>
                                                        </a>
                                                        <div class="cart-container">
                                                            <button class="btn-cart"><i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</button>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <a href="${context}/shop/product-details?product_id=${p.idProduct}">${p.name}</a>
                                                        <div class="rating">
                                                            <c:forEach begin="1" end="5" varStatus="i">
                                                                <i class="fa fa-star <c:if test="${i.index <= p.review.totals}">yellow</c:if>"></i>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="product-price">
                                                            <c:if test="${p.oldPrice != p.newPrice}">
                                                                <span class="old">${pu:format(p.oldPrice)}đ</span>
                                                            </c:if>
                                                            <span>${pu:format(p.newPrice)}đ</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ===== SHOP HOME LIST =====  -->
<section class="shop-home-list">
    <div class="container">
        <div class="row">
            <c:forEach begin="1" end="3" varStatus="i">
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="shop-list-title">
                        <h1>
                            <c:choose>
                                <c:when test="${i.count == 1}">Giảm giá</c:when>
                                <c:when test="${i.count == 2}">Bán chạy</c:when>
                                <c:when test="${i.count == 3}">Xem nhiều</c:when>
                            </c:choose>
                        </h1>
                    </div>
                    <c:choose>
                        <c:when test="${i.count == 1}">
                            <c:set var="items" value="${requestScope.discount_products}"/>
                        </c:when>
                        <c:when test="${i.count == 2}">
                            <c:set var="items" value="${requestScope.selling_products}"/>
                        </c:when>
                        <c:when test="${i.count == 3}">
                            <c:set var="items" value="${requestScope.view_products}"/>
                        </c:when>
                    </c:choose>
                    <c:forEach var="p" begin="0" end="2" items="${items}">
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image">
                                        <a href="${context}/shop/product-details?product_id=${p.idProduct}"><img src="${p.imgPath}" alt="#"/></a>
                                        <a href="${context}/shop/product-details?product_id=${p.idProduct}" class="buy"><i
                                                class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="content pt-5">
                                        <a class="pname" href="${context}/shop/product-details?product_id=${p.idProduct}">${p.name}</a>
                                        <p class="price">${pu:format(p.newPrice)}đ</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- ===== COUNTDOWN ===== -->
<c:set var="tp" value="${requestScope['today_discount_product']}"/>
<c:if test="${tp != null}">
    <section class="countdown">
        <div class="container-fluid p-0 h-100">
            <div class="row h-100 m-0">
                <div class="col-lg-5 col-12 h-100 m-0 p-0">
                    <div class="image h-100">
                        <img src="${tp.imgPath}" alt="#"/>
                    </div>
                </div>
                <div class="col-lg-7 col-12 h-100 m-0 p-0">
                    <div class="content">
                        <div class="heading-block">
                            <p class="small-title">Giảm giá trong ngày</p>
                            <h3 class="title"><a href="${context}/shop/product-details?product_id=${tp.idProduct}">${tp.name}</a></h3>
                            <p class="p-desc">${tp.desc}</p>
                            <h1 class="price">${pu:format(tp.newPrice)}đ <s>${pu:format(tp.oldPrice)}đ</s></h1>
                            <div class="time-container my-4 d-flex justify-content-center">
                                <div class="time-block">
                                    <span class="time-hours"></span>
                                    <span>HOURS</span>
                                </div>
                                <span class="time-delim">:</span>
                                <div class="time-block">
                                    <span class="time-minutes"></span>
                                    <span>MINUTES</span>
                                </div>
                                <span class="time-delim">:</span>
                                <div class="time-block">
                                    <span class="time-seconds"></span>
                                    <span>SECONDS</span>
                                </div>
                            </div>
                            <button class="get-now">MUA NGAY</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>

<!-- ===== SHOP BLOG =====  -->
<section class="shop-blog">
    <div class="container">
        <div class="section-title">
            <h2>Tin mới nhất</h2>
        </div>

        <div class="row">
            <div class="col-lg-4 col-md-6 col-12">
                <div class="shop-single-blog">
                    <a href="blog.jsp"><img src="../images/tin_tuc/370x300/tin_01.jpg" alt="#"/></a>
                    <div class="content p-4">
                        <p class="date">Thứ Hai, ngày 30/9/2022</p>
                        <a href="blog.jsp" class="title">Bộ Hóa chất áp giá các sản phẩm được nhập khẩu từ Mỹ...</a>
                        <a href="blog.jsp" class="more-btn">Tiếp tục đọc</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-12">
                <div class="shop-single-blog">
                    <a href="blog.jsp"><img src="../images/tin_tuc/370x300/tin_02.jpg" alt="#"/></a>
                    <div class="content p-4">
                        <p class="date">Thứ Ba, ngày 31/9/2022</p>
                        <a href="blog.jsp" class="title">Công bố chương trình khuyến mãi sản phẩm cho thí nghiệm...</a>
                        <a href="blog.jsp" class="more-btn">Tiếp tục đọc</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-12">
                <div class="shop-single-blog">
                    <a href="blog.jsp"><img src="../images/tin_tuc/370x300/tin_03.jpg" alt="#"/></a>
                    <div class="content p-4">
                        <p class="date">Chủ Nhật, ngày 29/9/2022</p>
                        <a href="blog.jsp" class="title">Tổ chức huy hoạch 200 hecta đất để xây dựng nhà máy chế...</a>
                        <a href="blog.jsp" class="more-btn">Tiếp tục đọc</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== SHOP SERVICES -->
<jsp:include page="../common/shop-services.jsp"/>

<!-- ===== FOOTER ===== -->
<jsp:include page="../common/shop-footer.jsp"/>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/shop-js.jsp"/>

</body>

</html>