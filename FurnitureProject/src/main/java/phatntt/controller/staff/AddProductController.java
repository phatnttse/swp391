package phatntt.controller.staff;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import phatntt.dao.ProductsDAO;
import phatntt.dto.ProductsDTO;

@WebServlet(name = "AddProductController", urlPatterns = {"/addproductcontroller"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50)               // 50 MB
public class AddProductController extends HttpServlet {

    private static final String ADD_PRODUCT_PAGE = "addproduct.jsp";
    private static final String PRODUCT_MANAGEMENT_PAGE = "staff/productManagement.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            Part part = request.getPart("thumbnail");
            String fileName = part.getSubmittedFileName();
            String path = getServletContext().getRealPath("/uploads") + File.separator + fileName;

            try (InputStream is = part.getInputStream();
                    OutputStream os = new FileOutputStream(path)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = is.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }

                // Lấy thông tin sản phẩm từ form
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int price = Integer.parseInt(request.getParameter("price"));
                int discount = Integer.parseInt(request.getParameter("discount"));

                // Tạo đối tượng ProductsDTO để lưu thông tin sản phẩm
                ProductsDTO product = new ProductsDTO();
                product.setCategoryId(categoryId);
                product.setTitle(title);
                product.setDescription(description);
                product.setQuantity(quantity);
                product.setPrice(price);
                product.setDiscount(discount);
                product.setThumbnail(fileName); // Lưu tên file ảnh vào DTO

                // Gọi phương thức thêm sản phẩm vào cơ sở dữ liệu
                ProductsDAO dao = new ProductsDAO();
                boolean success = dao.addProduct(product);

                if (success) {
                    // Nếu thêm sản phẩm thành công, chuyển hướng đến trang quản lý sản phẩm
                    response.sendRedirect(PRODUCT_MANAGEMENT_PAGE);
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Failed to add the product.");
                    RequestDispatcher rd = request.getRequestDispatcher(ADD_PRODUCT_PAGE);
                    rd.forward(request, response);
                }

            } catch (IOException e) {
                // Xử lý lỗi khi tải ảnh
                request.setAttribute("ERROR_MESSAGE", "Error uploading file: " + e.getMessage());
                RequestDispatcher rd = request.getRequestDispatcher(ADD_PRODUCT_PAGE);
                rd.forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
