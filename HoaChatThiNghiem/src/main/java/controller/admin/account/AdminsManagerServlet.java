package controller.admin.account;

import model.Admin;
import service.AdminService;
import service.AdminService_MT;
import utils.CommonString;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminsManagerServlet", value = "/admin/quan-ly-admin")
public class AdminsManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
        if (admin.getId_role_admin() == 3) {
            List<Admin> listAdmin = AdminService_MT.getAllAdmin();
            List<Object> allRoleAdminAndStatusAcc = AdminService_MT.getAllRoleAdminAndStatusAcc();
            request.setAttribute("adminList",listAdmin);
            request.setAttribute("allRoleAdmin",allRoleAdminAndStatusAcc.get(0));
            request.setAttribute("allStatusAcc",allRoleAdminAndStatusAcc.get(1));
            request.getRequestDispatcher("/admin-jsp/admins-manager.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/trang-chu");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
