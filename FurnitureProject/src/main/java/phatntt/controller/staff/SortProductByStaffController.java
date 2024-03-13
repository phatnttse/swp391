/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package phatntt.controller.staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phatntt.dao.ProductsDAO;
import phatntt.dto.ProductsDTO;
import phatntt.util.Constants;

/**
 *
 * @author mac
 */
@WebServlet(name="SortProductByStaffController", urlPatterns={"/SortProductByStaffController"})
public class SortProductByStaffController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet SortProductByStaffController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortProductByStaffController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        
        String typeSort = request.getParameter("typeSort");
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.Management.PRODUCT_MANAGEMENT_PAGE);
    
    try {
            ProductsDAO dao = new ProductsDAO();
            List<ProductsDTO> dTOs = new ArrayList<>();
            switch (typeSort) {
                case "AtoZ":
                    dTOs = dao.sortProductByNameAscending();
                    request.setAttribute("PRODUCTS", dTOs);

                    break;
                case "ZtoA":
                    dTOs = dao.sortProductByNameDescending();
                    request.setAttribute("PRODUCTS", dTOs);

                    break;
                case "IncreasePrice":
                    dTOs = dao.sortProductByPriceAscending();
                    request.setAttribute("PRODUCTS", dTOs);

                    break;
                case "DecreasePrice":
                    dTOs = dao.sortProductByPriceDescending();
                    request.setAttribute("PRODUCTS", dTOs);

                    break;
                case "Newest":
                    dTOs = dao.sortProductByNewCreateAt();
                    request.setAttribute("PRODUCTS", dTOs);

                    break;
                case "Oldest":
                    dTOs = dao.sortProductByOldCreateAt();
                    request.setAttribute("PRODUCTS", dTOs);

                    break;
                default:
                    // Mặc định, có thể là sắp xếp theo Mặc định hoặc xử lý theo logic khác
                    dTOs = dao.getAllProducts();
                    request.setAttribute("PRODUCTS", dTOs);

                    break;
            }
            url = siteMaps.getProperty(Constants.Management.PRODUCT_MANAGEMENT_PAGE)
                    + "?typeSort=" + typeSort;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }

    }
    
    
    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
