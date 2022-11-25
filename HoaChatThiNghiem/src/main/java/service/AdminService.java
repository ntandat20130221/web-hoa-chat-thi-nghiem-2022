package service;

import db.DbConnection;
import model.Admin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminService {


    public static boolean updatePassword(String username, String new_pass) {

        DBConnect connectDB = DBConnect.getInstall();
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
            connectDB.unInstall();
        }

        return false;
    }

    public static Admin checkLogin(String username, String passAD) {
        List<Admin> admins = new ArrayList<>();
        DbConnection connectDB = DbConnection.getInstall();
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
            connectDB.unInstall();
        }
        return null;
    }

//    public static void main(String[] args) {
//
//        System.out.println(AdminService.checkLogin("tuyen","20130459"));
//        System.out.println(AdminService.updatePassword("tuyen","20130459"));
//    }

}
