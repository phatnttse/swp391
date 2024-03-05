/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.products;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phatntt.dao.ProductsDAO;
import phatntt.dto.ProductsDTO;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ViewPopupProductController", urlPatterns = {"/ViewPopupProductController"})
public class ViewPopupProductController extends HttpServlet {

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
            out.println("<title>Servlet ViewPopupProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewPopupProductController at " + request.getContextPath() + "</h1>");
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
        String productId = request.getParameter("productId");
        try {
            // Lấy thông tin sản phẩm từ cơ sở dữ liệu
            ProductsDAO productDAO = new ProductsDAO();
            ProductsDTO product = productDAO.getProductById(Integer.parseInt(productId));

            // Đặt thông tin sản phẩm vào request attribute
            request.setAttribute("POPUP_PRODUCT", product);

            // Construct the HTML response
            String htmlResponse = "<div class='quickview-overlay fancybox-overlay fancybox-overlay-fixed'></div>"
                    + "<div class='quick-view-product'>"
                    + "<div class='block-quickview primary_block details-product'>"
                    + "<div class='row'>"
                    + "<div class='product-left-column product-images col-xs-12 col-sm-4 col-md-4 col-lg-5 col-xl-6'>"
                    + "<div class='image-block large-image col_large_default'>"
                    + "<span class='view_full_size'>"
                    + "<a class='img-product' title='' href=''>"
                    + "<img src='" + product.getThumbnail() + "' id='product-featured-image-quickview' "
                    + "class='img-responsive product-featured-image-quickview'>"
                    + "</a>"
                    + "</span>"
                    + "</div>"
                    + "</div>"
                    + "<div class='product-center-column product-info product-item col-xs-12 col-sm-6 col-md-8 col-lg-7 col-xl-6 details-pro style_product style_border' "
                    + "id='product-" + product.getProductId() + "'>"
                    + "<div class='head-qv group-status'>"
                    + "<h3 class='qwp-name title-product'><a class='text2line' href='' "
                    + "title='" + product.getTitle() + "'>" + product.getDescription() + "</a></h3>"
                    + "<div class='vend-qv group-status'>"
                    + "<div class='left_vend'>"
                    + "<div class='first_status '>Thương hiệu:"
                    + "<span class='vendor_ status_name'>" + "</span>"
                    + "</div>"
                    + "<span class='line_tt'>|</span>"
                    + "<div class='top_sku first_status'>Mã sản phẩm:"
                    + "<span class='sku_ status_name'>" + product.getProductId() + "</span>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "<div class='quickview-info'>"
                    + "<span class='prices price-box'>"
                    + "<span class='price product-price sale-price'>" + product.getPrice() + "</span>"
                    + "</span>"
                    + "</div>"
                    + // Continue adding your existing HTML code
                    "</div>"
                    + "</div>"
                    + "</div>"
                    + "<a title='Close' class='quickview-close close-window' href=''>"
                    + "<svg viewBox='0 0 320 512' class='svg-inline--fa fa-times fa-w-10'>"
                    + "<path fill='currentColor' "
                    + "d='M207.6 256l107.72-107.72c6.23-6.23 6.23-16.34 0-22.58l-25.03-25.03c-6.23-6.23-16.34-6.23-22.58 0L160 208.4 52.28 100.68c-6.23-6.23-16.34-6.23-22.58 0L4.68 125.7c-6.23 6.23-6.23 16.34 0 22.58L112.4 256 4.68 363.72c-6.23 6.23-6.23 16.34 0 22.58l25.03 25.03c6.23 6.23 16.34 6.23 22.58 0L160 303.6l107.72 107.72c6.23 6.23 16.34 6.23 22.58 0l25.03-25.03c6.23-6.23 6.23-16.34 0-22.58L207.6 256z'>"
                    + "</path>"
                    + "</svg>"
                    + "</a>"
                    + "</div>";

            // Send the HTML response to the client
            try (PrintWriter out = response.getWriter()) {
                out.println(htmlResponse);
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoadProductDetailController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(LoadProductDetailController.class.getName()).log(Level.SEVERE, null, ex);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String productId = request.getParameter("productId");
        try {
            // Lấy thông tin sản phẩm từ cơ sở dữ liệu
            ProductsDAO productDAO = new ProductsDAO();
            ProductsDTO product = productDAO.getProductById(Integer.parseInt(productId));

            // Construct the HTML response
            String htmlResponse = "<div class=\"quickview-overlay fancybox-overlay fancybox-overlay-fixed\"></div>"
                    + "<div class='quick-view-product'>"
                    + "<div class='block-quickview primary_block details-product'>"
                    + "<div class='row'>"
                    + "<div class='product-left-column product-images col-xs-12 col-sm-4 col-md-4 col-lg-5 col-xl-6'>"
                    + "<div class='image-block large-image col_large_default'>"
                    + "<span class='view_full_size'>"
                    + "<a class='img-product' title='' href=''>"
                    + "<img src='" + product.getThumbnail() + "' id='product-featured-image-quickview' "
                    + "class='img-responsive product-featured-image-quickview'>"
                    + "</a>"
                    + "</span>"
                    + "</div>"
                    + "</div>"
                    + "<div class='product-center-column product-info product-item col-xs-12 col-sm-6 col-md-8 col-lg-7 col-xl-6 details-pro style_product style_border' "
                    + "id='product-" + product.getProductId() + "'>"
                    + "<div class='head-qv group-status'>"
                    + "<h3 class='qwp-name title-product'><a class='text2line' href='' "
                    + "title='" + product.getTitle() + "'>" + product.getTitle() + "</a></h3>"
                    + "<div class='vend-qv group-status'>"
                    + "<div class='left_vend'>"
                    + "<div class='first_status '>Thương hiệu:"
                    + "<span class='vendor_ status_name'>" + "</span>"
                    + "</div>"
                    + "<span class='line_tt'>|</span>"
                    + "<div class='top_sku first_status'>Mã sản phẩm:"
                    + "<span class='sku_ status_name'>" + product.getProductId() + "</span>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "<div class='quickview-info'>"
                    + "<span class='prices price-box'>"
                    + "<span class='price product-price sale-price'>" + product.getFormattedPrice() + "</span>"
                    + "</span>"
                    + "</div>"
                    + "<form action=\"cart\" method=\"post\" class=\"quick_option variants form-ajaxtocart form-product\">\n"
                    + "\n"
                    + "                                <div class=\"form_product_content\">\n"
                    + "                                    <div class=\"count_btn_style quantity_wanted_p\">\n"
                    + "                                        <div class=\"soluong1 clearfix\">\n"
                    + "                                            <span class=\"soluong_h\">Số lượng:</span>\n"
                    + "                                            <div class=\"input_number_product\">\n"
                    + "                                                <a class=\"btn_num num_1 button button_qty\"\n"
                    + "                                                   onclick=\"var result = document.getElementById('quantity-detail'); var qtyqv = result.value; if (!isNaN(qtyqv) & amp; & amp; qtyqv > 1) result.value--; return false;\">-</a>\n"
                    + "                                                <input type=\"text\" id=\"quantity-detail\" name=\"quantity\" value=\"1\"\n"
                    + "                                                       maxlength=\"2\" class=\"form-control prd_quantity\"\n"
                    + "                                                       onkeypress=\"if (isNaN(this.value + String.fromCharCode(event.keyCode)))\n"
                    + "                                                                   return false;\"\n"
                    + "                                                       onchange=\"if (this.value == 0)\n"
                    + "                                                                   this.value = 1;\">\n"
                    + "                                                <a class=\"btn_num num_2 button button_qty\"\n"
                    + "                                                   onclick=\"var result = document.getElementById('quantity-detail');\n"
                    + "                                                           var qtyqv = result.value;\n"
                    + "                                                           if (!isNaN(qtyqv))\n"
                    + "                                                               result.value++;\n"
                    + "                                                           return false;\">+</a>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                        <div class=\"button_actions clearfix\">\n"
                    + "                                            <button type=\"submit\"\n"
                    + "                                                    class=\"btn_cool btn btn_base fix_add_to_cart ajax_addtocart btn_add_cart btn-cart add_to_cart add_to_cart_detail\">\n"
                    + "                                                <span class=\"btn-content text_1\">Thêm vào giỏ hàng</span>\n"
                    + "                                            </button>\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "                                </div>                         \n"
                    + "                            </form>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "<a title='Close' class='quickview-close close-window' href=''>"
                    + "<svg viewBox='0 0 320 512' class='svg-inline--fa fa-times fa-w-10'>"
                    + "<path fill='currentColor' "
                    + "d='M207.6 256l107.72-107.72c6.23-6.23 6.23-16.34 0-22.58l-25.03-25.03c-6.23-6.23-16.34-6.23-22.58 0L160 208.4 52.28 100.68c-6.23-6.23-16.34-6.23-22.58 0L4.68 125.7c-6.23 6.23-6.23 16.34 0 22.58L112.4 256 4.68 363.72c-6.23 6.23-6.23 16.34 0 22.58l25.03 25.03c6.23 6.23 16.34 6.23 22.58 0L160 303.6l107.72 107.72c6.23 6.23 16.34 6.23 22.58 0l25.03-25.03c6.23-6.23 6.23-16.34 0-22.58L207.6 256z'>"
                    + "</path>"
                    + "</svg>"
                    + "</a>"
                    + "</div>";

            // Send the HTML response to the client
            try (PrintWriter out = response.getWriter()) {
                out.println(htmlResponse);
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoadProductDetailController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(LoadProductDetailController.class.getName()).log(Level.SEVERE, null, ex);
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
