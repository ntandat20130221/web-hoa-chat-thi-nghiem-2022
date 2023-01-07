package controller.admin.account;

import database.dao.CustomerDao;
import model.Account;
import service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccountManagerServlet", urlPatterns = "/admin/quan-ly-tai-khoan")
public class AccountManagerServlet extends HttpServlet {
    private final CustomerDao customerDao = new CustomerDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Account> accounts = AdminService.getAllAccounts();
        req.setAttribute("accounts", accounts);
        req.getRequestDispatcher("/admin-jsp/account-manager.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String delete = req.getParameter("delete");
        if (delete != null) {
            customerDao.deleteAccount(Integer.parseInt(delete));
            resp.sendRedirect(req.getContextPath() + "/admin/quan-ly-tai-khoan");
            return;
        }

        String id = req.getParameter("account_id");
        String username = req.getParameter("account_username");
        String password = req.getParameter("account_password");
        String status = req.getParameter("account_status");
        String email = req.getParameter("account_email");
        customerDao.updateAccount(Integer.parseInt(id), username, password, extractStatusId(status), email);
        resp.sendRedirect(req.getContextPath() + "/admin/quan-ly-tai-khoan");
    }

    private int extractStatusId(String status) {
        switch (status) {
            case "bg-success": return 1;
            case "bg-warning": return 2;
            case "bg-danger": return 3;
        }
        return -1;
    }
}
