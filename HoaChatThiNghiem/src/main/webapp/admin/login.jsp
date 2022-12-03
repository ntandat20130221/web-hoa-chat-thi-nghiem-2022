<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập quản trị | Website quản trị v2.0</title>

    <!-- ===== STYLESHEET ===== -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="<c:url value='vendor/bootstrap/css/bootstrap.min.css'/> ">
    <link rel="stylesheet" href="<c:url value="css/login.css" />">
</head>

<body>
<% String error = (String) request.getAttribute("error"); %>

<section class="container-login d-flex justify-content-center align-items-center p-3">
    <div class="wrap-login">
        <div class="login-pic">
            <img src="images/team.jpg" alt="">
        </div>
        <div class="login-form">
            <span class="login-form-title text-center d-block mb-4">ĐĂNG NHẬP HỆ THỐNG</span>
            <form name="form-login" onsubmit="return validateFormLogin()" method="post">
                <%
                    if (error != null) {
                %>
                <div class="alert alert-danger" role="alert">
                    <%= error %>
                </div>
                <%
                    }
                %>
                <div class="wrap-input">
                    <input class="input"
                           type="text"
                           value="<%=request.getParameter("username") != null ? request.getParameter("username"):""%>"
                           placeholder="Tài khoản quản trị" name="username" id="field-username">
                    <span class="symbol-input d-flex align-items-center pl-4"><i class='bx bx-user'></i></span>
                </div>
                <div class="wrap-input">
                    <input autocomplete="off" class="input" type="password" placeholder="Mật khẩu" name="password"
                           id="field-password">
                    <span toggle="#field-password" class="bx bx-hide field-icon click-eye"></span>
                    <span class="symbol-input d-flex align-items-center pl-4"><i class='bx bx-key'></i></span>
                </div>
                <div class="form-btn d-flex flex-wrap justify-content-center w-100 pt-3">
                    <input type="submit" value="Đăng nhập" id="btn-login"/>
                </div>
                <div class="text-center pt-3">
                </div>
            </form>
        </div>
        <div class="text-center pt-5 w-100">
            <b>
                Phần mềm quản lý bán hàng <i class="bx bx-copyright"></i>
                <script>document.write(new Date().getFullYear())</script>
            </b>
        </div>
    </div>
</section>

<!-- ====== JAVASCRIPT ===== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>

</body>

</html>