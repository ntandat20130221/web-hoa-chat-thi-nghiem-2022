package controller.admin;

import model.*;
import service.ProductService;
import utils.CommonString;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

@WebServlet(name = "AdminAddProduct", value = "/admin/them-san-pham")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class AdminAddProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Object> results = ProductService.getTypeAndStatusAndSupplierForProduct();
        List<TypeProduct> typeProducts = (List<TypeProduct>) results.get(0);
        List<StatusProduct> statusProducts = (List<StatusProduct>) results.get(1);
        List<Supplier> suppliers = (List<Supplier>) results.get(2);

        request.setAttribute("ds-loai-san-pham", typeProducts);
        request.setAttribute("ds-trang-thai-san-pham", statusProducts);
        request.setAttribute("ds-nha-cung-cap", suppliers);

        request.getRequestDispatcher("/admin/form-add-product.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /*   Receive file upload to the Servlet from the HTML5 form  */
        Part part = request.getPart("AnhSP");
        String url_img_in_database = null;
        try {

            String realPath = request.getServletContext().getRealPath("/DATA");   //  absolute => A:\apache-tomcat-9.0.68\webapps\HoaChatThiNghiem_war\DATA
            String fileNameUpload = part.getSubmittedFileName();
            Path path = Path.of(realPath);
            if (!Files.exists(path)) Files.createDirectory(path);

            String path_of_file_upload = realPath + "/" + fileNameUpload;
            part.write(path_of_file_upload); // --> ghi file ảnh vào đường dẫn tuyệt đối trên máy chủ

            url_img_in_database = CommonString.URL_STORE_DATA + fileNameUpload;

        } catch (IOException io) {

            url_img_in_database = ""; // --> đường dẫn lưu trên database để rỗng
        }

        String nameProduct = request.getParameter("TenSP");
        String quantityProduct = request.getParameter("SoLuongSP");
        String listedPrice = request.getParameter("GiaNiemYetSP");
        String currentPrice = request.getParameter("GiaThucTeSP");
        String id_typeProduct = request.getParameter("LoaiSP");
        String id_statusProduct = request.getParameter("TrangThaiSP");
        String id_supplier = request.getParameter("NhaCungCap");
        String description = request.getParameter("MoTaSP");

        Product p = new Product();
        try {

            int quantity = Integer.parseInt(quantityProduct);
            int lPrice = Integer.parseInt(listedPrice);
            int cPrice = Integer.parseInt(currentPrice);
            int id_type = Integer.parseInt(id_typeProduct);
            int id_status = Integer.parseInt(id_statusProduct);
            int id_suppl = Integer.parseInt(id_supplier);

            p.setImgPath(url_img_in_database);
            p.setName(nameProduct);
            p.setQuantity(quantity);
            p.setListed_price(lPrice);
            p.setCurrent_price(cPrice);
            p.setType_product(id_type);
            p.setStatus_product(id_status);
            p.setSupplier(id_suppl);
            p.setDesc(description);

        } catch (Exception e) {

            response.sendRedirect("/HoaChatThiNghiem_war/admin/them-san-pham");
        }

        try {
            Admin admin = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
            boolean checkAddProduct = ProductService.addNewProduct(p, admin);
            if (checkAddProduct) {

                response.sendRedirect("/HoaChatThiNghiem_war/admin/them-san-pham");
            } else {

                response.sendRedirect("/HoaChatThiNghiem_war/admin/them-san-pham");
            }
        } catch (Exception e) {

            response.getWriter().println("Đã xảy ra lỗi");
        }
        /*
            Author : Minh Tuyên
         */
    }

}
