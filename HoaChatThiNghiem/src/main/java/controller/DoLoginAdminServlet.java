package controller;

import model.Admin;
import service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginAdmin", value = "/admin/doLoginAdmin")

public class DoLoginAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String passAD = request.getParameter("password");
        Admin admin = AdminService.checkLogin(username, passAD);
        if (admin == null) {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {

            HttpSession session = request.getSession(true);
            session.setAttribute("auth", admin);
            int role_admin = admin.getId_role_admin();
            if (role_admin == 1) {

                response.sendRedirect("root-index.jsp");

            } else if (role_admin == 2) {

                response.sendRedirect("index.jsp");
            }

        }


    }
}
