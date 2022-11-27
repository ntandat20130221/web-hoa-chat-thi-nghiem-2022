<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý admin | Quản trị Admin</title>

    <!-- ===== STYLESHEET ===== -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"/>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css"/>

    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css"/>
</head>

<body class="app sidebar-mini rtl">

<jsp:include page="../common/admin-header.jsp"/>
<jsp:include page="../common/admin-root-sidebar-menu.jsp"/>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Quản lý admin</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <!-- Action Buttons -->
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"><i
                                    class="fas fa-print"></i> In dữ liệu</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất
                                Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm pdf-file" type="button" title="In"><i
                                    class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                    </div>
                    <!-- Search -->
                    <div class="search-bar d-flex justify-content-between my-3">
                        <div class="d-flex align-items-center">
                            <!-- <span class="status">Hiện <span class="quantity">10</span> tài khoản</span> -->
                        </div>
                        <div class="search-wrap">
                            <label class="font-weight-bold m-0" for="search">Tìm kiếm: </label>
                            <input type="text" placeholder="" id="search">
                            <label for="by" class="font-weight-bold m-0 ml-3">Theo: </label>
                            <select id="by">
                                <option>Tài khoản</option>
                                <option>Quyền</option>
                            </select>
                        </div>
                    </div>
                    <!-- Table -->
                    <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0"
                           id="sampleTable">
                        <thead>
                        <tr>
                            <th>Tài khoản</th>
                            <th>Mật khẩu</th>
                            <th>Quyền</th>
                            <th>Sửa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>tranminhtuyen1@gmail.com</td>
                            <td>Tuyen123a</td>
                            <td>Quản lí admin</td>
                            <td>

                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                        data-toggle="modal" data-target="#modal-up"><i
                                        class="fas fa-edit"></i></button>
                            </td>

                        </tr>
                        <tr>
                            <td>tranminhtuyen2@gmail.com</td>
                            <td>Tuyen123b</td>
                            <td>Quản lí khách hàng, Quản lí sản phẩm, Quản lí đơn hàng, Báo cáo doanh thu</td>
                            <td>

                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                        data-toggle="modal" data-target="#modal-up"><i
                                        class="fas fa-edit"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>tranminhtuyen3@gmail.com</td>
                            <td>Tuyen123c</td>
                            <td>Quản lí khách hàng, Quản lí sản phẩm, Quản lí đơn hàng, Báo cáo doanh thu</td>
                            <td>

                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                        data-toggle="modal" data-target="#modal-up"><i
                                        class="fas fa-edit"></i></button>
                            </td>

                        </tr>
                        <tr>
                            <td>tranminhtuyen4@gmail.com</td>
                            <td>Tuyen123d</td>
                            <td>Quản lí khách hàng, Quản lí sản phẩm, Quản lí đơn hàng, Báo cáo doanh thu</td>
                            <td>

                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                        data-toggle="modal" data-target="#modal-up"><i
                                        class="fas fa-edit"></i></button>
                            </td>

                        </tr>
                        <tr>
                            <td>tranminhtuyen5@gmail.com</td>
                            <td>Tuyen123e</td>
                            <td>Quản lí khách hàng, Quản lí sản phẩm, Quản lí đơn hàng, Báo cáo doanh thu</td>
                            <td>

                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                        data-toggle="modal" data-target="#modal-up"><i
                                        class="fas fa-edit"></i></button>
                            </td>

                        </tr>
                        <tr>
                            <td>tranminhtuyen6@gmail.com</td>
                            <td>Tuyen123f</td>
                            <td>Quản lí khách hàng, Quản lí sản phẩm, Quản lí đơn hàng, Báo cáo doanh thu</td>
                            <td>

                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                        data-toggle="modal" data-target="#modal-up"><i
                                        class="fas fa-edit"></i></button>
                            </td>

                        </tr>
                        <tr>
                            <td>tranminhtuyen7@gmail.com</td>
                            <td>Tuyen123g</td>
                            <td>Quản lí khách hàng, Quản lí sản phẩm, Quản lí đơn hàng, Báo cáo doanh thu</td>
                            <td>

                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                        data-toggle="modal" data-target="#modal-up"><i
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

<div class="modal fade" id="modal-up" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Chỉnh sửa thông tin tài khoản của admin</h5>
                            </span>
                    </div>
                </div>
                <!-- <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">Mã sản phẩm </label>
                        <input class="form-control" type="number" value="71309005">
                    </div> -->
                <!-- <div class="form-group col-md-6">
                    <label class="control-label">Tên sản phẩm</label>
                    <input class="form-control" type="text" required value="Bàn ăn gỗ Theresa">
                </div> -->
                <!-- <div class="form-group  col-md-6">
                    <label class="control-label">Số lượng</label>
                    <input class="form-control" type="number" required value="20">
                </div> -->
                <!-- <div class="form-group col-md-6 ">
                    <label for="exampleSelect1" class="control-label">Quyền</label>
                    <select class="form-control" id="exampleSelect1">
                        <option>Còn hàng</option>
                        <option>Hết hàng</option>
                        <option>Đang nhập hàng</option>
                    </select>
                </div> -->
                <div class="form-group col-md-6">
                    <label class="control-label">Mật khẩu</label>
                    <input class="form-control" type="text" value="T123@">
                </div>
                <div class="form-group col-md-6">
                    <label for="exampleSelect1" class="control-label">Quyền</label>
                    <select class="form-control" id="exampleSelect1">
                        <option>Root - Admin</option>
                        <option>Normal - Admin</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="exampleSelect1" class="control-label">Trạng thái tài khoản</label>
                    <select class="form-control" id="exampleSelect2">
                        <option>Tạm khóa</option>
                        <option>Bình thường</option>
                    </select>
                </div>
            </div>
            <div class="d-flex justify-content-end mt-3">
                <button class="btn btn-save mr-3">Lưu lại</button>
                <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
            </div>
        </div>
        <div class="modal-footer"></div>
    </div>
</div>
</div>

<!-- ===== JAVASCRIPT ===== -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/bootstrap/js/popper.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/plugins/pace.min.js"></script>
<script src="js/main.js"></script>
<!-- ================================================================================================== -->
<script>
    // In dữ liệu
    var myApp = new (function () {
        this.printTable = function () {
            var tab = document.getElementById("sampleTable");
            var win = window.open("", "", "height=700,width=700");
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        };
    })();

    // Sao chép dữ liệu
    // var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

    // copyTextareaBtn.addEventListener('click', function (event) {
    //     var copyTextarea = document.querySelector('.js-copytextarea');
    //     copyTextarea.focus();
    //     copyTextarea.select();

    //     try {
    //         var successful = document.execCommand('copy');
    //         var msg = successful ? 'successful' : 'unsuccessful';
    //         console.log('Copying text command was ' + msg);
    //     } catch (err) {
    //         console.log('Oops, unable to copy');
    //     }
    // });
</script>
</body>

</html>