package dao;

import db.DbConnection;
import model.Product;
import model.StatusProduct;
import model.Supplier;
import model.TypeProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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

    public void updateProduct(Product newProduct) {
        String query = "SELECT * FROM products WHERE id_product=" + newProduct.getIdProduct();
        Statement st = DbConnection.getInstall().getUpdatableStatement();
        try {
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                int id = rs.getInt("id_product");
                if (id == newProduct.getIdProduct()) {
                    rs.updateInt("views", newProduct.getViews());
                    rs.updateRow();
                    break;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
        String sql = "SELECT id_product FROM products" +
                " WHERE name_product=? AND description_product= ? AND url_img_product= ? AND quantity_product= ?" +
                " AND id_type_product=? AND id_status_product= ? AND id_supplier= ?";
        PreparedStatement preStatement = connectDB.getPreparedStatement(sql);
        try {
            preStatement.setString(1,p.getName());
            preStatement.setString(2, p.getDesc());
            preStatement.setString(3, p.getImgPath());
            preStatement.setInt(4, p.getQuantity());
            preStatement.setInt(5, p.getType_product());
            preStatement.setInt(6, p.getStatus_product());
            preStatement.setInt(7, p.getSupplier());
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

    public List<TypeProduct> getTypeProducts(DbConnection connectDB) {
        List<TypeProduct> result = new ArrayList<>();
        String sql = "select id_type_product,name_type_product from type_product";
        Statement statement = connectDB.getStatement();
        try {
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                int id_type = rs.getInt("id_type_product");
                String name_type = rs.getString("name_type_product");
                TypeProduct tp = new TypeProduct(id_type, name_type);
                result.add(tp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public List<Supplier> getSuppliers(DbConnection connectDB) {
        List<Supplier> result = new ArrayList<>();
        String sql = "select id_supplier,name_supplier from suppliers";
        Statement statement = connectDB.getStatement();
        try {
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                int id_supplier = rs.getInt("id_supplier");
                String name_supplier = rs.getString("name_supplier");
                Supplier spl = new Supplier(id_supplier, name_supplier);
                result.add(spl);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public List<StatusProduct> getStatusProducts(DbConnection connectDB) {
        List<StatusProduct> result = new ArrayList<>();
        String sql = "select id_status_product,name_status_product from status_product";
        Statement statement = connectDB.getStatement();
        try {
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                int id_status = rs.getInt("id_status_product");
                String name_status = rs.getString("name_status_product");
                StatusProduct stp = new StatusProduct(id_status, name_status);
                result.add(stp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

}
