/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import phatntt.dao.UsersDAO;
import phatntt.dto.UsersDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateUsersController", urlPatterns = {"/UpdateUsersController"})
public class UpdateUsersController extends HttpServlet {

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
            out.println("<title>Servlet UpdateAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAccountServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.AdminFeatures.VIEW_DETAIL_ACCOUNT);
        String userId = request.getParameter("Id");
        String userEmail = request.getParameter("Email");
        String userName = request.getParameter("Name");
        String userPhone = request.getParameter("Phone");
        String userAddress = request.getParameter("Address");
        String userRoleId = request.getParameter("roleId");
        try {
            UsersDAO dao = new UsersDAO();
            UsersDTO dto = new UsersDTO();
            dto.setId(userId);
            dto.setEmail(userEmail);
            dto.setName(userName);
            dto.setPhone(userPhone);
            dto.setAddress(userAddress);
            dto.setRole(Integer.parseInt(userRoleId));
            boolean result = dao.updateUserManagement(dto);
            if (result) {
                List<UsersDTO> dTOs = dao.getAllUsersWithNameOfRole();
                request.setAttribute("LIST_USER_ROLE", dTOs);
                url = siteMaps.getProperty(Constants.AdminFeatures.USERACCOUNT_PAGE);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
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
