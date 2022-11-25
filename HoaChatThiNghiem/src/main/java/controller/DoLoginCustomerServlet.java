package controller;

import model.Customer;
import service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginCustomer", value = "/shop/DoLoginCustomer")
public class DoLoginCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Customer customer = CustomerService.checkLogin(email, password);
        if(customer != null){
            if(customer.getId_status_acc() == 1) {
                HttpSession session = request.getSession(true);
                session.setAttribute("auth_customer", customer);
//                response.getWriter().println(session);
                response.sendRedirect("index.jsp");

            }else if(customer.getId_status_acc() == 2){
                request.setAttribute("temporarily_ban", "Tài khoản tạm khóa");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                request.setAttribute("ban", "Tài khoản đã bị khóa vĩnh viễn");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
