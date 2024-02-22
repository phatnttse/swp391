/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phatntt.dao.CategoryDAO;

import phatntt.dao.ProductsDAO;
import phatntt.dto.CategoryDTO;
import phatntt.dto.ProductsDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HomePageServlet", urlPatterns = {"/home"})
public class HomePageServlet extends HttpServlet {

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
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.LoginFeatures.HOME_PAGE);

        try {
            //Danh muc san pham
            CategoryDAO categoryDAO = new CategoryDAO();
            List<CategoryDTO> categoryDTOs = categoryDAO.getCategoryCount();
            request.setAttribute("CATEGORY_ALL", categoryDTOs);

            //sản phẩm mới
            ProductsDAO productDAO = new ProductsDAO();
            List<ProductsDTO> listProducts = productDAO.getNewestProducts();
            request.setAttribute("PRODUCTS_LIST", listProducts);

            //sản phẩm theo phân loại
            String categoryIdStr = request.getParameter("categoryId");

            int categoryId = 1;
            categoryId = Integer.parseInt(categoryIdStr);
            ProductsDAO productbycategory = new ProductsDAO();
            List<ProductsDTO> listProductsByCategory = productbycategory.getProductByCategoryId(categoryId);
            request.setAttribute("PRODUCTS_CATEGORY", listProductsByCategory);

            StringBuilder out = new StringBuilder();
            out.append("<div id=\"product-list\">");
            out.append("<div class=\"current tab-content\">");
            out.append("<div class=\"row row-fix\">");
            for (ProductsDTO product : listProductsByCategory) {

                out.append("<div class=\"col-lg-3 col-6 col-xl-3 col-md-4 col-sm-6 col-fix\">");
                out.append("    <div class=\"product-action\">");
                out.append("        <div class=\"product-thumbnail\">");
                out.append("            <a class=\"image_thumb\">");
                out.append("                <img width=\"520\" height=\"520\" class=\"lazyload loaded\" src=\"" + product.getThumbnail() + "\">");
                out.append("            </a>");              
                out.append("            <div class=\"smart\">");
                out.append("                <span>-" + product.getDiscount() + "</span>");
                out.append("            </div>");
                out.append("            <a class=\"btn-wishlist\">");
                out.append("                <i class=\"ti-search\"></i>");
                out.append("            </a>");               
                out.append("            <div class=\"btn-shopping\">");
                out.append("                <button type=\"submit\" title=\"Thêm vào giỏ hàng\" class=\"ti-shopping-cart\" onclick=\"addProductToCart(" + product.getProductId() + ")\"></button>");
                out.append("            </div>");
                out.append("        </div>");
                out.append("        <div class=\"product-info\">");
                out.append("            <h5 class=\"product-name\">");
                out.append("                <a class=\"line-clamp line-clamp-2\" href=\"\">");
                out.append("                    " + product.getTitle());
                out.append("                </a>");
                out.append("            </h5>");
                out.append("            <div class=\"price-box\">");
                out.append("                " + product.getPrice());
                out.append("                <span class=\"compare-price\">170.000₫</span>");
                out.append("            </div>");
                out.append("        </div>");
                out.append("    </div>");
                out.append("</div>");
                
            }

            out.append("</div>");
            out.append("</div>");
             out.append("</div>");

            // Gửi HTML về trang JSP sử dụng HttpServletResponse
            response.setContentType("text/html");
            PrintWriter htmlResponse = response.getWriter();
            htmlResponse.write(out.toString());
            htmlResponse.flush();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
