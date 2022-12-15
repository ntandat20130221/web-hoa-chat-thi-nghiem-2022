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
            <li class="d-inline-block text-capitalize"><a href="${context}/shop/home">Trang chủ<i class="ti-arrow-right mx-2"></i></a></li>
            <li class="d-inline-block text-capitalize"><a href="${context}/shop/product-details">Chi tiết sản phẩm</a></li>
        </ul>
    </div>
</div>

<c:set var="p" value="${requestScope['product']}"/>
<!-- ===== PRODUCT DETAIL ===== -->
<section class="product-detail">
    <div class="container">
        <div class="row no-gutters main-detail p-5">
            <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                <div class="product-slider">
                    <div class="product-image">
                        <img class="active" src="${p.imgPath}" alt="">
                    </div>
                    <ul class="image-list">
                        <li><img src="${p.imgPath}" alt=""></li>
                        <li><img src="${p.imgPath}" alt=""></li>
                        <li><img src="${p.imgPath}" alt=""></li>
                        <li><img src="${p.imgPath}" alt=""></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
                <div class="product-d-content pl-5">
                    <span class="supplier"><i class="bi bi-patch-check-fill"></i> Nhà cung cấp: ${p.supply}</span>
                    <h2 class="pd-name">${p.name}</h2>
                    <div class="product-rating d-flex">
                        <div class="rating">
                            <c:forEach begin="1" end="5" varStatus="i">
                                <i class="fa fa-star <c:if test="${i.index <= p.review.average}">yellow</c:if>"></i>
                            </c:forEach>
                        </div>
                        <a href="#"> (${p.review.totals} Đánh Giá)</a>
                        <span>${p.sold} Đã Bán</span>
                        <span>${p.views} Đã Xem</span>
                    </div>
                    <div class="ps d-flex justify-content-between align-items-center">
                        <h3 class="the-price">${pu:format(p.newPrice)}đ<c:if test="${p.oldPrice != p.newPrice}">
                            <span class="dp">${pu:format(p.oldPrice)}đ</span>
                            <span class="percent">-${pu:discount(p.oldPrice, p.newPrice)}%</span></c:if>
                        </h3>
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
                    <div class="share-social mt-3">
                        <span class="label-share">Chia sẻ</span>
                        <ul class="wrapper">
                            <li class="icon facebook">
                                <span class="tooltip">Facebook</span>
                                <span><i class="fa fa-facebook-f"></i></span>
                            </li>
                            <li class="icon twitter">
                                <span class="tooltip">Twitter</span>
                                <span><i class="fa fa-twitter"></i></span>
                            </li>
                            <li class="icon youtube">
                                <span class="tooltip">Youtube</span>
                                <span><i class="fa fa-youtube-play"></i></span>
                            </li>
                            <li class="icon instagram">
                                <span class="tooltip">Instagram</span>
                                <span><i class="fa fa-instagram"></i></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== REVIEW ===== -->
<section class="product-reviews">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-lg-3">
                <div class="rating-left h-100 d-flex align-items-center">
                    <div>
                        <span class="rating-number">${p.review.average}<span>/5</span></span>
                        <div class="rating-stars">
                            <c:forEach begin="1" end="5" varStatus="i">
                                <i class="fa fa-star <c:if test="${i.index <= p.review.average}">yellow</c:if>"></i>
                            </c:forEach>
                        </div>
                        <span class="num-ratings">${p.review.totals} đánh giá</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="rating-right">
                    <div class="rating-5 row p-1">
                        <div class="col-lg-2">
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                        </div>
                        <div class="col-lg-10 d-flex align-items-center pl-0">
                            <div class="rate-outer">
                                <div class="rate-inner" data-rate="${p.review.percent5}"></div>
                            </div>
                            <div class="rating-percent">${p.review.percent5}%</div>
                            <div class="rating-divider"></div>
                            <div class="rating-count">${p.review.fiveStars} đánh giá</div>
                        </div>
                    </div>
                    <div class="rating-4 row p-1">
                        <div class="col-lg-2">
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="col-lg-10 d-flex align-items-center pl-0 w-100">
                            <div class="rate-outer">
                                <div class="rate-inner" data-rate="${p.review.percent4}"></div>
                            </div>
                            <div class="rating-percent">${p.review.percent4}%</div>
                            <div class="rating-divider"></div>
                            <div class="rating-count">${p.review.fourStars} đánh giá</div>
                        </div>
                    </div>
                    <div class="rating-3 row p-1">
                        <div class="col-lg-2">
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="col-lg-10 d-flex align-items-center pl-0">
                            <div class="rate-outer">
                                <div class="rate-inner" data-rate="${p.review.percent3}"></div>
                            </div>
                            <div class="rating-percent">${p.review.percent3}%</div>
                            <div class="rating-divider"></div>
                            <div class="rating-count">${p.review.threeStars} đánh giá</div>
                        </div>
                    </div>
                    <div class="rating-2 row p-1">
                        <div class="col-lg-2">
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="col-lg-10 d-flex align-items-center pl-0">
                            <div class="rate-outer">
                                <div class="rate-inner" data-rate="${p.review.percent2}"></div>
                            </div>
                            <div class="rating-percent">${p.review.percent2}%</div>
                            <div class="rating-divider"></div>
                            <div class="rating-count">${p.review.twoStars} đánh giá</div>
                        </div>
                    </div>
                    <div class="rating-1 row p-1">
                        <div class="col-lg-2">
                            <i class="fa fa-star yellow"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="col-lg-10 d-flex align-items-center pl-0">
                            <div class="rate-outer">
                                <div class="rate-inner" data-rate="${p.review.percent1}"></div>
                            </div>
                            <div class="rating-percent">${p.review.percent1}%</div>
                            <div class="rating-divider"></div>
                            <div class="rating-count">${p.review.oneStars} đánh giá</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button class="btn-rating">Đánh giá ngay</button>
    </div>
