/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phatntt.dao.ProductsDAO;
import phatntt.dto.ProductsDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditProductController", urlPatterns = {"/editproductcontroller"})
public class EditProductController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String PRODUCT_MANAGEMENT_PAGE = "productManagement.jsp";
    private static final String EDIT_PRODUCT_PAGE = "editproduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String url = ERROR;

            try {
                // Lấy thông tin sản phẩm từ form
                int productId = Integer.parseInt(request.getParameter("productId"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                float price = Float.parseFloat(request.getParameter("price"));
                String thumbnail = request.getParameter("thumbnail");
                int discount = Integer.parseInt(request.getParameter("discount"));
                int purchases = Integer.parseInt(request.getParameter("purchases"));

                // Tạo một đối tượng ProductsDTO để lưu trữ thông tin sản phẩm
                ProductsDTO product = new ProductsDTO();
                product.setProductId(productId); // Set the product ID for updating
                product.setCategoryId(categoryId);
                product.setTitle(title);
                product.setDescription(description);
                product.setQuantity(quantity);
                product.setPrice(price);
                product.setThumbnail(thumbnail);
                product.setDiscount(discount);
                product.setPurchases(purchases);

                // Gọi phương thức cập nhật sản phẩm từ ProductsDAO
                ProductsDAO dao = new ProductsDAO();
                boolean success = dao.updateProduct(product);

                if (success) {
                    // Nếu cập nhật sản phẩm thành công, chuyển hướng đến trang productmanagement.jsp
                    url = PRODUCT_MANAGEMENT_PAGE;
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Failed to update the product.");
                    url = EDIT_PRODUCT_PAGE; // Redirect back to the edit page with an error message
                }
            } catch (SQLException | NamingException | NumberFormatException e) {
                // Xử lý ngoại lệ
                log("Error in EditProductController: " + e.getMessage());
                request.setAttribute("ERROR_MESSAGE", "Error processing the request.");
                url = EDIT_PRODUCT_PAGE; // Redirect back to the edit page with an error message
            } finally {
                // Chuyển hướng đến trang kết quả (có thể là trang admin.jsp hoặc trang lỗi)
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // You may want to implement logic for retrieving the product details for editing
        // and then forward to the editproduct.jsp page with the product details pre-filled.
        // Example: request.setAttribute("product", productDetails);
        // Then forward to the editproduct.jsp page.
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
