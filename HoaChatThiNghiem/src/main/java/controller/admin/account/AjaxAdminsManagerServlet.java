package controller.admin.account;

import model.Admin;
import utils.CommonString;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminsManagerServlet", value = "/admin/quan-ly-admin")
public class AjaxAdminsManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Admin admin = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
        if (admin.getId_role_admin() == 3) {
            request.getRequestDispatcher("/admin-jsp/admins-manager.jsp").forward(request,response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/trang-chu");
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idRole = request.getParameter("IdRoleAdmin");
        try {
            Integer idRoleAdmin = Integer.parseInt(idRole);
            if (idRoleAdmin == 3) {
                response.getWriter().write(request.getContextPath() + "/admin/quan-ly-admin");
            } else {
                response.getWriter().write("fail");
            }
        } catch (Exception e) {
            response.getWriter().write("fail");
        }
    }
}
