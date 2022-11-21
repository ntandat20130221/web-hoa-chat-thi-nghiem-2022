<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lab Chemicals | Thông Tin Hồ Sơ</title>
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
            <li class="d-inline-block text-capitalize"><a href="profile.jsp">Hồ sơ của tôi</a></li>
        </ul>
    </div>
</div>

<!-- ===== PROFILE ===== -->
<section class="contact-us profile">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-12">
                <div class="single-head">
                    <div class="single-info">
                        <div class="d-flex flex-column align-items-center text-center mb-5">
                            <img class="rounded-circle" width="150px"
                                 src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"
                                 alt=""/>
                            <span class="font-weight-bold">Edogaru</span>
                        </div>
                        <ul>
                            <li>
                                <a href="purchase-history.jsp"><i class="bi bi-receipt"></i> Lịch sử mua hàng</a>
                            </li>
                            <li>
                                <a href="change-pass.jsp"><i class="bi bi-lock"></i> Đổi mật khẩu</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-12">
                <div class="form-main">
                    <div class="title">
                        <h3>Hồ sơ của tôi</h3>
                        <p class="m-0">Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
                    </div>
                    <form class="form" method="post">
                        <div class="row">
                            <div class="col-lg-12 col-12">
                                <div class="form-group">
                                    <label>Họ và tên</label>
                                    <input name="name" type="text" placeholder="Edogary"/>
                                </div>
                            </div>
                            <div class="col-lg-12 col-12">
                                <div class="form-group sex">
                                    <label class="mr-4">Giới tính:</label>
                                    <div class="form-check form-check-inline mr-4 d-inline-flex  align-items-center">
                                        <input class="form-check-input" type="radio" checked name="flexRadioDefault" id="male" value="male">
                                        <label class="form-check-label d-inline-block ml-2" for="male">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline d-inline-flex  align-items-center">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="female" value="female">
                                        <label class="form-check-label d-inline-block ml-2" for="female">Nữ</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-group">
                                    <label>Số điện thoại<span>*</span></label>
                                    <input name="subject" type="text" placeholder=""/>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-group">
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
                                    <label for="company">Tỉnh / Thành phố<span>*</span></label>
                                    <select id="company">
                                        <option value="company" selected="selected">TP.Hồ Chí Minh</option>
                                        <option>Hà Nội</option>
                                        <option>Lâm Đồng</option>
                                        <option>Bến Tre</option>
                                        <option>Đồng Tháp</option>
                                        <option>Sóc Trăng</option>
                                        <option>Kiên Giang</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group button">
                                    <button type="submit" class="btn">Lưu</button>
                                </div>
                            </div>
                        </div>
                    </form>
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