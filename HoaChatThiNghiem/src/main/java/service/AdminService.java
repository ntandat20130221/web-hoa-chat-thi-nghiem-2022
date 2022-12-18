package service;

import database.DbConnection;
import model.Admin;
import model.Bill;
import model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT COUNT(*) FROM bills " +
                "WHERE MONTH(time_order) = ? AND YEAR(time_order) = YEAR(CURRENT_DATE)")) {
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            return 0;
        }
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
            ps.setInt(1, 4);
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
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT * FROM bills b " +
                "JOIN status_bill s ON b.id_status_bill = s.id_status_bill " +
                "WHERE DATE(time_order) > (NOW() - INTERVAL ? DAY) ORDER BY time_order DESC LIMIT 0,4")) {
            ps.setInt(1, 4);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id_bill");
                String status = rs.getString("name_status_bill");
                String customerName = rs.getString("fullname_customer");
                double totalPrice = rs.getDouble("total_price");
                Bill bill = new Bill(id, status, customerName, totalPrice);
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

    public static void main(String[] args) {
        System.out.println(getTotalCustomerIn(7));
    }
}