</section>

<div id="rating-modal" class="hidden">
    <div class="modal-content">
        <form action="${context}/shop/product-details?product_id=${p.idProduct}" method="POST">
            <h5>Đánh giá ${p.name}</h5>
            <div class="content-comment">
                <textarea name="content" id="rating-content" rows="7" placeholder="Mời bạn chia sẻ thêm một số cảm nhận..."></textarea>
                <div class="error">Nội dung bình luận là bắt buộc!</div>
            </div>
            <div class="row no-gutters my-4 d-flex align-items-center">
                <div class="col-lg-4">
                    <p class="feeling">Bạn cảm thấy thế<br>nào về sản phẩm?<br>(Chọn sao)</p>
                </div>
                <div class="col-lg-8">
                    <div class="star-wrapper">
                        <input type="hidden" name="stars" value="5" id="input-stars">
                        <div class="star active" data-star="5">
                            <i class="fa fa-star"></i>
                            <span>Tuyệt vời</span>
                        </div>
                        <div class="star" data-star="4">
                            <i class="fa fa-star"></i>
                            <span>Tốt</span>
                        </div>
                        <div class="star" data-star="3">
                            <i class="fa fa-star"></i>
                            <span>Trung bình</span>
                        </div>
                        <div class="star" data-star="2">
                            <i class="fa fa-star"></i>
                            <span>Không tệ</span>
                        </div>
                        <div class="star" data-star="1">
                            <i class="fa fa-star"></i>
                            <span>Rất tệ</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rating-info d-flex justify-content-between mb-4">
                <div class="w-100 mr-3">
                    <input type="text" placeholder="Họ tên" name="fullname">
                    <span class="error mt-2 d-inline-block">Tên là bắt buộc!</span>
                </div>
                <div class="w-100">
                    <input type="text" placeholder="Số điện thoại" name="phone">
                    <span class="error mt-2 d-inline-block">Số điện thoại là bắt buộc!</span>
                </div>
                <div class="w-100 ml-3">
                    <input type="text" placeholder="Email" name="email">
                </div>
            </div>
            <button type="submit">Gửi đánh giá</button>
            <p class="d-block m-0 condition"><u>Lưu ý:</u> Để đánh giá được phê duyệt, vui lòng tham khảo
                <a href="#">Điều khoản và Chính sách bảo mật</a>
            </p>
        </form>
    </div>
</div>

<!-- ===== RELATED PRODUCTS ===== -->
<section class="newest-products mb-5">
    <div class="container">
        <div class="section-title">
            <h2>Sản Phẩm Liên Quan</h2>
        </div>
        <div class="owl-carousel newest-slider">
            <c:forEach var="pr" items="${requestScope.related_products}">
                <div class="single-product mt-0 mb-0 mr-3 ml-3">
                    <div class="product-img">
                        <a href="${context}/shop/product-details?product_id=${pr.idProduct}">
                            <img class="default-img" src="${pr.imgPath}" alt="#"/>
                            <span class="hot">${pr.status}</span>
                        </a>
                        <div class="cart-container">
                            <button class="btn-cart"><i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</button>
                        </div>
                    </div>
                    <div class="product-content">
                        <a href="${context}/shop/product-details?product_id=${pr.idProduct}">${pr.name}</a>
                        <div class="rating">
                            <c:forEach begin="1" end="5" varStatus="i">
                                <i class="fa fa-star <c:if test="${i.index <= pr.review.average}">yellow</c:if>"></i>
                            </c:forEach>
                        </div>
                        <div class="product-price">
                            <c:if test="${pr.oldPrice != pr.newPrice}">
                                <span class="old">${pu:format(pr.oldPrice)}đ</span>
                            </c:if>
                            <span>${pu:format(pr.newPrice)}đ</span>
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

    $('.rate-inner').each(function () {
        $(this).css('width', $(this).attr('data-rate').concat('%'))
    })

    $('.btn-rating').on('click', function () {
        $('#rating-modal').removeClass('hidden')
        $('body').css('overflow', 'hidden')
    })

    window.onclick = function (event) {
        if (event.target === document.getElementById('rating-modal')) {
            $('#rating-modal').addClass('hidden')
            $('body').css('overflow', 'auto')
        }
    }

    const starDiv = $('.star-wrapper .star');
    let el = starDiv.first();
    starDiv.on('click', function () {
        $('#input-stars').val($(this).attr('data-star'))
        toggleStar(el = $(this))
    })

    starDiv.mouseover(e => toggleStar($(e.target)))
    starDiv.mouseout(e => toggleStar(el))

    function toggleStar(e) {
        starDiv.each(function () {
            $(this).removeClass('active')
        })
        e.addClass('active')
    }
</script>
</body>

</html>