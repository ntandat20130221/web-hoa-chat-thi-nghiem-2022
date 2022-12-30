package controller.shop.cart;

import model.Cart;
import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "add_to_cart", urlPatterns = "/shop/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("product_id");
        if (productId != null) {
            Product product = ProductService.getProductById(Integer.parseInt(productId));

            Cart cart = (Cart) req.getSession().getAttribute("cart");
            if (cart == null) cart = new Cart();

            String action = req.getParameter("action");
            if (action != null) {
                switch (action) {
                    case "add":
                        String quantity = req.getParameter("quantity");
                        int qnt = quantity == null ? 1 : Integer.parseInt(quantity);
                        cart.addProduct(product, qnt);
                        break;
                    case "remove":
                        cart.removeProduct(product);
                        break;
                    case "delete":
                        cart.deleteProduct(product);
                        break;
                }
            } else
                cart.addProduct(product, 1);

            req.getSession().setAttribute("cart", cart);
            resp.sendRedirect(req.getHeader("referer"));
        }
    }
}
