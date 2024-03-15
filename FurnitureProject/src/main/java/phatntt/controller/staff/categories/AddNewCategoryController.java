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
@WebServlet(name = "AddNewCategoryController", urlPatterns = {"/addNewCategory"})
public class AddNewCategoryController extends HttpServlet {

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
            out.println("<title>Servlet AddNewCategoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewCategoryController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.Management.CATEGORY_MANAGER_PAGE);

        try {

            String name = request.getParameter("name");
          
            Part part = request.getPart("thumbnail");

           
                String folderSaveFile = "E:/Vit/SWP391/swp391/FurnitureProject/src/main/webapp/thumbnails/categories".trim();
                String saveFile = "/thumbnails/categories";

                String pathUpload = request.getServletContext().getRealPath(saveFile).trim();

                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString().trim();
               

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
            

            CategoryDTO category = CategoryDTO.builder()
                    .name(name)
                    .thumbnail(thumbnail)
                    .build();

            CategoryDAO dao = new CategoryDAO();
            boolean success = dao.addNewCategory(category);
            if (success) {
                url = siteMaps.getProperty(Constants.Management.ADD_NEW_CATEGORY_PAGE);
                request.setAttribute("ADD_CATEGORY_SUCCESS", "Thêm danh mục mới thành công");
            }
        } catch (SQLException | NamingException | NumberFormatException e) {
            log("Error in AddCategoryController: " + e.getMessage());
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
