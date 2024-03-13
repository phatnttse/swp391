/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.staff;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import phatntt.dao.CategoryDAO;
import phatntt.dto.CategoryDTO;

/**
 *
 * @author Phong
 */
@WebServlet(name = "AddCategoryController", urlPatterns = {"/AddCategoryController"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,    // 2 MB
                maxFileSize = 1024 * 1024 * 10,          // 10 MB
                maxRequestSize = 1024 * 1024 * 50)       // 50 MB
public class AddCategoryController extends HttpServlet {
    
    private static final String ADD_CATEGORY_PAGE = "AddCategory.jsp";
    

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String url = ADD_CATEGORY_PAGE;

        try {
            // Lấy thông tin sản phẩm từ form
            String name = request.getParameter("name");
            String thumbnail = request.getParameter("thumbnail");
// Tạo một đối tượng ProductsDTO để lưu trữ thông tin sản phẩm
            CategoryDTO category = new CategoryDTO();
            
            category.setName(name);
            category.setThumbnail(thumbnail);
            
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
            category.setThumbnail(filePath);
            
            CategoryDAO dao = new CategoryDAO();
            boolean success = dao.addCategory(category);
            if (success) {
                url = "categoryManagement";
            } else {
                request.setAttribute("ERROR_MESSAGE", "Failed to add the product.");
            }
        } catch (SQLException | NamingException | NumberFormatException e) {
            log("Error in AddCategoryController: " + e.getMessage());
            request.setAttribute("ERROR_MESSAGE", "Error processing the request.");
        } finally {
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
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
        processRequest(request, response);
    
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