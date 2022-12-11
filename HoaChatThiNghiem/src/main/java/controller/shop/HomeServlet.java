package controller.shop;

import model.Product;
import service.ProductService;
import utils.DateUtil;
import utils.PriceUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "HomeServlet", value = "/shop/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> newProducts = ProductService.getNewProducts();
        req.setAttribute("new_products", newProducts);

        List<Product> typicalProducts = ProductService.getProducts().stream()
                .sorted((p1, p2) -> p2.getSold() - p1.getSold())
                .collect(Collectors.toList());
        req.setAttribute("typical_products", typicalProducts);

        List<Product> discountProducts = ProductService.getProducts().stream()
                .filter(p -> p.getOldPrice() != p.getNewPrice())
                .sorted((p1, p2) -> PriceUtil.percentDiscount(p2.getOldPrice(), p2.getNewPrice()) -
                        PriceUtil.percentDiscount(p1.getOldPrice(), p1.getNewPrice()))
                .collect(Collectors.toList());
        req.setAttribute("discount_products", discountProducts);

        List<Product> sellingProducts = ProductService.getSellingProducts().stream()
                .sorted((p1, p2) -> p2.getViews() - p1.getViews())
                .collect(Collectors.toList());
        req.setAttribute("selling_products", sellingProducts);

        List<Product> viewProducts = ProductService.getProducts().stream()
                .sorted((p1, p2) -> p2.getViews() - p1.getViews())
                .collect(Collectors.toList());
        req.setAttribute("view_products", viewProducts);

        Product todayDiscountProduct = null;
        try {
            todayDiscountProduct = ProductService.getTodayDiscountProducts().stream()
                    .sorted((p1, p2) -> PriceUtil.percentDiscount(p2.getOldPrice(), p2.getNewPrice()) -
                            PriceUtil.percentDiscount(p1.getOldPrice(), p1.getNewPrice()))
                    .collect(Collectors.toList()).get(0);
        } catch (IndexOutOfBoundsException | NullPointerException e) {
        }
        req.setAttribute("today_discount_product", todayDiscountProduct);

        getServletContext().getRequestDispatcher("/shop/home.jsp").forward(req, resp);
    }
}
