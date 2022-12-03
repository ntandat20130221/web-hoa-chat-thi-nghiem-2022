package controller.admin;

import model.Admin;
import service.AdminService;
import utils.CommonString;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminLogin", value = "/admin/dang-nhap")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();  // get session current
        if (session != null) session.invalidate();  // cancel all session current

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/login.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String passAD = request.getParameter("password");
        Admin admin = AdminService.checkLogin(username, passAD); // call model
        if (admin == null) {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response); // return view
        } else {

            HttpSession session = request.getSession(true);
            session.setAttribute(CommonString.ADMIN_SESSION, admin);
            int role_admin = admin.getId_role_admin();
            if (role_admin == 1) {

                response.sendRedirect("/HoaChatThiNghiem_war/admin/root-trang-chu");

            } else if (role_admin == 2) {

                response.sendRedirect("/HoaChatThiNghiem_war/admin/trang-chu");

            }

        }
    }
}
