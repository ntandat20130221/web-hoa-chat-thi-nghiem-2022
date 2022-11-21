<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lab Chemicals | Lịch Sử Mua Hàng</title>
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
            <li class="d-inline-block text-capitalize"><a href="profile.jsp">Hồ sơ của tôi<i class="ti-arrow-right mx-2"></i></a></li>
            <li class="d-inline-block text-capitalize"><a href="purchase-history.jsp">Lịch sử mua hàng</a></li>
        </ul>
    </div>
</div>

<!-- ===== PURCHASE HISTORY ===== -->
<div class="shopping-cart">
    <div class="container">
        <!-- Shopping Summary -->
        <table class="table shopping-summery bg-white">
            <thead>
            <tr class="main-hading">
                <th>SẢN PHẨM</th>
                <th>TÊN SẢN PHẨM</th>
                <th class="text-center">GIÁ</th>
                <th class="text-center">SỐ LƯỢNG</th>
                <th class="text-center">TỔNG</th>
                <th class="text-center">
                    <i class="ti-trash remove-icon"></i>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="image" data-title="No">
                    <img src="https://via.placeholder.com/100x100" alt="#"/>
                </td>
                <td class="product-des" data-title="Description">
                    <p class="product-name">
                        <a href="product-details.jsp">Axit Sunfuric loãng</a>
                    </p>
                    <p class="product-des">
                        Axit sunfuric là một axit mạnh, hóa chất này có đầy đủ các
                        tính chất hóa học chung của axit.
                    </p>
                </td>
                <td class="price text-center" data-title="Price">
                    <span>1,000,000đ</span>
                </td>
                <td class="qty" data-title="Qty">
                    <!-- Input Order -->
                    <div class="input-group">
                        <div class="button minus">
                            <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                <i class="ti-minus"></i>
                            </button>
                        </div>
                        <input type="text" name="quant[1]" class="input-number" data-min="1" data-max="100" value="1"/>
                        <div class="button plus">
                            <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                <i class="ti-plus"></i>
                            </button>
                        </div>
                    </div>
                </td>
                <td class="total-amount text-center" data-title="Total">
                    <span>1,000,000đ</span>
                </td>
                <td class="action text-center" data-title="Remove">
                    <a href="#"><i class="ti-trash remove-icon"></i></a>
                </td>
            </tr>
            <tr>
                <td class="image" data-title="No">
                    <img src="https://via.placeholder.com/100x100" alt="#"/>
                </td>
                <td class="product-des" data-title="Description">
                    <p class="product-name">
                        <a href="product-details.jsp">Axit Sunfuric loãng</a>
                    </p>
                    <p class="product-des">
                        Axit sunfuric là một axit mạnh, hóa chất này có đầy đủ các
                        tính chất hóa học chung của axit.
                    </p>
                </td>
                <td class="price text-center" data-title="Price">
                    <span>1,000,000đ</span>
                </td>
                <td class="qty" data-title="Qty">
                    <!-- Input Order -->
                    <div class="input-group">
                        <div class="button minus">
                            <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                <i class="ti-minus"></i>
                            </button>
                        </div>
                        <input type="text" name="quant[1]" class="input-number" data-min="1" data-max="100" value="1"/>
                        <div class="button plus">
                            <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                <i class="ti-plus"></i>
                            </button>
                        </div>
                    </div>
                </td>
                <td class="total-amount text-center" data-title="Total">
                    <span>1,000,000đ</span>
                </td>
                <td class="action text-center" data-title="Remove">
                    <a href="#"><i class="ti-trash remove-icon"></i></a>
                </td>
            </tr>
            <tr>
                <td class="image" data-title="No">
                    <img src="https://via.placeholder.com/100x100" alt="#"/>
                </td>
                <td class="product-des" data-title="Description">
                    <p class="product-name">
                        <a href="product-details.jsp">Axit Sunfuric loãng</a>
                    </p>
                    <p class="product-des">
                        Axit sunfuric là một axit mạnh, hóa chất này có đầy đủ các
                        tính chất hóa học chung của axit.
                    </p>
                </td>
                <td class="price text-center" data-title="Price">
                    <span>1,000,000đ</span>
                </td>
                <td class="qty" data-title="Qty">
                    <!-- Input Order -->
                    <div class="input-group">
                        <div class="button minus">
                            <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                <i class="ti-minus"></i>
                            </button>
                        </div>
                        <input type="text" name="quant[1]" class="input-number" data-min="1" data-max="100" value="1"/>
                        <div class="button plus">
                            <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                <i class="ti-plus"></i>
                            </button>
                        </div>
                    </div>
                </td>
                <td class="total-amount text-center" data-title="Total">
                    <span>1,000,000đ</span>
                </td>
                <td class="action text-center" data-title="Remove">
                    <a href="#"><i class="ti-trash remove-icon"></i></a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- ===== SHOP SERVICES ===== -->
<jsp:include page="../common/shop-services.jsp"/>

<!-- ===== FOOTER ===== -->
<jsp:include page="../common/shop-footer.jsp"/>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/shop-js.jsp"/>

</body>

</html>