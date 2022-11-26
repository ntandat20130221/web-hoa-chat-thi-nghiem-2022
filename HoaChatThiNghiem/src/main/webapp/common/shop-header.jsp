<%@ page import="model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="context" value="${pageContext.request.contextPath}"/>

<header class="header shop">
    <div class="topbar">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-7 col-12">
                    <div class="text-left">
                        <ul>
                            <li><i class="ti-headphone-alt"></i>0983 803 100</li>
                            <li><i class="fa fa-envelope-o"></i>support@labchemicals.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5 col-12">
                    <div class="text-right">
                        <ul>
                            <li>
                                <a href="${context}/shop/login.jsp"><i class="bi bi-box-arrow-in-right"></i>Đăng nhập</a>
                            </li>
                            <li>
                                <a href="${context}/shop/register.jsp"><i class="bi bi-person-plus"></i>Đăng ký</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ===== HEADER MIDDLE ====== -->
    <div class="header-middle py-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-12">
                    <!-- Logo -->
                    <div class="logo">
                        <a href="${context}/shop/index.jsp"><img src="${context}/shop/images/labchemicals-logo.png" alt="logo"/></a>
                    </div>
                    <!-- Search Mobile -->
                    <div class="mobile-search">
                        <form class="search-form">
                            <input type="text" placeholder="Tìm kiếm..." name="search"/>
                            <button value="search" type="submit">
                                <i class="ti-search"></i>
                            </button>
                        </form>
                        <div>
                            <a href="#"><i class="ti-search"></i></a>
                        </div>
                    </div>
                    <div class="mobile-nav"></div>
                </div>
                <div class="col-lg-8 col-md-7 col-12 pt-1">
                    <div class="search-bar-top">
                        <div class="search-bar">
                            <form>
                                <input name="search" placeholder="Nhập tên sản phẩm....."/>
                                <button class="btn-search">
                                    <i class="ti-search"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-12">
                    <div class="right-bar">
                        <!-- Search Form -->
                        <div class="right-bar-item d-inline-block mr-4">
                            <%Customer customer = (Customer) session.getAttribute("auth_customer");%>
                            <a href="${context}/shop/profile.jsp" class="single-icon">
                                <%if (customer == null) {%>
                                <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                <%} else {%>
                                <p><%=customer.getFullname()%>
                                </p>
                                <%}%>
                            </a>
                        </div>
                        <div class="right-bar-item shopping d-inline-block">
                            <a href="${context}/shop/cart.jsp" class="single-icon">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="total-count">2</span></a>
                            <!-- Shopping Item -->
                            <div class="shopping-item">
                                <div class="dropdown-cart-header">
                                    <span>2 Sản phẩm</span>
                                    <a class="float-right" href="${context}/shop/cart.jsp">Xem giỏ hàng</a>
                                </div>
                                <ul class="shopping-list">
                                    <!-- Cart Item -->
                                    <li>
                                        <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                        <a class="cart-img" href="#"><img src="../images/hoa_chat/acid_bazo/acid_citric/acid_citric_70x70.jpg"
                                                                          alt="#"/></a>
                                        <h4><a href="#">Sulfuric acid 95%</a></h4>
                                        <p class="quantity">
                                            1x - <span class="amount">1,000,000đ</span>
                                        </p>
                                    </li>

                                    <!-- Cart Item -->
                                    <li>
                                        <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                        <a class="cart-img" href="#"><img src="../images/hoa_chat/acid_bazo/acid_sulfuric/acid_sulfuric_01_70x70.jpg"
                                                                          alt="#"/></a>
                                        <h4><a href="#">Methanol GR Merck</a></h4>
                                        <p class="quantity">
                                            1x - <span class="amount">1,000,000đ</span>
                                        </p>
                                    </li>
                                </ul>
                                <div class="bottom text-center">
                                    <div class="total">
                                        <span>Tổng cộng</span>
                                        <span class="total-amount">2,000,000đ</span>
                                    </div>
                                    <a href="${context}/shop/checkout.jsp" class="btn">Thanh toán</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== HEADER MENU ===== -->
    <div class="header-menu">
        <div class="container">
            <nav class="navbar navbar-expand-lg p-0">
                <div class="navbar-collapse">
                    <ul class="nav menu navbar-nav">
                        <li class="position-relative mr-2">
                            <a href="${context}/shop/products">Hóa chất<i class="ti-angle-down"></i></a>
                            <ul class="dropdown">
                                <li><a href="">ACID</a></li>
                                <li><a href="">BAZO</a></li>
                                <li><a href="">DUNG MÔI</a></li>
                                <li><a href="">ESTE</a></li>
                                <li><a href="">HÓA CHẤT CƠ BẢN</a></li>
                                <li><a href="">HỢP CHẤT TẠP CHỨC, POLIME</a></li>
                                <li><a href="">KIM LOẠI</a></li>
                                <li><a href="">MUỐI</a></li>
                                <li><a href="">OXIT</a></li>
                                <li><a href="">THUỐC THỬ</a></li>
                            </ul>
                        </li>
                        <li class="position-relative mr-2">
                            <a href="${context}/shop/products">Dụng cụ<i class="ti-angle-down"></i></a>
                            <ul class="dropdown">
                                <li><a href="">BÌNH THÍ NGHIỆM</a></li>
                                <li><a href="">BỘ CHÀY CỐI</a></li>
                                <li><a href="">BỘ LỌC HÚT CHÂN KHÔNG</a></li>
                                <li><a href="">CỐC CHÉN ĐĨA CHO LAB</a></li>
                                <li><a href="">ĐÈN CỒN</a></li>
                                <li><a href="">ĐO NHIỆT ĐỘ, TỶ TRỌNG, ÁP SUẤT</a></li>
                                <li><a href="">GIẤY LỌC, MÀNG LỌC</a></li>
                                <li><a href="">ỐNG ĐONG</a></li>
                                <li><a href="">ỐNG NGHIỆM</a></li>
                                <li><a href="">PHỄU</a></li>
                            </ul>
                        </li>
                        <li class="position-relative mr-2">
                            <a href="${context}/shop/products">Thiết bị<i class="ti-angle-down"></i></a>
                            <ul class="dropdown">
                                <li><a href="">CÂN PHÒNG THÍ NGHIỆM</a></li>
                                <li><a href="">KÍNH HIỂN VI</a></li>
                                <li><a href="">LÒ NUNG</a></li>
                                <li><a href="">MÁY CẤT NƯỚC</a></li>
                                <li>
                                    <a href="">MÁY ĐO CÁC CHỈ TIÊU TRONG DUNG DỊCH</a>
                                </li>
                                <li><a href="">MÁY LẮC</a></li>
                                <li><a href="">MÁY LY TÂM</a></li>
                                <li><a href="">NỒI HẤP TIỆT TRÙNG</a></li>
                                <li><a href="">TỦ ẤM</a></li>
                                <li><a href="">TỦ BẢO QUẢN MẪU VÀ TỦ LẠNH</a></li>
                            </ul>
                        </li>

                        <li class="position-relative mr-2">
                            <a href="${context}/shop/blog.jsp">Tin tức</a>
                        </li>
                        <li class="position-relative">
                            <a href="${context}/shop/contact.jsp">Liên hệ</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>