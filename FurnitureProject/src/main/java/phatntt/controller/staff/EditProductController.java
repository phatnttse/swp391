/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import phatntt.dao.ProductsDAO;
import phatntt.dto.ProductsDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditProductController", urlPatterns = {"/editproductcontroller"})
public class EditProductController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String PRODUCT_MANAGEMENT_PAGE = "productManagement.jsp";
    private static final String EDIT_PRODUCT_PAGE = "editproduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailManagementController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailManagementController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.Management.PRODUCT_MANAGEMENT_PAGE);
        
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            ProductsDAO productDAO = new ProductsDAO();
            
            ProductsDTO product = productDAO.getProductById(productId);
           
            url = siteMaps.getProperty(Constants.Management.EDIT_PRODUCT_PAGE)
                    +"?productId=" + productId;
            
           request.setAttribute("EDITPRODUCT", product);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(OrderManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(OrderManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
