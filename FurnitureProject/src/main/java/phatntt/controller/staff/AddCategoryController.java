/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package phatntt.controller.staff;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import phatntt.dao.CategoryDAO;
import phatntt.dao.ProductsDAO;
import phatntt.dto.CategoryDTO;
import phatntt.dto.ProductsDTO;

/**
 *
 * @author mac
 */
@WebServlet(name="AddCategoryController", urlPatterns={"/addcategorycontroller"})
public class AddCategoryController extends HttpServlet {
       private static final String ADD_CATEGORY_PAGE = "AddCategory.jsp";
    private static final String CATEGORY_MANAGEMENT_PAGE = "staff/categoryManagement.jsp";
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
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
                String name = request.getParameter("name");

                // Tạo đối tượng ProductsDTO để lưu thông tin sản phẩm
                CategoryDTO category = new CategoryDTO();
                category.setCategoryId(categoryId);
                category.setName(name);
                category.setThumbnail(fileName); // Lưu tên file ảnh vào DTO

                // Gọi phương thức thêm sản phẩm vào cơ sở dữ liệu
                CategoryDAO dao = new CategoryDAO();
                boolean success = dao.addCategory(category);

                if (success) {
                    // Nếu thêm sản phẩm thành công, chuyển hướng đến trang quản lý DANH MỤC
                    response.sendRedirect(CATEGORY_MANAGEMENT_PAGE);
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Failed to add the product.");
                    RequestDispatcher rd = request.getRequestDispatcher(ADD_CATEGORY_PAGE);
                    rd.forward(request, response);
                }

            } catch (IOException e) {
                // Xử lý lỗi khi tải ảnh
                request.setAttribute("ERROR_MESSAGE", "Error uploading file: " + e.getMessage());
                RequestDispatcher rd = request.getRequestDispatcher(ADD_CATEGORY_PAGE);
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(AddCategoryController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NamingException ex) {
                Logger.getLogger(AddCategoryController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
 

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

