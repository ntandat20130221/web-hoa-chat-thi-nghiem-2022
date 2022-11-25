<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="controller.shop.ProductsServlet" %>
<%@ page import="utils.PriceFormat" %>
<%@ page import="static controller.ProductDetailServlet.PARAM_ID" %>
<%@ page import="static controller.ProductsServlet.PARAM_SORT" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Global variables declaration --%>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<c:set var="p_sort" value="sort" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lab Chemicals | Danh Mục Sản Phẩm</title>
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
            <li class="d-inline-block text-capitalize"><a href="blog.jsp">Danh sách sản phẩm</a></li>
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
                        <div class="label-input mt-3">
                            <div class="d-flex justify-content-around">
                                <input class="from w-100 bg-white" type="text" placeholder="TỪ">
                                <div class="divider-dash mx-2 d-flex align-items-center"><div></div></div>
                                <input class="to w-100 bg-white" type="text" placeholder="ĐẾN">
                            </div>
                            <button>Áp dụng</button>
                        </div>
                        <ul class="check-box-list mt-3">
                            <li class="mb-1">
                                <label for="1">
                                    <input id="1" type="checkbox"/>200,000đ - 500,000đ<span class="count">(13)</span>
                                </label>
                            </li>
                            <li class="mb-1">
                                <label for="2">
                                    <input id="2" type="checkbox"/>500,000đ - 1,000,000đ<span class="count">(5)</span>
                                </label>
                            </li>
                            <li>
                                <label for="3">
                                    <input id="3" type="checkbox"/>1,000,000đ - 2,500,000đ<span class="count">(8)</span>
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
                            <label for="sl">Sắp xếp theo: </label>
                            <c:set var="val" value="${param[p_sort]}" />
                            <select id="sl" onchange="selectChange()">
                                <option <c:if test="${val == 'name'}">selected</c:if> value="name">Tên</option>
                                <option <c:if test="${val == 'price-up'}">selected</c:if> value="price-up">Giá: Thấp đến Cao</option>
                                <option <c:if test="${val == 'price-down'}">selected</c:if> value="price-down">Giá: Cao đến Thấp</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <% @SuppressWarnings("unchecked")
                    List<Product> products = (List<Product>) request.getAttribute(ProductsServlet.ATTR_PRODUCTS);
                        for (Product p : products) { %>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="single-product">
                            <div class="product-img">
                                <a href="${context}/shop/product-details?<%=PARAM_ID + "=" + p.getIdProduct()%>">
                                    <img class="default-img" src="<%=p.getImgPath()%>" alt="#"/>
                                    <% if (p.getStatus() != null) { %>
                                    <span class="new"><%=p.getStatus()%></span> <% } %>
                                </a>
                            </div>
                            <div class="product-content">
                                <a href="${context}/shop/product-details?<%=PARAM_ID + "=" + p.getIdProduct()%>"><%=p.getName()%>
                                </a>
                                <div class="rating">
                                    <% int stars = p.getStar();
                                        for (int i = 0; i < 5; i++) { %>
                                    <i class="<% if (stars > 0) { %>yellow <% } stars--; %> fa fa-star"></i> <% } %>
                                </div>
                                <div class="product-price">
                                    <% double oldPrice = p.getOldPrice();
                                        double newPrice = p.getNewPrice();
                                        if (oldPrice != 0) { %>
                                    <span class="old"><%=PriceFormat.format(oldPrice)%>đ</span> <% } %>
                                    <span><%=PriceFormat.format(newPrice)%>đ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
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
<jsp:include page="../common/shop-footer.jsp"/>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/shop-js.jsp"/>

<script>
    function selectChange() {
        let select = document.getElementById('sl')
        let selected = select.options[select.selectedIndex].value
        window.location.href = '${context}/shop/products?<%=PARAM_SORT%>=' + selected
    }
</script>
</body>

</html>