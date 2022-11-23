package controller;

import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "details", urlPatterns = "/shop/product-details")
public class ProductDetailServlet extends HttpServlet {
    public static final String PARAM_ID = "product_id";
    public static final String ATTR_DETAILS = "product_details";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter(PARAM_ID);
        if (id != null) {
            Product product = ProductService.getProductById(id);
            if (product != null) {
                req.setAttribute(ATTR_DETAILS, product);
                req.getRequestDispatcher("product-details.jsp").forward(req, resp);
            }
        }
    }
}
