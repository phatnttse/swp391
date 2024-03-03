/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.cart;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dao.CartDAO;
import phatntt.dto.CartDTO;
import phatntt.dto.UsersDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProductQuantity", urlPatterns = {"/productQuantity"})
public class ProductQuantity extends HttpServlet {

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
            out.println("<title>Servlet AddProductQuantity</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductQuantity at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int productId = Integer.parseInt(request.getParameter("productId"));

        try {
            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");

            CartDAO cartDAO = new CartDAO();
            boolean result = cartDAO.reduceProductToCart(user.getId(), productId);
            if (result) {
                List<CartDTO> products = cartDAO.getCartByUserId(user.getId());
                Gson gson = new Gson();
                String json = gson.toJson(products);               
                out.println(json);        
            }
            out.close();

        } catch (SQLException ex) {
            Logger.getLogger(ProductQuantity.class.getName()).log(Level.SEVERE, null, ex);
            // Xử lý lỗi nếu cần
        } catch (NamingException ex) {
            Logger.getLogger(ProductQuantity.class.getName()).log(Level.SEVERE, null, ex);
            // Xử lý lỗi nếu cần
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
        response.setContentType("application/json");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int productId = Integer.parseInt(request.getParameter("productId"));

        try {
            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");

            CartDAO cartDAO = new CartDAO();
            boolean result = cartDAO.addProductToCart(user.getId(), productId, null, null, 1, 0);
            if (result) {
                List<CartDTO> products = cartDAO.getCartByUserId(user.getId());
                Gson gson = new Gson();
                String json = gson.toJson(products);              
                out.println(json);     
            }
            out.close();

        } catch (SQLException ex) {
            Logger.getLogger(ProductQuantity.class.getName()).log(Level.SEVERE, null, ex);
            // Xử lý lỗi nếu cần
        } catch (NamingException ex) {
            Logger.getLogger(ProductQuantity.class.getName()).log(Level.SEVERE, null, ex);
            // Xử lý lỗi nếu cần
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
