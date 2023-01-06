package service;

import database.DbConnection;
import database.dao.AdminDAO;
import model.Admin;
import model.RoleAdmin;
import model.StatusAcc;

import java.util.ArrayList;
import java.util.List;

public class AdminService_MT {

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
}
