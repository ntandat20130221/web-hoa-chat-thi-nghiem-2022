package service;

import db.DbConnection;
import model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    public static Customer checkLogin(String email, String password){
        List<Customer> customers = new ArrayList<>();
        DbConnection connectDB = DbConnection.getInstall();
        String sql = "SELECT id_user_customer, username, pass, id_status_acc, id_city, fullname " +
                "from account_customer where username = ?";
        PreparedStatement preState = connectDB.getPreparedStatement(sql);
        try {
            preState.setString(1, email);
            ResultSet rs = preState.executeQuery();
            while(rs.next()){
                int id_customer = rs.getInt("id_user_customer");
                String email_customer = rs.getString("username");
                String password_customer = rs.getString("pass");
                int id_status_acc_customer = rs.getInt("id_status_acc");
                int id_city_customer = rs.getInt("id_city");
                String fullname_customer = rs.getString("fullname");
                Customer customer = new Customer(id_customer, email_customer, password_customer, id_status_acc_customer,
                        id_city_customer, fullname_customer);
                customers.add(customer);
            }
            if(customers.size() != 1){
                return null;
            }else{
                Customer unique = customers.get(0);
                if(unique.getPassword().equals(password)){
                    return unique;
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }finally {
            connectDB.unInstall();
        }
        return null;
    }

    public static boolean changePass(String newPass, String email){
        DbConnection connectDb = DbConnection.getInstall();
        String sql = "UPDATE account_customer " +
                "SET pass = ?, time_change_pass = current_timestamp()" +
                " WHERE username = ?";
        PreparedStatement preState = connectDb.getPreparedStatement(sql);
        try{
            preState.setString(1, newPass);
            preState.setString(2, email);
            int update = preState.executeUpdate();
            if (update > 0) {
                return true;
            }
        }catch (Exception e){
            throw new RuntimeException(e);
        }finally {
            connectDb.unInstall();
        }
        return false;
    }

    public static boolean checkExist(String email){
        DbConnection connectDb = DbConnection.getInstall();
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT id_user_customer, username, pass, id_status_acc, id_city, fullname " +
                "from account_customer where username = ?";
        PreparedStatement preState = connectDb.getPreparedStatement(sql);
        try{
            preState.setString(1, email);
            ResultSet rs = preState.executeQuery();
            while(rs.next()){
                int id_customer = rs.getInt("id_user_customer");
                String email_customer = rs.getString("username");
                String password_customer = rs.getString("pass");
                int id_status_acc_customer = rs.getInt("id_status_acc");
                int id_city_customer = rs.getInt("id_city");
                String fullname_customer = rs.getString("fullname");
                Customer customer = new Customer(id_customer, email_customer, password_customer, id_status_acc_customer,
                        id_city_customer, fullname_customer);
                customers.add(customer);
            }
            if(customers.size() == 0){
                return true;
            }
        }catch (Exception e){
            throw new RuntimeException();
        }finally {
            connectDb.unInstall();
        }
        return false;
    }

    public static void signUp(String email, String password){
        DbConnection connectDb = DbConnection.getInstall();
        String sql = "INSERT INTO account_customer(username, pass, id_status_acc, id_city) " +
                "VALUES(?, ?, 1, 1)";
        PreparedStatement preState = connectDb.getPreparedStatement(sql);
        try{
            preState.setString(1, email);
            preState.setString(2, password);
            preState.executeUpdate();
            System.out.println("success");
        }catch (Exception e){
            throw new RuntimeException();
        }finally {
            connectDb.unInstall();
        }
    }
    public static void main(String[] args) {
        System.out.println(checkLogin("nguyenphutai840@gmail.com", "123"));
        signUp("nguyenphutai@gmail.com", "123");
    }
}
