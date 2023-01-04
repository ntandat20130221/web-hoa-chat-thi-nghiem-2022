<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<%@ page import="model.Admin" %>
<%@ page import="utils.CommonString" %>

<% Admin admin = (Admin) session.getAttribute(CommonString.ADMIN_SESSION);%>

<%
    String url = request.getRequestURL().toString(), c1 = "", c2 = "", c3 = "", c4 = "", c5 = "";
    if (url.contains("index")) c1 = "haha";
    else if (url.contains("product")) c2 = "haha";
    else if (url.contains("bills")) c3 = "haha";
    else if (url.contains("sales")) c4 = "haha";
    else if (url.contains("settings")) c5 = "haha";
%>

<div class="app-sidebar-overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar-user"><img class="admin-avatar" src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="User Image">
        <p class="app-sidebar-user-name"><b>Admin</b></p>
        <p class="app-sidebar-user-designation"><%=admin.getFullname()%></p>
    </div>
    <hr>
    <ul class="app-menu">
        <li>
            <a class="app-menu-item <%=c1%>" href="${context}/admin/trang-chu"><i class='bx bx-tachometer'></i>
                <span class="app-menu-label">Trang chủ</span></a>
        </li>
        <li>
            <a class="app-menu-item <%=c2%>" href="${context}/admin/quan-ly-san-pham"><i class='bx bx-purchase-tag-alt'></i>
                <span class="app-menu-label">Quản lý sản phẩm</span></a>
        </li>
        <li>
            <a class="app-menu-item <%=c3%>" href="${context}/admin/quan-ly-don-hang"><i class='bx bx-task'></i>
                <span class="app-menu-label">Quản lý đơn hàng</span></a>
        </li>
        <li>
            <a class="app-menu-item <%=c4%>" href="${context}/admin/bao-cao-doanh-thu"><i class='bx bx-pie-chart-alt-2'></i>
                <span class="app-menu-label">Báo cáo doanh thu</span></a>
        </li>
        <li>
            <a class="app-menu-item <%=c5%>" href="${context}/admin/doi-mat-khau"><i class='bx bx-cog'></i>
                <span class="app-menu-label">Đổi mật khẩu</span></a>
        </li>
    </ul>
</aside>