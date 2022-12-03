package dao;

import db.DbConnection;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO {

    public ProductDAO() {
    }

    public boolean insertProduct(DbConnection connectDB, Product p, String nameAdmin) {
        String sql = "insert into products (name_product,description_product,url_img_product,quantity_product" +
                ",id_type_product,id_status_product,id_supplier,nameAdmin) " +
                "values(?,?,?,?,?,?,?,?)";
        PreparedStatement preStatement = connectDB.getPreparedStatement(sql);
        try {
            preStatement.setString(1, p.getName());
            preStatement.setString(2, p.getDesc());
            preStatement.setString(3, p.getImgPath());
            preStatement.setInt(4, p.getQuantity());
            preStatement.setInt(5, p.getType_product());
            preStatement.setInt(6, p.getStatus_product());
            preStatement.setInt(7, p.getSupplier());
            preStatement.setString(8, nameAdmin);
            int rowInserted = preStatement.executeUpdate();
            if (rowInserted > 0) return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;

        /*
        Author : Minh Tuyên
         */
    }

    public boolean insertPriceProduct(DbConnection connectDB, Product p, String nameAdmin) {
        String sql = "insert into price_product (id_product,listed_price,current_price,nameAdmin) values(?,?,?,?)";
        PreparedStatement preStatement = connectDB.getPreparedStatement(sql);
        try {
            preStatement.setInt(1, p.getIdProduct());
            preStatement.setInt(2, p.getListed_price());
            preStatement.setInt(3, p.getCurrent_price());
            preStatement.setString(4, nameAdmin);
            int rowInserted = preStatement.executeUpdate();
            if (rowInserted > 0) return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;

        /*
        Author : Minh Tuyên
         */

    }

    public int getIdProduct(DbConnection connectDB, Product p) {
        String sql = "select id_product from products where name_product=? and url_img_product=? "
                + "and id_type_product=? and id_status_product=? and id_supplier=?";
        try {
            PreparedStatement preStatement = connectDB.getPreparedStatement(sql);
            preStatement.setString(1, p.getName());
            preStatement.setString(2, p.getImgPath());
            preStatement.setInt(3, p.getType_product());
            preStatement.setInt(4, p.getStatus_product());
            preStatement.setInt(5, p.getStatus_product());
            ResultSet rs = preStatement.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
        /*
        Author : Minh Tuyên
         */
    }

}
