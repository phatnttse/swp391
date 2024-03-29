/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.users;

import java.io.IOException;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dto.ErrorDTO;
import phatntt.util.Key_Utils;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RegisterAccountServlet", urlPatterns = {"/register"})
public class RegisterAccountServlet extends HttpServlet {

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

        ErrorDTO errors = new ErrorDTO();
        boolean foundErr = false;

        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.SignUpFeatures.REGISTER_PAGE);

        try {
            if (!password.trim().matches(siteMaps.getProperty(Constants.ValidateFeatures.PASSWORD_REGEX))) {
                foundErr = true;
                errors.setPasswordRegexError(
                        siteMaps.getProperty(Constants.ValidateFeatures.PASSWORD_REGEX_ERR_MSG));
            }

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
                HttpSession session = request.getSession();
                session.setAttribute("EMAIL", email);
                session.setAttribute("GIVEN_NAME", given_name);
                session.setAttribute("FAMILY_NAME", family_name);
                session.setAttribute("PASSWORD", newPassword);

                url = siteMaps.getProperty(Constants.VerifyEmailFeatures.EMAIL_PAGE);
            }
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
