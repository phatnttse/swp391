/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.cart;

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
import javax.servlet.http.HttpSession;
import phatntt.dao.CartDAO;
import phatntt.dto.CartDTO;
import phatntt.dto.UsersDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BuyNowController", urlPatterns = {"/buyNow"})
public class BuyNowController extends HttpServlet {

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
            out.println("<title>Servlet BuyNowController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyNowController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.ShoppingFeatures.CREATE_ORDER_PAGE);

        int productId = Integer.parseInt(request.getParameter("productId"));
        String title = request.getParameter("title");
        String thumbnail = request.getParameter("thumbnail");
        int quantity = 1;
        String quantityStr = request.getParameter("quantity");
        if (quantityStr != null) {
            quantity = Integer.parseInt(quantityStr);
        }
        int price = Integer.parseInt(request.getParameter("price"));
        try {
            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");

            CartDAO cartDAO = new CartDAO();
            boolean result = cartDAO.addProductToCart(user.getId(), productId, title, thumbnail, quantity , price);

            if (result) {
                List<CartDTO> products = cartDAO.getCartByUserId(user.getId());
                session.setAttribute("ORDER_DETAILS", products);
                request.setAttribute("NUMBER_PRODUCT", products.size());
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductQuantity.class.getName()).log(Level.SEVERE, null, ex);
            // Xử lý lỗi nếu cần
        } catch (NamingException ex) {
            Logger.getLogger(ProductQuantity.class.getName()).log(Level.SEVERE, null, ex);
            // Xử lý lỗi nếu cần
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
