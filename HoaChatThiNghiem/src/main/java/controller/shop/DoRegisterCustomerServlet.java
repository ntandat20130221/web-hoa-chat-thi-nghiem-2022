package controller.shop;

import service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DoRegisterCustomerServlet", value = "/shop/register")
public class DoRegisterCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getServletContext().getRequestDispatcher("/shop/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm_pass = request.getParameter("confirm-pass");
        if(CustomerService.checkExist(email)){
            if(password.equals(confirm_pass)){
                CustomerService.signUp(email,password);
                response.sendRedirect(request.getContextPath()+"/shop/login");
            }else{
                request.setAttribute("text_register", "Không hợp lệ, hãy xác nhận lại mật khẩu");
                request.getServletContext().getRequestDispatcher("/shop/register.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("text_register", "Email đã tồn tại, vui lòng chọn Email khác");
            request.getServletContext().getRequestDispatcher("/shop/register.jsp");
        }
    }
}
