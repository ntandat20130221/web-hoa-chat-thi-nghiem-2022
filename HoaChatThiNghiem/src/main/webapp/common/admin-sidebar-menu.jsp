<%@ page import="model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Admin admin = (Admin) session.getAttribute("auth");%>
<div class="app-sidebar-overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar-user"><img class="admin-avatar" src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="User Image">
        <p class="app-sidebar-user-name"><b>Admin</b></p>
        <p class="app-sidebar-user-designation"><%=admin.getFullname()%></p>
    </div>
    <hr>
    <ul class="app-menu">
        <li>
            <a class="app-menu-item haha" href="/HoaChatThiNghiem_war/admin/trang-chu"><i class='bx bx-tachometer'></i>
                <span class="app-menu-label">Trang chủ</span></a>
        </li>
        <li>
            <a class="app-menu-item" href="/HoaChatThiNghiem_war/admin/quan-ly-san-pham"><i class='bx bx-purchase-tag-alt'></i>
                <span class="app-menu-label">Quản lý sản phẩm</span></a>
        </li>
        <li>
            <a class="app-menu-item" href="/HoaChatThiNghiem_war/admin/quan-ly-don-hang"><i class='bx bx-task'></i>
                <span class="app-menu-label">Quản lý đơn hàng</span></a>
        </li>
        <li>
            <a class="app-menu-item" href="/HoaChatThiNghiem_war/admin/bao-cao-doanh-thu"><i class='bx bx-pie-chart-alt-2'></i>
                <span class="app-menu-label">Báo cáo doanh thu</span></a>
        </li>
        <li>
            <a class="app-menu-item" href="/HoaChatThiNghiem_war/admin/doi-mat-khau"><i class='bx bx-cog'></i>
                <span class="app-menu-label">Đổi mật khẩu</span></a>
        </li>
    </ul>
</aside>