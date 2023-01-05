package service;

import database.DbConnection;
import database.dao.ProductDAO;
import model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public final class ProductService {
    private static final String QUERY_PRODUCTS =
            "SELECT p.id_product, p.url_img_product, p.name_product, p.star_review, p.description_product, p.quantity_product, p.date_inserted, " +
                    "sp.name_status_product, tp.name_type_product, st.name_subtype, s.name_supplier, IFNULL(sp2.quantity_sold, 0) quantity_sold, " +
                    "p.views, pp.current_price, pp.listed_price " +
                    "FROM products p JOIN price_product pp ON p.id_product = pp.id_product " +
                    "JOIN status_product sp ON p.id_status_product = sp.id_status_product " +
                    "JOIN subtype_product st ON p.id_subtype = st.id_subtype " +
                    "JOIN suppliers s ON p.id_supplier = s.id_supplier " +
                    "LEFT OUTER JOIN sold_product sp2 ON p.id_product = sp2.id_product " +
                    "JOIN type_product tp ON st.id_type_product = tp.id_type_product";

    private static final String QUERY_SELLING_BY_TIME_ORDER = QUERY_PRODUCTS +
            " WHERE p.id_product IN (SELECT id_product " +
            "FROM bills b JOIN bill_detail bd ON b.id_bill = bd.id_bill " +
            "WHERE DATE(time_order) > (NOW() - INTERVAL ? DAY) " +
            "GROUP BY id_product ORDER BY SUM(quantity) DESC)";

    private static final String QUERY_SELLING = QUERY_PRODUCTS +
            " WHERE p.id_product IN (SELECT id_product " +
            "FROM bills b JOIN bill_detail bd ON b.id_bill = bd.id_bill " +
            "GROUP BY id_product ORDER BY SUM(quantity) DESC)";

    private static final String QUERY_PRODUCTS_WHERE_DATE_INSERTED = QUERY_PRODUCTS +
            " WHERE DATE(p.date_inserted) > (NOW() - INTERVAL ? DAY) " +
            "ORDER BY DATE(p.date_inserted) DESC";

    private static final String QUERY_TODAY_DISCOUNT = QUERY_PRODUCTS +
            " WHERE p.id_product IN (SELECT p.id_product " +
            "FROM products p JOIN price_product pp on p.id_product = pp.id_product " +
            "WHERE DATE(pp.date) = CURDATE())";

    private static final String QUERY_TYPE_ID = "SELECT id_type_product FROM subtype_product WHERE id_subtype=?";

    private static final String QUERY_STAR_REVIEW = "SELECT COUNT(*) FROM review_product WHERE id_product=? AND stars=?";

    public static List<Product> queryProducts(String query, Object... params) {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement(query)) {
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
        return queryProducts(QUERY_SELLING_BY_TIME_ORDER, 7);
    }

    public static List<Product> getSellingProducts(boolean time) {
        if (time) return queryProducts(QUERY_SELLING_BY_TIME_ORDER, 30);
        else return queryProducts(QUERY_SELLING);
    }

    public static List<Product> getNewProducts() {
        return queryProducts(QUERY_PRODUCTS_WHERE_DATE_INSERTED, 30);
    }

    public static List<Product> getTodayDiscountProducts() {
        return queryProducts(QUERY_TODAY_DISCOUNT);
    }

    public static List<Product> getProhibitedProducts() {
        return queryProducts(QUERY_PRODUCTS + " WHERE sp.id_status_product = ?", 3);
    }

    public static List<Product> getOutOfStockProducts() {
        return queryProducts(QUERY_PRODUCTS + " WHERE p.quantity_product = ?", 0);
    }

    public static List<Product> searchProductsByName(String name) {
        return queryProducts(QUERY_PRODUCTS + " WHERE LOWER(p.name_product) LIKE LOWER(CONCAT('%',?,'%'))", name);
    }

    public static List<Product> getAddedProductIn(int month) {
        return queryProducts(QUERY_PRODUCTS + " WHERE MONTH(date_inserted) = ? AND YEAR(date_inserted) = YEAR(CURRENT_DATE)", month);
    }

    public static int getTotalSoldProducts() {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement("SELECT SUM(quantity_sold) FROM sold_product")) {
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static int getTotalSoldIn(int month) {
        try (PreparedStatement ps = DbConnection.getInstance().getPreparedStatement(
                "SELECT b.id_bill, SUM(bd.quantity) quantity " +
                        "FROM bills b JOIN bill_detail bd ON b.id_bill = bd.id_bill " +
                        "WHERE MONTH(time_order) = ? AND YEAR(time_order) = YEAR(CURRENT_DATE) " +
                        "GROUP BY b.id_bill")) {
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(2);
        } catch (SQLException e) {
            return 0;
        }
    }

    public static List<Product> getProductsByBillId(int id) {
        List<Product> products = new ArrayList<>();
        try (var ps = DbConnection.getInstance().getPreparedStatement("SELECT id_product FROM bill_detail WHERE id_bill = ?")) {
            ps.setInt(1, id);
            var rs = ps.executeQuery();
            while (rs.next()) {
                products.add(getProductById(rs.getInt(1)));
            }
        } catch (SQLException e) {
            return new ArrayList<>();
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
            ProductReview review = getReviewByProductId(id);
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
            Product product = new Product(id, imgPath, name, review, status, desc, quantity, type, subtype, supply, sold, date, views, oldPrice, newPrice);
            products.add(product);
        }
        return products;
    }

    public static int getTypeBySubtypeId(int subtypeId) {
        try (var ps = DbConnection.getInstance().getPreparedStatement(QUERY_TYPE_ID)) {
            ps.setInt(1, subtypeId);
            var rs = ps.executeQuery();
            rs.next();
            return rs.getInt("id_type_product");
        } catch (SQLException e) {
            return -1;
        }
    }

    public static Map<Integer, String> getSubtypesByType(int type) {
        Map<Integer, String> map = new HashMap<>();
        String query = "SELECT id_subtype, name_subtype FROM subtype_product WHERE id_type_product=?";
        try (var ps = DbConnection.getInstance().getPreparedStatement(query)) {
            ps.setInt(1, type);
            var rs = ps.executeQuery();
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
        try (var ps = DbConnection.getInstance().getPreparedStatement("SELECT id_type_product, name_type_product FROM type_product")) {
            var rs = ps.executeQuery();
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
        try (var ps = DbConnection.getInstance().getPreparedStatement("SELECT name_type_product FROM type_product WHERE id_type_product=?")) {
            ps.setInt(1, typeId);
            var rs = ps.executeQuery();
            rs.next();
            return rs.getString("name_type_product");
        } catch (SQLException e) {
            return null;
        }
    }

    public static Map<Integer, String> getSuppliers() {
        Map<Integer, String> map = new HashMap<>();
        try (var ps = DbConnection.getInstance().getPreparedStatement("SELECT id_supplier, name_supplier FROM suppliers")) {
            var rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id_supplier");
                String name = rs.getString("name_supplier");
                map.put(id, name);
            }
        } catch (SQLException e) {
            return new HashMap<>();
        }
        return map;
    }

    public static ProductReview getReviewByProductId(int id) {
        var pr = new ProductReview();
        pr.setProductId(id);

        int[] stars = new int[5];
        try (var ps = DbConnection.getInstance().getPreparedStatement(QUERY_STAR_REVIEW)) {
            for (int i = 0; i < 5; i++) {
                ps.setInt(1, id);
                ps.setInt(2, i + 1);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    stars[i] = rs.getInt(1);
                }
            }

            pr.setOneStars(stars[0]);
            pr.setTwoStars(stars[1]);
            pr.setThreeStars(stars[2]);
            pr.setFourStars(stars[3]);
            pr.setFiveStars(stars[4]);
            pr.setTotals(Arrays.stream(stars).sum());
        } catch (SQLException e) {
            return pr;
        }
        return pr;
    }

    public static boolean addNewProduct(Product p, Admin admin) {
        /*
        b1: thêm tên,mô tả,hình ảnh,số lượng,mã loại,mã trạng thái,mã nhà cung cấp, tên admin vào bảng products

        b2: lấy id của sản phẩm vừa được thêm vào bảng products dựa trên tên,mô tả,hình ảnh,số lượng,mã loại,mã trạng thái,mã nhà cung cấp

        b3: thêm giá niêm yết và giá bán thực tế của sản phẩm vào bảng price_product dựa trên id

        Author : Minh Tuyên
         */

        DbConnection connectDB = DbConnection.getInstance();
        ProductDAO dao = new ProductDAO();
        boolean checkInsertProduct = dao.insertProduct(connectDB, p, admin.getUsername()); // b1
        if (checkInsertProduct) {

            int idProduct = dao.getIdProduct(connectDB, p); // b2
            p.setIdProduct(idProduct);
            @SuppressWarnings("unused")
            boolean checkInsertPrice = dao.insertPriceProduct(connectDB, p, admin.getUsername()); //b3

            // do nothing
            return true;

        }
        connectDB.close();
        return false;
    }

    public static List<Object> getSubTypeAndStatusAndSupplierForProduct() {
        DbConnection connectDB = DbConnection.getInstance();
        ProductDAO dao = new ProductDAO();
        List<Object> result = new ArrayList<>();

        List<SubTypeProduct> subtypeProducts = dao.getSubTypeProducts(connectDB);
        List<StatusProduct> statusProducts = dao.getStatusProducts(connectDB);
        List<Supplier> suppliers = dao.getSuppliers(connectDB);

        result.add(subtypeProducts);
        result.add(statusProducts);
        result.add(suppliers);

        connectDB.close();
        return result;
         /*
        Author : Minh Tuyên
         */
    }

    public static List<Product> getAllProducts() {
        DbConnection connectDB = DbConnection.getInstance();
        ProductDAO dao = new ProductDAO();
        try {
            return dao.getAllProducts(connectDB);
        } finally {
            connectDB.close();
        }
         /*
        Author : Minh Tuyên
         */
    }

    public static boolean deleteProductById(int id) {

        DbConnection connectDB = DbConnection.getInstance();
        ProductDAO dao = new ProductDAO();
        try {
            connectDB.getConn().setAutoCommit(false);
            boolean checkDelete1 = dao.deleteProductByIdOnTable_price_product(connectDB, id);
            boolean checkDelete2 = dao.deleteProductByIdOnTable_sold_product(connectDB, id);
            boolean checkDelete3 = dao.deleteProductByIdOnTable_review_product(connectDB, id);
            boolean checkDelete4 = dao.deleteProductByIdOnTable_products(connectDB, id);
            if (checkDelete1 && checkDelete2 && checkDelete3 && checkDelete4) {
                connectDB.getConn().commit();                           // kết thúc giao tác
                return true;
            }
        } catch (SQLException e) {
            try {
                System.out.println("rollback: " + id);
                connectDB.getConn().rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        } finally {
            try {
                connectDB.getConn().setAutoCommit(true);
                connectDB.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
        /*
        Author : Minh Tuyên
         */
    }

    public static boolean updateProductById(Product p, Admin admin) {
        DbConnection connectDB = DbConnection.getInstance();
        ProductDAO dao = new ProductDAO();
        try {
            connectDB.getConn().setAutoCommit(false);
            boolean update1 = dao.AdminUpdateProductOnTable_products(connectDB, p, admin.getUsername());
            boolean update2 = dao.AdminInsertPriceProductOnTable_price_product(connectDB, p, admin.getUsername());
            if (update1 && update2) {
                connectDB.getConn().commit();                    // kết thúc giao tác
                return true;
            }
        } catch (SQLException e) {
            try {
                System.out.println("rollback");
                connectDB.getConn().rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        } finally {
            try {
                connectDB.getConn().setAutoCommit(true);
                connectDB.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return false;
         /*
        Author : Minh Tuyên
         */
    }


    public static void main(String[] args) {
        System.out.println(getProducts().size());
    }
}
