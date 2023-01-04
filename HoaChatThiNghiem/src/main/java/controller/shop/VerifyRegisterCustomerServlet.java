package controller.shop;

import model.Customer;
import model.Customer_register;
import service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "VerifyRegisterCustomerServlet", value = "/shop/verify-register")
public class VerifyRegisterCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = (HttpSession) request.getSession();
        session.getAttribute("session_cus");
        Customer_register cus = (Customer_register) session.getAttribute("cus");
        try{
            if(request.getQueryString().equals("key="+ cus.getId())){
                String email = cus.getEmail();
                String password = cus.getPassword();
                CustomerService.signUp(email,password);
                session.invalidate();
                request.getServletContext().getRequestDispatcher("/shop/login.jsp").forward(request, response);
            }else{
                session.invalidate();
                request.setAttribute("text_register","Đăng ký không thành công, hãy đăng ký lại");
                request.getServletContext().getRequestDispatcher("/shop/register").forward(request, response);
            }
        }catch (Exception e){
            session.invalidate();
            request.setAttribute("text_register","Đăng ký không thành công, hãy đăng ký lại");
            request.getServletContext().getRequestDispatcher("/shop/register").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
