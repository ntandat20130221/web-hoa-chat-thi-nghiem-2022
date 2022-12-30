package controller.shop;

import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "products", urlPatterns = "/shop/products")
public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = ProductService.getProducts();

        // categorizing
        String category = req.getParameter("category");
        List<Product> categoryProducts = new ArrayList<>();
        if (category != null) {
            if (!category.isEmpty()) {
                for (Product p : products) {
                    if (p.getType().equals(category)) {
                        categoryProducts.add(p);
                    }
                }
            }
        }

        // filtering
        String minPrice = req.getParameter("minPrice"), maxPrice = req.getParameter("maxPrice");
        double min = Double.MIN_VALUE, max = Double.MAX_VALUE;
        if (minPrice != null) {
            if (!minPrice.isEmpty()) {
                min = Double.parseDouble(minPrice);
            }
        }
        if (maxPrice != null) {
            if (!maxPrice.isEmpty()) {
                max = Double.parseDouble(maxPrice);
            }
        }

        List<Product> nextProduct;
        if (categoryProducts.size() > 0) {
            nextProduct = categoryProducts;
        } else {
            nextProduct = products;
        }
        List<Product> filteredProducts = new ArrayList<>();
        for (Product product : nextProduct) {
            if (product.getNewPrice() >= min && product.getNewPrice() <= max) {
                filteredProducts.add(product);
            }
        }

        // sorting
        String param = req.getParameter("sort");
        switch (param == null ? "" : param) {
            case "price_up":
                filteredProducts.sort(Comparator.comparing(Product::getNewPrice));
                break;
            case "price_down":
                filteredProducts.sort((o1, o2) -> (int) (o2.getNewPrice() - o1.getNewPrice()));
                break;
            default:
                filteredProducts.sort(Comparator.comparing(Product::getName));
        }


        req.setAttribute("products", filteredProducts);
        req.getRequestDispatcher("/shop/products.jsp").forward(req, resp);
    }
}
