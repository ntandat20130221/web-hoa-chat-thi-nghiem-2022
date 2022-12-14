package service;

import dao.ProductDAO;
import db.DbConnection;
import model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ProductService {
    private static final String QUERY_PRODUCTS =
            "SELECT p.id_product, p.url_img_product, p.name_product, p.star_review, p.description_product, " +
                    "p.quantity_product, p.date_inserted, sp.name_status_product, tp.name_type_product, st.name_subtype, " +
                    "s.name_supplier, sp2.quantity_sold, p.views, pp.current_price, pp.listed_price " +
                    "FROM products p JOIN price_product pp ON p.id_product = pp.id_product " +
                    "JOIN status_product sp ON p.id_status_product = sp.id_status_product " +
                    "JOIN subtype_product st ON p.id_subtype = st.id_subtype " +
                    "JOIN suppliers s ON p.id_supplier = s.id_supplier " +
                    "JOIN sold_product sp2 ON p.id_product = sp2.id_product " +
                    "JOIN type_product tp ON st.id_type_product = tp.id_type_product";

    private static final String QUERY_PRODUCTS_WHERE_TIME_ORDER =
            QUERY_PRODUCTS + " WHERE p.id_product IN (SELECT id_product " +
                    "FROM bills b JOIN bill_detail bd ON b.id_bill = bd.id_bill " +
                    "WHERE DATE(time_order) > (NOW() - INTERVAL ? DAY) " +
                    "GROUP BY id_product ORDER BY SUM(quantity) DESC)";

    private static final String QUERY_PRODUCTS_WHERE_DATE_INSERTED =
            QUERY_PRODUCTS + " WHERE DATE(p.date_inserted) > (NOW() - INTERVAL ? DAY) " +
                    "ORDER BY DATE(p.date_inserted) DESC";

    private static final String QUERY_TODAY_DISCOUNT =
            QUERY_PRODUCTS + " WHERE p.id_product IN (SELECT p.id_product " +
                    "FROM products p JOIN price_product pp on p.id_product = pp.id_product " +
                    "WHERE DATE(pp.date) = CURDATE())";

    private static final String QUERY_TYPE_ID = "SELECT id_type_product FROM subtype_product WHERE id_subtype=?";

    public static List<Product> queryProducts(String query, Object... params) {
        try (PreparedStatement ps = DbConnection.getInstall().getPreparedStatement(query)) {
            for (int i = 0; i < params.length; i++)
                ps.setObject(i + 1, params[i]);
            return getProducts(ps.executeQuery());
        } catch (SQLException e) {
            return new ArrayList<>();
        }
    }

    public static List<Product> getProducts() {
        return queryProducts(QUERY_PRODUCTS);
    }

    public static Product getProductById(int id) {
        return queryProducts(QUERY_PRODUCTS + " WHERE p.id_product=?", id).get(0);
    }

    public static List<Product> getProductsByType(int type) {
        return queryProducts(QUERY_PRODUCTS + " WHERE tp.id_type_product=?", type);
    }

    public static List<Product> getProductsBySubtype(int subtypeId) {
        return queryProducts(QUERY_PRODUCTS + " WHERE st.id_subtype=?", subtypeId);
    }

    public static List<Product> getHotProducts() {
        return queryProducts(QUERY_PRODUCTS_WHERE_TIME_ORDER, 7);
    }

    public static List<Product> getSellingProducts() {
        return queryProducts(QUERY_PRODUCTS_WHERE_TIME_ORDER, 30);
    }

    public static List<Product> getNewProducts() {
        return queryProducts(QUERY_PRODUCTS_WHERE_DATE_INSERTED, 7);
    }

    public static List<Product> getTodayDiscountProducts() {
        return queryProducts(QUERY_TODAY_DISCOUNT);
    }

    public static List<Product> searchProductsByName(String name) {
        return queryProducts(QUERY_PRODUCTS + " WHERE LOWER(p.name_product) LIKE LOWER(CONCAT('%',?,'%'))", name);
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
            String subtype = rs.getString("name_subtype");
            String supply = rs.getString("name_supplier");
            int sold = rs.getInt("quantity_sold");
            Date date = rs.getDate("date_inserted");
            int views = rs.getInt("views");
            Product product = new Product(id, imgPath, name, stars, status, desc, quantity, type, subtype,
                    supply, sold, date, views, oldPrice, newPrice);
            products.add(product);
        }
        return products;
    }

    public static int getTypeBySubtypeId(int subtypeId) {
        try (PreparedStatement ps = DbConnection.getInstall().getPreparedStatement(QUERY_TYPE_ID)) {
            ps.setInt(1, subtypeId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt("id_type_product");
        } catch (SQLException e) {
            return -1;
        }
    }

    public static Map<Integer, String> getSubtypesByType(int type) {
        Map<Integer, String> map = new HashMap<>();
        String query = "SELECT id_subtype, name_subtype FROM subtype_product WHERE id_type_product=?";
        try (PreparedStatement ps = DbConnection.getInstall().getPreparedStatement(query)) {
            ps.setInt(1, type);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id_subtype");
                String name = rs.getString("name_subtype");
                map.put(id, name);
            }
        } catch (SQLException e) {
            return new HashMap<>();
        }
        return map;
    }

    public static Map<Integer, String> getTypes() {
        Map<Integer, String> map = new HashMap<>();
        String query = "SELECT id_type_product, name_type_product FROM type_product";
        try (PreparedStatement ps = DbConnection.getInstall().getPreparedStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id_type_product");
                String name = rs.getString("name_type_product");
                map.put(id, name);
            }
        } catch (SQLException e) {
            return new HashMap<>();
        }
        return map;
    }

    public static String getTypeName(int typeId) {
        try (PreparedStatement ps = DbConnection
                .getInstall()
                .getPreparedStatement("SELECT name_type_product FROM type_product WHERE id_type_product=?")) {
            ps.setInt(1, typeId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getString("name_type_product");
        } catch (SQLException e) {
            return null;
        }
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
        if (checkInsertProduct) {

            int idProduct = dao.getIdProduct(connectDB, p); // b2
            p.setIdProduct(idProduct);
            boolean checkInsertPrice = dao.insertPriceProduct(connectDB, p, admin.getUsername()); //b3

            if (checkInsertPrice) {
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
