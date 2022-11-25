package controller.admin;

import model.Admin;
import service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangePassAdmin", value = "/admin/DoChangePass")
public class DoChangePassServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String old_pass = request.getParameter("old-pass");
        String new_pass = request.getParameter("new-pass");
        Admin admin = (Admin) request.getSession().getAttribute("auth");
        if (old_pass.equals(admin.getPassAD())) {

            boolean checkUpdate = AdminService.updatePassword(admin.getUsername(), new_pass);
            if (checkUpdate == true) {

                response.sendRedirect("login.jsp");


            } else {

                request.setAttribute("notification", "Cập nhật không thành công ^.^");

                int id_role_admin = admin.getId_role_admin();
                if (id_role_admin == 1) {
                    request.getRequestDispatcher("root-settings.jsp").forward(request, response);
                } else if (id_role_admin == 2) {
                    request.getRequestDispatcher("settings.jsp").forward(request, response);
                }
            }

        } else {

            request.setAttribute("error", "Hãy nhập lại mật khẩu cũ");
            int id_role_admin = admin.getId_role_admin();
            if (id_role_admin == 1) {
                request.getRequestDispatcher("root-settings.jsp").forward(request, response);
            } else if (id_role_admin == 2) {
                request.getRequestDispatcher("settings.jsp").forward(request, response);
            }

        }
    }
}
