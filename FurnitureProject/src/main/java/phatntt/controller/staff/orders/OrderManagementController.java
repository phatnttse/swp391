/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.staff.orders;

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
import phatntt.dao.OrdersDAO;
import phatntt.dao.ProductsDAO;
import phatntt.dao.StaffDAO;
import phatntt.dto.OrderDTO;
import phatntt.dto.OrderStatusDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderManagementController", urlPatterns = {"/orderManager"})
public class OrderManagementController extends HttpServlet {

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
        String url = siteMaps.getProperty(Constants.Management.ORDER_MANAGEMENT_PAGE);
        String pageParam = request.getParameter("page");
        int page = 1;

        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
            url = siteMaps.getProperty(Constants.Management.ORDER_MANAGEMENT_PAGE)
                    + "?page=" + page;
            request.setAttribute("PAGE", Integer.parseInt(pageParam));
        }
        int limit = 9;

        if (page > 1) {
            page = page - 1;
            page = page * limit - 1;
        }

        try {
            // Lấy tham số statusId từ request
            String statusIdStr = request.getParameter("statusId");

            // Lấy tham số filterDate từ request
            String filterDate = request.getParameter("filterDate");

            StaffDAO dao = new StaffDAO();
            List<OrderDTO> orders = null;
            String statusName;

            if (statusIdStr != null && filterDate != null) {

                int statusId = Integer.parseInt(statusIdStr);
                orders = dao.filterOrderByStatusAndDate(statusId, filterDate, page, limit);
                statusName = dao.getStatusNameById(statusId);
                url = siteMaps.getProperty(Constants.Management.ORDER_MANAGEMENT_PAGE) + "?page="
                        + "&statusId=" + statusId
                        + "&filterDate=" + filterDate;
                request.setAttribute("FILTER_DATE", filterDate);
                request.setAttribute("STATUS_NAME", statusName);
                request.setAttribute("STATUS_ID", statusId);

            }else{
                orders = dao.getAllOrders(page, limit);
            }

            List<OrderStatusDTO> orderStatus = dao.getAllOrderStatus();

            List<OrderDTO> ordersByDay = dao.getOrdersByCondition("WHERE DATE(o.created_at) = CURDATE()");
            List<OrderDTO> ordersByMonth = dao.getOrdersByCondition("WHERE MONTH(o.created_at) = MONTH(CURDATE()) AND YEAR(o.created_at) = YEAR(CURDATE())");
            List<OrderDTO> cancelledOrders = dao.getOrdersByCondition("WHERE o.status = 7");

            request.setAttribute("ORDERS", orders);
            request.setAttribute("ORDER_STATUS", orderStatus);
            request.setAttribute("ORDERS_CURRENT", orders.size());
            request.setAttribute("ORDERS_BYDAY", ordersByDay.size());
            request.setAttribute("ORDERS_BYMONTH", ordersByMonth.size());
            request.setAttribute("ORDERS_CANCELLED", cancelledOrders.size());


            int totalOrders = dao.getTotalOrders();
            int totalPages = (int) Math.ceil((double) totalOrders / limit);
            request.setAttribute("TOTAL_PAGES", totalPages);

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
