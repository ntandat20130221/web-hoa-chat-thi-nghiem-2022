<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pu" uri="https://com.labchemicals.functions" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý sản phẩm</title>

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
                            <a class="btn btn-add btn-sm" href="<%=request.getContextPath()%>/admin/them-san-pham"
                               title="Thêm"><i class="fas fa-plus"></i> Tạo mới sản phẩm</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"
                               onclick="myApp.printTable()"><i class="fas fa-print"></i> In dữ liệu</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất
                                Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm pdf-file" type="button" title="In"
                               onclick="myFunction(this)"><i class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Số lượng</th>
                            <th>Trạng thái</th>
                            <th>Giá niêm yết</th>
                            <th>Giá bán thực tế</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${requestScope.products}">
                            <tr class="rowProduct">
                                <td class="idProduct">${p.idProduct}</td>
                                <td>${p.name}</td>
                                <td><img src="${context}/${p.imgPath}" alt="" width="100px;"></td>
                                <td>${p.quantity}</td>
                                <td><span class="badge bg-success">${p.statusP.name_status}</span></td>
                                <td>${pu:format(p.listed_price)}</td>
                                <td>${pu:format(p.current_price)}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                            onclick=""><i class="fas fa-trash-alt"></i></button>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                            data-toggle="modal" data-target="#modal-up"><i
                                            class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
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
                        <label for="exampleSelect1" class="control-label">Trạng thái sản phẩm</label>
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
<script>
    <%--  Hiển thị danh sách sản phẩm sử dụng DataTable  --%>
    $(document).ready(function () {
        $('#sampleTable').DataTable();
    });
    <%--Xóa sản phẩm sử dụng Ajax --%>
    $('#sampleTable .trash').on('click', function () {
        swal({
            title: 'Cảnh báo',
            text: 'Bạn có chắc chắn là muốn xóa sản phẩm này?',
            buttons: ['Hủy bỏ', 'Đồng ý']
        }).then((agree) => {
                if (agree) {
                    var rowDelete = $(this).closest('tr')                       // row can be deleted
                    var id = $(this).closest('tr').find('.idProduct').text()    // get data from row in table
                    $.ajax({    // call Ajax for action delete product
                        url: '${context}/AjaxDeleteProductServlet',     //-- địa chỉ server
                        type: 'POST',                                   //-- phương thức truyền : GET,POST,PUT,DELETE,...
                        data: {IdProduct: id},                          //-- tham số truyền đến server
                        data_type: 'text',                              //-- kiểu dữ liệu nhận về từ server text,xml,json,...
                        success: (function (resultData) {
                            // alert(resultData)
                            if (resultData.toString() == "success") {
                                rowDelete.remove();
                                swal({
                                    text: 'Đã xóa thành công.',
                                    icon: 'success',
                                    timer: 1000,
                                    buttons: false
                                });
                            } else {
                                swal({
                                    text: 'Xóa không thành công.',
                                    icon: 'error',
                                    timer: 1000,
                                    buttons: false
                                });
                            }
                        }),         //-- xử lí phản hồi từ server
                        error: (function () {
                            // error no call ajax
                        })
                    })
                }
            }
        )
    });

    $('.btn-excel').on('click', function () {
        TableToExcel.convert(document.getElementById('sampleTable'), {
            name: `danh-sach-san-pham.xlsx`
        });
        return false
    })
</script>
</body>
</html>