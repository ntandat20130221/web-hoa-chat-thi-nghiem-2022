package controller;

import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "products", urlPatterns = "/shop/products")
public class ProductsServlet extends HttpServlet {
    public static final String ATTR_PRODUCTS = "products";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = ProductService.getProducts();
        req.setAttribute(ATTR_PRODUCTS, products);
        req.getRequestDispatcher("products.jsp").forward(req, resp);
    }
}
