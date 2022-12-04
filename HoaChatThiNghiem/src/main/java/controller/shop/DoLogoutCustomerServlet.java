package controller.shop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DoLogoutCustomerServlet", value = "/shop/DoLogoutCustomer")
public class DoLogoutCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = (HttpSession) request.getSession();
        session.getAttribute("auth_session_customer");
        session.invalidate();
        response.sendRedirect(request.getContextPath()+ "/shop/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
