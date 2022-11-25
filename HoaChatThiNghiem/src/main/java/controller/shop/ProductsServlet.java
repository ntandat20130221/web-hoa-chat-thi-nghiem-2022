package controller.shop;

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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = ProductService.getProducts();

        String minPrice = req.getParameter("minPrice");
        String maxPrice = req.getParameter("maxPrice");
        double min = Double.parseDouble(minPrice);
        double max = Double.parseDouble(maxPrice);

        String param = req.getParameter("sort");
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

        req.setAttribute("products", products);
        req.getRequestDispatcher("products.jsp").forward(req, resp);
    }
}
