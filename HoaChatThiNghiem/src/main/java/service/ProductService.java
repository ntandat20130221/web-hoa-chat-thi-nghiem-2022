package service;

import db.DBConnect;
import model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductService {

    public static List<Product> getProducts() {
        List<Product> products = new ArrayList<>();

        DBConnect db = DBConnect.getInstall();
        Statement st = db.getStatement();
        try {
            ResultSet rs = st.executeQuery("SELECT p.id_product, p.name_product, p.description_product, " +
                    "p.url_img_product, p.star_review, sp.name_status_product, p.quantity_product," +
                    "pp.listed_price, pp.current_price FROM products p " +
                    "JOIN price_product pp ON p.id_product = pp.id_product " +
                    "JOIN status_product sp on p.id_status_product = sp.id_status_product");

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
                Product product = new Product(id, imgPath, name, stars, status, desc, quantity, oldPrice, newPrice);
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public static Product getProductById(String idProduct) {
        Product product = null;
        Statement st = DBConnect.getInstall().getStatement();
        try {
            ResultSet rs = st.executeQuery("SELECT p.id_product, p.name_product, p.description_product, " +
                    "p.url_img_product, p.star_review, sp.name_status_product, p.quantity_product," +
                    "pp.listed_price, pp.current_price FROM products p " +
                    "JOIN price_product pp ON p.id_product = pp.id_product " +
                    "JOIN status_product sp on p.id_status_product = sp.id_status_product WHERE p.id_product=" + idProduct);
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
                product = new Product(id, imgPath, name, stars, status, desc, quantity, oldPrice, newPrice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }
}
