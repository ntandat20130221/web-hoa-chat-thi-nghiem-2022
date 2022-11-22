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
            ResultSet rs = st.executeQuery("SELECT p.id_product, p.name_product, " +
                    "p.url_img_product, p.star_review, sp.name_status_product, " +
                    "pp.listed_price, pp.current_price FROM products p " +
                    "JOIN price_product pp ON p.id_product = pp.id_product " +
                    "JOIN status_product sp on p.id_status_product = sp.id_status_product");

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String imgPath = rs.getString(3);
                int stars = rs.getInt(4);
                String status = rs.getString(5);
                double oldPrice = rs.getInt(6);
                double newPrice = rs.getInt(7);
                Product product = new Product(id, imgPath, name, stars, status, oldPrice, newPrice);
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }
}
