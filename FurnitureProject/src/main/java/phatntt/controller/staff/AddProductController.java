/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package phatntt.controller.staff;

import java.io.File;
import java.io.IOException;
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

/**
 *
 * @author mac
 */
@WebServlet(name="AddProductController", urlPatterns={"/addproductcontroller"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,    // 2 MB
                maxFileSize = 1024 * 1024 * 10,          // 10 MB
                maxRequestSize = 1024 * 1024 * 50)       // 50 MB
public class AddProductController extends HttpServlet {

    private static final String ADD_PRODUCT_PAGE = "AddProduct.jsp";
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF8");
        request.setCharacterEncoding("UTF-8");
        
            String url = ADD_PRODUCT_PAGE;

            try {
                // Lấy thông tin sản phẩm từ form
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int price = Integer.parseInt(request.getParameter("price"));
                String thumbnail = request.getParameter("thumbnail");
                int discount = Integer.parseInt(request.getParameter("discount"));
//                int purchases = Integer.parseInt(request.getParameter("purchases"));

                // Tạo một đối tượng ProductsDTO để lưu trữ thông tin sản phẩm
                ProductsDTO product = new ProductsDTO();
                product.setCategoryId(categoryId);
                product.setTitle(title);
                product.setDescription(description);
                product.setQuantity(quantity);
                product.setPrice(price);
                product.setThumbnail(thumbnail);
                product.setDiscount(discount);
            // Handling file upload for thumbnail
            Part filePart = request.getPart("thumbnail");
            String fileName = getSubmittedFileName(filePart);

            // Save the uploaded file to a specific directory on your server
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // Set the thumbnail property of the ProductsDTO
            product.setThumbnail(filePath);

                // Gọi phương thức thêm sản phẩm từ ProductsDAO
                ProductsDAO dao = new ProductsDAO();
                boolean success = dao.addProduct(product);

                if (success) {
                    // Nếu thêm sản phẩm thành công, chuyển hướng đến trang productmanagement.jsp
                    url = "productManagement";
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Failed to add the product.");
                }
            } catch (SQLException | NamingException | NumberFormatException e) {
                // Xử lý ngoại lệ
                log("Error in AddProductController: " + e.getMessage());
                request.setAttribute("ERROR_MESSAGE", "Error processing the request.");
            } finally {
                // Chuyển hướng đến trang kết quả (có thể là trang admin.jsp hoặc trang lỗi)
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
        
    }
    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
