/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.users;

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
@WebServlet(name = "CheckOutSuccessController", urlPatterns = {"/checkOutSuccess"})
public class CheckOutSuccessController extends HttpServlet {

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
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode"); // Mã phản hồi từ vnPay
        String vnp_TransactionNo = request.getParameter("vnp_TransactionNo"); // Mã giao dịch tại vnPay
        HttpSession session = request.getSession();
        UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");

        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.ShoppingFeatures.CREATE_ORDER_PAGE);

        try {
            if ("00".equals(vnp_ResponseCode) && vnp_TransactionNo != null && !vnp_TransactionNo.isEmpty()) {
                // Thanh toán thành công
                String email = (String) session.getAttribute("ORDER_EMAIL");
                String name = (String) session.getAttribute("ORDER_NAME");
                String phone = (String) session.getAttribute("ORDER_PHONE");
                String billingAddress = (String) session.getAttribute("ORDER_ADDRESS");
                String note = (String) session.getAttribute("NOTE");
                int amount = (int) session.getAttribute("AMOUNT");
                int amount2 = Integer.parseInt(request.getParameter("vnp_Amount"));
                System.out.println(amount2);

                List<CartDTO> orderDetails = (List<CartDTO>) session.getAttribute("ORDER_DETAILS");

                OrdersDAO orderDAO = new OrdersDAO();
                int orderId = orderDAO.createOrder(user.getId(), email, name, phone, billingAddress, note, 1, "VNPAY", true, amount);

                if (orderId > 0) {
                    OrderDetailDAO orderDetailDAO = new OrderDetailDAO();

                    OrderDTO order = orderDAO.getOrderById(orderId);

                    for (CartDTO orderDetail : orderDetails) {
                        orderDetailDAO.addOrderDetail(order.getOrderId(), orderDetail.getProductId(), orderDetail.getTitle(), orderDetail.getPrice(), orderDetail.getQuantity(), orderDetail.getThumbnail(), orderDetail.getPrice() * orderDetail.getQuantity());
                    }

                    orderDAO.clearCartByUserId(user.getId());
                    session.setAttribute("ORDER_SUCCESS", order);                                
                    url = siteMaps.getProperty(Constants.ShoppingFeatures.CHECKOUT_SUCCESS_PAGE);
                    session.removeAttribute("ORDER_EMAIL");
                    session.removeAttribute("ORDER_NAME");
                    session.removeAttribute("ORDER_PHONE");
                    session.removeAttribute("ORDER_ADDRESS");
                    session.removeAttribute("NOTE");
                    session.removeAttribute("AMOUNT");                
                }

            } else {
                // Thanh toán không thành công
                request.setAttribute("CHECKOUT_FAILED", "Thanh Toán Không Thành Công");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutSuccessController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CheckOutSuccessController.class.getName()).log(Level.SEVERE, null, ex);
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
