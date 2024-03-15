/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.staff.categories;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import phatntt.dao.CategoryDAO;
import phatntt.dto.CategoryDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "UpdateDeleteCategoryController", urlPatterns = {"/updateDeleteCategory"})
public class UpdateDeleteCategoryController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateDeleteCategoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDeleteCategoryController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoryIdStr = request.getParameter("categoryId");
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.Management.CATEGORY_MANAGER_PAGE);

        try {
            int categoryId = Integer.parseInt(categoryIdStr);
            CategoryDAO categoryDAO = new CategoryDAO();
            boolean result = categoryDAO.deleteCategory(categoryId);

            if (result) {
                url = "categoryManager";
                request.setAttribute("DELETE_SUCCESS", "Xóa danh mục thành công");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UpdateDeleteCategoryController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateDeleteCategoryController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.Management.CATEGORY_MANAGER_PAGE);

        try {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String name = request.getParameter("name");

            Part part = request.getPart("thumbnail");

            String folderSaveFile = "E:/Vit/SWP391/swp391/FurnitureProject/src/main/webapp/thumbnails/categories";

            String pathUpload = request.getServletContext().getRealPath("/thumbnails/categories");

            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            // Kiểm tra và tạo thư mục nếu chưa tồn tại
            File directory = new File(folderSaveFile);
            if (!directory.exists()) {
                directory.mkdirs();
            }
            if (!Files.exists(Paths.get(pathUpload))) {
                Files.createDirectories(Paths.get(pathUpload));
            }

            // Lưu trữ file vào thư mục
            part.write(folderSaveFile + File.separator + fileName);
            part.write(pathUpload + File.separator + fileName);
            String thumbnail = fileName;

            CategoryDAO categoryDAO = new CategoryDAO();
            CategoryDTO category = CategoryDTO.builder()
                    .categoryId(categoryId)
                    .name(name)
                    .thumbnail(thumbnail)
                    .build();

            boolean success = categoryDAO.updateCategory(category);

            if (success) {
                url = "categoryDetailManager" + "?categoryId=" + categoryId;
                request.setAttribute("UPDATE_SUCCESS", "Cập nhật danh mục thành công");
            }

        } catch (SQLException | NamingException ex) {
            ex.printStackTrace();

        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
