/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.staff;

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
import phatntt.dao.OrderDetailDAO;
import phatntt.dao.OrdersDAO;
import phatntt.dto.OrderDTO;
import phatntt.dto.OrderDetailDTO;
import phatntt.dto.OrderStatusDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderDetailManagementController", urlPatterns = {"/orderDetailManagement"})
public class OrderDetailManagementController extends HttpServlet {

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
            out.println("<title>Servlet OrderDetailManagementController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailManagementController at " + request.getContextPath() + "</h1>");
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
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.Management.ORDER_MANAGEMENT_PAGE);
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            OrdersDAO ordersDAO = new OrdersDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            
            OrderDTO order = ordersDAO.getOrderById(orderId);
            
            List<OrderDetailDTO> orderDetails = orderDetailDAO.getOrderDetailsByOrderId(orderId);
            
            List<OrderStatusDTO> orderStatus = orderDetailDAO.getAllOrderStatus();
            
            url = siteMaps.getProperty(Constants.Management.VIEW_ORDERDETAIL_PAGE)
                    +"?orderId=" + orderId;
            
            request.setAttribute("ORDER", order);
            request.setAttribute("ORDER_DETAILS", orderDetails);
            request.setAttribute("ORDER_STATUS", orderStatus);
            
        } catch (SQLException ex) {
            Logger.getLogger(OrderManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(OrderManagementController.class.getName()).log(Level.SEVERE, null, ex);
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
        
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.Management.VIEW_ORDERDETAIL_PAGE);
        
        int orderStatus =  Integer.parseInt(request.getParameter("orderStatus"));           
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        
        try {
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            boolean result = orderDetailDAO.updateOrderStatus(orderId, orderStatus);
            if (result){
                url = "orderManagement";
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(OrderDetailManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
