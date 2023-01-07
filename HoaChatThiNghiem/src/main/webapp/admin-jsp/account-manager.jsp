<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pu" uri="https://com.labchemicals.functions" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý tài khoản</title>

    <!-- ===== STYLESHEET ===== -->
    <jsp:include page="../common/admin-css.jsp"/>
</head>

<body class="app sidebar-mini rtl">
<%--    Header--%>
<%--<jsp:include page="../common/admin-header.jsp"/>--%>

<!-- Sidebar Menu -->
<jsp:include page="../common/admin-sidebar-menu.jsp"/>

<main class="app-content" id="bill-page">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href=""><b>Quản lý tài khoản</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
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
                               onclick="myApp.printTable()"><i class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered bill-table" id="sampleTable">
                        <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Tên tài khoản</th>
                            <th class="text-center">Mật khẩu</th>
                            <th class="text-center">Trạng thái</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Ngày tạo</th>
                            <th class="text-center">Chỉnh sửa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="a" items="${requestScope.accounts}">
                            <c:choose>
                                <c:when test="${a.status == 'Bình thường'}"><c:set var="bg" value="bg-success"/></c:when>
                                <c:when test="${a.status == 'Tạm khóa'}"><c:set var="bg" value="bg-warning"/></c:when>
                                <c:when test="${a.status == 'Khóa vĩnh viễn'}"><c:set var="bg" value="bg-danger"/></c:when>
                            </c:choose>
                            <tr>
                                <td data-aid="${a.id}" class="text-center">#${a.id}</td>
                                <td>${a.username}</td>
                                <td>${a.password}</td>
                                <td data-ss="${bg}" class="text-center"><span class="badge ${bg}">${a.status}</span></td>
                                <td>${a.email}</td>
                                <td>${a.time}</td>
                                <td class="text-center">
                                    <button class="btn btn-primary btn-sm edit" type="button"><i class="fas fa-edit"></i></button>
                                    <button class="btn btn-primary btn-sm trash" type="button"><i class="fas fa-trash-alt"></i></button>
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

<div class="modal fade modal-bill" id="modal-up" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content mt-5">
            <div class="modal-body p-4">
                <div class="row">
                    <div class="form-group col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Chỉnh sửa tài khoản</h5>
                            </span>
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="input-account-id">
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên tài khoản</label>
                        <input class="form-control" type="text" required name="account-username">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Mật khẩu</label>
                        <input class="form-control" type="text" required name="account-password">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Email</label>
                        <input class="form-control" type="email" name="account-email">
                    </div>
                    <div class="form-group col-md-6 ">
                        <label for="select-status" class="control-label">Trạng thái</label>
                        <select class="form-control" id="select-status" name="account-status">
                            <option value="bg-success">Bình thường</option>
                            <option value="bg-warning">Tạm khóa</option>
                            <option value="bg-danger">Khóa vĩnh viễn</option>
                        </select>
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-3">
                    <button class="btn btn-save mr-3" type="submit">Lưu lại</button>
                    <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/admin-js.jsp"/>
<!-- ================================================================================================== -->
<script>
    $('.edit').on('click', function () {
        const modal = $('#modal-up')
        modal.find('#input-account-id').val($(this).closest('tr').find('td:first-child').attr('data-aid'))
        modal.find('input[name=account-username]').val($(this).closest('tr').find('td:nth-child(2)').text())
        modal.find('input[name=account-password]').val($(this).closest('tr').find('td:nth-child(3)').text())
        modal.find('input[name=account-email]').val($(this).closest('tr').find('td:nth-child(5)').text())
        const bg = String($(this).closest('tr').find('td:nth-child(4)').attr('data-ss'))
        modal.find('select[name=account-status] option').each(function () {
            if (String($(this).val()) === bg)
                $(this).attr('selected', 'selected')
        })
        modal.modal('show')
    })

    $('.btn-save').on('click', function () {
        const form = $('<form></form>').attr('method', 'post').attr('action', '${context}/admin/quan-ly-tai-khoan')
        const fieldId = $('<input>').attr('type', 'hidden').attr('name', 'account_id')
            .attr('value', $('#input-account-id').val())
        const fieldUsername = $('<input>').attr('type', 'hidden').attr('name', 'account_username')
            .attr('value', $('input[name=account-username]').val())
        const fieldPassword = $('<input>').attr('type', 'hidden').attr('name', 'account_password')
            .attr('value', $('input[name=account-password]').val())
        const fieldStatus = $('<input>').attr('type', 'hidden').attr('name', 'account_status')
            .attr('value', $('#select-status').find(':selected').val())
        const fieldEmail = $('<input>').attr('type', 'hidden').attr('name', 'account_email')
            .attr('value', $('input[name=account-email]').val())
        form.append(fieldId).append(fieldUsername).append(fieldPassword).append(fieldStatus).append(fieldEmail)

        $(document.body).append(form)
        form.submit()
    })

    $('button.trash').on('click', function () {
        const _this = $(this)
        Swal.fire({
            icon: 'warning',
            iconColor: '#d50000',
            title: 'Xác nhận xóa tài khoản?',
            text: 'Hành động này sẽ xóa vĩnh viễn tài khoản người dùng.',
            confirmButtonColor: '#ea3e3e',
            confirmButtonText: 'XÓA',
            showCancelButton: true,
            cancelButtonText: 'HỦY'
        }).then(result => {
            if (result.isConfirmed) {
                const form = $('<form></form>').attr('method', 'post').attr('action', '${context}/admin/quan-ly-tai-khoan')
                const fieldId = $('<input>').attr('type', 'hidden').attr('name', 'delete')
                    .attr('value', $(_this).closest('tr').find('td:first-child').attr('data-aid'))
                $(document.body).append(form.append(fieldId))
                form.submit()
            }
        })
    })

    const myApp = new function () {
        this.printTable = function () {
            const tab = document.getElementById('sampleTable');
            const win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }

    $('#sampleTable').dataTable({
        // order: false,
        order: [[0, 'asc']]
    });

    $('.btn-excel').on('click', function () {
        TableToExcel.convert(document.getElementById('sampleTable'), {
            name: `account_management.xlsx`
        });
        return false
    })

    $('.pdf-file').on('click', function () {
        const pdf = new jsPDF('p', 'pt', 'letter');
        const source = $('#sampleTable');

        const margins = {
            top: 80,
            bottom: 60,
            left: 40,
            width: 522
        };

        pdf.fromHTML(
            source,
            margins.left,
            margins.top, {
                'width': margins.width
            },

            function () {
                pdf.save('Test.pdf');
            }, margins);
    })
</script>
</body>

</html>