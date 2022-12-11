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
//        String categoryType = req.getParameter("category_type");
//        if (categoryType != null) {
//            req.setAttribute("category_type", categoryType);
//        }

        // categorizing
        String category = req.getParameter("type");
        List<Product> products = category != null ?
                ProductService.getProductsByType(Integer.parseInt(category)) :
                ProductService.getProducts();

        setPriceRange(req, products);

        // filtering
        String minPrice = req.getParameter("minPrice"), maxPrice = req.getParameter("maxPrice");
        double min = minPrice != null ? Double.parseDouble(minPrice) : Double.MIN_VALUE;
        double max = maxPrice != null ? Double.parseDouble(maxPrice) : Double.MAX_VALUE;

        products = products.stream()
                .filter(product -> product.getNewPrice() >= min && product.getNewPrice() <= max)
                .collect(Collectors.toList());

        // sorting
        String param = req.getParameter("sortBy");
        if (param == null || param.equals("name"))
            products.sort(Comparator.comparing(Product::getName));
        else if (param.equals("price_up"))
            products.sort(Comparator.comparing(Product::getNewPrice));
        else if (param.equals("price_down"))
            products.sort((o1, o2) -> (int) (o2.getNewPrice() - o1.getNewPrice()));

        req.setAttribute("products", products);

        List<Product> hotProducts = ProductService.getHotProducts();
        req.setAttribute("hot_products", hotProducts);

        List<Product> newProducts = ProductService.getNewProducts();
        req.setAttribute("new_products", newProducts);

        req.getRequestDispatcher("/shop/products.jsp").forward(req, resp);
    }

    private void setPriceRange(HttpServletRequest req, List<Product> products) {
        int r1 = 0, r2 = 0, r3 = 0;
        for (Product product : products) {
            if (product.getNewPrice() >= 200000 && product.getNewPrice() < 500000) r1++;
            if (product.getNewPrice() >= 500000 && product.getNewPrice() < 1000000) r2++;
            if (product.getNewPrice() >= 1000000 && product.getNewPrice() < 2500000) r3++;
        }
        req.setAttribute("r1", r1);
        req.setAttribute("r2", r2);
        req.setAttribute("r3", r3);
    }
}
