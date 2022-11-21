<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lab Chemicals | Thanh Toán</title>
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
            <li class="d-inline-block text-capitalize"><a href="cart.jsp">Giỏ hàng<i class="ti-arrow-right mx-2"></i></a></li>
            <li class="d-inline-block text-capitalize"><a href="checkout.jsp">Thanh toán</a></li>
        </ul>
    </div>
</div>

<!-- ===== CHECKOUT ===== -->
<section class="checkout">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-12">
                <div class="checkout-form mt-4">
                    <div class="checkout-title">
                        <h3>Thông tin giao hàng</h3>
                        <p class="my-2">
                            Yêu cầu quý khách cần điền đầy đủ thông tin để việc giao hàng
                            được thuận lợi
                        </p>
                    </div>
                    <form class="form" method="post">
                        <div class="row">
                            <div class="col-lg-12 col-12">
                                <div class="form-group mb-4">
                                    <label>Họ và tên</label>
                                    <input name="name" type="text" placeholder=""/>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-group mb-4">
                                    <label>Số điện thoại<span>*</span></label>
                                    <input name="subject" type="text" placeholder=""/>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-group mb-4">
                                    <label>Email<span>*</span></label>
                                    <input name="email" type="email" placeholder=""/>
                                </div>
                            </div>
                            <div class="col-lg-8 col-12">
                                <div class="form-group">
                                    <label>Địa chỉ<span>*</span></label>
                                    <input name="company_name" type="text" placeholder=""/>
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="form-group">
                                    <label>Tỉnh / Thành phố<span>*</span></label>
                                    <select name="company_name" id="company">
                                        <option value="company" selected="selected">
                                            TP.Hồ Chí Minh
                                        </option>
                                        <option>Hà Nội</option>
                                        <option>Lâm Đồng</option>
                                        <option>Bến Tre</option>
                                        <option>Đồng Tháp</option>
                                        <option>Sóc Trăng</option>
                                        <option>Kiên Giang</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-12">
                <div class="order-details">
                    <!-- Order Widget -->
                    <div class="single-widget mb-4">
                        <h2>TỔNG CỘNG</h2>
                        <div class="content mt-3">
                            <ul>
                                <li>Hóa đơn<span>1,000,000đ</span></li>
                                <li>(+) Vận chuyển<span>10,000đ</span></li>
                                <li>Tổng<span class="total">1,010,000đ</span></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Order Widget -->
                    <div class="single-widget mb-5">
                        <h2>PHƯƠNG THỨC THANH TOÁN</h2>
                        <div class="content mt-3">
                            <div class="radio">
                                <input type="radio" id="2" checked>
                                <label class="checkbox-inline" for="2">Thanh toán trực tiếp</label>
                            </div>
                        </div>
                    </div>
                    <!-- Button Widget -->
                    <div class="single-widget get-button">
                        <div class="content">
                            <div class="button">
                                <a href="#" class="btn">Thanh toán</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== SHOP SERVICES ===== -->
<jsp:include page="../common/shop-services.jsp"/>

<!-- ===== FOOTER ===== -->
<jsp:include page="../common/shop-footer.jsp"/>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/shop-js.jsp"/>

</body>

</html>