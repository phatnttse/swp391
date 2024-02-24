/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.products;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int productId = Integer.parseInt(request.getParameter("productId"));
        String title = request.getParameter("title");
        String thumbnail = request.getParameter("thumbnail");
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float price = Float.parseFloat(request.getParameter("price"));

        try {

            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");

            CartDAO cartDAO = new CartDAO();
            boolean result = cartDAO.addProductToCart(user.getId(), productId, title, thumbnail, 1, price);
            List<CartDTO> carts = null;
            int totalProductsInCart = 0;
            if (result) {
                carts = cartDAO.getProductFromCartByProductId(productId);              
                totalProductsInCart = cartDAO.getTotalQuantityInCart(user.getId());
                session.setAttribute("CART_QUANTITY", totalProductsInCart);
                for (CartDTO cart : carts) {
                    if (cart.getProductId() == productId) {
                        out.println(
                                "                    <div id=\"popup-cart-mobile\" class=\"popup-cart-mobile active\">\n"
                                + "                        <div class=\"header-popcart\">\n"
                                + "                            <div class=\"top-cart-header\">\n"
                                + "                                <span>\n"
                                + "                                    Bạn đã thêm 1 sản phẩm vào giỏ hàng\n"
                                + "                                </span>\n"
                                + "                            </div>\n"
                                + "                            <div class=\"media-content bodycart-mobile\">\n"
                                + "                                <div class=\"thumb-1x1\">\n"
                                + "                                    <img src=\"" + cart.getThumbnail() + "\" alt=\"${product.title}\"></div>\n"
                                + "                                <div class=\"body_content\">\n"
                                + "                                    <h4 class=\"product-title\">" + cart.getTitle() + "</h4>\n"
                                + "                                    <div class=\"product-new-price\">\n"
                                + "                                        <b>" + cart.getPrice() + "</b>\n"
                                + "                                        <span></span>\n"
                                + "                                    </div>\n"
                                + "                                </div>\n"
                                + "                            </div>\n"
                                + "                            <a class=\"noti-cart-count\" href=\"\" title=\"Giỏ hàng\"> Giỏ hàng của bạn hiện có <span class=\"count_item_pr\">" + totalProductsInCart + "</span> sản phẩm </a>\n"
                                + "                            <div class=\"modal-close js-modal-close2\">\n"
                                + "                                <i class=\"ti-close\" title=\"Đóng\"></i>\n"
                                + "                            </div>\n"
                                + "                            </a>\n"
                                + "                            <div class=\"bottom-action\">\n"
                                + "                                <a href=\"cart\" class=\"viewcart\">\n"
                                + "                                    Xem giỏ hàng\n"
                                + "                                </a>\n"
                                + "                                <a href=\"#\" class=\"checkout\">\n"
                                + "                                    Thanh toán ngay\n"
                                + "                                </a>\n"
                                + "                            </div>\n"
                                + "                        </div>\n"
                                + "                    </div>\n"
                        );
                        break;
                    }
                }

            }

        } catch (SQLException ex) {
            log("AddItemToCartServlet_SQL: " + ex.getMessage());
        } catch (NamingException ex) {
            log("AddItemToCartServlet_Naming: " + ex.getMessage());
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
