/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailManagementController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailManagementController at " + request.getContextPath() + "</h1>");
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
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String title = request.getParameter("title");
//            int formattedPrice = Integer.parseInt(request.getParameter("formattedPrice"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            String thumbnail = request.getParameter("thumbnail");
            String description = request.getParameter("description");
            int purchases = Integer.parseInt(request.getParameter("purchases"));
            ProductsDAO productDAO = new ProductsDAO();
            ProductsDTO product = new ProductsDTO();
            product.setProductId(productId);
            product.setCategoryId(categoryId);
            product.setTitle(title);
            product.setQuantity(quantity);
            product.setDiscount(discount);
            product.setThumbnail(thumbnail);
            product.setDescription(description);
            product.setPurchases(purchases);

//            Long createdAt = Long.parseLong(request.getParameter("createdAt"));
            boolean success = productDAO.updateProductWithoutPrice(product);
            if (success) {
                url = "productdetailmanagement"
                        + "?productId=" + productId;
                request.setAttribute("UPDATE_SUCCESS", "Cập nhật sản phẩm thành công");
            } 

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
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
