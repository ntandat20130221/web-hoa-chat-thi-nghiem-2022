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

        String minPrice = req.getParameter("minPrice");
        String maxPrice = req.getParameter("maxPrice");
        double min = Double.MIN_VALUE, max = Double.MAX_VALUE;
        if (minPrice != null) {
            min = Double.parseDouble(minPrice);
        }

        if (maxPrice != null) {
            max = Double.parseDouble(maxPrice);
        }

        List<Product> filteredProducts = new ArrayList<>();
        for (Product product : products) {
            if (product.getNewPrice() >= min && product.getNewPrice() <= max) {
                filteredProducts.add(product);
            }
        }

        String param = req.getParameter("sort");
        if (param != null) {
            switch (param) {
                case "name":
                    filteredProducts.sort(Comparator.comparing(Product::getName));
                    break;
                case "price-up":
                    filteredProducts.sort(Comparator.comparing(Product::getNewPrice));
                    break;
                case "price-down":
                    filteredProducts.sort((o1, o2) -> (int) (o2.getNewPrice() - o1.getNewPrice()));
                    break;
            }
        } else {
            filteredProducts.sort(Comparator.comparing(Product::getName));
        }

        req.setAttribute("products", filteredProducts);
        req.getRequestDispatcher("products.jsp").forward(req, resp);
    }
}
