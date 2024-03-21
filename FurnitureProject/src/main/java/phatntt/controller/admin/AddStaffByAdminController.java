/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.admin;

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
import phatntt.dao.UsersDAO;
import phatntt.dto.ErrorDTO;
import phatntt.dto.UsersDTO;
import phatntt.util.Constants;
import phatntt.util.Key_Utils;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AddStaffByAdminController", urlPatterns = {"/AddStaffByAdminController"})
public class AddStaffByAdminController extends HttpServlet {

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
            out.println("<title>Servlet AddStaffByAdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStaffByAdminController at " + request.getContextPath() + "</h1>");
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

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm_password");
        String given_name = request.getParameter("given_name");
        String family_name = request.getParameter("family_name");
        String phone = request.getParameter("phone");
        ErrorDTO errors = new ErrorDTO();
        boolean foundErr = false;

        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.AdminFeatures.CREATE_STAFF_ACCOUNT);

        try {
//            if (!password.trim().matches(siteMaps.getProperty(Constants.ValidateFeatures.PASSWORD_REGEX))) {
//                foundErr = true;
//                errors.setPasswordRegexError(
//                        siteMaps.getProperty(Constants.ValidateFeatures.PASSWORD_REGEX_ERR_MSG));
//            }

            if (!confirm.trim().equals(password.trim())) {
                foundErr = true;
                errors.setConfirmNotMatch(
                        siteMaps.getProperty(Constants.ValidateFeatures.CONFIRM_NOTMATCH_ERR_MSG));
            }

            if (given_name.trim().length() < 2 || given_name.trim().length() > 50) {
                foundErr = true;
                errors.setGivenNameLengthError(
                        siteMaps.getProperty(Constants.ValidateFeatures.GIVENNAME_LENGTH_ERR_MSG));
            }

            if (family_name.trim().length() < 2 || given_name.trim().length() > 50) {
                foundErr = true;
                errors.setFamilyNameLengthError(
                        siteMaps.getProperty(Constants.ValidateFeatures.FAMILYNAME_LENGTH_ERR_MSG));
            }

            if (foundErr) {
                request.setAttribute("REGISTER_ERRORS", errors);
            } else { //no error
                Key_Utils utils = Key_Utils.getInstance();
                String newPassword = utils.hashPassword(password);
                UsersDAO dao = new UsersDAO();
                UsersDTO dto = new UsersDTO();
                dto.setGiven_name(given_name);
                dto.setFamily_name(family_name);
                dto.setPhone(phone);
                dto.setEmail(email);
                dto.setPassword(newPassword);
                boolean check = dao.createNewStaffAccount(dto);
                if (check) {
                    request.setAttribute("THANH_CONG", "Đăng kí tài khoản thành công");
                    url= siteMaps.getProperty(Constants.AdminFeatures.CREATE_STAFF_ACCOUNT);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddStaffByAdminController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AddStaffByAdminController.class.getName()).log(Level.SEVERE, null, ex);
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
