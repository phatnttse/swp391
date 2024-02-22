/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.users;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;
import phatntt.dao.UsersDAO;
import phatntt.dto.UsersDTO;
import phatntt.dto.UsersRegisterError;
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
        response.setContentType("text/html;charset=UTF-8");
        
        
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm_password");
        String given_name = request.getParameter("given_name");
        String family_name = request.getParameter("family_name");
        
             
        UsersRegisterError errors = new UsersRegisterError();
        boolean foundErr = false;
        
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties)context.getAttribute("SITEMAPS");
        
        
        String url = siteMaps.getProperty(Constants.SignUpFeatures.REGISTER_PAGE);
        try {
            //2. verify all user's error 
//            UsersDAO dao = new UsersDAO();
//            List<UsersDTO> userInfo = dao.getAllUsers();
//            for (UsersDTO dto : userInfo) {
//                if (username.trim().equals(dto.getUsername().trim())){
//                    errors.setEmailDuplicateError("Tên tài khoản "+ username + " đã tồn tại.");
//                    foundErr = true;
//                }
//            }              
                    
//            if (!password.trim().matches(siteMaps.getProperty(
//                    MyApplicationConstants.SignUpFeatures.PASSWORD_REGEX))) {
//                foundErr = true;
//                errors.setPasswordLengthError(
//                        siteMaps.getProperty(MyApplicationConstants.SignUpFeatures.PASSWORD_LENGTH_ERR_MESSAGE));
//            if (!confirm.trim().equals(password.trim())) {
//                foundErr = true;
//                errors.setConfirmNotMatch(
//                        siteMaps.getProperty(Constants.SignUpFeatures.CONFIRM_NOTMATCHED_ERR_MESSAGE));
//            }
//            if (given_name.trim().length() < 2 || given_name.trim().length() > 50) {
//                foundErr = true;
//                errors.setFullnameLengthError(
//                        siteMaps.getProperty(Constants.SignUpFeatures.FULLNAME_LENGTH_ERR_MESSAGE));
//            }        
//            if (foundErr) { // error occur
//                // cache to attribute then 
//                request.setAttribute("REGISTER_ERRORS", errors);
//               
//            } else { //no error
                Key_Utils utils = Key_Utils.getInstance();
                String newPassword = utils.hashPassword(password);
                HttpSession session = request.getSession();
                session.setAttribute("EMAIL", email);
                session.setAttribute("USERNAME", username);
                session.setAttribute("GIVEN_NAME",  given_name );
                session.setAttribute("FAMILY_NAME", family_name);
                session.setAttribute("PASSWORD", newPassword);              
                
                url = siteMaps.getProperty(Constants.VerifyEmailFeatures.EMAIL_PAGE);
                
            
//        } catch (SQLException ex) {
//            log("RegisterAccountServlet_SQLException: " + ex.getMessage());                                 
//        } catch (NamingException ex) {
//            log("RegisterAccountServlet_NamingException: " + ex.getMessage());
        } 

        finally {
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
