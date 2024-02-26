/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.cart;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;
import phatntt.dao.CartDAO;
import phatntt.dto.CartDTO;
import phatntt.dto.UsersDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

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
        String url = siteMaps.getProperty(Constants.ShoppingFeatures.CART_PAGE);

        try {
            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");
            List<CartDTO> cartList = null;
            if (user != null) {
                CartDAO dao = new CartDAO();
                cartList = dao.getCartByUserId(user.getId());
                if (cartList != null) {
                    session.setAttribute("CART", cartList);
                    url = siteMaps.getProperty(Constants.ShoppingFeatures.CART_PAGE);
                }
            } else {
                session.setAttribute("CART", cartList);
                url = siteMaps.getProperty(Constants.ShoppingFeatures.CART_PAGE);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");

            CartDAO cartDAO = new CartDAO();
            List<CartDTO> products = cartDAO.getCartByUserId(user.getId());
            session.setAttribute("ORDER_DETAILS", products);
            response.sendRedirect("checkOutPage");

        } catch (SQLException ex) {
            Logger.getLogger(ProductQuantity.class.getName()).log(Level.SEVERE, null, ex);
            // Xử lý lỗi nếu cần
        } catch (NamingException ex) {
            Logger.getLogger(ProductQuantity.class.getName()).log(Level.SEVERE, null, ex);
            // Xử lý lỗi nếu cần
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
