/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.staff.orders;

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
import phatntt.dao.StaffDAO;
import phatntt.dto.OrderDTO;
import phatntt.dto.OrderStatusDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "FilterOrdersByStaffController", urlPatterns = {"/filterOrders"})
public class FilterOrdersByStaffController extends HttpServlet {

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
            out.println("<title>Servlet FilterOrdersByStaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterOrdersByStaffController at " + request.getContextPath() + "</h1>");
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
        String url = siteMaps.getProperty(Constants.Management.ORDER_MANAGEMENT_PAGE);
        try {
            // Lấy tham số statusId từ request
            String statusIdStr = request.getParameter("statusId");

            // Lấy tham số filterDate từ request
            String filterDate = request.getParameter("filterDate");

            StaffDAO dao = new StaffDAO();
            List<OrderDTO> orders;
            String statusName;

            if (!statusIdStr.isEmpty() && !filterDate.isEmpty()) {

                int statusId = Integer.parseInt(statusIdStr);
                orders = dao.filterOrderByStatusAndDate(statusId, filterDate);
                statusName = dao.getStatusNameById(statusId);
                url = siteMaps.getProperty(Constants.Management.ORDER_MANAGEMENT_PAGE) + "?statusId=" + statusId
                        + "&filterDate=" + filterDate;
                request.setAttribute("FILTER_DATE", filterDate);
                request.setAttribute("STATUS_NAME", statusName);
                request.setAttribute("STATUS_ID", statusId);

            } else if (statusIdStr.isEmpty() && !filterDate.isEmpty()) {
                orders = dao.filterOrderByDate(filterDate);
                url = siteMaps.getProperty(Constants.Management.ORDER_MANAGEMENT_PAGE) + "?filterDate=" + filterDate;
                request.setAttribute("FILTER_DATE", filterDate);

            } else if (!statusIdStr.isEmpty() && filterDate.isEmpty()) {
                int statusId = Integer.parseInt(statusIdStr);
                orders = dao.filterOrderByStatus(statusId);
                statusName = dao.getStatusNameById(statusId);
                request.setAttribute("STATUS_NAME", statusName);
                request.setAttribute("STATUS_ID", statusId);
                url = siteMaps.getProperty(Constants.Management.ORDER_MANAGEMENT_PAGE) + "?statusId=" + statusId;

            } else {
                orders = dao.getAllOrders();
            }

            List<OrderStatusDTO> orderStatus = dao.getAllOrderStatus();

            request.setAttribute("ORDERS", orders);
            request.setAttribute("ORDER_STATUS", orderStatus);
        } catch (SQLException ex) {
            Logger.getLogger(FilterOrdersByStaffController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(FilterOrdersByStaffController.class.getName()).log(Level.SEVERE, null, ex);
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
