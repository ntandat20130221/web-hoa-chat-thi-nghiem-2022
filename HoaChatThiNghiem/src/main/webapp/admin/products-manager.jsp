<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý sản phẩm | Quản trị Admin</title>

    <!-- ===== STYLESHEET ===== -->
    <jsp:include page="../common/admin-css.jsp"></jsp:include>
</head>

<body class="app sidebar-mini rtl">
<%--    Header--%>
<jsp:include page="../common/admin-header.jsp"/>

<!-- Sidebar Menu -->
<jsp:include page="../common/admin-sidebar-menu.jsp"/>
    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item active"><a href="#"><b>Quản lý sản phẩm</b></a></li>
            </ul>
            <div id="clock"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <div class="row element-button">
                            <div class="col-sm-2">
                                <a class="btn btn-add btn-sm" href="/HoaChatThiNghiem_war/admin/them-san-pham" title="Thêm"><i class="fas fa-plus"></i> Tạo mới sản phẩm</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i class="fas fa-print"></i> In dữ liệu</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất Excel</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-delete btn-sm pdf-file" type="button" title="In" onclick="myFunction(this)"><i class="fas fa-file-pdf"></i> Xuất PDF</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i> Xóa tất cả </a>
                            </div>
                        </div>
                        <!-- Search -->
                        <div class="search-bar d-flex justify-content-between my-3">
                            <div class="d-flex align-items-center">
<%--                                <span class="status">Hiện <span class="quantity">10</span> danh mục</span>--%>
                            </div>
                            <div class="search-wrap">
                                <label class="font-weight-bold m-0" for="search">Tìm kiếm theo tên: </label>
                                <input type="text" placeholder="" id="search">
                                <label for="by" class="font-weight-bold m-0 ml-3">Loại sản phẩm: </label>
                                <select id="by">
                                    <option>Hóa chất</option>
                                    <option>Dụng cụ</option>
                                    <option>Thiết bị</option>
                                </select>
                            </div>
                        </div>
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th width="10"><input type="checkbox" id="all"></th>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Ảnh</th>
                                    <th>Số lượng</th>
                                    <th>Tình trạng</th>
                                    <th>Giá tiền</th>
                                    <th>Danh mục</th>
                                    <th>Chức năng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>71309005</td>
                                    <td>Bàn ăn gỗ Theresa</td>
                                    <td><img src="https://images.pexels.com/photos/2280571/pexels-photo-2280571.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>40</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>5.600.000đ</td>
                                    <td>Bàn ăn</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div class="modal fade" id="modal-up" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>
                            </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text" required value="Bàn ăn gỗ Theresa">
                        </div>
                        <div class="form-group  col-md-6">
                            <label class="control-label">Số lượng</label>
                            <input class="form-control" type="number" required value="20">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Giá niêm yết</label>
                            <input class="form-control" type="number" value="5.600.000">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Giá bán thực tế</label>
                            <input class="form-control" type="number" value="4.600.000">
                        </div>
                        <div class="form-group col-md-6 ">
                            <label for="exampleSelect1" class="control-label">Tình trạng sản phẩm</label>
                            <select class="form-control" id="exampleSelect1">
                                <option>Còn hàng</option>
                                <option>Hết hàng</option>
                                <option>Cấm bán</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleSelect1" class="control-label">Loại sản phẩm</label>
                            <select class="form-control" id="exampleSelect2">
                                <option>Hóa chất</option>
                                <option>Dụng cụ</option>
                                <option>Thiết bị</option>
                            </select>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end mt-3">
                        <button class="btn btn-save mr-3" type="submit">Lưu lại</button>
                        <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                    </div>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/admin-js.jsp"></jsp:include>
</body>
</html>