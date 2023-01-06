package service;

import database.DbConnection;
import database.dao.AdminDAO;
import model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AdminService {

    public static boolean updatePassword(String username, String new_pass) {

        DbConnection connectDB = DbConnection.getInstance();
        String sql = "update account_admin set passwordAD = ?, time_change_pass = current_timestamp() where username = ?";
        PreparedStatement preState = connectDB.getPreparedStatement(sql);
        try {
            preState.setString(1, new_pass);
            preState.setString(2, username);
            int update = preState.executeUpdate();
            if (update > 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            connectDB.close();
        }

        return false;
    }

    public static Admin checkLogin(String username, String passAD) {
        List<Admin> admins = new ArrayList<>();
        DbConnection connectDB = DbConnection.getInstance();
        String sql = "select username,passwordAD,id_role_admin,id_status_acc,fullname from account_admin where username = ?";
        PreparedStatement preState = connectDB.getPreparedStatement(sql);
        try {
            preState.setString(1, username);
            ResultSet rs = preState.executeQuery();
            while (rs.next()) {
                String user_name = rs.getString("username");
                String password = rs.getString("passwordAD");
                int id_role_admin = rs.getInt("id_role_admin");
                int id_status_acc = rs.getInt("id_status_acc");
                String full_name = rs.getString("fullname");
                Admin admin = new Admin(user_name, password, id_role_admin, id_status_acc, full_name);
                admins.add(admin);
            }

            if (admins.size() != 1) return null; // không thể tồn tại nhiều username trùng tên trong hệ thống

            Admin admin = admins.get(0);
            if (admin.getPassAD().equals(passAD)) return admin;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            connectDB.close();
        }
        return null;
    }

    public static List<Admin> getAllAdmin() {
        DbConnection connectDB = DbConnection.getInstance();
        AdminDAO dao = new AdminDAO();
        try {
            return dao.getAllAdmin(connectDB);
        } finally {
            connectDB.close();
        }
    }

    public static List<Object> getAllRoleAdminAndStatusAcc() {
        List<Object> result = new ArrayList<>();
        DbConnection connectDB = DbConnection.getInstance();
        AdminDAO dao = new AdminDAO();
        try {
            List<RoleAdmin> roleAdmins = dao.getAllRoleAdmin(connectDB);
            List<StatusAcc> statusAccs = dao.getAllStatusAcc(connectDB);
            result.add(roleAdmins);
            result.add(statusAccs);
        } finally {
            connectDB.close();
        }
        return result;
    }

    private static int getQuantityByBillId(int id) {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement(
                "SELECT SUM(bd.quantity) FROM bills b JOIN bill_detail bd ON b.id_bill = bd.id_bill WHERE b.id_bill = ? GROUP BY b.id_bill")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static List<Bill> getBillsIn(int month) {
        List<Bill> bills = new ArrayList<>();
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT b.id_bill, s.name_status_bill, " +
                "b.fullname_customer, b.total_price FROM bills b " +
                "JOIN status_bill s ON b.id_status_bill = s.id_status_bill " +
                "WHERE MONTH(time_order) = ? AND YEAR(time_order) = YEAR(CURRENT_DATE)")) {
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id_bill");
                List<Product> products = ProductService.getProductsByBillId(id);
                String status = rs.getString("name_status_bill");
                String address = rs.getString("address_customer");
                String customerName = rs.getString("fullname_customer");
                int quantity = getQuantityByBillId(id);
                double totalPrice = rs.getDouble("total_price");
                Date timeOrder = rs.getDate("time_order");
                Bill bill = new Bill(id, products, status, address, customerName, quantity, totalPrice, timeOrder);
                bills.add(bill);
            }
        } catch (SQLException e) {
            return new ArrayList<>();
        }
        return bills;
    }

    public static int getTotalCancelOrders() {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT COUNT(*) FROM bills WHERE id_status_bill = ?")) {
            ps.setInt(1, 3);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static double getTotalRevenue() {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT SUM(total_price) FROM bills")) {
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static int getTotalBills() {
        return getTotalOf("bills");
    }

    public static int getTotalProducts() {
        return getTotalOf("products");
    }

    public static int getTotalCustomers() {
        return getTotalOf("account_customer");
    }

    private static int getTotalOf(String table) {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT COUNT(*) FROM " + table)) {
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static int getTotalCustomerIn(int month) {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT COUNT(*) FROM account_customer " +
                "WHERE MONTH(time_created) = ? AND YEAR(time_created) = YEAR(CURRENT_DATE)")) {
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static int getTotalBillIn(int month) {
        return getBillsIn(month).size();
    }

    public static double getTotalSalesIn(int month) {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT SUM(total_price) FROM bills " +
                "WHERE MONTH(time_order) = ? AND YEAR(time_order) = YEAR(CURRENT_DATE) " +
                "GROUP BY MONTH(time_order)")) {
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getDouble(1);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static List<Customer> getRecentCustomers() {
        List<Customer> customers = new ArrayList<>();
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT id_user_customer, fullname, email_customer, " +
                "name_status_acc FROM account_customer a " +
                "JOIN status_acc s ON s.id_status_acc = a.id_status_acc " +
                "WHERE DATE(time_created) > (NOW() - INTERVAL ? DAY) ORDER BY time_created DESC LIMIT 0, 4;")) {
            ps.setInt(1, 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("fullname");
                String email = rs.getString("email_customer");
                Customer c = new Customer();
                c.setId(rs.getInt("id_user_customer"));
                c.setFullname(name);
                c.setEmail(email);
                c.setStatus(rs.getString("name_status_acc"));
                customers.add(c);
            }
        } catch (SQLException e) {
            return new ArrayList<>();
        }
        return customers;
    }

    public static List<Bill> getRecentBills() {
        List<Bill> bills = new ArrayList<>();
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT b.id_bill, s.name_status_bill, " +
                "b.fullname_customer, b.total_price FROM bills b " +
                "JOIN status_bill s ON b.id_status_bill = s.id_status_bill " +
                "WHERE DATE(time_order) > (NOW() - INTERVAL ? DAY) ORDER BY time_order DESC LIMIT 0,4")) {
            ps.setInt(1, 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id_bill");
                List<Product> products = ProductService.getProductsByBillId(id);
                String status = rs.getString("name_status_bill");
                String customerName = rs.getString("fullname_customer");
                String address = rs.getString("address_customer");
                int quantity = getQuantityByBillId(id);
                double totalPrice = rs.getDouble("total_price");
                Date timeOrder = rs.getDate("time_order");
                Bill bill = new Bill(id, products, status, address, customerName, quantity, totalPrice, timeOrder);
                bills.add(bill);
            }
        } catch (SQLException e) {
            return new ArrayList<>();
        }
        return bills;
    }

    public static int getNumberOfAlmostOutOfStockProducts() {
        try (Statement st = DbConnection.getInstance().getStatement()) {
            ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM products WHERE quantity_product <= 10");
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static int getNumberOfBills() {
        return getNumberOf("bills");
    }

    public static int getNumberOfCustomerAccounts() {
        return getNumberOf("account_customer");
    }

    public static int getNumberOfProducts() {
        return getNumberOf("products");
    }

    private static int getNumberOf(String table) {
        try (Statement st = DbConnection.getInstance().getStatement()) {
            ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM " + table);
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static void updateBill(int billId, String cus, double price, int status, String address) {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement(
                "UPDATE bills " +
                        "SET fullname_customer = ?, address_customer = ?, total_price = ?, id_status_bill = ? " +
                        "WHERE id_bill = ?"
        )) {
            ps.setString(1, cus);
            ps.setString(2, address);
            ps.setDouble(3, price);
            ps.setInt(4, status);
            ps.setInt(5, billId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        System.out.println(getBillsIn(7));
    }
}
