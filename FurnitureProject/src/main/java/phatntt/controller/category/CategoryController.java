/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.category;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phatntt.controller.HomePageServlet;
import phatntt.dao.ProductsDAO;
import phatntt.dto.ProductsDTO;
import phatntt.util.Key_Utils;

/**
 *
 * @author Dell
 */
@WebServlet(name = "CategoryController", urlPatterns = {"/category"})
public class CategoryController extends HttpServlet {

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
            out.println("<title>Servlet CategoryController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryController at " + request.getContextPath() + "</h1>");
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
        int categoryId;
        String categoryIdStr = request.getParameter("categoryId");
        ProductsDAO productDAO = new ProductsDAO();
        if (categoryIdStr != null) {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
                List<ProductsDTO> listProductsByCategoryId = productDAO.getProductByCategoryId(categoryId);
                
                
                StringBuilder out = new StringBuilder();
                out.append("<div class=\"tab-1 tab-content current\">");
                out.append("    <div class=\"contentfill\">");
                out.append("        <div class=\"swipertab swiper-container products-view-grid swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events swiper-container-multirow\">");
                out.append("            <div class=\"swiper-wrapper\" style=\"width: 1600px; transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;\">");
                
                for (ProductsDTO product : listProductsByCategoryId) {
                    out.append("                <div class=\"swiper-slide swiper-slide-active\" style=\"width: 300px; margin-right: 20px;\">");
                    out.append("                    <div class=\"item_product_main\"\">");
                    out.append("                        <form action=\"cart\" method=\"post\" class=\"variants product-action\" enctype=\"multipart/form-data\">");
                    out.append("                            <div class=\"product-thumbnail\">");
                    out.append("                                <a class=\"image_thumb\" href=\"LoadProductDetailController?productId="+product.getProductId()+"\" title=\""+product.getTitle()+"\">");
                    out.append("                                    <img class=\"lazyload loaded\" width=\"480\" height=\"480\" src=\"thumbnails/products/" + product.getThumbnail() + "\" alt=\"" + product.getTitle() + "\">");
                    out.append("                                </a>");
                    out.append("                                <span class=\"smart\">-" + product.getDiscount() + "%</span>");
                    out.append("                                <a href=\"\" class=\"btn-compare js-btn-wishlist setWishlist btn-views\" data-wish=\"bon-tam-massage-dat-goc\" tabindex=\"0\" title=\"Thêm vào yêu thích\">");
                    out.append("                                    <svg width=\"24\" height=\"24\" xmlns=\"http://www.w3.org/2000/svg\" fill-rule=\"evenodd\" clip-rule=\"evenodd\"><path d=\"M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181\"></path></svg>");
                    out.append("                                </a>");
                    out.append("                                <div class=\"action\">");
                    out.append("                                    <div class=\"actions-secondary\">");
                    out.append("                                        <div class=\"actions-primary\">");                                                           
                    out.append("                                            <button  type=\"button\" class=\"btn-cart add_to_cart \" title=\"Thêm vào giỏ hàng\" onclick=\"addProductToCart("+product.getProductId()+", '"+product.getTitle()+"', '"+product.getThumbnail()+"', "+product.getDiscountProduct()+")\">");
                    out.append("                                                <span class=\"icon icon-cart\">");
                    out.append("                                                    <svg viewBox=\"0 0 32 32\" xmlns=\"http://www.w3.org/2000/svg\"><defs><style>.cls-1{fill:none;stroke:#000;stroke-linecap:round;stroke-linejoin:round;stroke-width:2px;}</style></defs><title></title><g><polyline class=\"cls-1\" points=\"15 31 5 31 6 9 26 9 26.14 12\"></polyline><path class=\"cls-1\" d=\"M11,12V6a5,5,0,0,1,5-5h0a5,5,0,0,1,5,5v6\"></path><circle class=\"cls-1\" cx=\"23\" cy=\"23\" r=\"8\"></circle><line class=\"cls-1\" x1=\"23\" x2=\"23\" y1=\"19\" y2=\"27\"></line><line class=\"cls-1\" x1=\"27\" x2=\"19\" y1=\"23\" y2=\"23\"></line></g></svg>");
                    out.append("                                                </span>");
                    out.append("                                            </button>");
                    out.append("                                        </div>");
                    out.append("                                        <a title=\"Xem nhanh\" onclick=\"viewFastProduct("+product.getProductId()+")\" class=\"quick-view btn-views\">");
                    out.append("                                            <svg width=\"24\" height=\"24\" xmlns=\"http://www.w3.org/2000/svg\" fill-rule=\"evenodd\" clip-rule=\"evenodd\"><path d=\"M12.01 20c-5.065 0-9.586-4.211-12.01-8.424 2.418-4.103 6.943-7.576 12.01-7.576 5.135 0 9.635 3.453 11.999 7.564-2.241 4.43-6.726 8.436-11.999 8.436zm-10.842-8.416c.843 1.331 5.018 7.416 10.842 7.416 6.305 0 10.112-6.103 10.851-7.405-.772-1.198-4.606-6.595-10.851-6.595-6.116 0-10.025 5.355-10.842 6.584zm10.832-4.584c2.76 0 5 2.24 5 5s-2.24 5-5 5-5-2.24-5-5 2.24-5 5-5zm0 1c2.208 0 4 1.792 4 4s-1.792 4-4 4-4-1.792-4-4 1.792-4 4-4z\"></path></svg>");
                    out.append("                                        </a>");
                    out.append("                                    </div>");
                    out.append("                                </div>");
                    out.append("                            </div>");
                    out.append("                            <div class=\"product-info\">");
                    out.append("                                <h3 class=\"product-name\"><a href=\"/bon-tam-massage-dat-goc\" title=\"Bồn tắm Massage đặt góc\">" + product.getTitle() + "</a></h3>");
                    out.append("                                <div class=\"price-box\">");
                    out.append("                                    <span class=\"price\">" +  Key_Utils.getInstance().formattedPrice(product.getDiscountProduct())  + "₫</span>");
                    out.append("                                    <span class=\"compare-price\">" +Key_Utils.getInstance().formattedPrice(product.getPrice()) + "₫</span>");
                    out.append("                                </div>");
                    out.append("                            </div>");
                    out.append("                        </form>");
                    out.append("                    </div>");
                    out.append("                </div>");
                }           
                out.append("            </div>");    
                out.append("        </div>");
                out.append("    </div>");
                out.append("</div>");
                
                // Gửi HTML về trang JSP sử dụng HttpServletResponse
                response.setContentType("text/html");
                PrintWriter htmlResponse = response.getWriter();
                htmlResponse.write(out.toString());
                htmlResponse.flush();
            } catch (SQLException ex) {
                Logger.getLogger(HomePageServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NamingException ex) {
                Logger.getLogger(HomePageServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

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
