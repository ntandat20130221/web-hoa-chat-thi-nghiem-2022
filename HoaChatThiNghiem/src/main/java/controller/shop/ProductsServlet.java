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
import java.util.stream.Collectors;

@WebServlet(name = "products", urlPatterns = "/shop/products")
public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // categorizing
        String category = req.getParameter("type");
        List<Product> products = category != null ?
                ProductService.getProductsByType(Integer.parseInt(category)) :
                ProductService.getProducts();
        req.setAttribute("all_products", products);

        // filtering
        String minPrice = req.getParameter("minPrice"), maxPrice = req.getParameter("maxPrice");
        double min = minPrice != null ? Double.parseDouble(minPrice) : Double.MIN_VALUE;
        double max = maxPrice != null ? Double.parseDouble(maxPrice) : Double.MAX_VALUE;

        products = products.stream()
                .filter(product -> product.getNewPrice() >= min && product.getNewPrice() <= max)
                .collect(Collectors.toList());

        // sorting
        String param = req.getParameter("sortBy");
        if (param == null)
            products.sort(Comparator.comparing(Product::getName));
        else if (param.equals("price_up"))
            products.sort(Comparator.comparing(Product::getNewPrice));
        else if (param.equals("price_down"))
            products.sort((o1, o2) -> (int) (o2.getNewPrice() - o1.getNewPrice()));

        req.setAttribute("products", products);
        req.getRequestDispatcher("/shop/products.jsp").forward(req, resp);
    }
}
