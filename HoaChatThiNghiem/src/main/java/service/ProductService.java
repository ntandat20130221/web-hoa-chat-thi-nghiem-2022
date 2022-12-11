package service;

import dao.ProductDAO;
import db.DbConnection;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductService {
    private static final String QUERY_PRODUCTS =
            "SELECT p.id_product, p.url_img_product, p.name_product, p.star_review, p.description_product, " +
                    "p.quantity_product, p.date_inserted, sp.name_status_product, tp.name_type_product, s.name_supplier, " +
                    "sp2.quantity_sold, p.views, pp.current_price, pp.listed_price " +
                    "FROM products p JOIN price_product pp ON p.id_product = pp.id_product " +
                    "JOIN status_product sp on p.id_status_product = sp.id_status_product " +
                    "JOIN type_product tp on p.id_type_product = tp.id_type_product " +
                    "JOIN suppliers s on p.id_supplier = s.id_supplier " +
                    "JOIN sold_product sp2 on p.id_product = sp2.id_product";

    private static final String QUERY_HOT_PRODUCT_ID =
            "SELECT id_product, SUM(quantity) quantities " +
                    "FROM bills b JOIN bill_detail bd ON b.id_bill = bd.id_bill " +
                    "WHERE DATE(time_order) > (NOW() - INTERVAL 7 DAY) " +
                    "GROUP BY id_product ORDER BY quantities DESC";

    private static final String QUERY_SELLING_PRODUCT_ID =
            "SELECT id_product, SUM(quantity) quantities " +
                    "FROM bills b JOIN bill_detail bd ON b.id_bill = bd.id_bill " +
                    "WHERE DATE(time_order) > (NOW() - INTERVAL 30 DAY) " +
                    "GROUP BY id_product ORDER BY quantities DESC";

    private static final String QUERY_NEW_PRODUCT_ID =
            "SELECT id_product FROM products p WHERE DATE(date_inserted) > (NOW() - INTERVAL 7 DAY)";

    private static final String QUERY_TODAY_DISCOUNT =
            "SELECT p.id_product " +
                    "FROM products p JOIN price_product pp on p.id_product = pp.id_product " +
                    "WHERE DATE(pp.date) = CURDATE()";

    public static List<Product> getProducts() {
        List<Product> products;
        try (Statement st = DbConnection.getInstall().getStatement()) {
            products = getProducts(st.executeQuery(QUERY_PRODUCTS));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public static Product getProductById(int id) {
        Product product;
        try (PreparedStatement ps = DbConnection.getInstall().getPreparedStatement(QUERY_PRODUCTS + " WHERE p.id_product=?")) {
            ps.setInt(1, id);
            product = getProducts(ps.executeQuery()).get(0);
        } catch (SQLException | IndexOutOfBoundsException e) {
            return null;
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
            String supply = rs.getString("name_supplier");
            int sold = rs.getInt("quantity_sold");
            Date date = rs.getDate("date_inserted");
            int views = rs.getInt("views");
            Product product = new Product(id, imgPath, name, stars, status, desc, quantity, type, supply, sold, date, views, oldPrice, newPrice);
            products.add(product);
        }
        return products;
    }

    public static List<Product> getHotProducts() {
        List<Product> products = new ArrayList<>();
        try (ResultSet rs = DbConnection.getInstall().getStatement().executeQuery(QUERY_HOT_PRODUCT_ID)) {
            while (rs.next()) {
                int id = rs.getInt("id_product");
                Product product = getProductById(id);
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public static List<Product> getSellingProducts() {
        List<Product> products = new ArrayList<>();
        try (ResultSet rs = DbConnection.getInstall().getStatement().executeQuery(QUERY_SELLING_PRODUCT_ID)) {
            while (rs.next()) {
                int id = rs.getInt("id_product");
                Product product = getProductById(id);
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public static List<Product> getNewProducts() {
        List<Product> products = new ArrayList<>();
        try (ResultSet rs = DbConnection.getInstall().getStatement().executeQuery(QUERY_NEW_PRODUCT_ID)) {
            while (rs.next()) {
                int id = rs.getInt("id_product");
                Product product = getProductById(id);
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public static List<Product> getTodayDiscountProducts() {
        List<Product> products = new ArrayList<>();
        try (ResultSet rs = DbConnection.getInstall().getStatement().executeQuery(QUERY_TODAY_DISCOUNT)) {
            while (rs.next()) {
                int id = rs.getInt("id_product");
                Product product = getProductById(id);
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
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
