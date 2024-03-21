/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.admin;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
import phatntt.dto.ChartDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DashBoardController", urlPatterns = {"/dashboard"})
public class DashBoardController extends HttpServlet {

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
        String url = siteMaps.getProperty(Constants.Management.DASHBOARD);
        try {

            OrdersDAO dao = new OrdersDAO();

            // Nếu không có start và end parameters, tính doanh thu cho mỗi tháng trong năm qua
            List<ChartDTO> revenueByMonthList = dao.getRevenueByMonth();

            // Tạo một danh sách các tháng với giá trị doanh thu là 0 cho các tháng không có doanh thu
            List<ChartDTO> completeRevenueByMonthList = new ArrayList<>();
            for (int i = 1; i <= 12; i++) {
                boolean found = false;
                for (ChartDTO dto : revenueByMonthList) {
                    // Chuyển đổi chuỗi biểu thị cho tháng thành số nguyên
                    int month = Integer.parseInt(dto.getDate().substring(6)); // Loại bỏ "Month " và lấy số tháng
                    if (month == i) {
                        completeRevenueByMonthList.add(dto);
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    completeRevenueByMonthList.add(ChartDTO.builder()
                            .date("Tháng " + i)
                            .value(0)
                            .build());
                }
            }
            Map<String, Integer> totalPurchasesByCategory = dao.getTotalPurchasesByCategory();
            request.setAttribute("TOTAL_PURCHASES_BY_CATEGORY", totalPurchasesByCategory);
            request.setAttribute("REVENUE_BY_MONTH", completeRevenueByMonthList);

        } catch (SQLException ex) {
            Logger.getLogger(DashBoardController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(DashBoardController.class.getName()).log(Level.SEVERE, null, ex);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
