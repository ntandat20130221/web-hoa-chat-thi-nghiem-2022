package controller.admin;

import model.Bill;
import service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminBillsManager", value = "/admin/quan-ly-don-hang")
public class AdminBillsManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Bill> bills = CustomerService.getBills();
        request.setAttribute("bills", bills);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin-jsp/bills-manager.jsp");
        dispatcher.forward(request,response);
    }
}