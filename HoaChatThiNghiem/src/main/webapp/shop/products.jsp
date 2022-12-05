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
            <li class="d-inline-block text-capitalize"><a href="${context}/shop">Trang chủ<i class="ti-arrow-right mx-2"></i></a></li>
            <li class="d-inline-block text-capitalize"><a href="${context}/shop/products">Danh sách sản phẩm</a></li>
        </ul>
    </div>
</div>

<!-- ===== PRODUCTS ===== -->
<% @SuppressWarnings("unchecked") List<Product> products = (List<Product>) request.getAttribute("products"); %>
<section class="products">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-4 col-12">
                <div class="shop-sidebar">
                    <!-- Category -->
                    <div class="single-widget category">
                        <h3 class="title">Phân loại</h3>
                        <ul class="category-list">
                            <li class="mb-2 <c:if test="${param['type'] == '1'}">click-active</c:if>"><i class="fa fa-caret-right mr-2"></i><a
                                     data-query="1">Acid và Bazo</a></li>
                            <li class="mb-2 <c:if test="${param['type'] == '2'}">click-active</c:if>"><i class="fa fa-caret-right mr-2"></i><a
                                    data-query="2">Oxit</a></li>
                            <li class="mb-2 <c:if test="${param['type'] == '3'}">click-active</c:if>"><i class="fa fa-caret-right mr-2"></i><a
                                    data-query="3">Thuốc thử</a></li>
                            <li class="mb-2 <c:if test="${param['type'] == '4'}">click-active</c:if>"><i class="fa fa-caret-right mr-2"></i><a
                                    data-query="4">Chất chỉ thị</a></li>
                            <li class="mb-2 <c:if test="${param['type'] == '5'}">click-active</c:if>"><i class="fa fa-caret-right mr-2"></i><a
                                    data-query="5">Giấy lọc</a></li>
                            <li class="mb-2 <c:if test="${param['type'] == '6'}">click-active</c:if>"><i class="fa fa-caret-right mr-2"></i><a
                                    data-query="6">Kim loại</a></li>
                            <li class="<c:if test="${param['type'] == '7'}">click-active</c:if>"><i class="fa fa-caret-right mr-2"></i><a
                                    data-query="7">Khí hiếm</a></li>
                        </ul>
                    </div>

                    <!-- Price Filter -->
                    <div class="single-widget range mt-4">
                        <h3 class="title">Lọc theo giá</h3>
                        <div class="label-input mt-3">
                            <div class="d-flex justify-content-around">
                                <c:set var="from" value="${param['minPrice']}"/>
                                <c:set var="to" value="${param['maxPrice']}"/>
                                <input class="from w-100 bg-white" type="text" placeholder="TỪ" value="${from}"
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
                                <div class="divider-dash mx-2 d-flex align-items-center">
                                    <div></div>
                                </div>
                                <input class="to w-100 bg-white" type="text" placeholder="ĐẾN" value="${to}"
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
                            </div>
                            <button class="btn-apply py-2 text-white w-100">Áp dụng</button>
                        </div>
                        <ul class="check-box-list mt-3">
                            <c:set var="allProducts" value="${requestScope.all_products}"/>
                            <c:set var="p1" value="${0}"/><c:set var="p2" value="${0}"/><c:set var="p3" value="${0}"/>
                            <c:forEach var="ap" items="${allProducts}">
                                <c:if test="${ap.newPrice >= 200000 && ap.newPrice < 500000}">
                                    <c:set var="p1" value="${p1 + 1}"/>
                                </c:if>
                                <c:if test="${ap.newPrice >= 500000 && ap.newPrice < 1000000}">
                                    <c:set var="p2" value="${p2 + 1}"/>
                                </c:if>
                                <c:if test="${ap.newPrice >= 1000000 && ap.newPrice < 2500000}">
                                    <c:set var="p3" value="${p3 + 1}"/>
                                </c:if>
                            </c:forEach>
                            <li class="mb-1">
                                <label for="i1">
                                    <input id="i1" type="checkbox" value="200000-500000"
                                           <c:if test="${param['minPrice'] == 200000 && param['maxPrice'] == 500000}">checked</c:if>/>200,000đ
                                    - 500,000đ<span class="count">(${p1})</span>
                                </label>
                            </li>
                            <li class="mb-1">
                                <label for="i2">
                                    <input id="i2" type="checkbox" value="500000-1000000"
                                           <c:if test="${param['minPrice'] == 500000 && param['maxPrice'] == 1000000}">checked</c:if>/>500,000đ
                                    - 1,000,000đ<span class="count">(${p2})</span>
                                </label>
                            </li>
                            <li>
                                <label for="i3">
                                    <input id="i3" type="checkbox" value="1000000-2500000"
                                           <c:if test="${param['minPrice'] == 1000000 && param['maxPrice'] == 2500000}">checked</c:if>/>1,000,000đ
                                    - 2,500,000đ<span class="count">(${p3})</span>
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
                        <select id="sl">
                            <option
                                    <c:if test="${param['sortBy'] == 'name'}">selected</c:if> value="name">Tên
                            </option>
                            <option
                                    <c:if test="${param['sortBy'] == 'price_up'}">selected</c:if> value="price_up">Giá: Thấp đến Cao
                            </option>
                            <option
                                    <c:if test="${param['sortBy'] == 'price_down'}">selected</c:if> value="price_down">Giá: Cao đến Thấp
                            </option>
                        </select>
                    </div>
                </div>
                <div class="row" id="products-container">
                    <% for (Product p : products) { %>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="single-product">
                            <div class="product-img">
                                <a href="${context}/shop/product-details?product_id=<%=p.getIdProduct()%>">
                                    <img class="default-img" src="<%=p.getImgPath()%>" alt="#"/>
                                    <% if (p.getStatus() != null) { %>
                                    <span class="new"><%=p.getStatus()%></span> <% } %>
                                </a>
                                <div class="cart-container">
                                    <button class="btn-cart"><i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</button>
                                </div>
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
                        <a class="control mr-3" id="control-prev"><i class="bi-chevron-left"></i></a>
                        <a class="control ml-3" id="control-next"><i class="bi-chevron-right"></i></a>
                    </div>
                </div>
                
                <!-- No Data -->
                <div class="no-data hidden text-center">
                    <img src="${context}/shop/images/no_data.png" alt="No data">
                    <p>Oops! Không có sản phẩm nào. Điều chỉnh bộ lọc và thử lại nhé?</p>
                    <button class="clear-filter">Xóa bộ lọc</button>
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
    const queryMap = new Map()
    window.location.search.substring(1).split('&').forEach((value) => {
        const item = value.split('=')
        queryMap.set(item[0], item[1])
    })

    $('#sl').on('change', function () {
        const value = $(this).find(':selected').val()
        queryMap.set('sortBy', value)
        query()
    })

    $('.label-input > button').on('click', function () {
        const minPrice = $('.from').val(), maxPrice = $('.to').val();
        if (Number(minPrice) > Number(maxPrice)) alert("Vui lòng điền khoảng giá phù hợp")
        else {
            queryMap.set('minPrice', minPrice)
            queryMap.set('maxPrice', maxPrice)
            query()
        }
    })

    $('.check-box-list input').on('change', function () {
        $('.check-box-list input').not(this).prop('checked', false)
        if (this.checked) {
            const minPrice = $(this).val().split('-')[0]
            const maxPrice = $(this).val().split('-')[1]
            queryMap.set('minPrice', minPrice)
            queryMap.set('maxPrice', maxPrice)
        } else {
            queryMap.delete('minPrice')
            queryMap.delete('maxPrice')
        }
        query()
    })

    $('.category-list a').on('click', function () {
        const type = queryMap.get('type')
        if (type && type === $(this).attr('data-query'))
            queryMap.delete('type')
        else
            queryMap.set('type', $(this).attr('data-query'))
        query()
        return false;
    })

    function query(isPage) {
        if (queryMap.size === 0) {
            window.location.href = '${context}/shop/products'
            return
        }

        let query = '${context}/shop/products?'

        const type = queryMap.get('type')
        if (type) query = query.concat('&type=').concat(type)

        const sort = queryMap.get('sortBy')
        if (sort) query = query.concat('&sortBy=').concat(sort)

        const minPrice = queryMap.get('minPrice')
        if (minPrice) query = query.concat('&minPrice=').concat(minPrice)

        const maxPrice = queryMap.get('maxPrice')
        if (maxPrice) query = query.concat('&maxPrice=').concat(maxPrice)

        const page = queryMap.get('page')
        if (page && isPage) query = query.concat('&page=').concat(page)

        window.location.href = query.replace('?&', '?')
    }

    /**
     * Pagination
     */
    let currentPage = queryMap.get('page') ? Number(queryMap.get('page')) : 1

    $(function () {
        const itemCount = $('#products-container > div').length
        if (itemCount === 0) {
            $('.pagination-container').hide()
            $('.no-data').removeClass('hidden')
            $('.no-data .clear-filter').on('click', function () {
                queryMap.clear()
                query()
            })
            return
        }

        const pageCount = Math.ceil(itemCount / 9)
        for (let i = 1; i <= pageCount; i++) {
            const page = document.createElement('a')
            $(page).html(i).attr('page', i).insertBefore('#control-next')
        }

        $('#control-prev').on('click', () => {
            if (currentPage === 1) queryPage(pageCount)
            else queryPage(currentPage - 1)
        })
        $('#control-next').on('click', () => {
            if (currentPage === pageCount) queryPage(1)
            else queryPage(currentPage + 1)
        })

        $('.pagination-container a:not(.control)').each((index, value) => {
            const page = Number($(value).attr('page'))
            if (page) $(value).on('click', () => queryPage(page))
        })

        switchPage(currentPage)
    })

    function queryPage(page) {
        queryMap.set('page', page)
        query(true)
    }

    function switchPage(page) {
        $('.pagination-container > a').each((index, value) => {
            $(value).removeClass('active')
            if (page === Number($(value).attr('page'))) $(value).addClass('active')
        })

        const from = (page - 1) * 9, to = from + 9
        $('#products-container > div').each((index, value) => {
            if (index >= from && index < to) $(value).removeClass('hidden')
            else $(value).addClass('hidden')
        })
    }
</script>
</body>

</html>