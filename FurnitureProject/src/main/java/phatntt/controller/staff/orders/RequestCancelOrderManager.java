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
import phatntt.dto.RequestCancellationDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RequestCancelOrderManager", urlPatterns = {"/requestCancelOrderManager"})
public class RequestCancelOrderManager extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.Management.REQUEST_TO_CANCEL_ORDER_PAGE);

//        String pageParam = request.getParameter("page");
//        int page = 1;
//
//        if (pageParam != null) {
//            page = Integer.parseInt(pageParam);
//            url = siteMaps.getProperty(Constants.Management.REQUEST_TO_CANCEL_ORDER_PAGE)
//                    + "?page=" + page;
//            request.setAttribute("PAGE", Integer.parseInt(pageParam));
//        }

        try {
//            int limit = 9;
//
//            if (page != 1) {
//                page = page - 1;
//                page = page * limit - 1;
//            }

            StaffDAO dao = new StaffDAO();
            List<RequestCancellationDTO> requestCancels = dao.getAllRequestCancellations();

            if (requestCancels != null) {
                request.setAttribute("REQUEST_CANCELS", requestCancels);
            }

//            int totalRequests = dao.getTotalRequests();
//            int totalPages = (int) Math.ceil((double) totalRequests / limit);
//            request.setAttribute("TOTAL_PAGES", totalPages);
        } catch (SQLException ex) {
            Logger.getLogger(RequestCancelOrderManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(RequestCancelOrderManager.class.getName()).log(Level.SEVERE, null, ex);
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
