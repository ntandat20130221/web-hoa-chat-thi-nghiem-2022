package controller.admin;

import service.AdminService;
import service.CustomerService;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "AdminSalesReport", value = "/admin/bao-cao-doanh-thu")
public class AdminSalesReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int[] infos = {
                AdminService.getTotalCustomers(), AdminService.getTotalProducts(), AdminService.getTotalBills(),
                ProductService.getProhibitedProducts().size(), (int) AdminService.getTotalRevenue(),
                ProductService.getTotalSoldProducts(), ProductService.getOutOfStockProducts().size(), AdminService.getTotalCancelOrders()
        };
        req.setAttribute("infos", infos);

        req.setAttribute("selling", ProductService.getSellingProducts(false));
        req.setAttribute("bills_previous", AdminService.getBillsIn(LocalDate.now().minusMonths(1).getMonthValue()));
        req.setAttribute("oos_products", ProductService.getOutOfStockProducts());
        req.setAttribute("new_cus", CustomerService.getRecentCustomers(30));

        double[] sales = new double[12];
        int[] sold = new int[12], added = new int[12];
        for (int i = 1, j = 0; i < 13 && j < 12; i++, j++) {
            sales[j] = AdminService.getTotalSalesIn(i);
            sold[j] = ProductService.getTotalSoldIn(i);
            added[j] = ProductService.getAddedProductIn(i).size();
        }
        req.setAttribute("sales", sales);
        req.setAttribute("solds", sold);
        req.setAttribute("added", added);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin-jsp/sales-report.jsp");
        dispatcher.forward(req, resp);
    }
}
