/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.products;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phatntt.dao.ProductsDAO;
import phatntt.dto.ProductsDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoadProductDetailController", urlPatterns = {"/LoadProductDetailController"})
public class LoadProductDetailController extends HttpServlet {

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
        // Lấy productId từ request (có thể từ parameter hoặc attribute của session)
        String productId = request.getParameter("productId");
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.LoginFeatures.HOME_PAGE);
        try {

            // Lấy thông tin sản phẩm từ cơ sở dữ liệu
            ProductsDAO productDAO = new ProductsDAO();
            ProductsDTO product;

            product = productDAO.getProductById(Integer.parseInt(productId));

            // Đặt thông tin sản phẩm vào request attribute
            request.setAttribute("product", product);

            //set url
            url = siteMaps.getProperty(Constants.ProductsFeatures.PRODUCTS_DETAIL)
                    + "?productId=" + productId;
            
            //sản phẩm cùng loại
            List<ProductsDTO> dtos = productDAO.getProductSameCategory(Integer.parseInt(productId));
            request.setAttribute("SAME_CATEGORY", dtos);

        } catch (SQLException ex) {
            Logger.getLogger(LoadProductDetailController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(LoadProductDetailController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Chuyển hướng tới trang productDetail.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
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
