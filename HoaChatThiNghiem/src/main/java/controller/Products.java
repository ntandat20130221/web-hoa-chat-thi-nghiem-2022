package controller;

import db.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "products", urlPatterns = "products")
public class Products extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
        Statement statement = DBConnect.getInstall().getStatement();
        try {
            ResultSet rs = statement.executeQuery("SELECT p.id_product, p.name_product, " +
                    "p.url_img_product, p.star_review, p.id_status_product, " +
                    "pp.listed_price, pp.current_price FROM products p " +
                    "JOIN price_product pp ON p.id_product = pp.id_product");

            while (rs.next()) {
//                String pId = rs.
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
