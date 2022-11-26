<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,model.Product,utils.PriceFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Global variables declaration --%>
<c:set var="context" value="${pageContext.request.contextPath}"/>

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
                            <li class="mb-2"><a
                                    <c:if test="${param['category'] == 'acid_bazo'}">class="click-active"</c:if> href="#" id="acid_bazo">Acid và
                                Bazo</a></li>
                            <li class="mb-2"><a
                                    <c:if test="${param['category'] == 'oxit'}">class="click-active"</c:if> href="#" id="oxit">Oxit</a></li>
                            <li class="mb-2"><a
                                    <c:if test="${param['category'] == 'reagent'}">class="click-active"</c:if> href="#" id="reagent">Thuốc thử</a>
                            </li>
                            <li class="mb-2"><a
                                    <c:if test="${param['category'] == 'indicator'}">class="click-active"</c:if> href="#" id="indicator">Chất chỉ
                                thị</a></li>
                            <li class="mb-2"><a
                                    <c:if test="${param['category'] == 'filter_paper'}">class="click-active"</c:if> href="#" id="filter_paper">Giấy
                                lọc</a></li>
                            <li class="mb-2"><a
                                    <c:if test="${param['category'] == 'metal'}">class="click-active"</c:if> href="#" id="metal">Kim loại</a></li>
                            <li><a
                                    <c:if test="${param['category'] == 'rare_gas'}">class="click-active" </c:if> href="#" id="rare_gas">Khí hiếm</a>
                            </li>
                        </ul>
                    </div>

                    <!-- Price Filter -->
                    <div class="single-widget range mt-4">
                        <h3 class="title">Lọc theo giá</h3>
                        <div class="label-input mt-3">
                            <div class="d-flex justify-content-around">
                                <% String from = request.getParameter("minPrice"), to = request.getParameter("maxPrice"); %>
                                <input class="from w-100 bg-white" type="text" placeholder="TỪ"
                                    <% if (from != null) { %> value="<%=from%>" <% } %>
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
                                <div class="divider-dash mx-2 d-flex align-items-center">
                                    <div></div>
                                </div>
                                <input class="to w-100 bg-white" type="text" placeholder="ĐẾN"
                                    <% if (to != null) { %> value="<%=to%>" <% } %>
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
                            </div>
                            <button class="btn-apply py-2 text-white w-100" onclick="filterPrice()">Áp dụng</button>
                        </div>
                        <ul class="check-box-list mt-3">
                            <li class="mb-1">
                                <label for="i1">
                                    <input id="i1" type="checkbox" value="200000-500000" <c:if test="${param['check'] == 'i1'}">checked</c:if>/>200,000đ
                                    - 500,000đ<span class="count">(13)</span>
                                </label>
                            </li>
                            <li class="mb-1">
                                <label for="i2">
                                    <input id="i2" type="checkbox" value="500000-1000000" <c:if test="${param['check'] == 'i2'}">checked</c:if>/>500,000đ
                                    - 1,000,000đ<span class="count">(5)</span>
                                </label>
                            </li>
                            <li>
                                <label for="i3">
                                    <input id="i3" type="checkbox" value="1000000-2500000" <c:if test="${param['check'] == 'i3'}">checked</c:if>/>1,000,000đ
                                    - 2,500,000đ<span class="count">(8)</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-8 col-12">
                <!-- Shop Top -->
                <div class="shop-top d-flex justify-content-start">
                    <div class="single-shorter">
                        <label class="float-left" for="sl">Sắp xếp theo</label>
                        <select id="sl" onchange="sendRequest()">
                            <option
                                    <c:if test="${param['sort'] == 'name' || param['sort'] == ''}">selected</c:if> value="name">Tên
                            </option>
                            <option
                                    <c:if test="${param['sort'] == 'price_up'}">selected</c:if> value="price_up">Giá: Thấp đến Cao
                            </option>
                            <option
                                    <c:if test="${param['sort'] == 'price_down'}">selected</c:if> value="price_down">Giá: Cao đến Thấp
                            </option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <% @SuppressWarnings("unchecked") List<Product> products = (List<Product>) request.getAttribute("products");
                        for (Product p : products) { %>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="single-product">
                            <div class="product-img">
                                <a href="${context}/shop/product-details?product_id=<%=p.getIdProduct()%>">
                                    <img class="default-img" src="<%=p.getImgPath()%>" alt="#"/>
                                    <% if (p.getStatus() != null) { %>
                                    <span class="new"><%=p.getStatus()%></span> <% } %>
                                </a>
                            </div>
                            <div class="product-content">
                                <a href="${context}/shop/product-details?product_id=<%=p.getIdProduct()%>">
                                    <%=p.getName()%>
                                </a>
                                <div class="rating">
                                    <% int stars = p.getStar(); %>
                                    <c:forEach begin="1" end="5">
                                        <i class="<% if (stars > 0) { %>yellow <% } stars--; %> fa fa-star"></i>
                                    </c:forEach>
                                </div>
                                <div class="product-price">
                                    <% String op = PriceFormat.format(p.getOldPrice()), np = PriceFormat.format(p.getNewPrice());
                                        if (!op.equals("0")) { %>
                                    <span class="old"><%=op%>đ</span> <% } %>
                                    <span><%=np%>đ</span>
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
    function filterPrice() {
        $('.check-box-list').find('input:checked').attr('checked', false)
        let from = Number($('.from').val()), to = Number($('.to').val());
        if (from > to) alert(from + "Vui lòng điền khoảng giá phù hợp" + to)
        else sendRequest()
    }

    function sendRequest(category) {
        let sort = $('#sl').find(':selected').val();
        let minPrice = $('.from').val(), maxPrice = $('.to').val()
        let query = "${context}/shop/products?" + "sort=" + sort + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice

        let id = $('.check-box-list').find('input:checked').attr('id')
        if (id !== undefined) {
            query = query + "&check=" + id
        }

        if (category != null) {
            query = query + "&category=" + category
        }

        window.location.href = query
    }

    $('.check-box-list input[type="checkbox"]').on('change', function () {
        $('.check-box-list input[type="checkbox"]').not(this).prop('checked', false);
        let value = $(this).val()
        $('.from').val(value.split("-")[0])
        $('.to').val(value.split("-")[1])
        sendRequest()
    });

    $('.category-list a').on('click', function () {
        sendRequest($(this).attr('id'))
        return false;
    })
</script>
</body>

</html>