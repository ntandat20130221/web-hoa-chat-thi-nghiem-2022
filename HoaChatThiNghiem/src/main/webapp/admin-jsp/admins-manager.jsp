<%@ page import="model.Admin" %>
<%@ page import="utils.CommonString" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý admin</title>

    <!-- ===== STYLESHEET ===== -->
    <jsp:include page="../common/admin-css.jsp"/>
</head>

<body class="app sidebar-mini rtl">

<%--<jsp:include page="../common/admin-header.jsp"/>--%>

<jsp:include page="../common/admin-sidebar-menu.jsp"/>

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
                            <a class="btn btn-excel btn-sm" title="In"><i class="fas fa-file-excel"></i> Xuất
                                Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm pdf-file" type="button" title="In"><i
                                    class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                    </div>
                    <!-- Table -->
                    <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0"
                           id="sampleTable">
                        <thead>
                        <tr>
                            <th>Tài khoản</th>
                            <th>Trạng thái</th>
                            <th>Quyền</th>
                            <th>Họ tên</th>
                            <th>Sửa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="a" items="${requestScope.adminList}">
                            <tr>
                                <td>${a.username}</td>
                                <td>${a.name_status_acc}</td>
                                <td>${a.name_role_admin}</td>
                                <td>${a.fullname}</td>
                                <td>
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
                                <h5>Chỉnh sửa thông tin tài khoản của admin</h5>
                            </span>
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label class="control-label">Mật khẩu</label>
                    <input class="form-control" type="text" placeholder="it_nlu_2022">
                </div>
                <div class="form-group col-md-6">
                    <label for="SelectRole" class="control-label">Quyền</label>
                    <select class="form-control" id="SelectRole">
                        <option value="0">-- Chọn quyền tài khoản --</option>
                        <c:forEach var="r" items="${requestScope.allRoleAdmin}">
                            <option value="${r.id_role}">${r.name_role}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="SelectStatus" class="control-label">Trạng thái tài khoản</label>
                    <select class="form-control" id="SelectStatus">
                        <option value="0">-- Chọn trạng thái tài khoản --</option>
                        <c:forEach var="stt" items="${requestScope.allStatusAcc}">
                            <option value="${stt.id_status}">${stt.name_status}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="d-flex justify-content-end mt-3">
                <button class="btn btn-save mr-3">Lưu lại</button>
                <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
            </div>
        </div>
    </div>
</div>
</div>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/admin-js.jsp"/>
<script>
    <%--  Hiển thị danh sách sản phẩm sử dụng DataTable  --%>
    $(document).ready(function () {
        $('#sampleTable').DataTable();
    });


</script>
</body>
</html>