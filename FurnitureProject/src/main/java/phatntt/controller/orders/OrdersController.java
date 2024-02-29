/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.orders;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dao.OrderDetailDAO;
import phatntt.dao.OrdersDAO;
import phatntt.dto.CartDTO;
import phatntt.dto.OrderDTO;
import phatntt.dto.UsersDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrdersController", urlPatterns = {"/orders"})
public class OrdersController extends HttpServlet {

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
        HttpSession session = request.getSession();
        List<CartDTO> products = (List<CartDTO>) session.getAttribute("CART");
        session.setAttribute("CART", products);
        session.setAttribute("CART_SIZE", products.size());
        response.sendRedirect("checkOutPage");
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
        request.setCharacterEncoding("UTF-8");
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        try {
            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String billingAddress = request.getParameter("billingAddress");
            String note = request.getParameter("note");
            String paymentMethod = request.getParameter("paymentMethod");

            List<CartDTO> orderDetails = (List<CartDTO>) session.getAttribute("ORDER_DETAILS");

            OrdersDAO orderDAO = new OrdersDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            int orderId = orderDAO.createOrder(user.getId(), email, name, phone, billingAddress, note, 1, paymentMethod);
            OrderDTO order = orderDetailDAO.getOrderById(orderId);

            // Thêm order_details, tạo trigger giảm số lg sp trong kho khi tạo order.
            if (orderId > 0) {
                for (CartDTO orderDetail : orderDetails) {
                    orderDetailDAO.addOrderDetail(order.getOrder_id(), orderDetail.getProductId(), orderDetail.getTitle(), orderDetail.getPrice(), orderDetail.getQuantity(), orderDetail.getThumbnail(), orderDetail.getPrice() * orderDetail.getQuantity());
                }
                orderDAO.clearCartByUserId(user.getId());
                session.setAttribute("CHECK_OUT_SUCCESS", order);
                response.sendRedirect(siteMaps.getProperty(Constants.ShoppingFeatures.CHECK_OUT_SUCCESS_PAGE));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrdersController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(OrdersController.class.getName()).log(Level.SEVERE, null, ex);
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
