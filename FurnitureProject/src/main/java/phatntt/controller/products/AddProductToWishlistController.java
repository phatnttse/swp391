/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.products;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dao.WishlistDAO;
import phatntt.dto.UsersDTO;
import phatntt.dto.WishlistDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddProductToWishlistController", urlPatterns = {"/addProductToWishlist"})
public class AddProductToWishlistController extends HttpServlet {

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
            out.println("<title>Servlet AddProductToWishlistController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductToWishlistController at " + request.getContextPath() + "</h1>");
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
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            int productId = Integer.parseInt(request.getParameter("productId"));

            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");

            WishlistDAO dao = new WishlistDAO();
            WishlistDTO product = dao.getProductFromWishlist(productId);
            if (product != null) {
                out.println("<div id=\"alert-wishlist\" class=\"col-xs-11 col-sm-4 alert alert-success animated fadeInDown\" style=\"display: inline-block; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out 0s; z-index: 1031; top: 20px; right: 20px;\">\n"
                        + "            <button type=\"button\" class=\"close\" style=\"position: absolute; right: 10px; top: 5px; z-index: 1033;\">×</button><span class=\"glyphicon glyphicon-ok\">\n"
                        + "\n"
                        + "            </span> <span data-notify=\"title\"><strong>Xin lỗi</strong><br></span>\n"
                        + "            <span>Sản phẩm đã có trong mục yêu thích</span>\n"
                        + "         \n"
                        + "        </div>");
            } else {
                boolean result = dao.addProductToWishlist(productId, user.getId());
                if (result) {
                    out.println("<div id=\"alert-wishlist\" class=\"col-xs-11 col-sm-4 alert alert-success animated fadeInDown\" style=\"display: inline-block; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out 0s; z-index: 1031; top: 20px; right: 20px;\">\n"
                            + "            <button type=\"button\" class=\"close\" style=\"position: absolute; right: 10px; top: 5px; z-index: 1033;\">×</button><span class=\"glyphicon glyphicon-ok\">\n"
                            + "\n"
                            + "            </span> <span data-notify=\"title\"><strong>Tuyệt vời</strong><br></span>\n"
                            + "            <span>Bạn vừa thêm 1 sản phẩm vào mục yêu thích thành công bấm \n"
                            + "                <a style=\"color:#2196f3\" href=\"viewWishlist\">vào đây</a> \n"
                            + "                để tới trang yêu thích\n"
                            + "            </span>\n"
                            + "         \n"
                            + "        </div>");
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddProductToWishlistController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AddProductToWishlistController.class.getName()).log(Level.SEVERE, null, ex);
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
