<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Product,utils.PriceFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <% Product p = (Product) request.getAttribute("product"); %>
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
                    <span class="supplier">Nhà cung cấp: Merk - Đức</span>
                    <h2><%=p.getName()%>
                    </h2>
                    <div class="product-rating d-flex">
                        <div class="rating">
                            <% int stars = p.getStar(); %>
                            <c:forEach begin="1" end="5">
                                <i class="<% if (stars > 0) { %>yellow <% } stars--; %> fa fa-star"></i>
                            </c:forEach>
                        </div>
                        <a href="#"> (33 Đánh giá)</a>
                    </div>
                    <% String op = PriceFormat.format(p.getOldPrice()), np = PriceFormat.format(p.getNewPrice()); %>
                    <div class="ps d-flex justify-content-between align-items-center">
                        <h3><%=np%>đ<% if (!op.equals("0")) { %><span><%=op%>đ</span> <% } %></h3>
                        <span class="label label-in-stock">Còn hàng</span>
                    </div>
                    <div class="product-paragraph">
                        <p>
                            <%=p.getDesc()%>
                        </p>
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
                        <span><%=p.getQuantity()%> sản phẩm có sẵn</span>
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