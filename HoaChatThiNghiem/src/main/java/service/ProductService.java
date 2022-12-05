package service;

import dao.ProductDAO;
import db.DbConnection;
import model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private static final String QUERY_PRODUCTS = "SELECT p.id_product, p.name_product, p.description_product, " +
            "p.url_img_product, p.star_review, sp.name_status_product, p.quantity_product," +
            "pp.listed_price, pp.current_price, tp.name_type_product FROM products p " +
            "JOIN price_product pp ON p.id_product = pp.id_product " +
            "JOIN status_product sp on p.id_status_product = sp.id_status_product " +
            "JOIN type_product tp on p.id_type_product = tp.id_type_product";

    public static List<Product> getProducts() {
        List<Product> products;
        try (Statement st = DbConnection.getInstall().getStatement()) {
            products = getProducts(st.executeQuery(QUERY_PRODUCTS));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public static Product getProductById(String id) {
        Product product;
        try (PreparedStatement ps = DbConnection.getInstall().getPreparedStatement(QUERY_PRODUCTS + " WHERE p.id_product=?")) {
            ps.setString(1, id);
            product = getProducts(ps.executeQuery()).get(0);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    public static List<Product> getProductsByType(int typeId) {
        List<Product> products;
        try (PreparedStatement ps = DbConnection.getInstall().getPreparedStatement(QUERY_PRODUCTS + " WHERE p.id_type_product=?")) {
            ps.setInt(1, typeId);
            products = getProducts(ps.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return products;
    }

    private static List<Product> getProducts(ResultSet rs) throws SQLException {
        List<Product> products = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("id_product");
            String name = rs.getString("name_product");
            String desc = rs.getString("description_product");
            String imgPath = rs.getString("url_img_product");
            int stars = rs.getInt("star_review");
            String status = rs.getString("name_status_product");
            int quantity = rs.getInt("quantity_product");
            double oldPrice = rs.getInt("listed_price");
            double newPrice = rs.getInt("current_price");
            String type = rs.getString("name_type_product");
            Product product = new Product(id, imgPath, name, stars, status, desc, quantity, type, oldPrice, newPrice);
            products.add(product);
        }
        return products;
    }

    public static boolean addNewProduct(Product p, Admin admin) {
        /*
        b1: thêm tên,mô tả,hình ảnh,số lượng,mã loại,mã trạng thái,mã nhà cung cấp, tên admin vào bảng products

        b2: lấy id của sản phẩm vừa được thêm vào bảng products dựa trên tên,mô tả,hình ảnh,số lượng,mã loại,mã trạng thái,mã nhà cung cấp

        b3: thêm giá niêm yết và giá bán thực tế của sản phẩm vào bảng price_product dựa trên id

        Author : Minh Tuyên
         */

        DbConnection connectDB = DbConnection.getInstall();
        ProductDAO dao = new ProductDAO();
        boolean checkInsertProduct = dao.insertProduct(connectDB, p, admin.getUsername()); // b1
        if (checkInsertProduct == true) {

            int idProduct = dao.getIdProduct(connectDB, p); // b2
            p.setIdProduct(idProduct);
            boolean checkInsertPrice = dao.insertPriceProduct(connectDB, p, admin.getUsername()); //b3

            if (checkInsertPrice == true) {
                // do nothing
            }
            return true;

        }
        connectDB.unInstall();
        return false;
    }

    public static List<Object> getTypeAndStatusAndSupplierForProduct() {
        DbConnection connectDB = DbConnection.getInstall();
        ProductDAO dao = new ProductDAO();
        List<Object> result = new ArrayList<>();

        List<TypeProduct> typeProducts = dao.getTypeProducts(connectDB);
        List<StatusProduct> statusProducts = dao.getStatusProducts(connectDB);
        List<Supplier> suppliers = dao.getSuppliers(connectDB);

        result.add(typeProducts);
        result.add(statusProducts);
        result.add(suppliers);

        connectDB.unInstall();
        return result;

    }


}
