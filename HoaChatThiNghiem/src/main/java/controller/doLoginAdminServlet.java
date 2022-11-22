package controller;

import model.Admin;
import service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginAdmin", value = "/doLoginAdmin")
public class doLoginAdminServlet extends HttpServlet {
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
            request.getRequestDispatcher("admin/login.jsp").forward(request, response);
        } else {

            response.sendRedirect("admin/index.jsp");
        }


    }
}
