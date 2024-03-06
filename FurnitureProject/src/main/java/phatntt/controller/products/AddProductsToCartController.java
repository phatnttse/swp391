/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.products;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.List;
import java.util.Locale;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dao.CartDAO;
import phatntt.dto.CartDTO;
import phatntt.dto.UsersDTO;
import phatntt.util.Key_Utils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddProductsToCartController", urlPatterns = {"/addProductsToCart"})
public class AddProductsToCartController extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        int productId = Integer.parseInt(request.getParameter("productId"));
        String title = request.getParameter("title");
        String thumbnail = request.getParameter("thumbnail");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = 1;   
        String quantityStr = request.getParameter("quantity");
        if (quantityStr != null){
            quantity = Integer.parseInt(quantityStr);
        }

        try {

            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");
                      
            CartDAO cartDAO = new CartDAO();
            boolean result = cartDAO.addProductToCart(user.getId(), productId, title, thumbnail, quantity, price);
            List<CartDTO> carts = null;
            int totalProductsInCart = 0;
            int totalMoney = 0;
            if (result) {
                CartDTO product = cartDAO.getProductFromCart(productId);
                carts = cartDAO.getCartByUserId(user.getId());
                totalProductsInCart = cartDAO.getTotalQuantityInCart(user.getId());
                for (CartDTO cart : carts) {
                    totalMoney += (cart.getPrice() * cart.getQuantity());
                }
               
                session.setAttribute("CART_QUANTITY", totalProductsInCart);
                session.setAttribute("CART", carts);
                // Gửi mã HTML về phía client
                out.println(
                        "    <div class=\"header-popcart\">\n"
                        + "        <div class=\"top-cart-header\">\n"
                        + "            <span>Bạn đã thêm [<a class=\"cart-popup-name\" href=\"\">" + product.getTitle() + "</a>] vào giỏ hàng</span>\n"
                        + "        </div>\n"          
                        + "        <a title=\"Đóng\" class=\"cart_btn-close js-popup-close\">\n"
                        + "            <svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"1.1\" width=\"512\" height=\"512\" x=\"0\" y=\"0\" viewBox=\"0 0 365.696 365.696\" style=\"enable-background:new 0 0 512 512\" xml:space=\"preserve\" class=\"\">\n"
                        + "                <g>\n"
                        + "                    <path xmlns=\"http://www.w3.org/2000/svg\" d=\"m243.1875 182.859375 113.132812-113.132813c12.5-12.5 12.5-32.765624 0-45.246093l-15.082031-15.082031c-12.503906-12.503907-32.769531-12.503907-45.25 0l-113.128906 113.128906-113.132813-113.152344c-12.5-12.5-32.765624-12.5-45.246093 0l-15.105469 15.082031c-12.5 12.503907-12.5 32.769531 0 45.25l113.152344 113.152344-113.128906 113.128906c-12.503907 12.503907-12.503907 32.769531 0 45.25l15.082031 15.082031c12.5 12.5 32.765625 12.5 45.246093 0l113.132813-113.132812 113.128906 113.132812c12.503907 12.5 32.769531 12.5 45.25 0l15.082031-15.082031c12.5-12.503906 12.5-32.769531 0-45.25zm0 0\" fill=\"#ffffff\" data-original=\"#000000\"></path>\n"
                        + "                </g>\n"
                        + "            </svg>\n"
                        + "        </a>\n"
                        + "    </div>\n"
                        + "    <div id=\"cart-popup-container\" class=\"cartPopupContainer\">\n"
                        + "        <form action=\"cart\" method=\"post\" class=\"cart ajaxcart cartpopup\">\n"
                        + "<div class=\"cart-header-info\">\n"
                        + "            <div>Thông tin sản phẩm</div><div>Đơn giá</div><div>Số lượng</div><div>Thành tiền</div>\n"
                        + "        </div>\n"
                        + "        <div class=\"ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items\">");

                for (CartDTO cart : carts) {
                    out.println("            <div class=\"ajaxcart__row\">\n"
                            + "                <div class=\"ajaxcart__product cart_product\">\n"
                            + "                    <a href=\"\" class=\"ajaxcart__product-image cart_image\" title=\"" + cart.getTitle() + "\"><img width=\"80\" height=\"80\" src=\"" + cart.getThumbnail() + "\" alt=\"" + cart.getTitle() + "\"></a>\n"
                            + "                    <div class=\"grid__item cart_info\">\n"
                            + "                        <div class=\"ajaxcart__product-name-wrapper cart_name\">\n"
                            + "                            <a href=\"\" class=\"ajaxcart__product-name h4\" title=\"" + cart.getTitle() + "\">" + cart.getTitle() + "</a>\n"
                            + "                            <a class=\"cart__btn-remove remove-item-cart ajaxifyCart--remove\" href=\"\">Xóa</a>\n"
                            + "                        </div>\n"
                            + "                        <div class=\"grid\">\n"
                            + "                            <div class=\"grid__item one-half text-right cart_prices\">\n"
                            + "                                <span class=\"cart-price\">\n"
                            + "                          <span class=\"cart-price\">" + Key_Utils.getInstance().formattedPrice(cart.getPrice()) + "₫</span>\n"
                            + "                                </span>"
                            + "                            </div>\n"
                            + "                        </div>\n"
                            + "                        <div class=\"grid\">\n"
                            + "                            <div class=\"grid__item one-half cart_select\">\n"
                            + "                                <div class=\"ajaxcart__qty input-group-btn\">\n"
                            + "                                    <button onclick=\"reduceProductQuantity('"+user.getId()+"', "+cart.getProductId()+")\" type=\"button\" class=\"ajaxcart__qty-adjust ajaxcart__qty--minus items-count\">-</button>\n"
                            + "                                    <input type=\"text\" name=\"\" class=\"ajaxcart__qty-num number-sidebar\" value=\"" + cart.getQuantity() + "\" pattern=\"[0-9]*\"/>\n"
                            + "                                    <button onclick=\"addProductQuantity('"+user.getId()+"', "+cart.getProductId()+")\" type=\"button\" class=\"ajaxcart__qty-adjust ajaxcart__qty--plus items-count\">+</button>\n"
                            + "                                </div>\n"
                            + "                            </div>\n"
                            + "                        </div>\n"
                            + "                        <div class=\"grid\">\n"
                            + "                            <div class=\"grid__item one-half text-right cart_prices\">\n"
                            + "                                <span class=\"cart-price\">\n"
                            + "                                     <span class=\"cart-price\">" + Key_Utils.getInstance().formattedPrice(cart.getPrice() * cart.getQuantity()) + "₫</span>\n"
                            + "                                </span>"
                            + "                            </div>\n"
                            + "                        </div>\n"
                            + "                    </div>\n"
                            + "                </div>\n"
                            + "            </div>\n");
                }

                out.println("</div>\n"
                        + "        <div class=\"ajaxcart__footer ajaxcart__footer--fixed cart-footer\">\n"
                        + "            <div class=\"row\">\n"
                        + "                <div class=\"col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8\">\n"
                        + "                    <div class=\"ajaxcart__subtotal\">\n"
                        + "                        <div class=\"cart__subtotal\">\n"
                        + "                            <div class=\"cart__col-6\">Tổng tiền:</div>\n"
                        + "                            <div class=\"text-right cart__totle\"><span class=\"total-price\">" + Key_Utils.getInstance().formattedPrice(totalMoney)+ "₫</span></div>\n"
                        + "                        </div>\n"
                        + "                    </div>\n"
                        + "                    <div class=\"cart__btn-proceed-checkout-dt\">\n"
                        + "                        <button onclick=\"\" type=\"submit\" class=\"button btn btn-default cart__btn-proceed-checkout\"  title=\"Thanh toán\">Thanh toán</button>\n"
                        + "                    </div>\n"
                        + "                </div>\n"
                        + "            </div>\n"
                        + "        </div>\n"
                        + "    </form>\n"
                        + "   </div>\n"
                );
                out.close();
            }

        } catch (SQLException ex) {
            log("AddItemToCartServlet_SQL: " + ex.getMessage());
        } catch (NamingException ex) {
            log("AddItemToCartServlet_Naming: " + ex.getMessage());
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
