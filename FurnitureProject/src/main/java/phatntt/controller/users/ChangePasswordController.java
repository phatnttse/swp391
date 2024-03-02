/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.users;

import java.io.IOException;
import java.sql.SQLException;
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
import phatntt.dto.ErrorDTO;
import phatntt.dto.UsersDTO;
import phatntt.util.Key_Utils;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/changePassword"})
public class ChangePasswordController extends HttpServlet {

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
        String url = siteMaps.getProperty(Constants.DispatchFeatures.ACCOUNT_INFO_PAGE);
        
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String confirmNewPass = request.getParameter("confirmNewPass");
        String id = request.getParameter("hdId");
        
        
         ErrorDTO errors = new ErrorDTO();
        boolean foundErr = false;
        
        UsersDAO dao = new UsersDAO();
        Key_Utils utils = Key_Utils.getInstance();
        
        try  {
            HttpSession session = request.getSession();
            UsersDTO user = (UsersDTO)session.getAttribute("USER_INFO");
            if (!utils.checkPassword(oldPass, user.getPassword().trim()) && !oldPass.trim().equals(user.getPassword().trim())){
                errors.setOldPassNotMatch(siteMaps.getProperty(Constants.UsersFeatures.OLD_PASS_ERR_MESSAGE));
                foundErr = true;
            }
            if (!newPass.matches(siteMaps.getProperty(Constants.ValidateFeatures.PASSWORD_REGEX))){
                errors.setPasswordRegexError(siteMaps.getProperty(Constants.ValidateFeatures.PASSWORD_REGEX_ERR_MSG));
                foundErr = true;
            }else if(!confirmNewPass.trim().equals(newPass)){
                errors.setConfirmNotMatch(siteMaps.getProperty(Constants.ValidateFeatures.CONFIRM_NOTMATCH_ERR_MSG));
                foundErr = true;
            }
            if (foundErr){
                request.setAttribute("CHANGE_PASS_ERROR", errors);
            }else {                
                String newPassHashed = utils.hashPassword(newPass);
                boolean result = dao.changePassword(id, newPassHashed);
                if (result){
                    url = siteMaps.getProperty(Constants.UsersFeatures.LOGIN_PAGE);
                }
            }
                               
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
        }finally {
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
