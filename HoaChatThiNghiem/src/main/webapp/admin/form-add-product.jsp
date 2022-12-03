<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm sản phẩm | Quản trị Admin</title>

    <!-- ===== STYLESHEET ===== -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>

<body class="app sidebar-mini rtl">
<style>
    .Choicefile {
        display: block;
        background: #14142B;
        border: 1px solid #fff;
        color: #fff;
        width: 150px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        padding: 5px 0px;
        border-radius: 5px;
        font-weight: 500;
        align-items: center;
        justify-content: center;
    }

    .Choicefile:hover {
        text-decoration: none;
        color: white;
    }

    #uploadfile,
    .removeimg {
        display: none;
    }

    #thumbbox {
        position: relative;
        width: 100%;
        margin-bottom: 20px;
    }

    .removeimg {
        height: 25px;
        position: absolute;
        background-repeat: no-repeat;
        top: 5px;
        left: 5px;
        background-size: 25px;
        width: 25px;
        /* border: 3px solid red; */
        border-radius: 50%;

    }

    .removeimg::before {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        content: '';
        border: 1px solid red;
        background: red;
        text-align: center;
        display: block;
        margin-top: 11px;
        transform: rotate(45deg);
    }

    .removeimg::after {
        /* color: #FFF; */
        /* background-color: #DC403B; */
        content: '';
        background: red;
        border: 1px solid red;
        text-align: center;
        display: block;
        transform: rotate(-45deg);
        margin-top: -2px;
    }
</style>
<%--    Header--%>
<jsp:include page="../common/admin-header.jsp"/>

<!-- Sidebar Menu -->
<jsp:include page="../common/admin-sidebar-menu.jsp"/>

<main class="app-content">
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo mới sản phẩm</h3>
                <div class="tile-body">
                    <form class="row" method="post" enctype="multipart/form-data">
                        <div class="form-group col-md-3">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text" name="TenSP">
                        </div>
                        <div class="form-group  col-md-3">
                            <label class="control-label">Số lượng</label>
                            <input class="form-control" type="number" name="SoLuongSP">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Giá niêm yết</label>
                            <input class="form-control" type="number" name="GiaNiemYetSP" placeholder="VND">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Giá bán thực tế</label>
                            <input class="form-control" type="number" name="GiaThucTeSP" placeholder="VND">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="typeProduct" class="control-label">Loại sản phẩm</label>
                            <select class="form-control" id="typeProduct" name="LoaiSP">
                                <option>-- Chọn loại sản phẩm --</option>
                                <option>Bàn ăn</option>
                                <option>Bàn thông minh</option>
                                <option>Tủ</option>
                                <option>Ghế gỗ</option>
                                <option>Ghế sắt</option>
                                <option>Giường người lớn</option>
                                <option>Giường trẻ em</option>
                                <option>Bàn trang điểm</option>
                                <option>Giá đỡ</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="statusProduct" class="control-label">Tình trạng</label>
                            <select class="form-control" id="statusProduct" name="TrangThaiSP">
                                <option>-- Chọn tình trạng --</option>
                                <option>Còn hàng</option>
                                <option>Hết hàng</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="supplier" class="control-label">Nhà cung cấp</label>
                            <select class="form-control" id="supplier" name="NhaCungCap">
                                <option>-- Chọn nhà cung cấp --</option>
                                <option>Phong vũ</option>
                                <option>Thế giới di động</option>
                                <option>FPT</option>
                                <option>Admin</option>
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Ảnh sản phẩm</label>
                            <div id="boxchoice">
                                <input class="form-control" type="file" accept=".jpg,.png,.webp" name="AnhSP">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Mô tả sản phẩm</label>
                            <textarea class="form-control" id="descProduct" name="MoTaSP"></textarea>
                        </div>
                        <button class="btn btn-save" type="submit">Lưu lại</button>
                        <a class="btn btn-cancel" href="/HoaChatThiNghiem_war/admin/them-san-pham">Hủy bỏ</a>
                    </form>
                </div>

            </div>
        </div>
    </div>
</main>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/admin-js.jsp"></jsp:include>
<!-- ================================================================================================== -->
</body>

</html>