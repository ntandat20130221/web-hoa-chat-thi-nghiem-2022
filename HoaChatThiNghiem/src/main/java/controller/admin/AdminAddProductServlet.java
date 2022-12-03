package controller.admin;

import model.Admin;
import utils.CommonString;

import javax.servlet.RequestDispatcher;
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

@WebServlet(name = "AdminAddProduct", value = "/admin/them-san-pham")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class AdminAddProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/form-add-product.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /*   Receive file upload to the Servlet from the HTML5 form  */
        Part part = request.getPart("AnhSP");

        String realPath = request.getServletContext().getRealPath("/DATA");   //  absolute => A:\apache-tomcat-9.0.68\webapps\HoaChatThiNghiem_war\DATA

        String fileNameUpload = part.getSubmittedFileName();
        Path path = Path.of(realPath);
        if (!Files.exists(path)) Files.createDirectory(path);

        String path_of_file_upload = realPath + "/" + fileNameUpload;
        part.write(path_of_file_upload); // --> ghi file ảnh vào đường dẫn tuyệt đối trên máy chủ

        String url_img_in_database = CommonString.URL_STORE_DATA + fileNameUpload;
        String nameProduct = request.getParameter("TenSP");
        String quantityProduct = request.getParameter("SoLuongSP");
        String listedPrice = request.getParameter("GiaNiemYetSP");
        String currentPrice = request.getParameter("GiaThucTeSP");

        Admin admin = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);

        /*
            Author : Minh Tuyên
         */
    }

}
