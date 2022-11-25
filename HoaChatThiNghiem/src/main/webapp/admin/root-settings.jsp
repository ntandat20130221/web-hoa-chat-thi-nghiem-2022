<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu | Quản trị Admin</title>

    <!-- ===== STYLESHEET ===== -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>

<body class="app sidebar-mini rtl">

<jsp:include page="../common/admin-header.jsp"/>
<jsp:include page="../common/admin-root-sidebar-menu.jsp"/>
<% String error = (String) request.getAttribute("error");
   String noti = (String) request.getAttribute("notification");%>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#"><b>Cài đặt hệ thống</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row system-settings">
        <div class="col-lg-4">
            <div class="left text-left">
                <span class="d-inline-block mb-3"><b>Hình ảnh hồ sơ</b></span>
                <div class="img-container">
                    <img src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                         alt="">
                    <button><i class="bx bx-pencil"></i> Sửa</button>
                </div>
                <p class="text-center"><b>Admin</b></p>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="right pb-4">
                <form action="/HoaChatThiNghiem_war/admin/doChangePass" method="post">
                    <label class="d-block" for="name">Tên <span>*</span></label>
                    <input type="text" id="name">
                    <h4 class="position-relative mt-3 mb-4">Đổi mật khẩu</h6>
                        <label class="d-block mt-3" for="old">Mật khẩu cũ <span>*</span></label>
                        <input type="text" id="old" name="old-pass">
                        <label class="d-block mt-3" for="new">Mật khẩu mới</label>
                        <input type="text" id="new" name="new-pass">
                        <label class="d-block mt-3" for="confirm">Xác nhận mật khẩu mới</label>
                        <input type="text" id="confirm">
                        <button type="submit">Lưu thay đổi</button>
                            <% if(error!=null) {
                            %>
                        <div class="error" style="color: #ff4c3b"><%=error%>
                        </div>
                            <% } %>
            </div>
            </h4>
            </form>
        </div>
    </div>
    </div>

    <div class="text-center mt-5">
        <p>
            <b>Copyright
                <script>document.write(new Date().getFullYear())</script>
                Phần mềm quản lý bán hàng | Dev By Trường
            </b>
        </p>
    </div>
</main>

<!-- ===== JAVASCRIPT ===== -->
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>

<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/bootstrap/js/popper.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>