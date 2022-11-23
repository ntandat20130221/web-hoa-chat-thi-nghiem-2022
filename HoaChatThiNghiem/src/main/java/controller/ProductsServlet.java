package controller;

import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "products", urlPatterns = "/shop/products")
public class ProductsServlet extends HttpServlet {
    public static final String ATTR_PRODUCTS = "products";
    public static final String PARAM_SORT = "sort";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = ProductService.getProducts();

        String param = req.getParameter(PARAM_SORT);
        if (param != null) {
            switch (param) {
                case "name":
                    products.sort(Comparator.comparing(Product::getName));
                    break;
                case "price-up":
                    products.sort(Comparator.comparing(Product::getNewPrice));
                    break;
                case "price-down":
                    products.sort((o1, o2) -> (int) (o2.getNewPrice() - o1.getNewPrice()));
                    break;
            }
        } else {
            products.sort(Comparator.comparing(Product::getName));
        }

        req.setAttribute(ATTR_PRODUCTS, products);
        req.getRequestDispatcher("products.jsp").forward(req, resp);
    }
}
