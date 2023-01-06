package controller.admin.home;

import model.Bill;
import model.Customer;
import service.AdminService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminHome", value = "/admin/trang-chu")
public class AdminHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int[] stat = { AdminService.getNumberOfCustomerAccounts(), AdminService.getNumberOfProducts(),
                AdminService.getNumberOfBills(), AdminService.getNumberOfAlmostOutOfStockProducts() };
        req.setAttribute("int_array", stat);

        List<Bill> recentBills = AdminService.getRecentBills();
        req.setAttribute("recent_bills", recentBills);

        List<Customer> recentCustomers = AdminService.getRecentCustomers();
        req.setAttribute("recent_customers", recentCustomers);

        double[] sales = new double[12];
        int[] cus_created = new int[12], bill_created = new int[12];
        for (int i = 1, j = 0; i < 13 && j < 12; i++, j++) {
            sales[j] = AdminService.getTotalSalesIn(i);
            cus_created[j] = AdminService.getTotalCustomerIn(i);
            bill_created[j] = AdminService.getTotalBillIn(i);
        }
        req.setAttribute("sales", sales);
        req.setAttribute("cus_created", cus_created);
        req.setAttribute("bill_created", bill_created);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin-jsp/index.jsp");
        dispatcher.forward(req, resp);
    }
}
